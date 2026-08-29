SELECT
  s.id                                                      AS scribe_id,
  TO_CHAR(
    s.created_at AT TIME ZONE 'UTC-7',
    'Mon DD, YYYY HH12:MI AM "PT"'
  )                                                         AS created_at,
  s.patient_name,
  t.template_name,
  p.first_name || ' ' || p.last_name                        AS provider_name,
  sa.email,
  CASE s.task_status::text
    WHEN 'COMPLETED'           THEN 'Generated'
    WHEN 'SYNCED'              THEN 'Synced'
    WHEN 'IN_PROGRESS'         THEN 'In Progress'
    WHEN 'SYNCING'             THEN 'Syncing'
    WHEN 'REGENERATING'        THEN 'Regenerating'
    WHEN 'COMPLETED_BY_MDS'    THEN 'Completed by MDS'
    WHEN 'UPLOADED_BY_MDS'     THEN 'Uploaded by MDS'
    WHEN 'INCOMPLETE'          THEN 'Incomplete'
    WHEN 'SYNC_ERROR'          THEN 'Sync Error'
    WHEN 'ERROR'               THEN 'Error'
    WHEN 'SEND_TO_MDS_FAILED'  THEN 'Send to MDS Failed'
    WHEN 'USER_ERROR'          THEN 'User Error'
    ELSE s.task_status::text
  END AS status,
  CASE s.device_type::text
      WHEN 'MOBILE_ANDROID' THEN 'Android'
      WHEN 'MOBILE_IOS' THEN 'iOS'
      WHEN 'WEB_APP' THEN 'Web Browser'
      WHEN 'WEB_CHROME' THEN 'Chrome Extension'
      ELSE NULL
    END AS device_type
FROM scribe s
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
LEFT JOIN templates t ON t.id = s.template_id
WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
  AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
  AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
  AND ({{!templateSelect.value || templateSelect.value.length === 0}} OR t.template_name = {{templateSelect.value}})
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
  AND sa.email NOT ILIKE '%test%'
  AND p.first_name NOT ILIKE '%test%'
  AND p.last_name NOT ILIKE '%test%'
ORDER BY s.created_at DESC