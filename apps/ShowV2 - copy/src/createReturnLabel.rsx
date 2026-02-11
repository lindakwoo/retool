<Modal
  id="createReturnLabel"
  buttonText="Create Return Label"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "state" },
        { method: "setValue" },
        { pluginId: "ratesFromQueryCRL" },
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
        { pluginId: "create_return_label_form" },
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
        { pluginId: "createWithShippoRateStateCRL" },
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
        { pluginId: "queryDefaultBuyerAddress_ShipmentDataPage" },
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
        { method: "reset" },
        { pluginId: "queryCRLShipment" },
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
        { pluginId: "queryCRLShipment" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "script" },
        { method: "run" },
        { pluginId: "" },
        { targetId: null },
        {
          params: {
            ordered: [
              {
                src: 'if (return_label_receipient_select.hidden) {\n  return_label_receipient_select.setValue("whatnot")\n}else{\n  return_label_receipient_select.setValue("seller")  \n}\n\n//  Not sure why I need to trigger it explicitly\nreturn_label_recipient_select_change_js.trigger()',
              },
            ],
          },
        },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: "setHidden" },
        { pluginId: "c_override_existing_shipment" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  hidden=""
  modalHeight="650px"
  modalHeightType="auto"
  modalWidth="80%"
  tooltipText={
    '{{"Create Return Label, which will NOT override the existing shipment data"}}'
  }
>
  <Text
    id="text19"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="### Create Return Label"
    verticalAlign="center"
  />
  <Button
    id="revealBuyerAddressReturnLabelButton"
    _disclosedFields={{ array: [] }}
    disabled={
      '{{ !queryShipment.data || queryShipment.metadata.headers["x-whatnot-pii-masked"][0] === "false"}}'
    }
    marginType="normal"
    text="Reveal PII (required)"
  >
    <Event
      event="click"
      method="run"
      params={{
        ordered: [
          {
            src: "await queryShipment.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Spacer id="spacer2" marginType="normal" />
  <Form
    id="getRatesFormCRL"
    disabled=""
    disableSubmit="{{tableCreateReturnLabel.selectedIndex.length == 0}}"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden={
      '{{ queryShipment.data && queryShipment.metadata.headers["x-whatnot-pii-masked"][0] === "true"}}'
    }
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
        id="formTitle1"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Shipment Label"
        verticalAlign="center"
      />
      <Text
        id="text20"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="Package Dimensions:"
        verticalAlign="center"
      />
      <NumberInput
        id="length_crl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{length_crl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        inputValue={0}
        label="L"
        labelWidth="20


"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.data.parcel.length }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="width_crl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{width_crl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        inputValue={0}
        label="W"
        labelWidth="20
"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.data.parcel.width }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <NumberInput
        id="height_crl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{height_crl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
        decimalPlaces="2"
        inputValue={0}
        label="H"
        labelWidth="20
"
        marginType="normal"
        placeholder="Enter value"
        required={true}
        showSeparators={true}
        showStepper={true}
        value="{{ getShippingLabelInfo.data.parcel.height }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="dimension_scale_crl"
        itemMode="static"
        label="Dimension Scale:"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        required={true}
        showSelectionIndicator={true}
        value="{{ getShippingLabelInfo.data.parcel.distance_unit }}"
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
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
    </Header>
    <Body>
      <NumberInput
        id="weight_crl"
        _disclosedFields={{ array: [] }}
        currency="USD"
        customValidation={
          '{{weight_crl.value <= 0 ? "value must be greater than zero" : ""}}'
        }
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
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </NumberInput>
      <Select
        id="weight_scale_crl"
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
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <NumberInput
        id="insured_value_crl"
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
          '{{insured_value_crl.value >= 500 ? "A signature is often required by carriers to insure items over $500. A signture confirmation will be added to your order to make sure you\'re compliant for insurance coverage." : ""}}'
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
          pluginId="ratesFromQueryCRL"
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
                src: "signature_confirmation_crl[0].setValue(insured_value[0].value >= 500)",
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
        id="package_contents_crl"
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
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </TextInput>
      <Checkbox
        id="signature_confirmation_crl"
        _disclosedFields={{ array: [] }}
        label="Sign-On-Delivery Required"
        marginType="normal"
      >
        <Event
          event="change"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Checkbox>
      <Select
        id="refund_reason_crl"
        allowSearch={true}
        captionByIndex={
          '{{{\n  "Damaged Item in Transit": "RET-DIT",\n  "Misrepresented Condition": "RET-MCON",\n  "Buyer/Seller Dispute": "RET-DIS",\n  "Confirmed Counterfeit": "RET-COU",\n  "Damaged due to Incorrect Packaging": "RET-DPAC",\n  "Damaged - Misrepresented product condition": "RET-DMIS",\n  "Inconclusive Counterfeit": "RET-COU",\n  "International Shipping": "RET-INT",\n  "Misbid": "RET-BID",\n  "Missing Item": "RET-MIS",\n  "Other": "RET-OTH",\n  "Return to Sender": "RET-RTS",\n  "Shipment not dropped off": "RET-SHI",\n  "Tax Issues": "RET-TAX",\n  "Unlicensed Product": "RET-UNL",\n  "USPS error": "RET-USP",\n  "Wrong Item": "RET-WRO",\n  "HVI - T&S Investigation": "RET-HVI",\n  "Marked Delivered Not Received": "RET-DEL",\n  "Postage Due": "RET-POS",\n  "Referral Credit": "RET-REF",\n  "Break Did Not Fill": "RET-BDF",\n  "Tracking Stuck": "RET-TRA",\n  "Buyer Overcharged Shipping": "RET-BOS",\n  "Buyer Additional Postage Due": "RET-POS",\n  "Incorrect Address On Purchase": "RET-IAP",\n  "Whatnot Error": "RET-WNE",\n  "Fast Lane Refund": "RET-FLR",\n  "Buyer Cancellation Education": "RET-BCE",\n  "Missing or Damaged USPS Note": "RET-USN",\n  "Seller Return Dispute": "RET-SRD"\n}[item.label]\n}}'
        }
        colorByIndex=""
        data="{{ queryRefundReasonsDropdown_ShipmentDataPage.data }}"
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        label="Refund Reason:"
        labels="{{ item.label }}"
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight="375"
        placeholder="Select refund reason"
        required={true}
        showInEditor={null}
        showSelectionIndicator={true}
        tooltipByIndex=""
        value=""
        values="{{ item.value }}"
      >
        <Event
          event="focus"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="ratesFromQueryCRL"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <Text
        id="text28"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Orders in Shipment"
        verticalAlign="center"
      />
      <TableLegacy
        id="tableCreateReturnLabel"
        _columns={[
          "order_id",
          "order_item_id",
          "name",
          "item_weight",
          "item_weight_scale",
          "amount_charged_cents",
          "taxes_cents",
          "shipping_price_cents",
          "Custom Column 1",
          "Custom Column 2",
          "admin_order",
        ]}
        _columnSummaryTypes={{
          ordered: [
            { id: "" },
            { order_id: "" },
            { product_id: "" },
            { "Custom Column 3": "sum" },
            { "Custom Column 4": "average" },
            { amount_charged_cents: "sum" },
            { total_cents: "sum" },
            { user_refund_percentage: "average" },
            { user_refund_amount: "sum" },
            { taxes_cents: "sum" },
            { shipping_price_cents: "sum" },
            { order_item_id: "" },
            { item_weight: "sum" },
            { item_weight_scale: "" },
            { admin_order_link: "" },
          ],
        }}
        _columnSummaryValues={{
          ordered: [
            { id: "" },
            { order_id: "" },
            { product_id: "" },
            { "Custom Column 3": "" },
            { "Custom Column 4": "" },
            { amount_charged_cents: "" },
            { total_cents: "" },
            { user_refund_percentage: "" },
            { user_refund_amount: "" },
            { taxes_cents: "" },
            { shipping_price_cents: "" },
            { order_item_id: "" },
            { item_weight: "" },
            { item_weight_scale: "" },
            { admin_order_link: "" },
          ],
        }}
        _columnVisibility={{
          ordered: [
            { amount_charged_currency: false },
            { amount_refunded_cents: true },
            { total_currency: false },
            { total_cents: false },
            { amount_refunded_currency: false },
            { amount_charged_cents: true },
            { order_item_id: false },
            { item_shipping_profile_id: false },
            { id: false },
          ],
        }}
        _compatibilityMode={false}
        _unfilteredSelectedIndex=""
        allowMultiRowSelect={true}
        calculatedColumns={["Custom Column 1", "Custom Column 2"]}
        columnAlignment={{
          ordered: [
            { shipping_price_cents: "right" },
            { item_weight: "right" },
            { taxes_cents: "right" },
            { user_refund_amount: "right" },
            { product_id: "left" },
            { order_id: "left" },
            { user_refund_percentage: "right" },
            { item_weight_scale: "left" },
            { total_cents: "right" },
            { amount_charged_cents: "right" },
            { "Custom Column 1": "left" },
            { order_item_id: "left" },
            { "Custom Column 2": "left" },
            { "Custom Column 3": "right" },
            { "Custom Column 4": "right" },
            { id: "left" },
            { admin_order_link: "left" },
          ],
        }}
        columnColors={{
          shipping_price_cents: "",
          item_weight: "",
          taxes_cents: "",
          amount_charged_currency: "",
          created_at: "",
          amount_refunded_cents: "",
          user_refund_amount: "#e8cd8e",
          product_id: "",
          name: "",
          total_currency: "",
          order_id: "",
          user_refund_percentage: "#e7dd8e",
          item_weight_scale: "",
          total_cents: "",
          test: "",
          amount_refunded_currency: "",
          status: "",
          item_weight_amount: "",
          amount_charged_cents: "",
          "Custom Column 1": "",
          order_item_id: "",
          item_shipping_profile_id: "",
          "Custom Column 2": "",
          id: "",
          admin_order_link: "",
        }}
        columnEditable={{
          ordered: [
            { shipping_price_cents: false },
            { item_weight: false },
            { taxes_cents: false },
            { name: false },
            { order_id: false },
            { item_weight_scale: false },
            { amount_charged_cents: false },
            { "Custom Column 1": false },
            { order_item_id: false },
            { "Custom Column 2": false },
            { admin_order: false },
          ],
        }}
        columnFormats={{
          ordered: [
            { id: "TextDataCell" },
            { "Custom Column 1": "button" },
            { "Custom Column 2": "button" },
            { order_id: "TextDataCell" },
            { product_id: "TextDataCell" },
            { "Custom Column 3": "CurrencyDataCell" },
            { "Custom Column 4": "PercentDataCell" },
            { amount_charged_cents: "CurrencyDataCell" },
            { total_cents: "CurrencyDataCell" },
            { user_refund_percentage: "PercentDataCell" },
            { user_refund_amount: "CurrencyDataCell" },
            { taxes_cents: "CurrencyDataCell" },
            { shipping_price_cents: "CurrencyDataCell" },
            { order_item_id: "TextDataCell" },
            { item_weight: "NumberDataCell" },
            { item_weight_scale: "TextDataCell" },
            { admin_order_link: "LinkDataCell" },
          ],
        }}
        columnHeaderNames={{
          ordered: [
            { shipping_price_cents: "Shipping" },
            { item_weight: "Item Weight" },
            { taxes_cents: "Taxes" },
            { amount_charged_currency: "Currency" },
            { amount_refunded_cents: "" },
            { user_refund_amount: "REQ Refund Amount" },
            { product_id: "Product ID" },
            { name: "Name" },
            { order_id: "Order ID" },
            { user_refund_percentage: "REQ Refund Percentage" },
            { item_weight_scale: "Scale" },
            { total_cents: "Total" },
            { amount_refunded_currency: "Currency" },
            { status: "Order Item Status" },
            { item_weight_amount: "Item Weight" },
            { amount_charged_cents: "Amount Charged" },
            { "Custom Column 1": "Shipping Profile" },
            { order_item_id: "Order Item ID" },
            { item_shipping_profile_id: "" },
            { "Custom Column 2": "Open Order" },
            { "Custom Column 3": "Refund Amount" },
            { "Custom Column 4": "Refund Percentage" },
            { id: "" },
            { admin_order_link: "Admin Order Link" },
          ],
        }}
        columnMappers={{
          ordered: [
            { shipping_price_cents: "{{ self / 100}}" },
            { taxes_cents: "{{ self / 100}}" },
            { amount_refunded_cents: "{{self / 100}}" },
            { user_refund_amount: "{{self / 100}}" },
            { total_cents: "{{self/100}}" },
            { amount_charged_cents: "{{self / 100}}" },
            { "Custom Column 1": "Open" },
            { "Custom Column 2": "Open Order" },
            {
              "Custom Column 3":
                "{{ \ncurrentRow.amount_charged_cents * 0.01\n}}",
            },
            { "Custom Column 4": "1" },
          ],
        }}
        columnTypeProperties={{
          ordered: [
            { id: { ordered: [] } },
            { order_id: { ordered: [] } },
            { product_id: { ordered: [] } },
            {
              "Custom Column 3": {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                ],
              },
            },
            {
              "Custom Column 4": {
                ordered: [{ showSeparators: false }, { padDecimal: true }],
              },
            },
            {
              amount_charged_cents: {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            {
              total_cents: {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                ],
              },
            },
            {
              user_refund_percentage: {
                ordered: [
                  { showSeparators: true },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            {
              user_refund_amount: {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            {
              taxes_cents: {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            {
              shipping_price_cents: {
                ordered: [
                  { showSeparators: true },
                  { currency: "USD" },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            { order_item_id: { ordered: [] } },
            {
              item_weight: {
                ordered: [
                  { showSeparators: true },
                  { padDecimal: true },
                  { decimalPlaces: "2" },
                ],
              },
            },
            { item_weight_scale: { ordered: [] } },
            { admin_order_link: { ordered: [{ openInNewTab: true }] } },
          ],
        }}
        columnTypeSpecificExtras={{
          "Custom Column 1": {
            buttonType: "internal-url",
            internalUrlPath: "4da65e82-bfd3-11eb-babe-e7bd5e60afd2",
            internalUrlQuery:
              '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{self}}\\"}]"',
            newWindow: true,
          },
          "Custom Column 2": {
            buttonType: "internal-url",
            internalUrlQuery:
              '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{currentRow.order_id}}\\"}]"',
            newWindow: true,
            internalUrlPath: "d4ee58e0-ca19-11f0-8de6-87c38a8b8b13",
          },
        }}
        columnWidths={[
          { object: { id: "Custom Column 3", value: 128 } },
          { object: { id: "order_id", value: 98 } },
          { object: { id: "id", value: 110 } },
          { object: { id: "amount_charged_currency", value: 80 } },
          { object: { id: "Custom Column 4", value: 146 } },
          { object: { id: "user_refund_amount", value: 167.84375 } },
          { object: { id: "user_refund_percentage", value: 172.84375 } },
          { object: { id: "amount_charged_cents", value: 121 } },
          { object: { id: "name", value: 152 } },
          { object: { id: "Custom Column 2", value: 100 } },
          { object: { id: "item_weight_scale", value: 63 } },
          { object: { id: "admin_order_link", value: 550 } },
        ]}
        customButtonName=""
        data="{{queryCRLShipment.data}}"
        defaultSelectedRow="none"
        defaultSortByColumn="order_id"
        disableSorting={{ ordered: [{ admin_order_link: true }] }}
        events={[]}
        overflowType="scroll"
        resetAfterSave={false}
        rowHeight="compact"
        saveChangesDisabled="true"
        showColumnBorders={true}
        showInEditor={false}
        showRefreshButton={false}
        sortByRawValue={{
          ordered: [{ id: true }, { item_weight_scale: true }],
        }}
      />
      <Include src="./collapsibleContainer3.rsx" />
      <Include src="./collapsibleContainer7.rsx" />
    </Body>
    <Footer>
      <Button
        id="getRatesSubmitCRL"
        _disclosedFields={{ array: [] }}
        hidden=""
        marginType="normal"
        submit={true}
        submitTargetId="getRatesFormCRL"
        text="Get Return Shipment Rate Quotes"
      />
    </Footer>
    <Event
      event="submit"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getRatesCRL"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
  <Form
    id="populate_table_form"
    disableSubmit="{{tableCreateReturnLabel.selectedIndex.length == 0}}"
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden="{{!createWithShippoRateStateCRL.value}}"
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
        id="formTitle3"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Populate Table"
        verticalAlign="center"
      />
    </Header>
    <Body>
      <Date
        id="date_crl"
        _disclosedFields={{ array: [] }}
        dateFormat="yyyy-MM-dd"
        datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
        iconBefore="bold/interface-calendar"
        label="Date"
        marginType="normal"
        value="{{ new Date() }}"
      />
      <TextInput
        id="buyer_username_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Buyer Username"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{ queryRecord.data.user.username }}"
      />
      <TextInput
        id="seller_username_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Seller Username"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{ orderSeller.value.username }}"
      />
      <TextInput
        id="seller_early_payout_enabled_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Seller Early Payout"
        marginType="normal"
        readOnly="true"
        required={true}
        value={
          '{{ orderSeller.value.seller_early_payout_enabled ? "Yes" : "No"}}'
        }
      />
      <Select
        id="category_crl"
        allowSearch={true}
        captionByIndex=""
        colorByIndex=""
        customValidation="{{ !self.value ? `Please select the category` : '' }}"
        data=""
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        itemMode="static"
        label="Category"
        labels=""
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight={250}
        placeholder="Select category for listing"
        required={true}
        showClear={true}
        showInEditor={null}
        tooltipByIndex=""
        value="{{package_contents_crl.value}}"
        values=""
      >
        <Option id="4487e" disabled={false} hidden={false} value="Funko Pop" />
        <Option id="07d7c" disabled={false} hidden={false} value="Pokémon" />
        <Option id="99d8b" disabled={false} hidden={false} value="Comics" />
        <Option
          id="0bff8"
          disabled={false}
          hidden={false}
          value="Sport Cards"
        />
        <Option id="38f3d" disabled={false} hidden={false} value="Other" />
        <Option
          id="a2ccf"
          disabled={false}
          hidden={false}
          value="Vintage Wear"
        />
        <Option id="a0222" disabled={false} hidden={false} value="Sneakers" />
        <Option
          id="b5e68"
          disabled={false}
          hidden={false}
          value="Designer Toys"
        />
        <Option
          id="88f01"
          disabled={false}
          hidden={false}
          value="Action Figures"
        />
        <Option id="c2db8" disabled={false} hidden={false} value="Metazoo" />
        <Option
          id="bfb7f"
          disabled={false}
          hidden={false}
          value="Designer Art"
        />
        <Option id="dcc95" disabled={false} hidden={false} value="Yu-Gi-Oh!" />
        <Option id="8b574" disabled={false} hidden={false} value="Funko Soda" />
        <Option
          id="23ea7"
          disabled={false}
          hidden={false}
          value="Video Games"
        />
      </Select>
      <TextInput
        id="listing_name_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        hidden="true"
        label="Listing Name"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{queryRecord.data.items[0].name}}"
      />
      <Select
        id="refund_type_crl"
        allowSearch={true}
        captionByIndex=""
        colorByIndex=""
        customValidation="{{ !self.value ? `Please set the refund type` : '' }}"
        data=""
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        itemMode="static"
        label="Refund Type"
        labels=""
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight={250}
        placeholder="Select refund type"
        required={true}
        showClear={true}
        showInEditor={null}
        tooltipByIndex=""
        value="Seller Paid - Item Returned"
        values=""
      >
        <Option
          id="4487e"
          disabled={false}
          hidden={false}
          value="Seller Paid - Item Returned"
        />
        <Option
          id="07d7c"
          disabled={false}
          hidden={false}
          value="Seller Paid - No Return"
        />
        <Option
          id="99d8b"
          disabled={false}
          hidden={false}
          value="Seller Not Paid"
        />
      </Select>
      <NumberInput
        id="refund_amount_crl"
        _disclosedFields={{ array: [] }}
        currency="{{orderTransformer_ShipmentDataPage.value.total_currency}}"
        format="currency"
        hidden="true"
        inputValue={0}
        label="Refund Amount"
        marginType="normal"
        placeholder="Enter value"
        readOnly="true"
        showSeparators={true}
        showStepper={true}
        value="{{orderTransformer_ShipmentDataPage.value.total_cents / 100}}"
      />
      <NumberInput
        id="total_order_amount_crl"
        _disclosedFields={{ array: [] }}
        currency="{{orderTransformer_ShipmentDataPage.value.total_currency}}"
        format="currency"
        hidden="true"
        hideLabel={false}
        inputValue={0}
        label="Total Order Amount"
        marginType="normal"
        placeholder="Enter value"
        readOnly="true"
        showSeparators={true}
        showStepper={true}
        value="{{orderTransformer_ShipmentDataPage.value.total_cents / 100}}"
      />
      <TextInput
        id="sales_channel_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Sales Channel"
        marginType="normal"
        readOnly="true"
        required={true}
        value={
          '{{orderTransformer_ShipmentDataPage.value.sales_channel == "livestream" ? \'Live\' : "Marketplace"}}'
        }
      />
      <Select
        id="warehouse_crl"
        allowSearch={true}
        captionByIndex=""
        colorByIndex=""
        customValidation="{{ !self.value ? `Please set the warehouse` : '' }}"
        data=""
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        itemMode="static"
        label="Warehouse"
        labels=""
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight={250}
        required={true}
        showClear={true}
        showInEditor={null}
        tooltipByIndex=""
        value={
          '{{ return_label_receipient_select.value == \'whatnot\' ? "Yes": "No"}}'
        }
        values=""
      >
        <Option id="4bdc1" disabled={false} hidden={false} value="Yes" />
        <Option id="b0803" disabled={false} hidden={false} value="No" />
      </Select>
      <TextInput
        id="tracking_number_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Tracking Number"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{createWithShippoRateStateCRL.value.tracking_number}}"
      />
      <TextInput
        id="label_url_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Label URL"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{createWithShippoRateStateCRL.value.label_url}}"
      />
      <Select
        id="refunded_crl"
        allowSearch={true}
        captionByIndex=""
        colorByIndex=""
        customValidation="{{ !self.value ? `Please set the refunded` : '' }}"
        data=""
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        itemMode="static"
        label="Refunded"
        labels=""
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight={250}
        placeholder="Select Refunded"
        required={true}
        showClear={true}
        showInEditor={null}
        tooltipByIndex=""
        value="No (Shipping)"
        values=""
      >
        <Option id="4bdc1" disabled={false} hidden={false} value="Yes" />
        <Option id="b0803" disabled={false} hidden={false} value="No" />
        <Option
          id="1f39e"
          disabled={false}
          hidden={false}
          value="No (Shipping)"
        />
      </Select>
      <Select
        id="fault_crl"
        allowSearch={true}
        captionByIndex=""
        colorByIndex=""
        customValidation="{{ !self.value ? `Please set the fault` : '' }}"
        data=""
        deprecatedLabels="{{queryRefundReasonsDropdown_ShipmentDataPage.data.map(x => x.label)}}"
        disabled=""
        disabledByIndex=""
        fallbackTextByIndex=""
        hidden={null}
        hiddenByIndex=""
        iconByIndex=""
        imageByIndex=""
        itemMode="static"
        label="Fault"
        labels=""
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        overlayMaxHeight={250}
        placeholder="Select Fault"
        required={true}
        showClear={true}
        showInEditor={null}
        tooltipByIndex=""
        value=""
        values=""
      >
        <Option id="4bdc1" disabled={false} hidden={false} value="Buyer" />
        <Option id="b0803" disabled={false} hidden={false} value="Seller" />
        <Option id="1f39e" disabled={false} hidden={false} value="Shipping" />
      </Select>
      <TextInput
        id="agent_name_crl"
        _disclosedFields={{ array: [] }}
        disabled="false"
        label="Agent Name"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{current_user.fullName}}"
      />
      <TextInput
        id="admin_order_crl"
        _disclosedFields={{ array: [] }}
        disabled=""
        hidden="true"
        label="Admin Order"
        marginType="normal"
        readOnly="true"
        required={true}
        value="{{urlparams.href}}"
      />
      <TextInput
        id="zen_desk_crl"
        _disclosedFields={{ array: [] }}
        disabled=""
        label="Zendesk"
        marginType="normal"
        placeholder="Copy/Paste ZenDesk Ticket URL"
        readOnly=""
        required={true}
      />
    </Body>
    <Footer>
      <Button
        id="populateTableSubmit"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        submit={true}
        submitTargetId="populate_table_form"
        text="Populate Table"
      />
    </Footer>
    <Event
      event="submit"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryCRLPopulateTable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Form>
  <Include src="./getRatesCRLInfoContainer.rsx" />
</Modal>
