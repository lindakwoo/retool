select is_buy_your_own_label, is_trackable_byol, override_reason from DBT.CORE.shipments where shipment_id = {{ queryShipment.data.id }}
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryShipmentBYOL"}
