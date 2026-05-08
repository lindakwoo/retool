<Modal
  id="returnToSellerLabel"
  buttonText="Seller -> Buyer Label"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "ratesFromQueryCRTSL" },
        { targetId: null },
        { params: { ordered: [{ value: "false" }] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "getShippingLabelInfo" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: "reset" },
        { pluginId: "create_return_to_sender_label_form" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "createWithShippoRateStateCRTSL" },
        { targetId: null },
        { params: { ordered: [{ value: "false" }] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: "reset" },
        { pluginId: "create_return_to_sender_label_created_form" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "queryDefaultBuyerAddress_ShipmentDataPage" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  hidden=""
  modalHeight="650px"
  modalWidth="50%"
  tooltipText={
    '{{"Create Return to Sender Label, which will NOT override the existing shipment data"}}'
  }
>
  <Text
    id="text21"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="### Seller -> Buyer Label "
    verticalAlign="center"
  />
  <Spacer id="spacer3" marginType="normal" />
  <Form
    id="getRatesFormCRTSL"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hoistFetching={true}
    marginType="normal"
    padding="12px"
    paddingType="normal"
    requireValidation={true}
    showBody={true}
    showFooter={true}
    showHeader={true}
  >
    <Header>
      <Text
        id="formTitle4"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Shipment Label"
        verticalAlign="center"
      />
      <Text
        id="text22"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="Package Dimensions:"
        verticalAlign="center"
      />
      <NumberInput
        id="length_crtsl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{length_crtsl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="0"
        inputValue={0}
        label="L"
        labelWidth="30


"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{getShippingLabelInfo.isImported ?getShippingLabelInfo.data.parcel.length : (queryShipment.data.dimensions.length).toFixed(1)}}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="width_crtsl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{width_crtsl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="0"
        inputValue={0}
        label="W"
        labelWidth="30
"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.isImported ? getShippingLabelInfo.data.parcel.width : (queryShipment.data.dimensions.width).toFixed(1)}}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="height_crtsl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{height_crtsl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        inputValue={0}
        label="H"
        labelWidth="30
"
        marginType="normal"
        padDecimal={true}
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.isImported ? getShippingLabelInfo.data.parcel.height : (queryShipment.data.dimensions.height).toFixed(1)}}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="dimension_scale_crtsl"
        itemMode="static"
        label="Dimension Scale:"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        value="{{ getShippingLabelInfo.isImported ? getShippingLabelInfo.data.parcel.distance_unit : queryShipment.data.dimensions.scale }}"
      >
        <Option id="ee2c9" label="inches" value="inches" />
        <Option id="5a525" label="foot" value="foot" />
        <Option id="91e9d" label="centimeter" value="centimeter" />
        <Option
          id="1e22a"
          disabled={false}
          hidden={false}
          label="meter"
          value="meter"
        />
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
    </Header>
    <Body>
      <NumberInput
        id="weight_crtsl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{weight_crtsl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        inputValue={0}
        label="Package Weight:"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.isImported ? getShippingLabelInfo.data.parcel.weight : (queryShipment.data.weight.amount).toFixed(1) }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="weight_scale_crtsl"
        itemMode="static"
        label="Weight Scale"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        value="{{ getShippingLabelInfo.isImported ? getShippingLabelInfo.data.parcel.mass_unit : queryShipment.data.weight.scale}}"
      >
        <Option id="ee2c9" label="lb" value="lb" />
        <Option id="5a525" label="oz" value="oz" />
        <Option id="91e9d" label="g" value="g" />
        <Option
          id="7ba43"
          disabled={false}
          hidden={false}
          label="kg"
          value="kg"
        />
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <NumberInput
        id="insured_value_crtsl"
        _disclosedFields={{ array: [] }}
        currency="{{getShippingLabelInfo.data.currency}}"
        customValidation={
          '{{width.value < 0 ? "value must not be less than zero" : ""}}'
        }
        disabled="{{ ['UK','GB'].includes(getShippingLabelInfo.data.address_from.country) }}"
        format="currency"
        inputValue={0}
        label="Insured Value:"
        labelCaption={
          '{{insured_value_crtsl.value >= 500 ? "A signature is often required by carriers to insure items over $500. A signture confirmation will be added to your order to make sure you\'re compliant for insurance coverage." : ""}}'
        }
        labelWrap={true}
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="0"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="change"
          method="run"
          params={{
            ordered: [
              {
                src: "signature_confirmation_crtsl[0].setValue(insured_value[0].value >= 500)",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <TextInput
        id="package_contents_crtsl"
        _disclosedFields={{ array: [] }}
        label="Package Contents:"
        marginType="normal"
        minLength=""
        placeholder="e.g. Toys"
        required={true}
        value="{{ getShippingLabelInfo.data.parcel.product_categories }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </TextInput>
      <Select
        id="hazmat_override_crtsl"
        emptyMessage="No options"
        itemMode="static"
        label="Hazmat Override"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        showSelectionIndicator={true}
        value=""
      >
        <Option id="df935" label="Standard" value="STANDARD" />
        <Option id="224cf" label="Lithium Battery" value="LITHIUM_BATTERY" />
        <Option id="15e44" label="Not Hazmat" value="NOT_HAZMAT" />
      </Select>
      <Checkbox
        id="signature_confirmation_crtsl"
        _disclosedFields={{ array: [] }}
        label="Sign-On-Delivery Required"
        marginType="normal"
      >
        <Event
          event="change"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRTSL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Checkbox>
      <Include src="./collapsibleContainer5.rsx" />
      <Include src="./collapsibleContainer6.rsx" />
    </Body>
    <Footer>
      <Button
        id="getRatesSubmitCRTSL"
        _disclosedFields={{ array: [] }}
        hidden=""
        marginType="normal"
        submit={true}
        submitTargetId="getRatesFormCRTSL"
        text="Get Return Shipment Rate Quotes"
      />
    </Footer>
    <Event
      event="submit"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getRatesCRTSL"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
  <Form
    id="create_return_to_sender_label_form"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden="{{!ratesFromQueryCRTSL.value}}"
    hoistFetching={true}
    marginType="normal"
    padding="12px"
    paddingType="normal"
    requireValidation={true}
    showBody={true}
    showFooter={true}
    showHeader={true}
  >
    <Header>
      <Button
        id="getRatesLogsHyperlink2"
        iconBefore="bold/interface-link-square-alternate"
        text="Open logs"
      >
        <Event
          event="click"
          method="openUrl"
          params={{
            ordered: [
              { url: "{{getShippingRatesLogsURL_ShipmentDataPage.value}}" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Button
        id="getRatesLogsHyperlinkCopy2"
        iconBefore="bold/interface-edit-copy"
        text="Copy link to logs"
      >
        <Event
          event="click"
          method="copyToClipboard"
          params={{
            ordered: [
              { value: "{{getShippingRatesLogsURL_ShipmentDataPage.value}}" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </Header>
    <Body>
      <Select
        id="rates_crtsl"
        captionByIndex={
          '{{ `${item.provider.toLowerCase()} ${item.account_type && item.account_type !== "unknown" ? item.account_type : ""} account` }}\n'
        }
        data="{{ ratesFromQueryCRTSL.value }}"
        label="Shipment Rates:"
        labels="{{item.courier}} -  {{item.rate_card_name || item.product || item.shipping_service_id}} - {{item.price}} - {{item.eta_in_days}} days"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        values="{{ i }}"
      />
      <Select
        id="label_format_crtsl"
        itemMode="static"
        label="Label Format:"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        value="PDF_4x6"
      >
        <Option id="5a525" label="PDF Single 8x11" value="PDF" />
        <Option
          id="1e22a"
          disabled={false}
          hidden={false}
          label="PDF 4x6"
          value="PDF_4x6"
        />
      </Select>
    </Body>
    <Footer>
      <Button
        id="formButton2"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        submit={true}
        submitTargetId="create_return_to_sender_label_form"
        text="Create Return Shipping Label"
      />
    </Footer>
    <Event
      enabled=""
      event="submit"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="createWithShippoRateCRTSL"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
  <Form
    id="create_return_to_sender_label_created_form"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden="{{!createWithShippoRateStateCRTSL.value}}"
    hoistFetching={true}
    marginType="normal"
    padding="12px"
    paddingType="normal"
    requireValidation={true}
    resetAfterSubmit={true}
    showBody={true}
    showFooter={true}
    showHeader={true}
  >
    <Header>
      <Text
        id="formTitle5"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Label Created"
        verticalAlign="center"
      />
    </Header>
    <Body>
      <TextInput
        id="tracking_number_crtsl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Tracking Number"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{createWithShippoRateStateCRTSL.value.tracking_number}}"
      />
      <TextInput
        id="label_url_crtsl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Label URL"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{createWithShippoRateStateCRTSL.value.label_url}}"
      />
    </Body>
    <Footer>
      <Button
        id="formButton3"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        submit={true}
        submitTargetId="create_return_to_sender_label_created_form"
        text="Done"
      />
    </Footer>
    <Event
      event="submit"
      method="confetti"
      params={{ ordered: [] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="submit"
      method="close"
      params={{ ordered: [] }}
      pluginId="returnToSellerLabel"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
</Modal>
