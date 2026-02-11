<Container
  id="shipmentsInLivestreamContainer"
  disabled={'{{queryRecord.data.sales_channel == "standard"}}'}
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden={'{{queryRecord.data.sales_channel == "standard"}}'}
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle17"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Buyer Shipments in this Livestream"
      verticalAlign="center"
    />
  </Header>
  <View id="f9ec0" viewKey="View 1">
    <Text
      id="text40"
      _disclosedFields={{ array: [] }}
      hidden=""
      marginType="normal"
      value="{{queryRecord.data.buyer_shipments_in_livestream.length}} {{queryRecord.data.buyer_shipments_in_livestream.length == 1 ? 'shipment' : 'total shipments'}} in this livestream for this buyer. 
Multiple shipments can exist from either (a) manual shipment splitting by the seller or (b) Smart Bundling during order placement."
      verticalAlign="center"
    />
    <Text
      id="text39"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Total shipping spend across ALL shipments in this livestream for this buyer: {{queryRecord.data.total_paid_across_all_buyer_shipments_in_live.total_amount}}**
* Buyer paid: {{queryRecord.data.total_paid_across_all_buyer_shipments_in_live.buyer_amount}}
* Seller paid: {{queryRecord.data.total_paid_across_all_buyer_shipments_in_live.seller_amount}}"
      verticalAlign="center"
    />
    <Text
      id="text44"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!livestreamShippingSettings.value}}"
      marginType="normal"
      value="**Livestream Shipping Settings**
* Domestic Shipping Cost: **{{ livestreamShippingSettings.value.us_domestic_shipping_cost ?? 'not set' }}**
{{ livestreamShippingSettings.value.us_domestic_shipping_cost === 'buyer_pays_max_amount'
  ? '    * Max ' + new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: livestreamShippingSettings.value.us_domestic_buyer_pays_max_amount_currency
        ?? 'USD'
    }).format((livestreamShippingSettings.value.us_domestic_buyer_pays_max_amount_cents ?? 0) / 100)
  : '' }}
* Domestic Shipments 1–5lbs: **{{ livestreamShippingSettings.value.shipments_1_to_5_lbs ?? 'not set' }}**
* Domestic Shipments > 5lbs: **{{ livestreamShippingSettings.value.us_domestic_shipments_over_5_lbs ?? 'not set' }}**
* First-Class Mail Letters Enabled: **{{ livestreamShippingSettings.value.is_first_class_mail_letters_enabled ?? 'not set' }}**
"
      verticalAlign="center"
    />
    <Alert
      id="shippingSettingsDNE"
      description="Shipping settings do not exist for this livestream."
      hidden="{{livestreamShippingSettings.value !== null}}"
      title=""
    />
    <TableLegacy
      id="table3"
      _columns={[
        "id",
        "n_orders",
        "weight",
        "total_amount",
        "buyer_amount",
        "seller_amount",
        "Custom Column 1",
        "bundle_config",
        "bundle_config_shipping_profile_id",
      ]}
      _columnSummaryTypes={{
        ordered: [
          { "Custom Column 2": "checkedCount" },
          { bundle_config_shipping_profile_id: "" },
          { bundle_config: "" },
          { weight: "" },
        ],
      }}
      _columnSummaryValues={{
        ordered: [
          { "Custom Column 2": "" },
          { bundle_config_shipping_profile_id: "" },
          { bundle_config: "" },
          { weight: "" },
        ],
      }}
      _columnVisibility={{
        ordered: [{ bundle_config_shipping_profile_id: true }],
      }}
      _compatibilityMode={false}
      calculatedColumns={["Custom Column 1"]}
      columnAlignment={{
        "Custom Column 1": "left",
        id: "left",
        "Custom Column 2": "center",
        bundle_config_shipping_profile_id: "left",
        bundle_config: "left",
        weight: "left",
      }}
      columnColors={{
        ordered: [
          { "Custom Column 1": "" },
          { bundle_config: "" },
          { bundle_config_shipping_profile_id: "" },
          { buyer_amount: "" },
          { id: "" },
          { n_orders: "" },
          { seller_amount: "" },
          { total_amount: "" },
        ],
      }}
      columnEditable={{
        "Custom Column 1": false,
        bundle_config_shipping_profile_id: false,
      }}
      columnFormats={{
        ordered: [
          { "Custom Column 1": "button" },
          { "Custom Column 2": "CheckboxDataCell" },
          { bundle_config_shipping_profile_id: "button" },
          { bundle_config: "default" },
          { weight: "TextDataCell" },
        ],
      }}
      columnHeaderNames={{
        bundle_config_shipping_profile_id: "Max Bundle Size Shipping Profile",
        buyer_amount: "Buyer Shipping Spend",
        total_amount: "Total Shipping Spend",
        "Custom Column 1": "Open Shipment",
        n_orders: "# Orders",
        "Custom Column 2": "Tied to max bundle size",
        seller_amount: "Seller Shipping Spend",
        weight: "Shipment Weight (Actual)",
        id: "Shipment ID",
        bundle_config: "Max Bundle Size?",
      }}
      columnMappers={{
        "Custom Column 1": "Open Shipment",
        id: "{{self}} {{self == queryShipment.data.id ? '(This shipment)' : '' }}",
        "Custom Column 2": "{{queryShipment.data.bundling_status}}",
        bundle_config: "{{ currentRow.bundle_config?.max_bundle_size}}",
        bundle_config_shipping_profile_id:
          "Shipping Profile {{ currentRow.bundle_config_shipping_profile_id }}",
        weight: "{{ currentRow.weight.amount }} {{ currentRow.weight.scale }}",
      }}
      columnMappersRenderAsHTML={{
        map: { bundle_config_shipping_profile_id: false },
      }}
      columnTypeProperties={{
        ordered: [
          { "Custom Column 2": { ordered: [{ falseDisplayValue: "empty" }] } },
          { bundle_config_shipping_profile_id: {} },
          { bundle_config: {} },
          { weight: {} },
        ],
      }}
      columnTypeSpecificExtras={{
        ordered: [
          {
            "Custom Column 1": {
              ordered: [
                { buttonType: "internal-url" },
                { internalUrlPath: "0580c8fe-bfd3-11eb-abc6-a38238801047" },
                {
                  internalUrlQuery: '"[{\\"key\\":\\"\\",\\"value\\":\\"\\"}]"',
                },
                { newWindow: true },
                {
                  internalUrlHashParams:
                    '"[{\\"key\\":\\"shipment_id\\",\\"value\\":\\"{{currentRow.id}}\\"}]"',
                },
              ],
            },
          },
          {
            bundle_config_shipping_profile_id: {
              ordered: [
                { buttonType: "internal-url" },
                { internalUrlPath: "4da65e82-bfd3-11eb-babe-e7bd5e60afd2" },
                {
                  internalUrlQuery:
                    '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{currentRow.bundle_config_shipping_profile_id}}\\"}]"',
                },
                { newWindow: true },
                {
                  buttonDisabled:
                    "{{!!!currentRow.bundle_config_shipping_profile_id}}",
                },
              ],
            },
          },
        ],
      }}
      columnWidths={[
        { object: { id: "n_orders", value: 77.03125 } },
        { object: { id: "total_amount", value: 145.03125 } },
        { object: { id: "id", value: 161.8359375 } },
        { object: { id: "bundle_config", value: 149.8203125 } },
        { object: { id: "Custom Column 1", value: 163.3203125 } },
        { object: { id: "buyer_amount", value: 148.1533966064453 } },
        { object: { id: "seller_amount", value: 163.6505584716797 } },
        { object: { id: "weight", value: 133.99715423583984 } },
      ]}
      data="{{queryRecord.data.buyer_shipments_in_livestream}}"
      defaultSortByColumn="id"
      doubleClickToEdit={true}
      dynamicRowHeights={true}
      hidden=""
      showBoxShadow={false}
    />
  </View>
</Container>
