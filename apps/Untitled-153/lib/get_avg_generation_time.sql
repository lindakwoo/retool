SELECT
  COUNT(s.id) AS scribe_count,
  ROUND(AVG(
    EXTRACT(EPOCH FROM (s.processing_completed_timestamp - s.end_recording_timestamp))
  ))::integer AS avg_latency_seconds
FROM scribe s
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
WHERE p.site_id = {{selectSite.value}}::integer
  AND s.created_at >= NOW() - INTERVAL '7 days'
  AND s.processing_completed_timestamp IS NOT NULL
  AND s.end_recording_timestamp IS NOT NULL