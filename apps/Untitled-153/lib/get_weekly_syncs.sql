WITH provider_scribes_raw AS (
  SELECT
    s.id AS scribe_id,
    sa.id AS account_id,
    sa.is_site_admin,
    s.created_at
  FROM providers p
  JOIN scribe_accounts sa ON sa.provider_id = p.id
  JOIN scribe s ON s.scribe_account_id = sa.id
  WHERE p.site_id = {{ selectSite.value }}
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
eligible_scribes AS (
  SELECT psr.scribe_id
  FROM provider_scribes_raw psr
  JOIN admin_scribe_counts asc_ ON asc_.account_id = psr.account_id
  WHERE NOT (asc_.is_site_admin IS TRUE AND asc_.scribe_count <= 10)
),
success_events AS (
  SELECT
    ses.scribe_id,
    ses.sync_end_time
  FROM scribe_ehr_syncs ses
  JOIN eligible_scribes es ON es.scribe_id = ses.scribe_id
  WHERE ses.status = 'SUCCESS'
    AND ({{dateRangeAllTime.value}} OR ses.sync_end_time >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR ses.sync_end_time < {{dateRange.value.end}}::date + INTERVAL '1 day')
),
weekly AS (
  SELECT
    DATE_TRUNC('week', sync_end_time) + INTERVAL '4 days' AS friday,
    COUNT(*) AS total_synced_scribes
  FROM success_events
  GROUP BY 1
)
SELECT
  TO_CHAR(friday - INTERVAL '4 days', 'Mon DD, YYYY') AS week_of,
  total_synced_scribes
FROM weekly
ORDER BY friday ASC;