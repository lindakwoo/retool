WITH provider_scribes_raw AS (
  SELECT
    s.id AS scribe_id,
    s.created_at,
    CASE s.device_type::text
      WHEN 'MOBILE_ANDROID' THEN 'Android'
      WHEN 'MOBILE_IOS' THEN 'iOS'
      WHEN 'WEB_APP' THEN 'Web Browser'
      WHEN 'WEB_CHROME' THEN 'Chrome Extension'
      ELSE NULL
    END AS device_label,
    sa.id AS account_id,
    sa.is_site_admin
  FROM providers p
  JOIN scribe_accounts sa ON sa.provider_id = p.id
  JOIN scribe s ON s.scribe_account_id = sa.id
  WHERE p.site_id = {{ selectSite.value }}
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND sa.email NOT ILIKE '%test%'
    AND p.first_name NOT ILIKE '%test%'
    AND p.last_name NOT ILIKE '%test%'
    AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
),
admin_scribe_counts AS (
  SELECT account_id, is_site_admin, COUNT(*) AS scribe_count
  FROM provider_scribes_raw
  GROUP BY account_id, is_site_admin
),
filtered_scribes AS (
  SELECT psr.scribe_id, psr.created_at, psr.device_label
  FROM provider_scribes_raw psr
  JOIN admin_scribe_counts asc_ ON asc_.account_id = psr.account_id
  WHERE NOT (asc_.is_site_admin IS TRUE AND asc_.scribe_count <= 10)
),
weekly AS (
  SELECT
    DATE_TRUNC('week', created_at) + INTERVAL '4 days' AS friday,
    device_label,
    COUNT(*) AS total
  FROM filtered_scribes
  WHERE device_label IS NOT NULL
  GROUP BY 1, 2
)
SELECT
  TO_CHAR(friday - INTERVAL '4 days', 'Mon DD, YYYY') AS week_of,
  COALESCE(SUM(CASE WHEN device_label = 'Android' THEN total END), 0) AS android,
  COALESCE(SUM(CASE WHEN device_label = 'iOS' THEN total END), 0) AS ios,
  COALESCE(SUM(CASE WHEN device_label = 'Web Browser' THEN total END), 0) AS web_browser,
  COALESCE(SUM(CASE WHEN device_label = 'Chrome Extension' THEN total END), 0) AS chrome_extension
FROM weekly
GROUP BY friday
ORDER BY friday ASC;