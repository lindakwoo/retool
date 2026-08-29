WITH site_accounts_raw AS (
  SELECT
    sa.id AS scribe_account_id,
    sa.is_site_admin
  FROM providers p
  JOIN scribe_accounts sa ON sa.provider_id = p.id
  WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND sa.scribe_tier_id != 1
    AND sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
),
admin_scribe_counts AS (
  SELECT
    sar.scribe_account_id,
    sar.is_site_admin,
    COUNT(s.id) AS scribe_count
  FROM site_accounts_raw sar
  LEFT JOIN scribe s ON s.scribe_account_id = sar.scribe_account_id
    AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
  GROUP BY sar.scribe_account_id, sar.is_site_admin
),
site_accounts AS (
  -- Mirror the HAVING logic: drop admins with <= 10 scribes, keep everyone else
  SELECT scribe_account_id
  FROM admin_scribe_counts
  WHERE NOT (is_site_admin IS TRUE AND scribe_count <= 10)
),
scribe_activity AS (
  SELECT DISTINCT s.scribe_account_id
  FROM scribe s
  JOIN site_accounts sa ON sa.scribe_account_id = s.scribe_account_id
  WHERE ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
)
SELECT
  ss.provider_count                            AS licensed_seats,
  (SELECT COUNT(*) FROM site_accounts)         AS total_accounts,
  (SELECT COUNT(*) FROM scribe_activity)       AS active_accounts,
  ROUND(
    (SELECT COUNT(*) FROM scribe_activity)::numeric
    / GREATEST(ss.provider_count, 1) * 100, 1
  )                                            AS activation_pct
FROM scribe_sites ss
WHERE ss.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}