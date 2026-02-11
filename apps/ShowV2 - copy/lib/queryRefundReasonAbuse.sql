with refund_user_metrics as (
    select * 
    from dbt.products.ts__refund_abuse_metrics_retool
    where user_id = {{orderBuyer.value}}::string
)
  
,wide_results as (SELECT
     user_id::string User_ID
    ,gameable_refund_amount::string as gameable_refund_amount_usd
    ,gameable_refunds::string as gameable_shipments_refunded
    ,round(refund_ratio*100,2)::string as total_spend_refunded_pct
    ,above_user_refund_threshold::string above_user_refund_threshold
    ,above_user_refund_mdnr_threshold::string above_user_refund_mdnr_threshold
    ,COALESCE(LIFETIME_REFUNDS_DAMAGED_IN_TRANSIT,0)::string               REFUNDS_DAMAGED_IN_TRANSIT
    ,round(COALESCE(REFUNDS_DAMAGED_IN_TRANSIT_PCT,0),2)::string       REFUNDS_DAMAGED_IN_TRANSIT_PCT
    ,COALESCE(ABOVE_DAMAGED_IN_TRANSIT_THRESHOLD,0)::string       REFUNDS_DAMAGED_IN_TRANSIT_THRESHOLD
    ,above_fast_lane_threshold::string above_fast_lane_threshold
    ,above_buyer_cancellation_education_threshold::string above_buyer_cancellation_education_threshold
    ,above_hvi_threshold::string above_hvi_threshold
    ,COALESCE(ABOVE_USPS_MDNR_THRESHOLD,0)::string                        REFUNDS_USPS_MDNR_THRESHOLD
    ,round(coalesce(REFUNDS_USPS_MDNR_PCT,0),2)::string           REFUNDS_USPS_MDNR_PCT
    ,COALESCE(ABOVE_MISREP_CONDITION_THRESHOLD,0)::string                 REFUNDS_MISREP_CONDITION_THRESHOLD
    ,round(coalesce(REFUNDS_MISREP_CONDITION_PCT,0),2)::string       REFUNDS_MISREP_CONDITION_PCT
    ,COALESCE(ABOVE_MISSING_WRONG_ADDRESSISSUE_RTS_THRESHOLD,0)::string   REFUNDS_MISSING_WRONG_ADDRESSISSUE_RTS_THRESHOLD
    ,round(Coalesce(REFUNDS_MISSING_WRONG_ADDRESSISSUE_RTS_PCT,0),2)::string       REFUNDS_MISSING_WRONG_ADDRESSISSUE_RTS_PCT
    ,Coalesce(ABOVE_USPS_MDNR_THRESHOLD,0)::string                 REFUNDS_USPS_MDNR_THRESHOLD
    ,Coalesce(ABOVE_MISSING_WRONG_ADDRESSISSUE_RTS_THRESHOLD,0)::string       REFUNDS_MISSING_WRONG_ADDRESSISSUE_RTS_THRESHOLD
    ,Coalesce(ABOVE_MISREP_CONDITION_THRESHOLD,0)::string              REFUNDS_MISREP_CONDITION_THRESHOLD
    ,Coalesce(ABOVE_REFERRAL_CREDIT_THRESHOLD,0)::string REFUNDS_REFERRAL_CREDIT_THRESHOLD
    from refund_user_metrics
)

 
select *
from wide_results;
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryRefundReasonAbuse"}

