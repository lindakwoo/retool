const run = async () => {
  const rows = tableShipments.selectedRow.data.reverse()

    for (const row of rows) {
      if (selectBulkAction.value === 'pay_seller'){
        payOrderID.setValue(row.order_id);
        promptPayoutConfirmation.setValue(false);
        await queryPayout_OrdersInShipmentPage.trigger();
      } else {
        stateOrderItemId.setValue(row.id);
        stateActionValue.setValue(selectBulkAction.value);
        await querySubmitActionNoConfirm.trigger();
      }
    }
    // reset selections
    tableShipments.selectRow();
    selectBulkAction.clearValue();
    selectBulkCancellationReason.clearValue();
    payOrderID.setValue(urlparams.id);
    promptPayoutConfirmation.setValue(true);
};

run();