WITH site_providers AS (
  SELECT id
  FROM providers
  WHERE site_id = {{ selectSite.value}}
    AND first_name NOT ILIKE '%test%'
    AND last_name NOT ILIKE '%test%'
),
base_appts AS (
  SELECT a.id, a.created_at
  FROM appointments a
  WHERE a.rendering_provider_id IN (SELECT id FROM site_providers)
    AND a.appointment_status IN ('SCHEDULED')
    AND ({{dateRangeAllTime.value}} OR a.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR a.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
),
weekly AS (
  SELECT
    DATE_TRUNC('week', created_at) + INTERVAL '4 days' AS friday,
    COUNT(*) AS total_appointments
  FROM base_appts
  GROUP BY 1
)
SELECT
  TO_CHAR(friday - INTERVAL '4 days', 'Mon DD, YYYY') AS week_of,
  total_appointments
FROM weekly
ORDER BY friday ASC;