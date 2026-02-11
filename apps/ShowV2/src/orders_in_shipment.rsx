<Screen
  id="orders_in_shipment"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="feec1807-d866-40a4-bd3f-39db3b18c7c2"
>
  <JavascriptQuery
    id="bulkUpdate"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/bulkUpdate.js", "string")}
    queryFailureConditions="[]"
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Function
    id="orderTransformer_OrdersInShipmentPage"
    funcBody={include(
      "../lib/orderTransformer_OrdersInShipmentPage.js",
      "string"
    )}
    runBehavior="debounced"
  />
  <RESTQuery
    id="queryCancellationReasons_OrdersInShipmentPage"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query="order_items/cancellation_reasons"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer={
      "var is_user_in_fraud = {{current_user.groups.map(group => group.name).includes('Fraud')}};\nfor (let i = 0; i < data.length; i++) {\n   if (data[i] == \"fraud\" && !is_user_in_fraud) {\n      data.splice(i, 1);\n     \n   }\n}\nreturn data;"
    }
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryCategoryId_OrdersInShipmentPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryCategoryId_OrdersInShipmentPage.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryIsGlobalCoupon_OrdersInShipmentPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include(
      "../lib/queryIsGlobalCoupon_OrdersInShipmentPage.sql",
      "string"
    )}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryPayout_OrdersInShipmentPage"
    body="[]"
    bodyType="json"
    confirmationMessage="Are you sure you want to payout the order?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query="orders/{{payOrderID.value}}/early_payout"
    requireConfirmation="{{ promptPayoutConfirmation.value }}"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    showSuccessConfetti={true}
    showSuccessToaster={false}
    triggersOnFailure={[]}
    triggersOnSuccess={["queryRecord"]}
    type="POST"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      enabled="{{ payOrderID.value == urlparams.id}}"
      event="success"
      method="confetti"
      params={{}}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ payOrderID.value == urlparams.id}}"
      event="success"
      method="trigger"
      params={{
        map: {
          options: { map: { additionalScope: { map: { shouldShowPii: "" } } } },
        },
      }}
      pluginId="queryRecord"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ payOrderID.value == urlparams.id}}"
      event="success"
      method="close"
      params={{}}
      pluginId="modalRefund"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <SqlQueryUnified
    id="querySellerOrderCancellationReason_OrdersInShipmentPage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/querySellerOrderCancellationReason_OrdersInShipmentPage.sql",
      "string"
    )}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer={
      'return {\n  "reason": (data.reason.length > 0) ? data.reason[0] : null,\n  "reason_input_text": (data.reason_input_text.length > 0) ? data.reason_input_text[0] : null,\n  "buyer_facing_message": (data.buyer_facing_message.length > 0) ? data.buyer_facing_message[0] : null\n}'
    }
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <RESTQuery
    id="querySubmitActionNoConfirm"
    body={
      '[{"key":"action","value":"{{stateActionValue.value}}"},{"key":"cancellation_reason","value":"{{selectBulkCancellationReason.value || null}}"},{"key":"seller_id","value":"{{orderSeller.value.id}}"},{"key":"buyer_username","value":"{{queryRecord.data.user.username}}"},{"key":"order_uuid","value":"{{queryRecord.data.uuid}}"},{"key":"channel_reference","value":"{{queryRecord.data.channel_reference || null}}"},{"key":"author_email","value":"{{current_user.email}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="order_items/{{stateOrderItemId.value}}/actions"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    showSuccessConfetti={true}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    triggersOnFailure={[]}
    triggersOnSuccess={[]}
    type="POST"
    updateSetValueDynamically={true}
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="confetti"
      params={{ ordered: [] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRecord"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Frame
    id="$main5"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="textOrderItemsTitle"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      marginType="normal"
      style={{ ordered: [] }}
      value="#### Orders in Shipment"
      verticalAlign="center"
    />
    <Text
      id="text41"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Shipment subtotal:** {{(queryShipment.data.items.reduce((acc, item) => acc + item.subtotal_cents, 0) / 100).toLocaleString('en-US', { style: 'currency', currency: queryShipment.data.items[0].subtotal_currency })}}
**Shipping spend for this shipment:** {{queryShipment.data.amount_spent_on_shipping.total_amount}}
* Buyer paid: {{queryShipment.data.amount_spent_on_shipping.buyer_amount}}
* Seller paid: {{queryShipment.data.amount_spent_on_shipping.seller_amount}}"
      verticalAlign="center"
    />
    <TableLegacy
      id="tableShipments"
      _columns={[
        "order_id",
        "order_uuid",
        "created_at",
        "id",
        "name",
        "product_id",
        "Custom Column 3",
        "status",
        "item_weight_amount",
        "item_weight_scale",
        "used_incremental_weight",
        "item_shipping_profile_id",
        "Custom Column 1",
        "subtotal_cents",
        "amount_charged_currency",
        "amount_refunded_currency",
        "shipping_price_cents",
        "seller_shipping_price_cents",
        "seller_shipping_price_currency",
        "shipping_price_currency",
        "taxes_cents",
        "taxes_currency",
        "total_cents",
        "amount_refunded_cents",
        "total_currency",
        "amount_charged_cents",
        "quantity",
        "Custom Column 2",
        "subtotal_currency",
        "Custom Column 4",
        "credit_cents",
        "credit_currency",
        "Custom Column 5",
      ]}
      _columnSummaryTypes={{
        ordered: [
          { total_cents: "" },
          { shipping_price_currency: "sum" },
          { amount_refunded_cents: "" },
          { amount_charged_cents: "sum" },
          { shipping_price_cents: "" },
          { seller_shipping_price_cents: "" },
          { used_incremental_weight: "" },
          { subtotal_cents: "" },
          { taxes_cents: "" },
          { "Custom Column 5": "" },
          { created_at: "" },
        ],
      }}
      _columnSummaryValues={{
        ordered: [
          { total_cents: "" },
          { shipping_price_currency: "" },
          { amount_refunded_cents: "" },
          { amount_charged_cents: "" },
          { shipping_price_cents: "" },
          { seller_shipping_price_cents: "" },
          { used_incremental_weight: "" },
          { subtotal_cents: "" },
          { taxes_cents: "" },
          { "Custom Column 5": "" },
          { created_at: "" },
        ],
      }}
      _columnVisibility={{
        ordered: [
          { shipping_price_cents: true },
          { listing: true },
          { taxes_cents: true },
          { amount_charged_currency: false },
          { amount_refunded_cents: true },
          { quantity: false },
          { product_id: false },
          { name: true },
          { subtotal_currency: false },
          { sales: true },
          { total_currency: false },
          { order_id: true },
          { item_weight_scale: false },
          { subtotal_cents: true },
          { total_cents: true },
          { amount_refunded_currency: false },
          { status: true },
          { price_cents: true },
          { amount_charged_cents: false },
          { "Custom Column 1": true },
          { "Custom Column 2": false },
          { taxes_currency: false },
          { seller_shipping_price_currency: false },
          { shipping_price_currency: false },
          { "Custom Column 4": false },
          { shipment: true },
          { id: true },
          { email: true },
          { actions: true },
          { used_incremental_weight: false },
        ],
      }}
      _compatibilityMode={false}
      _unfilteredSelectedIndex="[{{queryShipment.data.items.findIndex(row => row.order_id == urlparams.id)}}]"
      allowMultiRowSelect={true}
      applyDynamicSettingsToColumnOrder={false}
      calculatedColumns={[
        "Custom Column 1",
        "Custom Column 2",
        "Custom Column 3",
        "Custom Column 4",
        "Custom Column 5",
      ]}
      columnAlignment={{
        ordered: [
          { shipping_price_cents: "right" },
          { seller_shipping_price_cents: "right" },
          { taxes_cents: "right" },
          { created_at: "left" },
          { amount_refunded_cents: "right" },
          { subtotal_cents: "right" },
          { total_cents: "right" },
          { amount_charged_cents: "right" },
          { "Custom Column 1": "left" },
          { item_shipping_profile_id: "left" },
          { shipping_price_currency: "right" },
          { "Custom Column 3": "left" },
          { "Custom Column 5": "left" },
          { used_incremental_weight: "center" },
        ],
      }}
      columnColors={{
        shipping_price_cents: "",
        seller_shipping_price_cents: "",
        listing: "",
        taxes_cents: "",
        credit_cents: "",
        amount_charged_currency: "",
        created_at: "",
        amount_refunded_cents: "",
        quantity: "",
        user_refund_amount: "",
        product_id: "",
        name: "",
        subtotal_currency: "",
        sales: "",
        order_uuid: "",
        total_currency: "",
        order_id: "",
        user_refund_percentage: "",
        item_weight_scale: "",
        subtotal_cents: "",
        total_cents: "",
        amount_refunded_currency: "",
        status: "",
        item_weight_amount: "",
        price_cents: "",
        amount_charged_cents: "",
        "Custom Column 1": "",
        item_shipping_profile_id: "",
        "Custom Column 2": "",
        credit_currency: "",
        taxes_currency: "",
        seller_shipping_price_currency: "",
        shipping_price_currency: "",
        "Custom Column 3": "",
        "Custom Column 4": "",
        shipment: "",
        "Custom Column 5": "",
        id: "",
        email: "",
        actions: "",
        used_incremental_weight: "",
      }}
      columnEditable={{
        ordered: [
          { item_shipping_profile_id: false },
          { amount_charged_cents: false },
          { "Custom Column 2": false },
          { "Custom Column 3": false },
          { "Custom Column 4": false },
          { "Custom Column 5": false },
        ],
      }}
      columnFormats={{
        ordered: [
          { "Custom Column 1": "button" },
          { item_shipping_profile_id: "button" },
          { total_cents: "default" },
          { shipping_price_currency: "CurrencyDataCell" },
          { amount_refunded_cents: "default" },
          { amount_charged_cents: "CurrencyDataCell" },
          { shipping_price_cents: "default" },
          { seller_shipping_price_cents: "default" },
          { "Custom Column 3": "button" },
          { used_incremental_weight: "default" },
          { subtotal_cents: "default" },
          { taxes_cents: "default" },
          { "Custom Column 5": "TextDataCell" },
          { created_at: "DateTimeDataCell" },
        ],
      }}
      columnHeaderNames={{
        ordered: [
          { shipping_price_cents: "Buyer Shipping" },
          { seller_shipping_price_cents: "Seller Shipping" },
          { taxes_cents: "Taxes" },
          { created_at: "Created At" },
          { amount_refunded_cents: "Refunded" },
          { quantity: "Qty" },
          { product_id: "Product ID" },
          { name: "Name" },
          { order_uuid: "Order UUID" },
          { total_currency: "Currency" },
          { order_id: "Order ID" },
          { item_weight_scale: "Weight Scale" },
          { subtotal_cents: "Subtotal" },
          { total_cents: "Total" },
          { status: "Order Item Status" },
          { item_weight_amount: "Net Weight" },
          { amount_charged_cents: "Amount Paid" },
          { "Custom Column 1": "Order" },
          { item_shipping_profile_id: "Shipping Profile\n" },
          { "Custom Column 2": "Shipping Profile ID" },
          { shipping_price_currency: "" },
          { "Custom Column 3": "Product" },
          { "Custom Column 4": "Item Weight" },
          { "Custom Column 5": "Order UUID" },
          { id: "Order Item Id" },
          { used_incremental_weight: "Incremental Weight" },
        ],
      }}
      columnMappers={{
        shipping_price_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format(self / 100) }}",
        seller_shipping_price_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format(self / 100) }}",
        taxes_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format(self / 100) }}",
        amount_refunded_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format(self / 100) }}",
        subtotal_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format(self / 100) }}",
        total_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrdersInShipmentPage.value.currency }).format((self - currentRow.amount_refunded_cents) / 100) }}",
        item_weight_amount:
          "{{self}} {{currentRow.item_weight_scale}} {{currentRow.used_incremental_weight ? '(incremental)' : ''}}",
        amount_charged_cents: "{{self/100}}",
        "Custom Column 1": "Order",
        item_shipping_profile_id: "Ship Profile",
        "Custom Column 2": "{{self}}",
        shipping_price_currency: "",
        "Custom Column 3": "Product",
        "Custom Column 4": "{{self}}",
        "Custom Column 5": "",
      }}
      columns={[
        "order_id",
        "id",
        "name",
        "email",
        "sales",
        "actions",
        "listing",
        "price_cents",
        "product_id",
        "shipment",
        "status",
        "Custom Column 1",
      ]}
      columnTypeProperties={{
        ordered: [
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
            shipping_price_currency: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          {
            amount_refunded_cents: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          {
            amount_charged_cents: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          {
            shipping_price_cents: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          {
            seller_shipping_price_cents: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          {
            used_incremental_weight: {
              ordered: [{ falseDisplayValue: "empty" }],
            },
          },
          { subtotal_cents: { ordered: [] } },
          {
            taxes_cents: {
              ordered: [
                { showSeparators: true },
                { currency: "USD" },
                { padDecimal: true },
              ],
            },
          },
          { "Custom Column 5": { ordered: [] } },
          {
            created_at: {
              ordered: [
                { manageTimeZone: true },
                { dateFormat: "MMM d, yyyy" },
                { valueTimeZone: "00:00" },
                { displayTimeZone: "local" },
                { timeFormat: "h:mm:ss a" },
              ],
            },
          },
        ],
      }}
      columnTypeSpecificExtras={{
        "Custom Column 1": {
          buttonType: "internal-url",
          internalUrlPath: "d4ee58e0-ca19-11f0-8de6-87c38a8b8b13",
          internalUrlQuery:
            '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{currentRow.order_id}}\\"}]"',
          newWindow: true,
        },
        item_shipping_profile_id: {
          buttonType: "internal-url",
          internalUrlPath: "4da65e82-bfd3-11eb-babe-e7bd5e60afd2",
          internalUrlQuery:
            '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{self}}\\"}]"',
          newWindow: true,
        },
        "Custom Column 3": {
          buttonType: "internal-url",
          internalUrlPath: "05e8b604-bfd2-11eb-a473-e3aa09e6a93b",
          internalUrlQuery:
            '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{currentRow.product_id}}\\"}]"',
          newWindow: true,
        },
      }}
      columnVisibility={{
        ordered: [
          { listing: true },
          { product_id: true },
          { name: true },
          { sales: true },
          { order_id: true },
          { status: true },
          { price_cents: true },
          { "Custom Column 1": true },
          { shipment: true },
          { id: true },
          { email: true },
          { actions: true },
        ],
      }}
      columnWidths={[
        { object: { id: "name", value: 79 } },
        { object: { id: "item_shipping_profile_id", value: 132 } },
        { object: { id: "seller_shipping_price_cents", value: 120 } },
        { object: { id: "Custom Column 1", value: 137 } },
        { object: { id: "shipping_price_cents", value: 115 } },
        { object: { id: "product_id", value: 88 } },
        { object: { id: "id", value: 100 } },
        { object: { id: "status", value: 135 } },
        { object: { id: "used_incremental_weight", value: 114 } },
        { object: { id: "item_weight_scale", value: 98.5859375 } },
        { object: { id: "created_at", value: 192 } },
        { object: { id: "item_weight_amount", value: 97.3359375 } },
        { object: { id: "order_id", value: 164 } },
        { object: { id: "order_uuid", value: 208 } },
      ]}
      customButtonName="Actions"
      data="{{queryShipment.data.items}}"
      defaultSelectedRow="index"
      defaultSortByColumn="created_at"
      defaultSortDescending={true}
      onCustomButtonPressQueryName="table1onCustomButtonPressQueryNameTrigger"
      pageSize={9}
      showClearSelection={true}
      showColumnBorders={true}
      sortByRawValue={{ ordered: [{ total_cents: true }] }}
      sortMappedValue={{ ordered: [{ total_cents: false }] }}
    />
    <Button
      id="button8"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy Order Details"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "Order date: {{orderTransformer_OrdersInShipmentPage.value.created_at}}\nShipment id: {{queryShipment.data.id}}\nTracking: {{queryShipment.data.tracking_code}}\nBuyer Username: {{orderTransformer_OrdersInShipmentPage.value.user.username}}\n\n{{(tableShipments.selectedRow.data).map(o => `Order number: ${o.order_id}`).join('\\n')}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Select
      id="selectBulkAction"
      _defaultValue={null}
      allowDeselect={true}
      captionByIndex=""
      colorByIndex=""
      data=""
      disabledByIndex=""
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      itemMode="static"
      label="Bulk Actions"
      labels=""
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      tooltipByIndex=""
      values=""
    >
      <Option
        id="24881"
        disabled={false}
        hidden={false}
        label="Cancel"
        value="trigger_cancel"
      />
      <Option
        id="58ad1"
        disabled={false}
        hidden={false}
        label="Shipping"
        value="trigger_ship_it"
      />
      <Option
        id="c4591"
        disabled={false}
        hidden={false}
        label="Pay Seller"
        value="pay_seller"
      />
    </Select>
    <Select
      id="selectBulkCancellationReason"
      allowDeselect={true}
      data="{{ queryCancellationReasons_OrdersInShipmentPage.data }}"
      disabled="{{selectBulkAction.value == 'trigger_complete'}}"
      label="Cancellation Reason"
      labels="{{ _.startCase(item) }}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      values="{{ item }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "{{ selectBulkCancellationReason.value }}" } }}
        pluginId="varSelectBulkCancellationReasonValue"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Include src="./CancellationWarningModal.rsx" />
    <Button
      id="button2"
      _disclosedFields={{ array: [] }}
      disabled="{{ (!selectBulkAction.value) | (selectBulkAction.value == 'trigger_cancel' & !selectBulkCancellationReason.value) }}"
      marginType="normal"
      text="Submit Bulk Action"
    >
      <Event
        enabled={
          '{{ selectBulkAction.value == "trigger_cancel" &&(queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("break") || queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("Break") || queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("mystery") || queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("Mystery"))}}'
        }
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="CancellationWarningModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={
          '{{ selectBulkAction.value != "trigger_cancel" ||(!queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("break") && !queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("Break") && !queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("mystery") && !queryCategoryId_OrdersInShipmentPage.data.LABEL[0].includes("Mystery"))}}'
        }
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="bulkUpdate"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Frame>
</Screen>
