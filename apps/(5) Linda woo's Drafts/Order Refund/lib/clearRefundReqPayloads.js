let orders = ordersInShipment.value;
if (orders != null) {
  orders.forEach((o) => {
    o.quotation = null;
    o.orderRefundRequest = null;
    o.legacyRefundRequest = null;
    o.giveawayRefundRequest = null;
  })
  await ordersInShipment.setValue(orders);
}