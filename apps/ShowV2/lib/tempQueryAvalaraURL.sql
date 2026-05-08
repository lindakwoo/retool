SELECT 
  'https://admin.avalara.com/transactions?code=' 
    || external_id 
    || '&country=All&filterFrom=' 
    || DATE(created_at) 
    || '&filterTo=' 
    || DATE(created_at) as avatax_url
FROM order_taxes
WHERE order_id = {{urlparams.id}};
-- snowflake_telemetry: {"app_name": "Orders/Show", "query_name": "tempQueryAvalaraURL"}