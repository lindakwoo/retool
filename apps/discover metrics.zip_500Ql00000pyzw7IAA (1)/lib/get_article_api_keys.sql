SELECT DISTINCT
    integration,
    api_data_json_key
FROM ft_prod_analytics.mongosrc__knowledge_article
CROSS JOIN UNNEST(
    MAP_KEYS(
        CAST(JSON_PARSE(api_data_json) AS MAP<VARCHAR, JSON>)
    )
) AS t(api_data_json_key)
WHERE org_id = '{{ org_id_as_int.value }}'
order by integration