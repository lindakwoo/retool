const rows = tableShipmentsRefund.selectedRow.data.reverse();
const requests = [];
for (const row of rows) {
  // console.log("queryBulkRefund: Collectig requests, now processing order_id=", row.order_id);
  requests.push({
    order_id: row.order_id,
    user_refund_amount: Math.round(row.user_refund_amount),
    status: "InProgress...",
    order_created_at: row.created_at,
  });
}

console.log("queryBulkRefund: Collected " + requests.length + " requests");
queryBulkRefundRequestsState.setValue(requests);

for (const request of requests) {
  console.log(
    "queryBulkRefund: Running queryRefund for order_id=",
    request.order_id
  );
  Promise.resolve(
    await queryRefund.trigger({
      additionalScope: {
        stateBulkRefundSelectedOrderInShipmentId: request.order_id,
        stateBulkRefundSelectedOrderInShipmentReqAmountCents:
          request.user_refund_amount,
      },
      onSuccess: (data) => {
        console.log(
          "queryRefund for order: " + request.order_id + " has succeeded"
        );
        Promise.resolve(
          queryRefundSuccessHandler.trigger({
            additionalScope: {
              stateBulkRefundSelectedOrderInShipmentId: request.order_id,
              responseData: data,
            },
          })
        );
      },
      onFailure: (error) => {
        console.log(
          "queryRefund for order: " + request.order_id + " has failed"
        );
        let status = null;
        try {
          const parsedError = JSON.parse(error);
          if (parsedError?.data?.message) {
            const parsedMessage = JSON.parse(parsedError.data.message);
            let errMsg = parsedMessage.detail || parsedError.data.message;
            if (typeof errMsg === 'object' && errMsg !== null && 'msg' in errMsg) {
              errMsg = errMsg.msg
            }
            console.log(">>> errMsg: ", errMsg);
            status = "Failed: " + errMsg;

            utils.showNotification({
              title: "Refund Failed",
              description: status,
              notificationType: "error",
            });
          }
        } catch (e) {}
        Promise.resolve(
          queryRefundFailureHandler.trigger({
            additionalScope: {
              stateBulkRefundSelectedOrderInShipmentId: request.order_id,
              orderCreatedAt: request.order_created_at,
              status: status,
            },
          })
        );
      },
    })
  );
  console.log(
    "queryBulkRefund: Finished running queryRefund for order_id=",
    request.order_id
  );
}

console.log("queryBulkRefund: Done! (ran: " + requests.length + " requests)");
