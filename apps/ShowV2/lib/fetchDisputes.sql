select
  event_details:processor::varchar as  dispute_system
  , event_details:dispute_status::varchar as dispute_status
  , event_details:reason::varchar as dispute_type
  , event_details:created_at::timestamp as created_at
  , event_details:deadline_at::timestamp as deadline_at
  ,  event_details:order_uuid::varchar as order_uuid
from dbt.products.ts__stg_chargebacks
where 
  order_uuid = {{queryRecord.data.uuid}}  
order by created_at asc  
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "fetchDisputes"}