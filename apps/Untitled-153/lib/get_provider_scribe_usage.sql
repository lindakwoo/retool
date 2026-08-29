WITH site_providers AS (
  SELECT id FROM providers
  WHERE site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
    AND first_name NOT ILIKE '%test%'
    AND last_name NOT ILIKE '%test%'
),
scribe_base AS (
  SELECT
    sa.provider_id,
    s.id AS scribe_id,
    s.created_at,
    DATE_TRUNC('week', s.created_at) AS week_start
  FROM scribe_accounts sa
  JOIN scribe s ON s.scribe_account_id = sa.id
  WHERE sa.is_enabled = true
    AND sa.email NOT ILIKE '%@getathelas.com'
    AND sa.email NOT ILIKE '%@commure.com'
    AND sa.email NOT ILIKE '%@augmedix.com'
    AND sa.email NOT ILIKE '%test%'
    AND sa.provider_id IN (SELECT id FROM site_providers)
    AND sa.provider_id = (
      SELECT provider_id FROM scribe_accounts
      WHERE id = {{scribeAccountID.value}}::integer
    )
    AND s.created_at >= {{ dateRangeAllTime.value ? '2000-01-01' : dateRange.value.start }}
    AND s.created_at < {{ dateRangeAllTime.value ? '2099-01-01' : new Date(new Date(dateRange.value.end).getTime() + 86400000).toISOString() }}
)
SELECT
  sb.week_start,
  COUNT(DISTINCT sb.scribe_id) AS total_scribes
FROM scribe_base sb
GROUP BY sb.week_start
ORDER BY sb.week_start ASC