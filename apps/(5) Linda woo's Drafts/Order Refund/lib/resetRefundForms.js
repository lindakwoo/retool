formFullRefund.clear();
formFullRefund.reset();
formItemPriceRefund.clear();
formItemPriceRefund.reset();
formShippingRefund.clear();
formShippingRefund.reset();
formLegacyRefund.clear();
formLegacyRefund.reset();
formGiveawayRefund.clear();
formGiveawayRefund.reset();
formTaxRefund.clear();
formTaxRefund.reset();
if (tableOrders.selectedRows.length == 0) {
  formFullRefund.setDisabled(true);
  formItemPriceRefund.setDisabled(true);
  formShippingRefund.setDisabled(true);
  formLegacyRefund.setDisabled(true);
  formGiveawayRefund.setDisabled(true);
  formTaxRefund.setDisabled(true);
} else {
  formFullRefund.setDisabled(false);
  formItemPriceRefund.setDisabled(false);
  formShippingRefund.setDisabled(false);
  formLegacyRefund.setDisabled(false);
  formGiveawayRefund.setDisabled(false);
  formTaxRefund.setDisabled(false);
}
await querySetRefundWarningMessage.trigger();
await clearRefundReqPayloads.trigger();