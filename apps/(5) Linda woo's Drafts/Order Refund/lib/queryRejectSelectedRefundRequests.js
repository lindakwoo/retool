if (!selectRejectRefundSelectReason.value || !textRejectRefundMessage.value) {
  utils.showNotification({
    title: "Invalid Reason or Message",
    description: "Please provide proper info before rejection request",
    notificationType: 'error'
  });
  return false;
}

let errorMessages = "";
variableRejectRefundResultMessage.setValue(errorMessages);
const rows = tableOrders.selectedRows;
for (const row of rows) {
  if (row.refund_request_id) {
    Promise.resolve(
      await queryRejectRefund.trigger({
        additionalScope: {
          refund_request_id: row.refund_request_id,
          refund_request_reject_reason: selectRejectRefundSelectReason.value, 
          refund_reuqest_reject_message: textRejectRefundMessage.value,
        },
        onSuccess: () => {
          utils.showNotification({
            title: "Refund Successfully Rejected",
            description: `Refund Rejected id: ${row.refund_reuqest_id}`,
            notificationType: "success",
          });
          
        },
        onFailure: (error) => {
          const parsedError = JSON.parse(error)
        
          if (parsedError?.data?.message) {
            const parsedMessage = JSON.parse(parsedError.data.message);
            let errMsg = parsedMessage.detail || parsedError.data.message;
            console.log(errMsg);
            errorMessages = errorMessages + errMsg + "\n"
          }
        },
      })
    );
  }
}
if(errorMessages == "") {
  modalFrameRejectRefunds.hide();
  formRejectRefunds.clear();
  variableRejectRefundResultMessage.setValue("");
  queryOrder.trigger();
} else {
  variableRejectRefundResultMessage.setValue(errorMessages);
}