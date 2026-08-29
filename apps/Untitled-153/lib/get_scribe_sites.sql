SELECT 
  si.id AS site_id, 
  si.name AS site_name, 
  ss.gld AS actual_gld,
  u.name AS am_name,
  'scribe' AS source,
  STRING_AGG(
  '(' || INITCAP(p.first_name) || ' ' || INITCAP(p.last_name) || ') ' || LOWER(sa.email),
  ', ' ORDER BY p.last_name, p.first_name
) AS site_admins
FROM sites si
JOIN scribe_sites ss ON ss.site_id = si.id
LEFT JOIN users u ON u.id = si.account_manager_id
LEFT JOIN providers p ON p.site_id = si.id
LEFT JOIN scribe_accounts sa ON sa.provider_id = p.id
  AND sa.is_site_admin = true
  AND sa.is_enabled = true
  AND sa.email NOT ILIKE '%@getathelas.com'
  AND sa.email NOT ILIKE '%@commure.com'
  AND sa.email NOT ILIKE '%@augmedix.com'
  AND sa.email NOT ILIKE '%test%'
WHERE si.id = 2476
GROUP BY si.id, si.name, ss.arr, ss.gld, u.name