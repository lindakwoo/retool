let triggers = []
let results = []
if(ordersInShipment.value == null) {
  return results;
}

ordersInShipment.value.forEach((order) => {
  if(order.orderRefundRequest) {
    let req = order.orderRefundRequest;
    triggers.push(
      queryCreateOrderRefund.trigger({
        additionalScope: {
          orderIdParam: order.order_id,
          requestPayload: JSON.stringify(req)
        },
        onSuccess: (resp) => {
          results.push({
            refundMethod:order.refundMethod,
            orderId: order.order_id,
            orderRefundId: resp.id,
            status: "CREATING",
          })
        },
        onFailure: () => {
          results.push({
            refundMethod:order.refundMethod,
            orderId: order.order_id,
            orderRefundId: null,
            status: "FAILED",
          })
        }
      })
    );
  }
  else if(order.legacyRefundRequest) {
    let req = order.legacyRefundRequest;
    let refundMethod = order.refundMethod;
    let refundAmountCents = req.legacy_refund_amount_cents;
    if (req.refund_reason == "postage_due") {
      refundMethod = "postage_due";
    }
    if (req.is_full_refund) {
      refundAmountCents = order.quotation.buyer_refund.amount*100;
    }
    triggers.push(
      queryCreateLegacyRefund.trigger({
        additionalScope: {
          orderIdParam: order.order_id,
          requestPayload: JSON.stringify(req)
        },
        onSuccess: (resp) => {
          results.push({
            orderId: order.order_id,
            refundMethod:refundMethod,
            status: resp.msg,
            refundAmount: {
              amount: refundAmountCents,
              currency: order.total_currency,
            }
          })
        },
        onFailure: (error) => {
          let status = req.msg ? req.msg : "Failed";
          let errorParsed = JSON.parse(error);
          if(errorParsed.data && errorParsed.data.data && errorParsed.data.data.title) {
            status = errorParsed.data.data.title;
          }
          results.push({
            orderId: order.order_id,
            refundMethod:refundMethod,
            status: status,
            refundAmount: {
              amount: refundAmountCents,
              currency: order.total_currency,
            }
          })
        }
      })
    );
  }
});

await Promise.all(triggers);
return results;
