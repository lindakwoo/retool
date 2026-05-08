if (!mRejectRefundSelectReason.value) {
  utils.showNotification({
    title: "Invalid Reason or Message",
    description: "Please provide proper info before rejection request",
    notificationType: 'error'
  });
  return false;
}
mRejectRefundTRefundError.setValue("")
const rows = tableShipmentsRefund.selectedRow.data;
let has_failure = false
for (const row of rows) {
  if (row.refund_request_id) {
    Promise.resolve(
      await rejectRefundRequest.trigger({
        additionalScope: {
          refund_reuqest_id: row.refund_request_id,
          refund_reuqest_reason: mRejectRefundSelectReason.value, 
          refund_reuqest_message: mRejectRefundTMessage.value,
        },
        onSuccess: (data) => {
          console.log(
            "bulk reject for refund_request_id: " + row.refund_request_id + " has succeeded"
          );
          utils.showNotification({
                title: "Refund Successfully Rejected",
                description: `Refund Rejected id: ${row.refund_reuqest_id}`,
                notificationType: "success",
              });
          
        },
        onFailure: (error) => {
          console.log(
            "bulk reject for refund_request_id: " + row.refund_request_id + " has failed"
          );
          const parsedError = JSON.parse(error)
        
          if (parsedError?.data?.message) {
            const parsedMessage = JSON.parse(parsedError.data.message);
            let errMsg = parsedMessage.detail || parsedError.data.message;
            console.log(mRejectRefundTRefundError.value)
            mRejectRefundTRefundError.setValue(mRejectRefundTRefundError.value +  errMsg + "\n")
            console.log(errMsg)
            has_failure = true
          }
        },
      })
    );
  } else {
    Promise.resolve(
      await createAndRejectRefundRequest.trigger({
        additionalScope: {
          order_id: row.order_id,
          refund_reuqest_reason: mRejectRefundSelectReason.value, 
          refund_reuqest_message: mRejectRefundTMessage.value,
        },
        onSuccess: (data) => {
          console.log(
            "bulk reject for refund_request_id: " + row.refund_request_id + " has succeeded"
          );
          utils.showNotification({
                title: "Refund Successfully Rejected",
                description: `Refund Rejected id: ${row.refund_reuqest_id}`,
                notificationType: "success",
              });
          
        },
        onFailure: (error) => {
          console.log(
            "bulk reject for refund_request_id: " + row.refund_request_id + " has failed"
          );
          const parsedError = JSON.parse(error)
        
          if (parsedError?.data?.message) {
            const parsedMessage = JSON.parse(parsedError.data.message);
            let errMsg = parsedMessage.detail || parsedError.data.message;
            console.log(mRejectRefundTRefundError.value)
            mRejectRefundTRefundError.setValue(mRejectRefundTRefundError.value +  errMsg + "\n")
            console.log(errMsg)
            has_failure = true
          }
        },
      })
    );
  }
}
if(! has_failure) {
  mRejectRefund.hide(); 
  modalRefund.close();
  queryNewRefund2_0.trigger();
}