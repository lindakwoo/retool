<Modal
  id="modalRefund"
  buttonText="Refund Modal"
  closeOnOutsideClick={true}
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "queryItemAuthenticityDropdown" },
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
        { pluginId: "queryRefundShipment" },
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
        { method: "clearValue" },
        { pluginId: "selectRefundReason" },
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
        { method: "clearValue" },
        { pluginId: "selectReturned" },
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
        { method: "clearValue" },
        { pluginId: "textRefundNotes" },
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
        { pluginId: "refundType" },
        { targetId: null },
        { params: { ordered: [{ value: "partial" }] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  hidden="true"
  modalHeight="340px"
  modalHeightType="auto"
  modalOverflowType="visible"
  modalWidth="80%"
  showInEditor={true}
>
  <Text
    id="text4"
    _defaultValue=""
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value={
      "👋 **NOTE:**\n\n{{stateNewRefund2_0.value.count > 0 ? '- <span style=\"color:red\"><b>This order has refund requests. The amount already refunded is: '+ stateNewRefund2_0.value.amount_refunded_formated + '. Please adjust your process accordingly</b></style>' : ''}}\n- 100% will always be payment amount charged\n- 1% to 99% will be % of subtotal\n- <span style=\"color:red\"><b> Current return thresholds are $50 for US orders and $100 for all international orders. Please do not return orders below these thresholds</b></style>"
    }
    verticalAlign="center"
  />
  <Button
    id="buttonRefundSetTotalRefund"
    _disclosedFields={{ array: [] }}
    disabled="{{ queryRefundShipment.data == null || queryRefundShipment.data.length == 0 }}"
    marginType="normal"
    text="FULL Refund"
    tooltipText="Sets all the Orders in Shipment to Amount Charged + Taxes + Shipping"
  >
    <Event
      event="click"
      method="clearValue"
      params={{ ordered: [] }}
      pluginId="selectRefundReason"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="clearValue"
      params={{ ordered: [] }}
      pluginId="selectReturned"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetTotalRefund"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "full" }] }}
      pluginId="refundType"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="buttonRefundSetSubtotalRefund"
    _disclosedFields={{ array: [] }}
    disabled="{{ queryRefundShipment.data == null || queryRefundShipment.data.length == 0 }}"
    marginType="normal"
    text="Set Subtotal Refund"
    tooltipText="Sets all the Orders in Shipment to Amount Charged"
  >
    <Event
      event="click"
      method="clearValue"
      params={{ ordered: [{ value: '"tax_issues"' }] }}
      pluginId="selectRefundReason"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="clearValue"
      params={{ ordered: [{ value: "false" }] }}
      pluginId="selectReturned"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetSubtotalRefund"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "subtotal\n" }] }}
      pluginId="refundType"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="buttonRefundSetTaxRefund"
    _disclosedFields={{ array: [] }}
    disabled="{{ queryRefundShipment.data == null || queryRefundShipment.data.length == 0 }}"
    marginType="normal"
    text="Set Tax Refund"
    tooltipText="Sets all the Orders in Shipment to Taxes "
  >
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: '"tax_issues"' }] }}
      pluginId="selectRefundReason"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "false" }] }}
      pluginId="selectReturned"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetTaxRefund"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "tax" }] }}
      pluginId="refundType"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="buttonSetShippingRefund"
    _disclosedFields={{ array: [] }}
    disabled="{{ queryRefundShipment.data == null || queryRefundShipment.data.length == 0 }}"
    marginType="normal"
    text="Set Shipping Refund"
    tooltipText="Sets all the Orders in Shipment to Shipping"
  >
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: '"buyer_overcharged_shipping"' }] }}
      pluginId="selectRefundReason"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "false" }] }}
      pluginId="selectReturned"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetShippingRefund"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="setValue"
      params={{ ordered: [{ value: "shipping" }] }}
      pluginId="refundType"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <NumberInput
    id="numberinputAllRefundPercent"
    _defaultValue={null}
    _disclosedFields={{ array: [] }}
    allowNull={true}
    currency="USD"
    decimalPlaces="0"
    format="percent"
    label="Set All Refund Percentages (of Subtotal) to"
    marginType="normal"
    max="1"
    min="0"
    placeholder="<Set a percentage value of subtotal for ALL the orders>"
    showClear={true}
    showStepper={true}
    value="null"
  >
    <Event
      event="change"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetAllPercentagesTo"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </NumberInput>
  <NumberInput
    id="numberinputAllRefundAmount"
    _defaultValue={null}
    _disclosedFields={{ array: [] }}
    allowNull={true}
    currency="USD"
    decimalPlaces="2"
    format="currency"
    label="Set All Refund Amount to"
    marginType="normal"
    max=""
    min=""
    placeholder="<Set an amount value for ALL the orders>"
    showClear={true}
    showStepper={true}
    value="null"
  >
    <Event
      event="change"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundSetAllAmountsTo"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </NumberInput>
  <Select
    id="overrideOrderCurrency"
    emptyMessage="No options"
    hidden="true"
    itemMode="static"
    label="Override Currency (ALEKS ONLY)"
    overlayMaxHeight={375}
    placeholder="Select an option"
    showClear={true}
    showSelectionIndicator={true}
  >
    <Option id="0ff35" label="USD" value="USD" />
    <Option id="8912d" label="EUR" value="EUR" />
    <Option id="86671" label="AUD" value="AUD" />
  </Select>
  <Select
    id="selectRefundReason"
    allowSearch={true}
    customValidation="{{ !self.value ? `Please set the refund reason` : '' }}"
    data="{{queryRefundReasonsDropdown_PaymentDetailsPage.data.map(x => x.value)}}"
    deprecatedLabels="{{queryRefundReasonsDropdown_PaymentDetailsPage.data.map(x => x.label)}}"
    disabled=""
    hidden={null}
    label="Refund reason"
    labels="{{ self.deprecatedLabels[i] }}"
    labelWrap={true}
    maintainSpaceWhenHidden={null}
    marginType="normal"
    overlayMaxHeight={250}
    placeholder="Select refund reason"
    required={true}
    showClear={true}
    showInEditor={null}
    value=""
    values="{{ item }}"
  >
    <Event
      event="change"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="checkRefundReason"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Select>
  <Select
    id="selectReturned"
    allowSearch={true}
    data="[true, false]"
    deprecatedLabels=""
    disabled=""
    hidden={null}
    label="Returned?"
    labels={'{{ ["Returned", "Not returned"][i] }}'}
    labelWrap={true}
    maintainSpaceWhenHidden={null}
    marginType="normal"
    overlayMaxHeight={250}
    placeholder="Set whether the order was returned"
    required={true}
    showClear={true}
    showInEditor={null}
    value=""
    values="{{ item }}"
  />
  <Select
    id="fake_item_reason"
    customValidation={
      '{{["inconclusive", "authentic", "not_authentic"].includes(fake_item_reason.value) ? null : "Fake Item reason must be filled out"}}'
    }
    hidden="true"
    itemMode="static"
    label="Fake Item Reason"
    labelAlign="right"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Required Field"
    required={'{{selectRefundReason.value == "fake_item"}}'}
    showSelectionIndicator={true}
    value=""
  >
    <Option id="7779e" label="Inconclusive" value="inconclusive" />
    <Option id="74d51" label="Authentic" value="authentic" />
    <Option id="38e49" label="Not authentic" value="not_authentic" />
  </Select>
  <Select
    id="selectBillBackSeller"
    allowSearch={true}
    captionByIndex=""
    colorByIndex=""
    data=""
    deprecatedLabels=""
    disabled=""
    disabledByIndex=""
    fallbackTextByIndex=""
    hidden=""
    hiddenByIndex=""
    iconByIndex=""
    imageByIndex=""
    itemMode="static"
    label="Charge seller"
    labels=""
    labelWrap={true}
    maintainSpaceWhenHidden={null}
    marginType="normal"
    overlayMaxHeight={250}
    placeholder={
      "{{ (String(selectRefundReason.value) == 'confirmed_counterfeit' || String(selectRefundReason.value) == 'return_to_sender' || String(selectRefundReason.value) == 'shipment_not_dropped_off' || String(selectRefundReason.value) == 'break_did_not_fill') ? \"Yes\" : \"No\"\n  }}"
    }
    showInEditor={null}
    tooltipByIndex=""
    value="{{ (String(selectRefundReason.value) == 'confirmed_counterfeit' || String(selectRefundReason.value) == 'return_to_sender' || String(selectRefundReason.value) == 'shipment_not_dropped_off' || String(selectRefundReason.value) == 'break_did_not_fill') ? true : false
  }}"
    values=""
  >
    <Option
      id="1c0a5"
      disabled={false}
      hidden={false}
      label="No"
      value="false"
    />
    <Option
      id="799d3"
      disabled={false}
      hidden={false}
      label="Yes"
      value="true"
    />
    <Event
      enabled="{{ selectBillBackSeller.value == true }}"
      event="change"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "warning" },
                { title: "Set to Yes will bill back seller!" },
                { duration: "10" },
                {
                  description:
                    "When set to Yes, we will create a negative seller ledger adjustment. The value is min of the seller payout and requested amount.",
                },
              ],
            },
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Select>
  <Select
    id="item_authenticity"
    data="{{ queryItemAuthenticityDropdown.data }}"
    hidden={'{{selectRefundReason.value != "fake_item"}}'}
    label="Item Authenticity"
    labels="{{ item.label }}"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    showSelectionIndicator={true}
    values="{{ item.value }}"
  />
  <TextArea
    id="textRefundNotes"
    _defaultValue=""
    _disclosedFields={{ array: [] }}
    autoResize={true}
    label="Notes"
    marginType="normal"
    maxLength=""
    minLines={2}
    placeholder="(optional) Enter notes"
  />
  <Text
    id="text6"
    _disclosedFields={{ array: [] }}
    hidden="true"
    horizontalAlign="center"
    marginType="normal"
    style={{
      ordered: [
        { background: "rgba(255, 167, 167, 0.5)" },
        { color: "rgba(253, 0, 0, 1)" },
      ],
    }}
    value="Fake Item reason must be filled out"
    verticalAlign="center"
  />
  <Text
    id="text133"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### Orders in Shipment"
    verticalAlign="center"
  />
  <TableLegacy
    id="tableShipmentsRefund"
    _columns={[
      "refund_request_status",
      "order_id",
      "subtotal_cents",
      "taxes_cents",
      "shipping_price_cents",
      "Custom Column 3",
      "total_cents",
      "amount_refunded_cents",
      "user_refund_amount",
      "user_refund_subtotal_percentage",
      "user_refund_total_percentage",
      "name",
      "Custom Column 1",
      "Custom Column 2",
      "id",
      "credit_cents",
      "created_at",
      "refund_request_id",
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
        { user_refund_subtotal_percentage: "average" },
        { user_refund_total_percentage: "average" },
        { subtotal_cents: "sum" },
        { amount_refunded_cents: "sum" },
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
        { user_refund_subtotal_percentage: "" },
        { user_refund_total_percentage: "" },
        { subtotal_cents: "" },
        { amount_refunded_cents: "" },
      ],
    }}
    _columnVisibility={{
      ordered: [
        { amount_charged_currency: false },
        { refund_request_status: true },
        { amount_refunded_cents: true },
        { total_currency: false },
        { total_cents: true },
        { amount_refunded_currency: false },
        { amount_charged_cents: true },
        { item_shipping_profile_id: false },
        { id: false },
      ],
    }}
    _compatibilityMode={false}
    _unfilteredSelectedIndex=""
    allowMultiRowSelect={true}
    calculatedColumns={[
      "Custom Column 1",
      "Custom Column 2",
      "Custom Column 3",
    ]}
    columnAlignment={{
      ordered: [
        { user_refund_subtotal_percentage: "right" },
        { shipping_price_cents: "right" },
        { taxes_cents: "right" },
        { user_refund_total_percentage: "right" },
        { amount_refunded_cents: "right" },
        { user_refund_amount: "right" },
        { product_id: "left" },
        { order_id: "left" },
        { user_refund_percentage: "right" },
        { subtotal_cents: "right" },
        { total_cents: "right" },
        { amount_charged_cents: "right" },
        { "Custom Column 1": "left" },
        { "Custom Column 2": "left" },
        { "Custom Column 3": "right" },
        { "Custom Column 4": "right" },
        { id: "left" },
      ],
    }}
    columnColors={{
      user_refund_subtotal_percentage: "#ffd24d",
      shipping_price_cents: "",
      taxes_cents: "",
      credit_cents: "",
      amount_charged_currency: "",
      user_refund_total_percentage: "#e6ac00",
      refund_request_status: "",
      created_at: "",
      amount_refunded_cents: "",
      user_refund_amount: "#ffe699",
      product_id: "",
      name: "",
      total_currency: "",
      order_id: "",
      user_refund_percentage: "#e7dd8e",
      item_weight_scale: "",
      subtotal_cents: "",
      total_cents: "",
      test: "",
      amount_refunded_currency: "",
      status: "",
      refund_request_id: "",
      item_weight_amount: "",
      amount_charged_cents: "",
      "Custom Column 1": "",
      item_shipping_profile_id: "",
      "Custom Column 2": "",
      "Custom Column 3": "",
      id: "",
    }}
    columnEditable={{
      ordered: [
        { "Custom Column 1": false },
        { "Custom Column 2": false },
        { user_refund_percentage: true },
        { user_refund_amount: true },
        { user_refund_total_percentage: true },
        { user_refund_subtotal_percentage: true },
        { "Custom Column 3": false },
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
        { user_refund_subtotal_percentage: "PercentDataCell" },
        { user_refund_total_percentage: "PercentDataCell" },
        { subtotal_cents: "CurrencyDataCell" },
        { amount_refunded_cents: "CurrencyDataCell" },
      ],
    }}
    columnHeaderNames={{
      ordered: [
        { user_refund_subtotal_percentage: "REQ Subtotal Refund %" },
        { shipping_price_cents: "Shipping" },
        { taxes_cents: "Taxes" },
        { amount_charged_currency: "Currency" },
        { user_refund_total_percentage: "REQ Total Refund %" },
        { refund_request_status: "Refund Request Status" },
        { amount_refunded_cents: "Refunded" },
        { user_refund_amount: "REQ Refund Amount" },
        { product_id: "Product ID" },
        { name: "Name" },
        { order_id: "Order ID" },
        { user_refund_percentage: "REQ Refund Percentage" },
        { item_weight_scale: "Item Weight Scale" },
        { subtotal_cents: "Subtotal" },
        { total_cents: "Total" },
        { amount_refunded_currency: "Currency" },
        { status: "Order Item Status" },
        { item_weight_amount: "Item Weight" },
        { amount_charged_cents: "Subtotal" },
        { "Custom Column 1": "Shipping Profile" },
        { item_shipping_profile_id: "" },
        { "Custom Column 2": "Open Order" },
        { "Custom Column 3": "Credit used" },
        { "Custom Column 4": "REQ Total Refund Percentage" },
        { id: "" },
      ],
    }}
    columnMappers={{
      ordered: [
        { user_refund_subtotal_percentage: "" },
        { shipping_price_cents: "{{ self / 100}}" },
        { taxes_cents: "{{ self / 100}}" },
        { amount_refunded_cents: "{{self / 100}}" },
        { user_refund_amount: "{{self / 100}}" },
        { subtotal_cents: "{{ self / 100}}" },
        { total_cents: "{{self/100}}" },
        { amount_charged_cents: "{{self / 100}}" },
        { "Custom Column 1": "Open" },
        { "Custom Column 2": "Open Order" },
        { "Custom Column 3": "{{ currentRow.credit_cents  * 0.01 }}" },
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
            ordered: [
              { showSeparators: true },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
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
              { decimalPlaces: "2" },
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
        {
          user_refund_subtotal_percentage: {
            ordered: [
              { showSeparators: true },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
          },
        },
        {
          user_refund_total_percentage: {
            ordered: [
              { showSeparators: true },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
          },
        },
        {
          subtotal_cents: {
            ordered: [
              { showSeparators: true },
              { currency: "USD" },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
          },
        },
        {
          amount_refunded_cents: {
            ordered: [
              { showSeparators: true },
              { currency: "USD" },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
          },
        },
      ],
    }}
    columnTypeSpecificExtras={{
      "Custom Column 1": {
        buttonType: "internal-url",
        internalUrlPath: "4da65e82-bfd3-11eb-babe-e7bd5e60afd2",
        internalUrlQuery: '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{self}}\\"}]"',
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
      { object: { id: "id", value: 110 } },
      { object: { id: "amount_charged_currency", value: 80 } },
      { object: { id: "Custom Column 4", value: 146 } },
      { object: { id: "user_refund_percentage", value: 172.84375 } },
      { object: { id: "amount_charged_cents", value: 128 } },
      { object: { id: "user_refund_total_percentage", value: 158 } },
      { object: { id: "user_refund_amount", value: 155.84375 } },
      { object: { id: "user_refund_subtotal_percentage", value: 168.328125 } },
      { object: { id: "Custom Column 1", value: 114 } },
      { object: { id: "Custom Column 2", value: 112 } },
      { object: { id: "subtotal_cents", value: 92 } },
      { object: { id: "taxes_cents", value: 86.78125 } },
      { object: { id: "shipping_price_cents", value: 90.765625 } },
      { object: { id: "order_id", value: 87 } },
      { object: { id: "total_cents", value: 104 } },
      { object: { id: "amount_refunded_cents", value: 95.140625 } },
    ]}
    customButtonName=""
    data="{{queryRefundShipment.data}}"
    defaultSelectedRow="none"
    defaultSortByColumn="order_id"
    events={[
      {
        ordered: [
          { event: "cellChange" },
          { type: "datasource" },
          { method: "trigger" },
          { pluginId: "queryRefundTableShipmentsRefundCellChangeHandler" },
          { targetId: null },
          { params: { ordered: [] } },
          { waitType: "debounce" },
          { waitMs: "0" },
        ],
      },
    ]}
    overflowType="scroll"
    resetAfterSave={false}
    rowHeight="compact"
    saveChangesDisabled="true"
    showColumnBorders={true}
    showInEditor={false}
    showRefreshButton={false}
    sortByRawValue={{ ordered: [{ id: true }, { item_weight_scale: true }] }}
  />
  <Button
    id="buttonRejectRefunds"
    _disclosedFields={{ array: [] }}
    disabled=""
    hidden={null}
    loading=""
    maintainSpaceWhenHidden={null}
    marginType="normal"
    showInEditor={null}
    text="Reject Refund Requests"
  >
    <Event
      event="click"
      method="show"
      params={{ ordered: [] }}
      pluginId="mRejectRefund"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="buttonRefund"
    _disclosedFields={{ array: [] }}
    disabled="{{
!selectRefundReason.value ||
selectReturned.value == null || 
tableShipmentsRefund.selectedIndex.length == 0}}"
    hidden={null}
    loading=""
    maintainSpaceWhenHidden={null}
    marginType="normal"
    showInEditor={null}
    text="Refund"
  >
    <Event
      enabled={
        '{{(isBuyerPotentialRefundAbuser.value && ( selectRefundReason.value == "damaged_item" || selectRefundReason.value == "damaged_misrepresented_condition" || selectRefundReason.value == "missing_item" || selectRefundReason.value == "wrong_item" || selectRefundReason.value == "return_to_sender" || selectRefundReason.value == "incorrect_address_on_purchase" || selectRefundReason.value == "buyer_seller_dispute" || selectRefundReason.value == "misbid" || selectRefundReason.value == "marked_delivered_not_received" || selectRefundReason.value == "fast_lane_refund" || selectRefundReason.value == "buyer_cancellation_education" || selectRefundReason.value == "tracking_stuck")) || (isBuyerPotentialRefundAbuserMdnr.value && selectRefundReason.value == "marked_delivered_not_received")}}'
      }
      event="click"
      method="open"
      params={{ ordered: [] }}
      pluginId="refundWarningModalMdnr"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled={
        '{{!((isBuyerPotentialRefundAbuser.value && ( selectRefundReason.value == "damaged_item" || selectRefundReason.value == "damaged_misrepresented_condition" || selectRefundReason.value == "missing_item" || selectRefundReason.value == "wrong_item" || selectRefundReason.value == "return_to_sender" || selectRefundReason.value == "incorrect_address_on_purchase" || selectRefundReason.value == "buyer_seller_dispute" || selectRefundReason.value == "misbid" || selectRefundReason.value == "marked_delivered_not_received" || selectRefundReason.value == "fast_lane_refund" || selectRefundReason.value == "buyer_cancellation_education" || selectRefundReason.value == "tracking_stuck")) || (isBuyerPotentialRefundAbuserMdnr.value && selectRefundReason.value == "marked_delivered_not_received"))}}'
      }
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryBulkRefund"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled={
        '{{!((isBuyerPotentialRefundAbuser.value && ( selectRefundReason.value == "damaged_item" || selectRefundReason.value == "damaged_misrepresented_condition" || selectRefundReason.value == "missing_item" || selectRefundReason.value == "wrong_item" || selectRefundReason.value == "return_to_sender" || selectRefundReason.value == "incorrect_address_on_purchase" || selectRefundReason.value == "buyer_seller_dispute" || selectRefundReason.value == "misbid" || selectRefundReason.value == "marked_delivered_not_received" || selectRefundReason.value == "fast_lane_refund" || selectRefundReason.value == "buyer_cancellation_education" || selectRefundReason.value == "tracking_stuck")) || (isBuyerPotentialRefundAbuserMdnr.value && selectRefundReason.value == "marked_delivered_not_received"))}}'
      }
      event="click"
      method="open"
      params={{ ordered: [] }}
      pluginId="modalQueryRefundSummary"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
