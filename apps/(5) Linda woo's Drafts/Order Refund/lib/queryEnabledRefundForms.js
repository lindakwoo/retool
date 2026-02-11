let enabledRefundForms = [];
let selectedOrders = [];
tableOrders.selectedRows.forEach((row) => {
  let orders = ordersInShipment.value;
  for (const i in orders) {
    if (orders[i].order_id == row.order_id) {
      selectedOrders.push(orders[i]);
      break;
    }
  }
});

let hasLegacy = selectedOrders
  .filter(
    o => o.reversibles 
      && o.reversibles.LEGACY_REVERSIBLE 
      && o.reversibles.LEGACY_REVERSIBLE.amount > 0
  ).length > 0;
let hasGiveaway = selectedOrders
  .filter(
    o => o.order_style == 'giveaway'
  ).length > 0;
let hasBuyerShipping = selectedOrders
  .filter(
    o => o.reversibles
      && o.reversibles.BUYER_SHIPPING 
      && o.reversibles.BUYER_SHIPPING.amount > 0
  ).length > 0;
let hasItemPrice = selectedOrders
  .filter(
    o => o.reversibles
      && o.reversibles.ITEM_PRICE 
      && o.reversibles.ITEM_PRICE.amount > 0
  ).length > 0;

let hasTax = selectedOrders
  .filter(
    o => o.reversibles 
      && (
        (o.reversibles.TAXES_ON_ITEM && o.reversibles.TAXES_ON_ITEM.amount > 0) 
        || (o.reversibles.TAXES_ON_BUYER_SHIPPING && o.reversibles.TAXES_ON_BUYER_SHIPPING.amount > 0)
      )
  ).length > 0;
if(hasLegacy) {
  enabledRefundForms.push("legacy");
  if (selectedOrders.length == 1) {
    enabledRefundForms.push("postage_due");
  }
}
else if(hasGiveaway) {
  enabledRefundForms.push("giveaway");
  enabledRefundForms.push("postage_due");
}
else {
  if (hasBuyerShipping || hasItemPrice) {
    enabledRefundForms.push("full");
  }
  if(hasBuyerShipping) {
    enabledRefundForms.push("shipping");
  }
  if(hasItemPrice) {
    enabledRefundForms.push("item_price");
  }
  if(hasTax) {
    enabledRefundForms.push("tax");
  }
  if((hasBuyerShipping || hasItemPrice || hasTax) && selectedOrders.length == 1) {
    enabledRefundForms.push("postage_due");
  }
}

const selectedRefundMethods = Array.from(new Set(
  tableOrders.selectedSourceRows
  .map((row) => row.refundMethod)
));

if (enabledRefundForms.length == 0 || selectedRefundMethods.length > 1) {
  enabledRefundForms = ["na"];
}

tabsRefundForms.setValue(enabledRefundForms[0]);

return enabledRefundForms;
