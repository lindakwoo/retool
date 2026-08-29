SELECT
  ROUND(
    COUNT(*) FILTER (WHERE pct_scribes_synced >= 0.30)::numeric
    / NULLIF(COUNT(*), 0)
  , 1) AS pct_providers_syncing
FROM (
  SELECT
    p.id AS provider_id,
    COUNT(DISTINCT ses.id)::numeric / NULLIF(COUNT(DISTINCT s.id), 0) AS pct_scribes_synced
  FROM providers p
  JOIN scribe_accounts sa ON sa.provider_id = p.id
  LEFT JOIN scribe s ON s.scribe_account_id = sa.id
    AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
  LEFT JOIN scribe_ehr_syncs ses ON ses.scribe_id = s.id
  WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND sa.email NOT ILIKE '%test%'
    AND p.first_name NOT ILIKE '%test%'
    AND p.last_name NOT ILIKE '%test%'
  GROUP BY p.id
  HAVING NOT (BOOL_OR(sa.is_site_admin) IS TRUE AND COUNT(DISTINCT s.id) <= 10)
    AND COUNT(DISTINCT s.id) > 0
) sub