SELECT *
FROM dbt.core.shipments__tracking_metrics
where shipment_id = {{ queryShipment.data.id }}
-- snowflake_telemetry: {"app_name": "Orders/ShowV2", "query_name": "queryShipmentScanTraits"}