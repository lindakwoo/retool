variableRejectButtonEnabled.setValue(false);

const NON_REJECTABLE_REFUND_STATUSES = [
  "RETURN_SHIPMENT_SHIPPED", 
  "SELLER_DEDUCT", 
  "APPROVED", 
  "REJECTED_REMINDER_NOT_SENT", 
  "REJECTED"
];

let buttonEnabled = false;
let rejectRefundMessages = "";
for (let row of tableOrders.selectedRows) {
  let order = null;
  for (const i in ordersInShipment.value) {
    if (ordersInShipment.value[i].order_id == row.order_id) {
      order = ordersInShipment.value[i];
      break;
    }
  }

  
  if(order.refund_request_id && !NON_REJECTABLE_REFUND_STATUSES.includes(order.refund_request_status)) {
    buttonEnabled = true;
    rejectRefundMessages = rejectRefundMessages +"Order Id:"+order.order_id+" Order Status"+order.status+" Refund Request Id:"+order.refund_request_id+" Refund Request Status:"+order.refund_request_status+" Order Total:"+order.total_cents+"\n";
  } else {
    buttonEnabled = false;
    break;
  }
}
variableRejectButtonEnabled.setValue(buttonEnabled);
if(buttonEnabled) {
  variableRejectRefundMessages.setValue(rejectRefundMessages);
}


