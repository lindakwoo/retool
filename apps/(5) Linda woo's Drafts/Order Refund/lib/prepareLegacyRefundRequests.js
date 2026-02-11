let legacyAmountRefundRatio = percentageLegacyRetund.value;

let orders = ordersInShipment.value;

tableOrders.selectedRows.forEach((row) => {
  let order = null;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      order = orders[i];
      break;
    }
  }

  let currency = null;
  if(order){
    let legacyRefundCents = 0;
    if(order.reversibles.LEGACY_REVERSIBLE) {
      legacyRefundCents = (order.reversibles.LEGACY_REVERSIBLE.amount * legacyAmountRefundRatio)*100;
      currency = order.reversibles.LEGACY_REVERSIBLE.currency;
    }

    let is_full = false;
    if (legacyAmountRefundRatio == 1) {
      is_full = true;
    }
    if (legacyRefundCents != 0) {
      order.legacyRefundRequest = {
        author_email: current_user.email,
        refund_reason: selectLegacyRefundReason.value,
        notes: textAreaLegacyNotes.value,
        is_full_refund: is_full,
        legacy_refund_amount_cents: is_full ? null : Math.round(legacyRefundCents),
        legacy_refund_amount_currency: is_full ? null : currency,
        coverer_type: selectLegacyPaidBy.value,
        refund_type: selectLegacyReturnedTo.value,
      }
    }
    else {
      order.legacyRefundRequest = null;
    }
  }
});

await ordersInShipment.setValue(orders);