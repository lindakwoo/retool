let itemPriceRefundRatio = percentageItemPriceRefund.value;

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
    let itemPriceRefundCents = 0;
    if (order.reversibles.ITEM_PRICE) {
      itemPriceRefundCents=(order.reversibles.ITEM_PRICE.amount*itemPriceRefundRatio)*100
      currency = order.reversibles.ITEM_PRICE.currency;
    }
    if(!itemPriceRefundCents) {
      itemPriceRefundCents = 0;
    }

    if (itemPriceRefundCents != 0) {
      order.orderRefundRequest = {
        author_email: current_user.email,
        refund_reason: selectItemPriceRefundReason.value,
        notes: textAreaItemPriceNotes.value,
        is_full_refund: false,
        subtotal_reversal_cents: Math.round(itemPriceRefundCents),
        subtotal_reversal_currency: currency,
        buyer_shipping_reversal_cents:null,
        buyer_shipping_reversal_currency: null,
        coverer_type: selectItemPricePaidBy.value,
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