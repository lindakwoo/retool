<Modal
  id="modalVoidAndReassignTrackingCode"
  buttonText="Void & Reassign Tracking Code"
  disabled={
    '{{!["printed", "created", "in_transit"].includes(queryShipment.data.status)}}'
  }
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "selectedShipmentToBeOverridden" },
        {
          params: {
            ordered: [
              {
                value:
                  "{{queryRecord.data.items[0].order_item.internal_shipment_id}}",
              },
            ],
          },
        },
        { waitType: "debounce" },
        { waitMs: "0" },
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: true }] } },
      ],
    },
    {
      ordered: [
        { event: "close" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "selectedShipmentToBeOverridden" },
        { params: { ordered: [{ value: "{{null}}" }] } },
        { waitType: "debounce" },
        { waitMs: "0" },
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: true }] } },
      ],
    },
    {
      ordered: [
        { eventParams: { ordered: [{ onlyRespondToUserInteraction: false }] } },
        { method: "trigger" },
        { params: { ordered: [] } },
        { targetId: null },
        { pluginId: "queryShippingCouriers" },
        { waitType: "debounce" },
        { event: "open" },
        { type: "datasource" },
        { waitMs: "0" },
      ],
    },
  ]}
  modalHeightType="auto"
  tooltipText={
    '{{["printed", "created", "in_transit"].includes(queryShipment.data.status) ? "Override shipment data by providing the tracking code of a manually generated shipment label" : `Shipment cannot be reassigned, because it is in invalid state (${queryShipment.data.status}). It must be either "created", "printed" or "in_transit"`}}'
  }
>
  <Text
    id="text10"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="### Void & Reassign Tracking Code"
    verticalAlign="center"
  />
  <Select
    id="modalVoidAndReassignShippoAcctInput"
    _defaultValue={null}
    captionByIndex=""
    colorByIndex=""
    data=""
    disabledByIndex=""
    fallbackTextByIndex=""
    hiddenByIndex=""
    iconByIndex=""
    imageByIndex=""
    itemMode="static"
    label="Shippo account used to generate this label"
    labelCaption="This will always be sunny@whatnot.com unless it's a UPS label"
    labelPosition="top"
    labels=""
    marginType="normal"
    overlayMaxHeight={375}
    required={true}
    showSelectionIndicator={true}
    tooltipByIndex=""
    value="{{ self.values[0] }}"
    values=""
  >
    <Option
      id="fd0a6"
      caption="The regular Shippo account used for all carriers except UPS"
      disabled={false}
      hidden={false}
      label="sunny@whatnot.com"
      value="public"
    />
    <Option
      id="e8994"
      caption="The Shippo account used to generate UPS labels"
      disabled={false}
      hidden={false}
      label="aidan+platform@whatnot.com"
      value="platform"
    />
  </Select>
  <Select
    id="modalVoidAndReassignCourierInput"
    _defaultValue={null}
    allowDeselect={true}
    data="{{ queryShippingCouriers.data }}"
    hiddenByIndex=""
    label="Courier for new label"
    labelPosition="top"
    labels="{{ item.label }}"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    required={true}
    showSelectionIndicator={true}
    value="{{ self.values[0] }}"
    values="{{ item.value }}"
  />
  <TextInput
    id="modalVoidAndReassignTrackingCodeInput"
    _defaultValue=""
    _disclosedFields={{ array: [] }}
    disabled=""
    label="New tracking code"
    marginType="normal"
    maxLength="35"
    pattern="^\d[\d ]*"
    placeholder="E.g. 9205 5901 6491 7332 5292 56"
    required={true}
  />
  <Container
    id="containerVoidAndReassignErrorMessage"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden="{{!voidAndReassignErrorMsg.value}}"
    hoistFetching={true}
    marginType="normal"
    padding="12px"
    paddingType="normal"
    showBody={true}
    style={{
      ordered: [
        { border: "danger" },
        { headerBackground: "rgb(234, 182, 178)" },
        { background: "rgb(251, 245, 244)" },
      ],
    }}
  >
    <Header>
      <Text
        id="containerTitle2"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        style={{ ordered: [{ color: "primary" }] }}
        value="#### Failed to Generate Label"
        verticalAlign="center"
      />
    </Header>
    <View id="29207" viewKey="View 1">
      <Text
        id="voidAndReassignErrorMessage"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="**Error**: {{voidAndReassignErrorMsg.value}} "
        verticalAlign="center"
      />
    </View>
  </Container>
  <Button
    id="modalVoidAndReassignTrackingCodeActionButton"
    _disclosedFields={{ array: [] }}
    disabled="{{!!!modalVoidAndReassignTrackingCodeInput.value}}"
    marginType="normal"
    text="Reassign"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="querySubmitVoidAndReassignTrackingCode"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
