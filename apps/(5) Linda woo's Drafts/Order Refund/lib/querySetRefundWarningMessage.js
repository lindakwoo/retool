let message = "";
for(let row of tableOrders.selectedRows) {
  let order = null;
  for (const i in ordersInShipment.value) {
    if (ordersInShipment.value[i].order_id == row.order_id) {
      order = ordersInShipment.value[i];
      break;
    }
  }
  
  if(order && order.refund_request_status == 'REJECTED') {
    message = message + "This order already had a refund request that was rejected. Confirm with your supervisor before processing a new refund\n";
    break;
  }
}

variableRefundWarningMessage.setValue(message);

