const rows = tableCreateReturnLabel.selectedRow.data.reverse()
const requests = []
for (const row of rows) {
  requests.push({
    order_id: row.order_id,
    refund_amount: Math.round(row.amount_charged_cents) / 100,  // Note: we set the refund amount to 100% of the total charged amount (in dollars)
    listing_name: row.name,
    admin_order_link: row.admin_order_link,
  });
}
console.log("queryCRLPopulateTable: Collected " + requests.length + " requests");

for (const request of requests) {
  console.log("queryBulkRefund: Running queryRefund for order_id=", request.order_id);
  Promise.resolve(await appendToGoogleSpreadsheetCRL.trigger({
    additionalScope: {
      populateTableSelectedOrderInShipmentId: request.order_id,
      populateTableSelectedOrderInShipmentRefundAmount: request.refund_amount,
      populateTableSelectedOrderInShipmentListingName: request.listing_name,
      populateTableSelectedOrderInShipmentAdminOrderLink: request.admin_order_link,
    },
    onSuccess: (_) => {
      console.log("appendToGoogleSpreadsheetCRL for order: " + request.order_id + " has succeeded");
    },
    onFailure: (_) => {
      console.log("appendToGoogleSpreadsheetCRL for order: " + request.order_id + " has failed");
    },
  }));
  console.log("queryCRLPopulateTable: Finished running queryRefund for order_id=", request.order_id);
}

console.log("queryCRLPopulateTable: Done! (ran: " + requests.length + " requests)");