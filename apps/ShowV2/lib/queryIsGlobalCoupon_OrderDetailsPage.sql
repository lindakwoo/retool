select coupons.id, coupons.is_global from coupons
inner join coupon_usages on coupons.id=coupon_usages.coupon_id where order_id={{urlparams.id}}
limit 1
-- snowflake_telemetry: {"app_name": "Orders/Show", "query_name": "queryIsGlobalCoupon"}