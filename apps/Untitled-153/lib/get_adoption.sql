SELECT
  sa.id                                          AS account_id,
  sa.email,
  p.first_name,
  p.last_name,
  COUNT(s.id)                                    AS total_scribes,
  ROUND(SUM(s.audio_length_in_seconds) / 60.0, 2)  AS total_session_minutes,
  ROUND(AVG(s.audio_length_in_seconds) / 60.0, 2)  AS avg_minutes_per_visit,
  TO_CHAR(MAX(s.created_at) AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles', 'MM/DD/YYYY HH:MI AM') AS last_scribe_date,
  COUNT(DISTINCT DATE_TRUNC('week', s.created_at)) AS weeks_active,
  ROUND(
    COUNT(DISTINCT CASE 
      WHEN EXTRACT(DOW FROM s.created_at) NOT IN (0,6) 
      THEN DATE(s.created_at) 
    END)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1
  )                                              AS avg_days_per_week,
  ROUND(COUNT(s.id)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1) AS scribes_per_week,
  STRING_AGG(DISTINCT CASE s.device_type::text
    WHEN 'MOBILE_ANDROID' THEN 'Android'
    WHEN 'MOBILE_IOS' THEN 'iOS'
    WHEN 'WEB_APP' THEN 'Web Browser'
    WHEN 'WEB_CHROME' THEN 'Chrome Extension'
    ELSE NULL
  END, ', ')                                     AS device_types,
  CASE
    WHEN COUNT(s.id) = 0 THEN 'Not Started'
    WHEN NOW()::date - MAX(s.created_at)::date > 22 THEN 'Inactive'
    WHEN NOW()::date - MAX(s.created_at)::date > 8 THEN 'At Risk'
    WHEN ROUND(COUNT(s.id)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1) >= 3 THEN 'Healthy'
    ELSE 'Partial'
  END AS status
FROM providers p
JOIN scribe_accounts sa ON sa.provider_id = p.id
LEFT JOIN scribe s ON s.scribe_account_id = sa.id
  AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
  AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
  AND sa.is_enabled = true
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
  AND sa.email NOT ILIKE '%test%'
  AND p.first_name NOT ILIKE '%test%'
  AND p.last_name NOT ILIKE '%test%'
GROUP BY sa.id, sa.email, p.first_name, p.last_name
HAVING NOT (bool_or(sa.is_site_admin) IS TRUE AND COUNT(s.id) <= 10)
ORDER BY total_scribes DESC