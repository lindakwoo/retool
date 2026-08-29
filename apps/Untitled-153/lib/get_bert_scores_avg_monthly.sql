WITH base AS (
  SELECT
    p.id AS provider_id,
    sa.email AS provider_email,
    (nem.metrics ->> 'bert_score')::FLOAT AS bert_score,
    nem.created_at
  FROM scribe_accounts sa
  JOIN providers p ON p.id = sa.provider_id
  JOIN scribe sc ON sc.scribe_account_id = sa.id
  JOIN note_evaluation_metrics nem ON nem.scribe_id = sc.id
  WHERE p.site_id = {{ selectSite.value }}
    AND nem.eval_type IN (
      'PROVIDER_EDIT_EVAL',
      'MDS_SIGNED_EVAL',
      'PROVIDER_SIGNED_EVAL',
      'EHR_UPLOAD_EVAL',
      'PRE_CF_PROV_SIGNED_EVAL',
      'POST_CF_PROV_SIGNED_EVAL'
    )
    AND nem.metrics ? 'bert_score'
),
per_provider AS (
  SELECT
    TO_CHAR(DATE_TRUNC('month', created_at), 'Mon YYYY') AS month,
    DATE_TRUNC('month', created_at) AS month_dt,
    provider_id,
    provider_email,
    ROUND(AVG(bert_score)::numeric, 4) AS avg_bert_score,
    COUNT(*) AS evaluations
  FROM base
  GROUP BY 1, 2, 3, 4
),
site_avg AS (
  SELECT
    TO_CHAR(DATE_TRUNC('month', created_at), 'Mon YYYY') AS month,
    DATE_TRUNC('month', created_at) AS month_dt,
    NULL::integer AS provider_id,
    'SITE AVERAGE'::text AS provider_email,
    ROUND(AVG(bert_score)::numeric, 4) AS avg_bert_score,
    COUNT(*) AS evaluations
  FROM base
  GROUP BY 1, 2
)
SELECT * FROM per_provider
UNION ALL
SELECT * FROM site_avg
ORDER BY month_dt ASC, provider_email ASC;