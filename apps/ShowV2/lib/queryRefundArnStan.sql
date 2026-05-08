WITH order_to_payment AS (
  SELECT ORDER_ID, PAYMENT_ID
  FROM dbt.core.base__orders
  WHERE ORDER_ID = {{urlparams.id}}
),
payment_to_trx AS (
  SELECT
    otp.ORDER_ID,
    otp.PAYMENT_ID,
    pt.gateway_entity_id as transaction_id
  FROM order_to_payment otp
  JOIN dbt.core.payments__transactions pt
    ON otp.PAYMENT_ID = pt.PAYMENT_ID
),
refunds AS (
  SELECT
    pti.ORDER_ID,
    pti.PAYMENT_ID,
    pti.transaction_id,
    r.DESTINATION_DETAILS_CARD_REFERENCE as arn_stan,
    r.REFUND_AMOUNT,
    r.STATUS as refund_status
  FROM payment_to_trx pti
  JOIN dbt.core.payments__stripe_refunds r
    ON pti.transaction_id = r.id
)
SELECT
  ORDER_ID,
  PAYMENT_ID,
  transaction_id,
  arn_stan,
  REFUND_AMOUNT,
  refund_status
FROM refunds;
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryRefundArnStan"}
