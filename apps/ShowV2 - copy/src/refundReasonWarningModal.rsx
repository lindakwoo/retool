<Modal
  id="refundReasonWarningModal"
  buttonText="Refund Reason Warning Modal"
  hidden="true"
  modalHeight="200px"
  modalHeightType="auto"
  modalWidth="40%"
  showInEditor={true}
>
  <Text
    id="refundReasonWarningHeader"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="## Warning:"
    verticalAlign="center"
  />
  <Text
    id="refundReasonWarningText"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="This refund reason has been flagged as high-risk due to user information. The user may be a refund abuser."
    verticalAlign="center"
  />
  <Button
    id="refundReasonProceedButton"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    style={{ ordered: [{ background: "danger" }] }}
    text="I understand, proceed with refund"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="refundReasonWarningModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
