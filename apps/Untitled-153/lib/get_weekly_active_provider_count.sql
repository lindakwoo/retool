WITH weeks AS (
  SELECT DISTINCT DATE_TRUNC('week', s.created_at) + INTERVAL '4 days' AS friday
  FROM scribe s
  JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
  JOIN providers p ON p.id = sa.provider_id
  WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
),
provider_scribes_raw AS (
  SELECT
    sa.id AS account_id,
    sa.is_site_admin,
    s.created_at
  FROM providers p
  JOIN scribe_accounts sa ON sa.provider_id = p.id
  JOIN scribe s ON s.scribe_account_id = sa.id
  WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
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
  SELECT
    account_id,
    is_site_admin,
    COUNT(*) AS scribe_count
  FROM provider_scribes_raw
  GROUP BY account_id, is_site_admin
),
provider_scribes AS (
  SELECT psr.account_id, psr.created_at
  FROM provider_scribes_raw psr
  JOIN admin_scribe_counts asc_ ON asc_.account_id = psr.account_id
  WHERE NOT (asc_.is_site_admin IS TRUE AND asc_.scribe_count <= 10)
),
last_scribe_per_provider_per_week AS (
  SELECT
    w.friday,
    ps.account_id,
    MAX(ps.created_at) FILTER (WHERE ps.created_at <= w.friday) AS last_scribe_before_friday
  FROM weeks w
  JOIN provider_scribes ps ON ps.created_at <= w.friday
  GROUP BY w.friday, ps.account_id
)
SELECT
  TO_CHAR(l.friday - INTERVAL '4 days', 'Mon DD, YYYY') AS week_of,
  COUNT(DISTINCT CASE
    WHEN (
      SELECT COUNT(*) 
      FROM generate_series(l.last_scribe_before_friday::date, l.friday::date, '1 day') d
      WHERE EXTRACT(DOW FROM d) NOT IN (0,6)
    ) <= 6 THEN l.account_id
  END) AS healthy_partial_providers
FROM last_scribe_per_provider_per_week l
GROUP BY l.friday
ORDER BY l.friday ASC