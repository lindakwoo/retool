const rows = tableShipmentsRefund.data
for (const row of rows) {
  console.log("Running query for order_id=", row.order_id);
  row.user_refund_amount = row.total_cents;
  row.user_refund_subtotal_percentage = row.user_refund_amount / row.subtotal_cents;
  row.user_refund_total_percentage = row.user_refund_amount / row.total_cents;
}
tableShipmentsRefund.setData(rows); // Commit changes
return rows;
