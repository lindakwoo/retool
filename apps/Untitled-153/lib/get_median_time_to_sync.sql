WITH excluded_admins AS (
  SELECT sa2.id
  FROM scribe_accounts sa2
  JOIN scribe s2 ON s2.scribe_account_id = sa2.id
  JOIN providers p2 ON p2.id = sa2.provider_id
  WHERE p2.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND sa2.is_site_admin IS TRUE
  GROUP BY sa2.id
  HAVING COUNT(s2.id) <= 10
)
SELECT
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (
    ORDER BY EXTRACT(EPOCH FROM (ses.sync_end_time - s.created_at)) / 3600
  )::numeric, 2) AS median_hours_to_sync
FROM scribe s
JOIN scribe_ehr_syncs ses ON ses.scribe_id = s.id
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
LEFT JOIN excluded_admins ea ON ea.id = sa.id
WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
  AND ea.id IS NULL
  AND sa.is_enabled = true
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
  AND sa.email NOT ILIKE '%test%'
  AND p.first_name NOT ILIKE '%test%'
  AND p.last_name NOT ILIKE '%test%'
  AND ({{dateRangeAllTime.value}} OR (s.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles')::date >= {{dateRange.value.start}}::date)
  AND ({{dateRangeAllTime.value}} OR (s.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles')::date <= {{dateRange.value.end}}::date)
  AND ses.sync_end_time IS NOT NULL