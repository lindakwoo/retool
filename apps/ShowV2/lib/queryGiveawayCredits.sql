WITH all_giveaway_credits AS (
    /* branch A – matches the GIVEAWAY_REFUND row */
    SELECT lt.amount_cents
    FROM   ledger_transactions lt
    WHERE  lt.sub_transaction_type   = 'GIVEAWAY_CREDITS'
      AND  lt.external_entity_type   = 'GIVEAWAY_REFUND'
      AND  lt.external_entity_id     = {{urlparams.id}}

    UNION ALL

    /* branch B – matches rows through order_items */
    SELECT lt.amount_cents
    FROM   ledger_transactions lt
    JOIN   order_items oi
           ON oi.id = lt.order_item_id
    WHERE  lt.sub_transaction_type = 'GIVEAWAY_CREDITS'
      AND  oi.order_id             = {{urlparams.id}}
)

SELECT SUM(amount_cents) AS total_amount_cents
FROM   all_giveaway_credits;
