SELECT count(*) as total_ticket_count
FROM (
select 
org_id,
ticket_id
from ft_prod_analytics.metrics__tickets_combined
where org_id = '{{ urlparams.hash.org_id }}'
) AS "source"