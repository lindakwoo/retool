let refundForm = null;
if (tabbedContainerRefundForm.currentViewKey === "legacy") {
  refundForm = formLegacyRefund;
}
else if(tabbedContainerRefundForm.currentViewKey === "giveaway") {
  refundForm = formGiveawayRefund;
}
else if(tabbedContainerRefundForm.currentViewKey === "postage_due") {
  refundForm = formPostageDueRefund;
} 
else if(tabbedContainerRefundForm.currentViewKey === "full") {
  refundForm = formFullRefund;
}
else if(tabbedContainerRefundForm.currentViewKey === "item_price") {
  refundForm = formItemPriceRefund;
}
else if(tabbedContainerRefundForm.currentViewKey === "shipping") {
  refundForm = formShippingRefund;
}
else if(tabbedContainerRefundForm.currentViewKey === "tax") {
  refundForm = formTaxRefund;
}
refundForm.submit();

