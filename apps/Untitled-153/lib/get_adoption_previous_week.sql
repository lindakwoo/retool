SELECT
  sa.id                                          AS account_id,
  sa.email,
  p.first_name,
  p.last_name,
  COUNT(s.id)                                    AS total_scribes,
  MAX(s.created_at)                              AS last_scribe_date,
  COUNT(DISTINCT DATE_TRUNC('week', s.created_at)) AS weeks_active,
  ROUND(
    COUNT(DISTINCT CASE 
      WHEN EXTRACT(DOW FROM s.created_at) NOT IN (0,6) 
      THEN DATE(s.created_at) 
    END)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1
  )                                              AS avg_days_per_week,
  ROUND(COUNT(s.id)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1) AS scribes_per_week,
  CASE
    WHEN COUNT(s.id) = 0 THEN 'Not Started'
    WHEN (
      SELECT COUNT(*)
      FROM generate_series(MAX(s.created_at)::date, {{new Date(new Date(dateRange.value.end).getTime() - 7 * 24 * 60 * 60 * 1000)}}::date, '1 day') d
      WHERE EXTRACT(DOW FROM d) NOT IN (0, 6)
    ) > 16 THEN 'Inactive'
    WHEN (
      SELECT COUNT(*)
      FROM generate_series(MAX(s.created_at)::date, {{new Date(new Date(dateRange.value.end).getTime() - 7 * 24 * 60 * 60 * 1000)}}::date, '1 day') d
      WHERE EXTRACT(DOW FROM d) NOT IN (0, 6)
    ) > 6 THEN 'At Risk'
    WHEN ROUND(COUNT(s.id)::numeric / NULLIF(COUNT(DISTINCT DATE_TRUNC('week', s.created_at)), 0), 1) >= 3 THEN 'Healthy'
    ELSE 'Partial'
  END AS status
FROM providers p
JOIN scribe_accounts sa ON sa.provider_id = p.id
LEFT JOIN scribe s ON s.scribe_account_id = sa.id
  AND s.created_at >= {{new Date(new Date(dateRange.value.start).getTime() - 7 * 24 * 60 * 60 * 1000)}}
  AND s.created_at < {{new Date(new Date(dateRange.value.end).getTime() - 7 * 24 * 60 * 60 * 1000 + 24 * 60 * 60 * 1000)}}
WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
  AND sa.is_enabled = true
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
GROUP BY sa.id, sa.email, p.first_name, p.last_name
HAVING NOT (bool_or(sa.is_site_admin) IS TRUE AND COUNT(s.id) <= 10)
ORDER BY total_scribes DESC