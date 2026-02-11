with seller_data as (
  select
    x.seller_id,
    lcr.category_reporting as main_ls_category,
    x.seller_rating_overall,
    z.vip_seller,
    iff(y.violation_category = 'High refunds', 'Y', null) as refund_threshold,
    iff(y.violation_category = 'High shipping delays', 'Y', null) as delayed_dropoff_threshold
  from dbt.products.a__seller x
  left join 
  (
    select *
      from dbt.products.ts__violation_cases
     where dt = current_date()
  ) y
    on x.seller_id = y.user_id
  left join dbt.products.ts__seller_tags z 
    on x.seller_id = z.seller_id
  left join dbt.products.a__livestream_category_reporting as lcr 
    on lcr.livestream_tag_id = x.mode_livestream_tag_id
  where x.seller_id = {{queryRecord.data.user.id}}
)

,buyer_data as (
    select
        id,
        vip_buyer
    from dbt.products.a__user
    where id = {{ queryRecord.data.user.id }}
)
 
select
  sd.main_ls_category,
  sd.seller_rating_overall,
  sd.vip_seller,
  sd.refund_threshold,
  sd.delayed_dropoff_threshold,
  case when bd.vip_buyer = 1 then 'Y' else null end as vip_buyer
from seller_data as sd
full outer join buyer_data as bd
on sd.seller_id = bd.id

-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "buyerAutomatedTags"}