SELECT "source"."org_id" AS "org_id", "source"."taxonomy_id" AS "taxonomy_id", "source"."assigned_start_date" AS "assigned_start_date", "source"."assigned_end_date" AS "assigned_end_date", "source"."total_ticket_count" AS "total_ticket_count", "source"."predicted_on" AS "predicted_on", "source"."used_in_training_count" AS "used_in_training_count", "source"."is_template_count" AS "is_template_count", "source"."cluster_id_count" AS "cluster_id_count"
FROM (select 
org_id,
taxonomy_id,

min(assigned_at) as assigned_start_date,
max(assigned_at) as assigned_end_date,

count(*) as total_ticket_count,
count(*) - sum(case when used_in_training then 1 else 0 end) as predicted_on,
sum(case when used_in_training then 1 else 0 end) as used_in_training_count,
sum(case when is_template then 1 else 0 end) as is_template_count,

count(distinct cluster_id) as cluster_id_count


from ft_prod_analytics.mlsrc__discover_cluster_tickets
where org_id = '{{ urlparams.hash.org_id }}' and taxonomy_id = '{{ taxonomySelect.value }}'

group by 1,2
order by 6,5 desc) AS "source"