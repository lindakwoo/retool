SELECT 
  percent_retained,
  provider_id,
  scribe_id,
  scribe_created_at
FROM redline_data
WHERE site_id = {{ selectSite.value }};