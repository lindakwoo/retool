WITH selected_provider AS (
  SELECT provider_id FROM scribe_accounts
  WHERE id = {{ tableIntegrationUsage.selectedRow.scribe_account_id }}
),
all_scribers AS (
  SELECT from_provider_id AS provider_id
  FROM scribe_provider_collaborators
  WHERE status = 'APPROVED'
    AND to_provider_id IN (SELECT provider_id FROM selected_provider)
  UNION
  SELECT provider_id FROM selected_provider
),
appt_base AS (
  SELECT
    a.id            AS appointment_id,
    a.reason
  FROM appointments a
  WHERE a.appointment_status != 'CANCELLED'
    AND a.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND a.created_at < LEAST(NOW(), {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }})
    AND a.rendering_provider_id IN (SELECT provider_id FROM selected_provider)
),
total_appts AS (
  SELECT COUNT(DISTINCT appointment_id) AS total FROM appt_base
),
synced_appts AS (
  SELECT DISTINCT s.appointment_id
  FROM scribe s
  JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
  JOIN scribe_ehr_syncs ses ON ses.scribe_id = s.id
    AND ses.status = 'SUCCESS'
  WHERE sa.provider_id IN (SELECT provider_id FROM all_scribers)
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND s.appointment_id IN (SELECT appointment_id FROM appt_base)
    AND s.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND s.created_at < LEAST(NOW(), {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }})
),
reason_counts AS (
  SELECT
    COALESCE(ab.reason, '(no reason)')                                           AS reason,
    COUNT(DISTINCT ab.appointment_id)                                            AS total_appointments,
    COUNT(DISTINCT ab.appointment_id)::numeric
      / NULLIF((SELECT total FROM total_appts), 0)                               AS pct_of_total_appointments
  FROM appt_base ab
  LEFT JOIN synced_appts syn ON syn.appointment_id = ab.appointment_id
  GROUP BY ab.reason
  HAVING COUNT(DISTINCT CASE WHEN syn.appointment_id IS NOT NULL
      THEN ab.appointment_id END) = 0
)
SELECT
  reason,
  total_appointments,
  pct_of_total_appointments
FROM reason_counts
ORDER BY total_appointments DESC