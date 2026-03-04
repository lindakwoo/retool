<Modal
  id="modalActionShipIt"
  buttonText="Generate Outgoing Label"
  closeOnOutsideClick={true}
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "stateOrderItemId" },
        {
          params: { ordered: [{ value: "{{queryRecord.data.items[i].id}}" }] },
        },
        { waitType: "debounce" },
        { waitMs: "0" },
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: true }] } },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "stateActionValue" },
        {
          params: {
            ordered: [{ value: "{{transformerActionShipIt.value.value}}" }],
          },
        },
        { waitType: "debounce" },
        { waitMs: "0" },
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: true }] } },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: "clearValue" },
        { pluginId: "radiogroupActionShipIt" },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
        { pluginInstance: "0" },
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: true }] } },
      ],
    },
  ]}
  hidden="{{!!!transformerActionShipIt.value}}"
  modalHeightType="auto"
>
  <Text
    id="text9"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### Generate Outgoing Shipping Label"
    verticalAlign="center"
  />
  <Alert
    id="alert1"
    description="Only use this tool for outgoing warehouse shipments."
    type="warning"
  />
  <RadioGroup
    id="radiogroupActionShipIt"
    _defaultValue={null}
    data="{{queryShippingRates.data}}"
    deprecatedLabels="{{queryShippingRates.data.map(x => `${x.price} - ${x.currier} ${x.product}`)}}"
    groupLayout="singleColumn"
    label="Shipping Rate"
    labelPosition="top"
    labels="{{ item.courier + ' ' + item.product + ' - ' + item.price }}"
    labelWrap={true}
    marginType="normal"
    required={true}
    value=""
    values="{{ i }}"
  />
  <ButtonWidget
    id="buttonSubmitActionShipIt"
    disabled="{{!!!radiogroupActionShipIt['0'].value}}"
    events={[
      {
        ordered: [
          { event: "click" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "querySubmitActionShipIt" },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
    ]}
  />
</Modal>
