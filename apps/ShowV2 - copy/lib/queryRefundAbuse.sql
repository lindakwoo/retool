-- Set 'orderBuyer' temporary state value to user ID for testing

select
    {{ current_date().format("YYYY-MM-DD") }} as dt
    , spend
    , gameable_refund_amount as lifetime_total_refund_completed_amount_dollars_gameable
    , gameable_refunds as lifetime_count_refund_completed_shipments_purchased_gameable
    , gameable_refund_ratio as lifetime_pct_spend_refunded_gameable
    , strong_links
    , linked_gameable_refunds
    , linked_refund_ratio
    , above_user_refund_threshold as user_above_refund_threshold
    , gameable_refund_amount_usd_mdnr as lifetime_total_refund_completed_amount_dollars_gameable_mdnr
    , gameable_shipments_refunded_mdnr as lifetime_count_refund_completed_shipments_purchased_gameable_mdnr
    , total_spend_refunded_mdnr_pct as lifetime_pct_spend_refunded_gameable_mdnr
    , linked_gameable_shipments_refunded_mdnr
    , linked_total_spend_refunded_mdnr_pct
    , above_user_refund_unverifiable_threshold as user_above_refund_threshold_mdnr
    , linked_fast_lane_shipments_refunded
    , linked_buyer_cancellation_education_events
    , lifetime_refunds_hvi
    -- , lifetime_total_spend
    -- , gameable_refund_amount_usd as lifetime_total_refund_completed_amount_dollars_gameable
    -- , gameable_shipments_refunded as lifetime_count_refund_completed_shipments_purchased_gameable
    -- , total_spend_refunded_pct as lifetime_pct_spend_refunded_gameable
    -- , strong_links
    -- , linked_gameable_shipments_refunded
    -- , linked_total_spend_refunded_pct
    -- , above_user_refund_threshold as user_above_refund_threshold
    -- , gameable_refund_amount_usd_mdnr as lifetime_total_refund_completed_amount_dollars_gameable_mdnr
    -- , gameable_shipments_refunded_mdnr as lifetime_count_refund_completed_shipments_purchased_gameable_mdnr
    -- , total_spend_refunded_mdnr_pct as lifetime_pct_spend_refunded_gameable_mdnr
    -- , linked_gameable_shipments_refunded_mdnr
    -- , linked_total_spend_refunded_mdnr_pct
    -- , above_user_refund_mdnr_threshold as user_above_refund_threshold_mdnr
    -- , linked_fast_lane_shipments_refunded
    -- , linked_buyer_cancellation_education_events
    -- , lifetime_refunds_hvi
from dbt.products.ts__refund_abuse_metrics_retool
where user_id = {{orderBuyer.value}}::string
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryRefundAbuse"}