SELECT 
  p.id AS provider_id,
  sa.email AS provider_email,
  (p.first_name || ' ' || p.last_name) AS provider_name
FROM providers p
JOIN scribe_accounts sa ON sa.provider_id = p.id
WHERE p.site_id = {{ selectSite.value }}
  AND (
    {{ (get_percent_retained_avg_monthly.data?.provider_id || []).filter(pid => pid != null).length > 0 }}
    AND p.id = ANY({{ _.uniq((get_percent_retained_avg_monthly.data?.provider_id || []).filter(pid => pid != null).map(Number)) }})
  );