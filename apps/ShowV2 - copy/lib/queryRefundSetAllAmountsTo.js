const newAmount = numberinputAllRefundAmount.value;
const rows = tableShipmentsRefund.data

if (newAmount === null) {
  return
}

console.log("Setting All the refund amount to = ", newAmount);
for (const row of rows) {
  // console.log("Setting the refund amount for order_id=", row.order_id);
  row.user_refund_amount = newAmount * 100;
  row.user_refund_subtotal_percentage = newAmount * 100 / row.subtotal_cents;
  row.user_refund_total_percentage = newAmount * 100 / row.total_cents;
}
tableShipmentsRefund.setData(rows); // Commit changes
numberinputAllRefundAmount.clearValue();
refundType.setValue('partial')
return rows;
