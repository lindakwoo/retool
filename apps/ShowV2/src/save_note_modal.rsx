<Modal
  id="save_note_modal"
  buttonText="Unattached Tracking Numbers Note"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "get_note_for_order" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  modalHeightType="auto"
>
  <Text
    id="text45"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### Custom Shipment Notes and tracking "
    verticalAlign="center"
  />
  <TextInput
    id="save_note_tracking_info"
    _disclosedFields={{ array: [] }}
    label="Shipment Tracking #"
    marginType="normal"
    placeholder="shipment tracking number"
    value="{{get_note_for_order.data.tracking_info}}"
  />
  <TextInput
    id="save_note_zd"
    _disclosedFields={{ array: [] }}
    label="Zendesk Ticket"
    marginType="normal"
    placeholder="zendesk ticket url"
    value="{{get_note_for_order.data.zd_ticket}}"
  />
  <Select
    id="save_note_insured"
    emptyMessage="No options"
    itemMode="static"
    label="Insured label"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    showSelectionIndicator={true}
    value="{{get_note_for_order.data.insured}}"
  >
    <Option id="259c9" label="YES" value="true" />
    <Option id="cb95b" label="NO" value="false" />
  </Select>
  <TextArea
    id="save_note_additional"
    _disclosedFields={{ array: [] }}
    autoResize={true}
    label="Additional Notes"
    labelPosition="top"
    marginType="normal"
    minLines="4"
    placeholder="put any additional notes about this order here"
    value="{{get_note_for_order.data.notes}}"
  />
  <Button
    id="insert_note"
    _disclosedFields={{ array: [] }}
    hidden={'{{get_note_for_order.data.order_id != ""}}'}
    marginType="normal"
    text="save note"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="insert_note_for_order"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="update_note"
    _disclosedFields={{ array: [] }}
    hidden={'{{get_note_for_order.data.order_id == ""}}'}
    marginType="normal"
    submitTargetId=""
    text="update note"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="update_note_for_order"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
