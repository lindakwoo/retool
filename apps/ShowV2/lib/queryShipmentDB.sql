select * from shipments where id = {{orderShipmentId.value}}
-- snowflake_telemetry: {"app_name": "Orders/Show", "query_name": "queryShipmentDB"}