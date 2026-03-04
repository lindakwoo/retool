let orders = ordersInShipment.value
let errors = []
let triggers = []
tableOrders.selectedRows.forEach((row) => {
  let order = null;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      order = orders[i];
      break;
    }
  }
  if (order.orderRefundRequest) {
    if(order.orderRefundRequest.refund_type == "TAX"){
      let total_tax = Number(order.reversibles.TAXES_ON_ITEM ? order.reversibles.TAXES_ON_ITEM.amount : 0) + Number(order.reversibles.TAXES_ON_BUYER_SHIPPING ? order.reversibles.TAXES_ON_BUYER_SHIPPING.amount : 0);
      order.quotation = {
        buyer_refund: {
          amount: total_tax,
          currency:order.total_currency,
        }
      }
    }
    else {
      triggers.push(
        queryGetQuotation.trigger({
          additionalScope: {
            orderIdParam: order.order_id,
            requestPayload: JSON.stringify(order.orderRefundRequest)
          },
          onFailure: (err) => {
            order.quotation = null;
            errors.push(err);
          },
          onSuccess: (quotation) => {
            order.quotation = quotation
          }
        })
      )
    }
  }
  else if(order.legacyRefundRequest) {
    let buyer_refund_amount = {
      amount: order.legacyRefundRequest.legacy_refund_amount_cents ? order.legacyRefundRequest.legacy_refund_amount_cents / 100 : order.reversibles.LEGACY_REVERSIBLE ? order.reversibles.LEGACY_REVERSIBLE.amount : 0,
      currency: order.total_currency,
    }
    order.quotation = {
      buyer_refund: buyer_refund_amount
    };
  }
  else if(order.giveawayRefundRequest) {
    let buyer_refund_amount = {
      amount: order.giveawayRefundRequest.legacy_refund_amount_cents / 100,
      currency: order.total_currency,
    }
    order.quotation = {
      buyer_refund: buyer_refund_amount
    };
  }
  else {
    order.quotation = null;
  }
});

await Promise.all(triggers);
await ordersInShipment.setValue(orders);