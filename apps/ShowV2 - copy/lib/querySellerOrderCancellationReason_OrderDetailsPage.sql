SELECT reason, reason_input_text, buyer_facing_message 
FROM seller_order_cancellation_reasons
WHERE order_id = {{ urlparams.id }}
LIMIT 1