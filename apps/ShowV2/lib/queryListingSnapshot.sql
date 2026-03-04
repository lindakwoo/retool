SELECT listing_snapshot FROM order_records where order_id={{queryRecord.data.id}}
-- snowflake_telemetry: {"app_name": "Orders/Show", "query_name": "queryListingSnapshot"}