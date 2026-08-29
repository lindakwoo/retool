WITH site_providers AS (
  SELECT id FROM providers
  WHERE site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND first_name NOT ILIKE '%test%'
    AND last_name NOT ILIKE '%test%'
),
collaborators AS (
  SELECT spc.from_provider_id, spc.to_provider_id
  FROM scribe_provider_collaborators spc
  WHERE spc.status = 'APPROVED'
    AND (
      spc.from_provider_id IN (SELECT id FROM site_providers)
      OR spc.to_provider_id IN (SELECT id FROM site_providers)
    )
),
collab_providers AS (
  SELECT id FROM site_providers
  UNION
  SELECT from_provider_id FROM collaborators
),
latest_accounts AS (
  SELECT DISTINCT ON (provider_id)
    provider_id,
    id AS scribe_account_id
  FROM scribe_accounts
  WHERE is_enabled = true
    AND provider_id IN (SELECT id FROM site_providers)
  ORDER BY provider_id, id DESC
),
scribe_base AS (
  SELECT
    sa.provider_id,
    s.id AS scribe_id,
    s.created_at
  FROM site_providers sp
  JOIN providers p ON p.id = sp.id
  JOIN scribe_accounts sa ON sa.provider_id = p.id
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND sa.email NOT ILIKE '%test%'
  JOIN scribe s ON s.scribe_account_id = sa.id
    AND s.created_at >= NOW() - INTERVAL '30 days'
),
sync_base AS (
  SELECT
    sb.provider_id,
    sb.scribe_id,
    MIN(ses.sync_end_time) AS first_sync_end,
    MAX(ses.sync_end_time) AS last_sync_end
  FROM scribe_base sb
  JOIN scribe_ehr_syncs ses ON ses.scribe_id = sb.scribe_id
    AND ses.sync_end_time > sb.created_at
  GROUP BY sb.provider_id, sb.scribe_id
),
scribe_counts AS (
  SELECT
    sb.provider_id,
    COUNT(DISTINCT sb.scribe_id) AS total_scribes,
    COUNT(DISTINCT sy.scribe_id) AS total_ehr_syncs,
    CASE
      WHEN COUNT(sy.scribe_id) = 0 THEN '—'
      WHEN PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY EXTRACT(EPOCH FROM (sy.first_sync_end - sb.created_at)) / 86400
      ) < 1 THEN '< 1 day'
      ELSE ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY EXTRACT(EPOCH FROM (sy.first_sync_end - sb.created_at)) / 86400
      )::numeric, 1)::text || ' days'
    END AS median_days_to_sync,
    TO_CHAR(
      MAX(sy.last_sync_end) AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles',
      'MM/DD/YYYY'
    ) AS last_sync_date
  FROM scribe_base sb
  LEFT JOIN sync_base sy ON sy.scribe_id = sb.scribe_id
  GROUP BY sb.provider_id
),
site_synced_scribes AS (
  SELECT DISTINCT s.appointment_id
  FROM collab_providers cp
  JOIN scribe_accounts sa ON sa.provider_id = cp.id AND sa.is_enabled = true
  JOIN scribe s ON s.scribe_account_id = sa.id
    AND s.appointment_id IS NOT NULL
    AND s.created_at >= NOW() - INTERVAL '30 days'
  JOIN scribe_ehr_syncs ses ON ses.scribe_id = s.id AND ses.status = 'SUCCESS'
),
appt_counts AS (
  SELECT
    a.rendering_provider_id AS provider_id,
    COUNT(DISTINCT a.id) AS total_appointments,
    COUNT(DISTINCT CASE WHEN ss.appointment_id IS NOT NULL THEN a.id END) AS total_appointments_synced
  FROM appointments a
  JOIN site_providers sp ON sp.id = a.rendering_provider_id
  LEFT JOIN site_synced_scribes ss ON ss.appointment_id = a.id
  WHERE a.appointment_status != 'CANCELLED'
    AND a.created_at >= NOW() - INTERVAL '30 days'
  GROUP BY a.rendering_provider_id
),
provider_stats AS (
  SELECT
    p.id AS provider_id,
    la.scribe_account_id,
    INITCAP(p.first_name) AS first_name,
    INITCAP(p.last_name) AS last_name,
    sc.total_scribes,
    sc.total_ehr_syncs,
    ROUND(sc.total_ehr_syncs::numeric / NULLIF(sc.total_scribes, 0), 4) AS pct_scribes_synced,
    COALESCE(ac.total_appointments, 0) AS total_appointments,
    COALESCE(ac.total_appointments_synced, 0) AS total_appointments_synced,
    ROUND(ac.total_appointments_synced::numeric / NULLIF(ac.total_appointments, 0), 4) AS pct_appointments_synced,
    sc.median_days_to_sync,
    sc.last_sync_date
  FROM providers p
  JOIN site_providers sp ON sp.id = p.id
  JOIN scribe_counts sc ON sc.provider_id = p.id
  LEFT JOIN appt_counts ac ON ac.provider_id = p.id
  LEFT JOIN latest_accounts la ON la.provider_id = p.id
  WHERE p.first_name NOT ILIKE '%test%'
    AND p.last_name NOT ILIKE '%test%'
),
admin_filter AS (
  SELECT
    sa.provider_id,
    BOOL_OR(sa.is_site_admin) AS is_any_admin
  FROM scribe_accounts sa
  JOIN site_providers sp ON sp.id = sa.provider_id
  WHERE sa.is_enabled = true
  GROUP BY sa.provider_id
)
SELECT ps.*
FROM provider_stats ps
JOIN admin_filter af ON af.provider_id = ps.provider_id
WHERE NOT (af.is_any_admin IS TRUE AND ps.total_scribes <= 10)
ORDER BY ps.last_name, ps.first_name