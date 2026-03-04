SELECT 
  'https://admin.avalara.com/transactions?code=' 
  	|| tt.tax_provider_transaction_id
    || '&country=All&filterFrom=' 
    || DATE(tt.created_at) 
    || '&filterTo=' 
    || DATE(tt.created_at) as avatax_url
FROM tax_transactions as tt
WHERE 
  tt.external_entity_id = {{urlparams.id}}
  and tt.external_entity_type = 'ORDER'
;
-- snowflake_telemetry: {"app_name": "Orders/Show", "query_name": "queryAvalaraFeesURL"}