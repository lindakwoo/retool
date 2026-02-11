let orders = ordersInShipment.value;

tableOrders.selectedRows.forEach((row) => {
  let order = null;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      order = orders[i];
      break;
    }
  }

  if (
      (
        order.reversibles.ITEM_PRICE 
        && order.reversibles.ITEM_PRICE.amount > 0
      )
      || (
        order.reversibles.BUYER_SHIPPING 
        && order.reversibles.BUYER_SHIPPING.amount > 0
      )
      || (
        order.refund_request_id 
        && order.refund_request_status != 'APPROVED'
        )
    ) {
    order.orderRefundRequest = {
      author_email: current_user.email,
      refund_reason: selectFullRefundReason.value,
      notes: textAreaFullRefundNotes.value,
      is_full_refund: true,
      subtotal_reversal_cents: null,
      subtotal_reversal_currency: null,
      coverer_type: selectFullRefundPaidBy.value,
      with_commission: false,
      refund_type: selectFullRefundType.value
    }
    if(order.refund_request_id) {
      order.orderRefundRequest.existing_refund_request_id = order.refund_request_id;
    }
  }
  else {
    order.orderRefundRequest = null;
  }
});
await ordersInShipment.setValue(orders);