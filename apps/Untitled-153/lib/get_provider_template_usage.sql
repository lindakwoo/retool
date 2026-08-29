SELECT
  SPLIT_PART(SPLIT_PART(COALESCE(t.template_name, 'No Template'), ' | ', 1), ' - ', 1) AS template_name,
  COUNT(DISTINCT sb.id)                                                                  AS total_scribes
FROM scribe_accounts sa
JOIN scribe sb ON sb.scribe_account_id = sa.id
  AND ({{dateRangeAllTime.value}} OR sb.created_at >= {{dateRange.value.start}})
  AND ({{dateRangeAllTime.value}} OR sb.created_at < {{dateRange.value.end}}::date + INTERVAL '1 day')
LEFT JOIN templates t ON t.id = sb.template_id
WHERE sa.id = {{scribeAccountID.value}}::integer
GROUP BY t.template_name
ORDER BY total_scribes DESC