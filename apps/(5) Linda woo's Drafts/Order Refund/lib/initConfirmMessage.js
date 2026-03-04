let currency = ordersInShipment.value.map(o => o.total_currency)[0];

let est_total_buyer_refund = ordersInShipment.value
  .filter(o => o.orderRefundRequest || o.legacyRefundRequest)
  .map(o => o.quotation.buyer_refund.amount)
  .reduce((partialSum, a) => partialSum + Number(a), 0);
let est_total_buyer_refund_formatted = new Intl.NumberFormat(current_user.locale, { style: 'currency', currency: currency })
  .format(est_total_buyer_refund);

let est_seller_earnings_reversal = ordersInShipment.value
  .filter(o => o.orderRefundRequest)
  .map(o => o.quotation.seller_earning_reversal ? o.quotation.seller_earning_reversal.amount : 0)
  .reduce((partialSum, a) => partialSum + Number(a), 0);
let est_seller_charge = ordersInShipment.value
  .filter(o => o.orderRefundRequest)
  .map(o => o.quotation.seller_charge ? o.quotation.seller_charge.amount : 0)
  .reduce((partialSum, a) => partialSum + Number(a), 0);
let est_seller_cost_formatted = new Intl.NumberFormat(current_user.locale, { style: 'currency', currency: currency })
  .format(Number(est_seller_earnings_reversal) + Number(est_seller_charge));

if(ordersInShipment.value.filter(o => o.legacyRefundRequest).length > 0) {
  return "**Total estimated buyer refund:** " + est_total_buyer_refund_formatted + "\n" 
    + "**Total estimated seller cost:** Can't estimate for legacy refunds.";
}
else if(ordersInShipment.value.filter(o => o.orderRefundRequest).length > 0) {
  return "**Total estmated buyer refund:** " + est_total_buyer_refund_formatted + "\n" 
    + "**Total estimated seller cost:** " + est_seller_cost_formatted
}
else {
  return "No refund request will be processed."
}

