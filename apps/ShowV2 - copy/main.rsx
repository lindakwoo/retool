<App>
  <Include src="./functions.rsx" />
  <DocumentTitle
    id="$customDocumentTitle"
    value="Order-{{ queryRecord.data.id }}"
  />
  <Include src="./src/buyer_shipments_in_this_livestream.rsx" />
  <Include src="./src/disputes.rsx" />
  <Include src="./src/invoice.rsx" />
  <Include src="./src/legacy.rsx" />
  <Include src="./src/listing.rsx" />
  <Include src="./src/order_details.rsx" />
  <Include src="./src/orders_in_shipment.rsx" />
  <Include src="./src/payment_details.rsx" />
  <Include src="./src/seller_cancellation_fee.rsx" />
  <Include src="./src/shipment_data.rsx" />
  <Include src="./src/shipping_adjustments.rsx" />
  <Include src="./src/tracking_updates_from_shippo.rsx" />
  <Include src="./header.rsx" />
</App>
