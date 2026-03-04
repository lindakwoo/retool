let orders = ordersInShipment.value;

tableOrders.selectedRows.forEach((row) => {
  let order = null;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      order = orders[i];
      break;
    }
  }

  let total_tax = Number(order.reversibles.TAXES_ON_ITEM ? order.reversibles.TAXES_ON_ITEM.amount : 0) + Number(order.reversibles.TAXES_ON_BUYER_SHIPPING ? order.reversibles.TAXES_ON_BUYER_SHIPPING.amount : 0);
  if (total_tax > 0) {    
    order.orderRefundRequest = {
      author_email: current_user.email,
      refund_reason: selectTaxRefundReason.value,
      notes: textAreaTaxRefundNotes.value,
      is_full_refund: false,
      subtotal_reversal_cents: null,
      subtotal_reversal_currency: null,
      coverer_type: "WHATNOT",
      with_commission: false,
      refund_type: "TAX"
    }
  }
  else {
    order.orderRefundRequest = null;
  }
});
await ordersInShipment.setValue(orders);