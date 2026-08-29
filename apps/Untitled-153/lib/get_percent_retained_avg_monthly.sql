WITH base AS (
  SELECT
    provider_id,
    percent_retained::float AS percent_retained,
    scribe_created_at
  FROM redline_data
  WHERE site_id = {{ selectSite.value }}
),
per_provider AS (
  SELECT
    TO_CHAR(DATE_TRUNC('month', scribe_created_at), 'Mon YYYY') AS month,
    DATE_TRUNC('month', scribe_created_at) AS month_dt,
    provider_id,
    ROUND(AVG(percent_retained)::numeric, 4) AS avg_percent_retained,
    COUNT(*) AS evaluations
  FROM base
  GROUP BY 1, 2, 3
),
site_avg AS (
  SELECT
    TO_CHAR(DATE_TRUNC('month', scribe_created_at), 'Mon YYYY') AS month,
    DATE_TRUNC('month', scribe_created_at) AS month_dt,
    NULL::integer AS provider_id,
    ROUND(AVG(percent_retained)::numeric, 4) AS avg_percent_retained,
    COUNT(*) AS evaluations
  FROM base
  GROUP BY 1, 2
)
SELECT * FROM per_provider
UNION ALL
SELECT * FROM site_avg
ORDER BY month_dt ASC, provider_id NULLS FIRST;