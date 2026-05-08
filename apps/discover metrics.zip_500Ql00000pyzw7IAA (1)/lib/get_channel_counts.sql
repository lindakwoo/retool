WITH base AS (
    SELECT
        "source_id" AS "source_id",
        "ticket_id" AS "ticket_id",
        "status" AS "status",
        "org_id" AS "org_id",
        "channel" AS "channel"
    FROM
        "ft_prod_analytics"."metrics__tickets_combined"
    WHERE 
        org_id = '{{org_id_as_int.value}}'
    AND
        date_created > TIMESTAMP '{{dateQueries.data.startDate}}'
  )
SELECT 
  channel,
  count(distinct ticket_id) as ticket_count
FROM base
GROUP BY channel
ORDER BY 2 DESC
 