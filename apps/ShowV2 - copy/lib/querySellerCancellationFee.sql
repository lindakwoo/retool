select *
from ledger_transactions lt
where 1=1
  and user_id = {{ orderSeller.value.id }}
  and external_entity_type = 'ORDER'
  and external_entity_id = {{ url.searchParams.id }}
  and transaction_type = 'ADJUSTMENT'
  and sub_transaction_type in (
    'SELLER_CANCELLATION_FEE',
    'SELLER_CANCELLATION_FEE_REVERSAL'
  )
order by created_at desc
limit 10