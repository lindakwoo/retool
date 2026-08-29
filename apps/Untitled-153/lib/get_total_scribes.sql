SELECT COUNT(s.id) AS total_scribes
FROM scribe s
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
WHERE p.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
  AND sa.is_enabled = true
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
  AND sa.email NOT ILIKE '%test%'
  AND p.first_name NOT ILIKE '%test%'
  AND p.last_name NOT ILIKE '%test%'
  AND sa.id NOT IN (
    SELECT sa2.id
    FROM scribe_accounts sa2
    JOIN scribe s2 ON s2.scribe_account_id = sa2.id
    JOIN providers p2 ON p2.id = sa2.provider_id
    WHERE p2.site_id = {{ selectSite.value === 'watchlist' ? watchlistSelectedSite.value : selectSite.value }}
      AND sa2.is_site_admin IS TRUE
    GROUP BY sa2.id
    HAVING COUNT(s2.id) <= 10
  )