SELECT DISTINCT
    integration
FROM ft_prod_analytics.mongosrc__knowledge_article
WHERE org_id = '{{ org_id_as_int.value }}'
order by integration