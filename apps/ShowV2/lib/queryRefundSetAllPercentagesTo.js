const newPercentage = numberinputAllRefundPercent.value;
const rows = tableShipmentsRefund.data

if (newPercentage === null) {
  return
}

console.log("Setting All the refund percentage (of Subtotal) to = ", newPercentage);
for (const row of rows) {
  // console.log("Setting the refund percentage for order_id=", row.order_id);
  row.user_refund_amount = row.subtotal_cents * newPercentage;
  row.user_refund_subtotal_percentage = newPercentage;
  row.user_refund_total_percentage = row.user_refund_amount / row.total_cents;
}
tableShipmentsRefund.setData(rows); // Commit changes
numberinputAllRefundPercent.clearValue();
refundType.setValue('partial')
return rows;
