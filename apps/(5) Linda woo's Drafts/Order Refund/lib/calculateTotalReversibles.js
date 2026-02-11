let admin_reversibles = [
  "ITEM_PRICE",
  "BUYER_SHIPPING",
  "REWARD_CREDITS",
  "TAXES_ON_ITEM",
  "TAXES_ON_BUYER_SHIPPING",
  "RETAIL_DELIVERY_FEE",
  "LEGACY_REVERSIBLE"
]

function to_pretty_text(text) {
  if(text == "ITEM_PRICE") {
    return "Order price";
  }
  if(text == "TAXES_ON_ITEM") {
    return "Tax on order(s)";
  }
  if(text == "BUYER_SHIPPING") {
    return "Buyer paid shipping";
  }
  if(text == "TAXES_ON_BUYER_SHIPPING") {
    return "Tax on shipping";
  }
  if (text == "REWARD_CREDITS") {
    return "Reward credits (inc.)"
  }
  return text.toLowerCase()
    .replace (/^[-_]*(.)/, (_, c) => c.toUpperCase())
    .replace (/[-_]+(.)/g, (_, c) => ' ' + c.toUpperCase())
}

let total_reversibles = {}

tableOrders.selectedRows.forEach((row) => {
  let reversibles = {}
  for (const i in ordersInShipment.value) {
    let order = ordersInShipment.value[i];
    if (order.order_id == row.order_id) {
      reversibles = order.reversibles;
      break;
    }
  }
  for(const key in reversibles) {
    if (!admin_reversibles.includes(key)) {
      continue;
    }
    
    if(key in total_reversibles) {
      if (total_reversibles[key].currency != reversibles[key].currency) {
        throw new Error("Reversible currencies don't match");
      }
      total_reversibles[key].amount = parseFloat(
        (total_reversibles[key].amount + parseFloat(reversibles[key].amount)).toFixed(10)
      );
    } else {
      total_reversibles[key] = {
        amount: parseFloat(reversibles[key].amount),
        currency: reversibles[key].currency,
        key: key,
        name: to_pretty_text(key),
      }
    }
  }
  
});
return total_reversibles;