let orders = ordersInShipment.value;

tableOrders.selectedRows.forEach((row) => {
  let order = null;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      order = orders[i];
      break;
    }
  }

  if(order){
    if (order.total_cents == 0
        && currencyGiveawayRefund.value>0) {
      order.legacyRefundRequest = {
        author_email: current_user.email,
        refund_reason: selectGiveawayReason.value,
        notes: textAreaGiveawayNotes.value,
        is_full_refund: false,
        legacy_refund_amount_cents:currencyGiveawayRefund.value*100,
        legacy_refund_amount_currency: order.total_currency,
        coverer_type: "WHATNOT",
        refund_type: "NO_RETURN",
      }
    }
    else {
      order.legacyRefundRequest = null;
    }
  }
});

await ordersInShipment.setValue(orders);