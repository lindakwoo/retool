<Modal
  id="CancellationWarningModal"
  buttonText="Cancellation Warning Modal"
  hidden="true"
  modalHeightType="auto"
>
  <Text
    id="text106"
    marginType="normal"
    value={
      'Are you sure? This order is from a break or mystery, and we should very rarely cancel these orders as the merchandise is now opened.\n\nIf you\'d still like to cancel, type "confirm" below and click Cancel.'
    }
    verticalAlign="center"
  />
  <TextInput
    id="textInput1"
    label="Cancellation Confirmation"
    labelPosition="top"
    marginType="normal"
    placeholder={'Type "confirm" if you\'d like to cancel this order'}
  />
  <Button
    id="button13"
    disabled={'{{textInput1.value != "confirm"}}'}
    marginType="normal"
    style={{ ordered: [{ background: "danger" }] }}
    text="Cancel"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="bulkUpdate"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
