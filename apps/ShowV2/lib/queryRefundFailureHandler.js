let data = tableRefundSummary.data;
for (let i = 0; i < data.length; i++) {
  if (data[i].order_id === stateBulkRefundSelectedOrderInShipmentId) {
    console.log("queryRefund: Updated status to \"Failed\" for order_id: " + data[i].order_id);
    data[i].status = status || "Failed" 
  }
}
tableRefundSummary.setData(data);