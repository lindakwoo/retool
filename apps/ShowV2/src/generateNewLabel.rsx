<Modal
  id="generateNewLabel"
  buttonText="Generate New Label"
  disabled={
    '{{!["created", "printed", "in_transit"].includes(queryShipment.data.status) }}'
  }
  events={[
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
        { type: "state" },
        { method: "setValue" },
        { pluginId: "ratesFromQuery" },
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
        { pluginId: "generate_new_label_form" },
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
        { pluginId: "customs_weight_calc" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  modalHeight="650px"
  modalWidth="50%"
  tooltipText={
    '{{["created","printed", "in_transit"].includes(queryShipment.data.status) ? "Generate a new shipping label, which will override the existing shipment data" : `Shipment cannot be reassigned, because it is in invalid state (${queryShipment.data.status}). It must be either "created", "printed" or "in_transit"`}}'
  }
>
  <Text
    id="generateNewLabelTitle"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="## Generate New Label"
    verticalAlign="center"
  />
  <Text
    id="northernIrelandWarning"
    hidden="{{ !(orderSeller.value?.home_address?.country_code === 'GB' && (orderSeller.value?.home_address?.postal_code || '').toUpperCase().startsWith('BT')) }}"
    value="*Note for sellers in Northern Ireland (BT postcode)*. DPD UK does not support shipments from Northern Ireland. Follow https://docs.google.com/document/d/1w1ubVCmiSSOBGMnzAE9bvQZyzZ3KcZoWYYNygEWyGKo/edit?tab=t.0"
    verticalAlign="center"
  />
  <Spacer id="spacer1" marginType="normal" />
  <Form
    id="getRatesForm"
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
        id="text13"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="### Shipment Info"
        verticalAlign="center"
      />
    </Header>
    <Body>
      <Alert
        id="flatRateBoxAlert2"
        description="Based on the show's shipping settings and package weight, the seller will be prompted to enter a flat-rate box. You & the seller can still generate a regular Priority Mail label."
        hidden="{{!!!requiresFlatRateBox.value}}"
        title="Should Use Flat-Rate Box"
      />
      <Select
        id="selectFlatRateBoxType"
        data="{{getShippingLabelInfo.data.courier_parcel_template_ids}}"
        disabled="{{!!!shipFlatRateToggle.value}}"
        emptyMessage="No options"
        hidden=""
        label="Flat-Rate Box Type"
        labelWrap={true}
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        showSelectionIndicator={true}
        value="{{getShippingLabelInfo.data.courier_parcel_template_ids[0]}}"
      />
      <Switch
        id="shipFlatRateToggle"
        _disclosedFields={{ array: [] }}
        label="Ship Flat-Rate Boxes"
        marginType="normal"
        value="{{requiresFlatRateBox.value}}"
      />
      <Text
        id="dimensionsDisclaimer"
        _disclosedFields={{ array: [] }}
        hidden="{{!!!shipFlatRateToggle.value}}"
        marginType="normal"
        value="*Dimensions below are updated to reflect the selected Flat-Rate Box type. Weight is irreleant for Flat Rate Boxes.* "
        verticalAlign="center"
      />
      <Text
        id="text43"
        _disclosedFields={{ array: [] }}
        hidden=""
        marginType="normal"
        value="Package Dimensions:"
        verticalAlign="center"
      />
      <NumberInput
        id="length"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{length.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        disabled="{{shipFlatRateToggle.value}}"
        hidden=""
        inputValue={0}
        label="L"
        labelWidth="20


"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getParcelDimensions.value.length }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="width"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{width.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        disabled="{{shipFlatRateToggle.value}}"
        hidden=""
        inputValue={0}
        label="W"
        labelWidth="20
"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getParcelDimensions.value.width }}"
      >
        <Event
          event="change"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="height"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{height.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        disabled="{{shipFlatRateToggle.value}}"
        hidden=""
        inputValue={0}
        label="H"
        labelWidth="20
"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getParcelDimensions.value.height }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="dimension_scale"
        disabled="{{shipFlatRateToggle.value}}"
        itemMode="static"
        label="Dimension Scale:"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        readOnly=""
        required={true}
        showSelectionIndicator={true}
        value="{{ getParcelDimensions.value.scale }}"
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
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <NumberInput
        id="weight"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{weight.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        disabled="{{shipFlatRateToggle.value}}"
        inputValue={0}
        label="Package Weight:"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.data.parcel.weight }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="weight_scale"
        disabled="{{shipFlatRateToggle.value}}"
        itemMode="static"
        label="Weight Scale"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        value="{{ getShippingLabelInfo.data.parcel.mass_unit }}"
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
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <NumberInput
        id="insured_value"
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
          '{{insured_value.value >= 500 ? "A signature is often required by carriers to insure items over $500. A signture confirmation will be added to your order to make sure you\'re compliant for insurance coverage." : ""}}'
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
          pluginId="ratesFromQuery"
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
                src: "signature_confirmation.setValue(insured_value.value >= 500)\n\n",
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
        id="package_contents"
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
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </TextInput>
      <Select
        id="hazmat_override"
        emptyMessage="No options"
        itemMode="static"
        label="Hazmat Override"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        showSelectionIndicator={true}
      >
        <Option id="df935" label="Standard" value="STANDARD" />
        <Option id="224cf" label="Lithium Battery" value="LITHIUM_BATTERY" />
        <Option id="15e44" label="Not Hazmat" value="NOT_HAZMAT" />
      </Select>
      <TextInput
        id="aes_itn"
        label="ITN"
        labelCaption="For customs"
        marginType="normal"
        placeholder="Enter value"
      />
      <Checkbox
        id="signature_confirmation"
        _disclosedFields={{ array: [] }}
        label="Sign-On-Delivery Required"
        marginType="normal"
      >
        <Event
          event="change"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQuery"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Checkbox>
      <Include src="./collapsibleContainer1.rsx" />
      <Include src="./collapsibleContainer2.rsx" />
    </Body>
    <Footer>
      <Button
        id="getRatesSubmit"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        submit={true}
        submitTargetId="getRatesForm"
        text="Get Rates"
      />
    </Footer>
    <Event
      event="submit"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getRates"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
  <Include src="./getRatesInfoContainer.rsx" />
  <Include src="./containerLabelGenerationFailureMessages.rsx" />
  <Text
    id="text132"
    hidden=""
    value="*Note for US -> International shipments*. If you are facing customs form failures, try using a weight of at least {{ customs_weight_calc.data }} oz."
    verticalAlign="center"
  />
</Modal>
