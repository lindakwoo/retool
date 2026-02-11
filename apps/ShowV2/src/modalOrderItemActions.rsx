<Modal
  id="modalOrderItemActions"
  buttonText="Actions ({{queryRecord.data.items[i].actions.filter((action) => action.label != 'Cancel' && action.label != 'Silent cancel').length}} available)"
  disabled="{{queryRecord.data.items[i].actions.length === 0}}"
  events={[]}
>
  <Alert
    id="generateOutgoingLabelAlert"
    description="The 'Generate Outgoing Label' button (formerly 'Ship It') is only available for hand-authenticated marketplace orders leaving the warehouse (order style is 'ORDER' or 'OFFER'). If you need this button, please reach out to #epd-pal-pod and tag @logistics-eng."
    hidden="true"
    title="Missing 'Generate Outgoing Label' Button"
  />
  <Include src="./modalActionShipIt.rsx" />
  <ButtonWidget
    id="buttonAction1"
    events={[
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateOrderItemId" },
          {
            params: {
              ordered: [{ value: "{{queryRecord.data.items[i].id}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateActionValue" },
          {
            params: {
              ordered: [{ value: "{{transformerActions.value[0].value}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "querySubmitAction" },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "200" },
        ],
      },
    ]}
    hidden="{{!transformerActions.value[0]}}"
    value="{{transformerActions.value.filter((action) => action.label != 'Cancel' && action.label != 'Silent cancel')[0].label}}"
  />
  <ButtonWidget
    id="buttonAction2"
    events={[
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateOrderItemId" },
          {
            params: {
              ordered: [{ value: "{{queryRecord.data.items[i].id}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateActionValue" },
          {
            params: {
              ordered: [{ value: "{{transformerActions.value[1].value}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "querySubmitAction" },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "200" },
        ],
      },
    ]}
    hidden="{{!transformerActions.value[1]}}"
    value="{{transformerActions.value.filter((action) => action.label != 'Cancel' && action.label != 'Silent cancel')[1].label}}"
  />
  <ButtonWidget
    id="buttonAction3"
    events={[
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateOrderItemId" },
          {
            params: {
              ordered: [{ value: "{{queryRecord.data.items[i].id}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateActionValue" },
          {
            params: {
              ordered: [{ value: "{{transformerActions.value[2].value}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "querySubmitAction" },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "200" },
        ],
      },
    ]}
    hidden="{{!transformerActions.value[2]}}"
    value="{{transformerActions.value.filter((action) => action.label != 'Cancel' && action.label != 'Silent cancel')[2].label}}"
  />
  <ButtonWidget
    id="buttonAction4"
    events={[
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateOrderItemId" },
          {
            params: {
              ordered: [{ value: "{{queryRecord.data.items[i].id}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "state" },
          { method: "setValue" },
          { pluginId: "stateActionValue" },
          {
            params: {
              ordered: [{ value: "{{transformerActions.value[3].value}}" }],
            },
          },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
      {
        ordered: [
          { event: "click" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "querySubmitAction" },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "200" },
        ],
      },
    ]}
    hidden="{{!transformerActions.value[3]}}"
    value="{{transformerActions.value.filter((action) => action.label != 'Cancel' && action.label != 'Silent cancel')[3].label}}"
  />
  <Select
    id="selectCancellationReason"
    allowDeselect={true}
    data="{{ queryCancellationReasons_ListingPage.data }}"
    hidden="{{(queryRecord.data.items[0].actions.filter(x => x.value == ('trigger_cancel')).length != 1) & (queryRecord.data.items[0].actions.filter(x => x.value == ('trigger_silent_cancel')).length != 1)}}"
    label="Cancellation Reason"
    labelPosition="top"
    labels="{{ _.startCase(item) }}"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    showSelectionIndicator={true}
    value=""
    values="{{ item }}"
  />
</Modal>
