let buyerShippingRefundRatio = percentageShippingRefund.value;

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
    let buyerShippingRefundCents = 0;
    if (order.reversibles.BUYER_SHIPPING) {
      buyerShippingRefundCents = (order.reversibles.BUYER_SHIPPING.amount * buyerShippingRefundRatio)*100;
      currency = order.reversibles.BUYER_SHIPPING.currency;
    }
    if(!buyerShippingRefundCents) {
      buyerShippingRefundCents = 0;
    }

    if (buyerShippingRefundCents != 0) {
      order.orderRefundRequest = {
        author_email: current_user.email,
        refund_reason: selectShippingRefundReason.value,
        notes: textAreaShippingNotes.value,
        is_full_refund: false,
        subtotal_reversal_cents: 0,
        subtotal_reversal_currency: currency,
        buyer_shipping_reversal_cents: Math.round(buyerShippingRefundCents),
        buyer_shipping_reversal_currency: currency,
        coverer_type: selectShippingPaidBy.value,
        with_commission: false,
        refund_type: "NO_RETURN"
      }
    }
    else {
      order.orderRefundRequest = null;
    }
  }
});

await ordersInShipment.setValue(orders);