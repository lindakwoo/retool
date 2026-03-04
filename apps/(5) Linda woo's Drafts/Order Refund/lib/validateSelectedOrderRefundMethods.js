const selectedOrderRefundMethods = Array.from(new Set(
  tableOrders.selectedSourceRows
  .map((row) => row.refundMethod)
));

if (selectedOrderRefundMethods.length > 1) {
  modalFrameOrderSelectWarning.show();
}

return selectedOrderRefundMethods;