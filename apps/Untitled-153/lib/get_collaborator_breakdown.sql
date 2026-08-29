WITH selected_provider AS (
  SELECT provider_id FROM scribe_accounts
  WHERE id = {{ tableIntegrationUsage.selectedRow.scribe_account_id }}
),
collaborators AS (
  SELECT 
    spc.from_provider_id,
    INITCAP(p.first_name) || ' ' || INITCAP(p.last_name) AS scribed_by_name,
    CASE WHEN spc.from_provider_id = (SELECT provider_id FROM selected_provider)
      THEN 'Self' ELSE 'Collaborator'
    END AS relationship
  FROM scribe_provider_collaborators spc
  JOIN providers p ON p.id = spc.from_provider_id
  WHERE spc.status = 'APPROVED'
    AND spc.to_provider_id IN (SELECT provider_id FROM selected_provider)
  UNION ALL
  SELECT
    sp.provider_id AS from_provider_id,
    INITCAP(p.first_name) || ' ' || INITCAP(p.last_name) AS scribed_by_name,
    'Self' AS relationship
  FROM selected_provider sp
  JOIN providers p ON p.id = sp.provider_id
),
appt_base AS (
  SELECT
    a.id AS appointment_id
  FROM appointments a
  WHERE a.appointment_status != 'CANCELLED'
    AND a.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND a.created_at < LEAST(NOW(), {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }})
    AND a.rendering_provider_id IN (SELECT provider_id FROM selected_provider)
),
total_appts AS (
  SELECT COUNT(DISTINCT appointment_id) AS total FROM appt_base
),
synced_scribes AS (
  SELECT
    s.appointment_id,
    sa.provider_id AS synced_by_provider_id
  FROM scribe s
  JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
  JOIN scribe_ehr_syncs ses ON ses.scribe_id = s.id
    AND ses.status = 'SUCCESS'
  WHERE sa.provider_id IN (SELECT from_provider_id FROM collaborators)
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND s.appointment_id IN (SELECT appointment_id FROM appt_base)
    AND s.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND s.created_at < LEAST(NOW(), {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }})
)
SELECT
  c.scribed_by_name,
  c.relationship,
  COUNT(DISTINCT ss.appointment_id)                                              AS total_synced,
  COUNT(DISTINCT ss.appointment_id)::numeric
    / NULLIF((SELECT total FROM total_appts), 0)                                 AS pct_of_appts_synced
FROM collaborators c
LEFT JOIN synced_scribes ss ON ss.synced_by_provider_id = c.from_provider_id
GROUP BY c.scribed_by_name, c.relationship, c.from_provider_id
ORDER BY c.relationship, c.scribed_by_name