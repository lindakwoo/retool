// Set refundReasonWarningMessage to a non-null string to display a pop-up warning modal let refundReasonWarningMessage = null;
// Warning: refundReason is set to value from queryRefundReasonsDropdown.data // This is not the same as the actual label displayed in dropdown selector // 'Preview' queryRefundReasonsDropdown to see the value that corresponds with each dropdown in the modal const refundReason = selectRefundReason.value;
 
if (queryRefundReasonAbuse.data.ABOVE_USER_REFUND_THRESHOLD == "true") {
  refundReasonWarningMessage = (
      "This user is above the threshold for our gameable refund rule."
  );
  if (queryRefundReasonAbuse.data.ABOVE_FAST_LANE_THRESHOLD == "true") {
    refundReasonWarningMessage += (
      " They are above the threshold for FAST_LANE."
    );
  }
  if (queryRefundReasonAbuse.data.ABOVE_BUYER_CANCELLATION_EDUCATION_THRESHOLD == "true") {
    refundReasonWarningMessage += (
      " They are above the threshold for BUYER_CANCELLATION_EDUCATION."
    );
  }
  if (queryRefundReasonAbuse.data.ABOVE_HVI_THRESHOLD == "true") {
    refundReasonWarningMessage += (
      " They are above the threshold for HVI."
    );
  }
}
if (refundReasonWarningMessage !== null){
  refundReasonWarningText.setValue(refundReasonWarningMessage);
  refundReasonWarningModal.open();
}