WITH site_providers AS (
  SELECT id FROM providers
  WHERE site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND first_name NOT ILIKE '%test%'
    AND last_name NOT ILIKE '%test%'
),
scribe_base AS (
  SELECT
    sa.provider_id,
    s.id AS scribe_id,
    s.created_at,
    DATE_TRUNC('week', s.created_at) AS week_start
  FROM scribe_accounts sa
  JOIN scribe s ON s.scribe_account_id = sa.id
  WHERE sa.is_enabled = true
    AND sa.is_site_admin IS NOT TRUE
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND sa.email NOT ILIKE '%test%'
    AND sa.provider_id IN (SELECT id FROM site_providers)
    AND sa.provider_id = (
      SELECT provider_id FROM scribe_accounts
      WHERE id = {{ tableIntegrationUsage.selectedRow.scribe_account_id }}
    )
    AND s.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND s.created_at < {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }}
),
sync_base AS (
  SELECT
    sb.scribe_id,
    sb.week_start,
    MIN(ses.sync_end_time) AS first_sync_end
  FROM scribe_base sb
  JOIN scribe_ehr_syncs ses ON ses.scribe_id = sb.scribe_id
    AND ses.sync_end_time > sb.created_at
    AND ses.status = 'SUCCESS'
  GROUP BY sb.scribe_id, sb.week_start
)
SELECT
  sb.week_start,
  COUNT(DISTINCT sb.scribe_id)                                                   AS total_scribes,
  COUNT(DISTINCT CASE
    WHEN sy.first_sync_end IS NOT NULL
    AND EXTRACT(EPOCH FROM (sy.first_sync_end - sb.created_at)) / 86400 < 1
    THEN sb.scribe_id END)                                                       AS synced_under_1_day
FROM scribe_base sb
LEFT JOIN sync_base sy ON sy.scribe_id = sb.scribe_id
GROUP BY sb.week_start
ORDER BY sb.week_start ASC