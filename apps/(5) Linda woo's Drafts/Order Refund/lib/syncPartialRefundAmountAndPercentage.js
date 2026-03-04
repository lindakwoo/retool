let from_component = null;
let to_component = null;
if(reversibleKey == "ITEM_PRICE" && direction == "TO_PERCENTAGE") {
  from_component = currencyItemPriceRefund;
  to_component = percentageItemPriceRefund;
}
else if(reversibleKey == "ITEM_PRICE" && direction == "TO_AMOUNT") {
  from_component = percentageItemPriceRefund;
  to_component = currencyItemPriceRefund;
}
else if(reversibleKey == "BUYER_SHIPPING" && direction == "TO_PERCENTAGE") {
  from_component = currencyShippingRefund;
  to_component = percentageShippingRefund;
}
else if(reversibleKey == "BUYER_SHIPPING" && direction == "TO_AMOUNT") {
  from_component = percentageShippingRefund;
  to_component = currencyShippingRefund;
}
else if(reversibleKey == "LEGACY_REVERSIBLE" && direction == "TO_PERCENTAGE") {
  from_component = currencyLegacyRefund;
  to_component = percentageLegacyRetund;
}
else if(reversibleKey == "LEGACY_REVERSIBLE" && direction == "TO_AMOUNT") {
  from_component = percentageLegacyRetund;
  to_component = currencyLegacyRefund;
}

let reversibles = calculateTotalReversibles.data;
let reversible_amount = 0;
if(reversibleKey in reversibles) {
  reversible_amount=calculateTotalReversibles.data[reversibleKey].amount;
}

if(reversible_amount == 0) {
  to_component.setValue(0);
}
else {
  if (direction == "TO_PERCENTAGE") {
    to_component.setValue(from_component.value/reversible_amount);
  }
  else {
    to_component.setValue(reversible_amount*from_component.value);
  }
}

