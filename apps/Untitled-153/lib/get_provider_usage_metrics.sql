WITH scribe_base AS (
  SELECT
    s.id,
    s.created_at,
    s.audio_length_in_seconds,
    DATE_TRUNC('week', s.created_at) AS week_start,
    t.template_name
  FROM scribe_accounts sa
  JOIN scribe s ON s.scribe_account_id = sa.id
  LEFT JOIN templates t ON t.id = s.template_id
  WHERE sa.id = {{scribeAccountID.value}}::integer
    AND ({{dateRangeAllTime.value}} OR s.created_at >= {{dateRange.value.start}})
    AND ({{dateRangeAllTime.value}} OR s.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
),
template_counts AS (
  SELECT
    COALESCE(template_name, 'No Template') AS template_name,
    COUNT(*) AS template_count
  FROM scribe_base
  GROUP BY 1
  ORDER BY template_count DESC
  LIMIT 1
)
SELECT
  ROUND(COUNT(sb.id)::numeric / NULLIF(COUNT(DISTINCT sb.week_start), 0), 1) AS avg_scribes_per_active_week,
  ROUND(
    (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sb.audio_length_in_seconds) / 60.0)::numeric,
    2
  ) AS median_minutes_per_visit,
  COUNT(DISTINCT sb.week_start) AS weeks_active,
  (SELECT template_name FROM template_counts) AS most_used_template
FROM scribe_base sb;