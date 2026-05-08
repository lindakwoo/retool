select 
    *
from dbt.applications.main_backend__ts_actions 
where 
    user_id = {{queryRecord.data.user["id"]}}
    and active = TRUE 
    and (status = 'APPROVED' or status is NULL)
    and (
        action = 'BAN'
        or action = 'SHADOWBAN'
        or (
            action = 'SUSPEND' and 
            (
               (reviewed_at is NULL and created_at > dateadd('day', -7, sysdate())) or 
               (reviewed_at is not NULL and reviewed_at > dateadd('day', -7, sysdate()))
            )
        )
        or (
            action = 'SUSPEND_2D_KEEP_EARLY_PAYOUT' and 
            (
               (reviewed_at is NULL and created_at > dateadd('day', -2, sysdate())) or 
               (reviewed_at is not NULL and reviewed_at > dateadd('day', -2, sysdate()))
            )
        )
    )
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryBuyerTSStanding"}