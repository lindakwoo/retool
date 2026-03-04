function to_pretty_text(text) {
  return text.toLowerCase()
    .replace (/^[-_]*(.)/, (_, c) => c.toUpperCase())
    .replace (/[-_]+(.)/g, (_, c) => ' ' + c.toUpperCase())
}

const delay = function(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

let results = executionResult.value;
let triggers = []
for(let result of results) {
  if(result.refundMethod === "normal") {
    triggers.push(
      queryOrderRefunds.trigger({
        additionalScope: {
          orderIdParam: result.orderId
        },
        onSuccess: (resp) => {
          let orderRefund = resp.filter(oref => oref.id === result.orderRefundId)[0];
          result.status = orderRefund.status;
          result.covererType = orderRefund.coverer_type;
          result.refundReason = to_pretty_text(orderRefund.refund_reason);
          result.refundType = orderRefund.refund_type;
          if (orderRefund.refund_outcome) {
            result.buyer_refund = orderRefund.refund_outcome.buyer_refund;
            result.total_seller_charge = orderRefund.refund_outcome.total_seller_charge;
          }
        },
        onFailure: () => {
          result.status = 'Could not get status';
        }
      })
    );
  }
}

await Promise.all(triggers);
executionResult.setValue(results);

if (
  results
  .filter(res => res.status != "FAILED" && res.status != "BUYER_REFUNDED" && res.status != "COMPLETED" && res.refundMethod == "normal")
  .length > 0
) {
  await delay(5000);
  getOrderRefundExecutionResult.trigger();
}