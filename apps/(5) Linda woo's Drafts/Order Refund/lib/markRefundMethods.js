let orders = ordersInShipment.value;

orders.forEach((order) => {
  if("LEGACY_REVERSIBLE" in order.reversibles) {
    order.refundMethod = "legacy";
  }
  else if(order.order_style == 'giveaway') {
    order.refundMethod = "giveaway";
  }
  else {
    order.refundMethod = "normal";
  }  
});
ordersInShipment.setValue(orders);