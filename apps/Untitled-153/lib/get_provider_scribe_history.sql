SELECT
  s.id                                                      AS scribe_id,
  s.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles' AS created_at,
  s.patient_name,
  t.template_name,
  p.first_name,
  p.last_name,
  ROUND(EXTRACT(EPOCH FROM (
    s.processing_completed_timestamp - s.end_recording_timestamp
  )))::integer AS latency_seconds
FROM scribe s
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
LEFT JOIN templates t ON t.id = s.template_id
WHERE s.scribe_account_id = {{scribeAccountID.value}}
  AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
  AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
ORDER BY s.created_at DESC