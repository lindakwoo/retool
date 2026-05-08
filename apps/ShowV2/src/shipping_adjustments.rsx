<Screen
  id="shipping_adjustments"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="afe1c54a-ef1e-40fd-9775-a10d98892b1a"
>
  <SqlQueryUnified
    id="querySellerOrderCancellationReason_ShippingAdjustmentsPage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/querySellerOrderCancellationReason_ShippingAdjustmentsPage.sql",
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
  <SqlQueryUnified
    id="queryIsGlobalCoupon_ShippingAdjustmentsPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include(
      "../lib/queryIsGlobalCoupon_ShippingAdjustmentsPage.sql",
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
  <Function
    id="orderTransformer_ShippingAdjustmentsPage"
    funcBody={include(
      "../lib/orderTransformer_ShippingAdjustmentsPage.js",
      "string"
    )}
    runBehavior="debounced"
  />
  <RESTQuery
    id="queryShippingAdjustments"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="shipments/{{orderShipmentId.value}}/surcharge_adjustments"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryDeleteAdjustment"
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="/shipments/{{shippingAdjustmentTable.selectedRow.data.id}}/cancel-adjustment"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    type="DELETE"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "info" },
                { title: "Adjustment Cancelled" },
                { description: "User will still need to manually be refunded" },
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
    <Event
      event="success"
      method="refresh"
      params={{ ordered: [] }}
      pluginId="shippingAdjustmentTable"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "info" },
                { title: "Failed to Cancel Adjustment" },
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
  </RESTQuery>
  <Frame
    id="$main7"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="textAdjustmentsHeader"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Shipping Adjustments"
      verticalAlign="center"
    />
    <Container
      id="container6"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
    >
      <Header>
        <Text
          id="containerTitle16"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          verticalAlign="center"
        />
      </Header>
      <View id="3d009" viewKey="View 1">
        <TableLegacy
          id="shippingAdjustmentTable"
          _columns={[
            "Custom Column 1",
            "id",
            "adjustment_type",
            "charge_amount_sub_units",
            "tax_sub_units",
            "total_sub_units",
            "charge_amount_currency",
            "charge_reasons",
            "old_shipment_state",
            "new_shipment_state",
            "status",
            "tax_currency",
            "total_currency",
          ]}
          _columnSummaryTypes={{ ordered: [{ charge_amount_sub_units: "" }] }}
          _columnSummaryValues={{ ordered: [{ charge_amount_sub_units: "" }] }}
          _columnVisibility={{
            ordered: [
              { charge_amount_currency: false },
              { tax_currency: false },
              { total_currency: false },
              { "Custom Column 1": true },
            ],
          }}
          _compatibilityMode={false}
          calculatedColumns={["Custom Column 1"]}
          columnAlignment={{
            ordered: [
              { charge_amount_sub_units: "right" },
              { tax_sub_units: "right" },
              { total_sub_units: "right" },
              { "Custom Column 1": "left" },
            ],
          }}
          columnColors={{
            charge_reasons: "",
            old_shipment_state: "",
            tax_currency: "",
            new_shipment_state: "",
            total_currency: "",
            adjustment_type: "",
            charge_amount_currency: "",
            status: "",
            charge_amount_sub_units: "",
            total_sub_units: "",
            "Custom Column 1": "",
            id: "",
            tax_sub_units: "",
          }}
          columnEditable={{ ordered: [{ "Custom Column 1": false }] }}
          columnFormats={{
            ordered: [
              { charge_amount_sub_units: "default" },
              { "Custom Column 1": "button" },
            ],
          }}
          columnFrozenAlignments={{ ordered: [{ "Custom Column 1": "right" }] }}
          columnHeaderNames={{
            ordered: [
              { charge_amount_sub_units: "Subtotal" },
              { charge_reasons: "Charge Reasons" },
              { old_shipment_state: "Old Shipment Values" },
              { new_shipment_state: "New Shipment Values" },
              { tax_sub_units: "Taxes" },
              { total_sub_units: "Total" },
              { adjustment_type: "\nType" },
              { "Custom Column 1": "Cancel Adjustment" },
            ],
          }}
          columnMappers={{
            charge_amount_sub_units:
              "{{new Intl.NumberFormat('en-US', {style: 'currency', currency: orderTransformer_ShippingAdjustmentsPage.value.currency}).format(self / 100)}}",
            charge_reasons:
              '{{ self.map( (reason) => {\n  return {\n  WEIGHT_ADJ_LESS_THAN_1_LB_TO_1_TO_5_LB: "Weight less than 1lb to 1-5lbs", \n  WEIGHT_ADJ_LESS_THAN_1_LB_TO_OVER_5_LB: "Weight less than 1lb to over 5lbs",\n  WEIGHT_ADJ_1_TO_5_LB_TO_OVER_5_LB: "Weight 1-5lbs to over 5lbs",\n  WEIGHT_INCREASE_WHILE_OVER_5_LB: "Weight increase while over 5lbs",\n  DIMENSIONS_ABOVE_ONE_CUBIC_FOOT: "Dimensions above one cubic foot",\n  FLAT_RATE_TO_PRIORITY_AND_ADJ_OVER_5_LBS: "Opted out of flat rate while over 5lbs",\n  TO_FLAT_RATE_AND_UNDER_1_LB: "Opted into flat rate while under 1lb",\n  "Split Shipment": "Unbundle"}[reason] ?? reason \n})}}',
            tax_sub_units:
              "{{new Intl.NumberFormat('en-US', {style: 'currency', currency: orderTransformer_ShippingAdjustmentsPage.value.currency}).format(self / 100)}}",
            total_sub_units:
              "{{new Intl.NumberFormat('en-US', {style: 'currency', currency: orderTransformer_ShippingAdjustmentsPage.value.currency}).format(self / 100)}}",
            old_shipment_state: "",
            new_shipment_state: "",
            adjustment_type:
              '{{\n  {\n    SURCHARGE: "Surcharge (outside of allowance)",\n    SURCHARGE_WITHIN_ALLOWANCE: "Surcharge (within allowance)"\n  }[self] ?? self\n}}',
            "Custom Column 1": "Cancel",
          }}
          columnMappersRenderAsHTML={{
            ordered: [{ "Custom Column 1": false }],
          }}
          columnTypeProperties={{
            ordered: [
              {
                charge_amount_sub_units: {
                  ordered: [
                    { showSeparators: true },
                    { currency: "USD" },
                    { padDecimal: true },
                  ],
                },
              },
            ],
          }}
          columnTypeSpecificExtras={{
            ordered: [
              {
                "Custom Column 1": {
                  ordered: [
                    { buttonType: "action" },
                    { action: "queryDeleteAdjustment" },
                  ],
                },
              },
            ],
          }}
          columnWidths={[
            { object: { id: "charge_amount_sub_units", value: 102.5625 } },
            { object: { id: "tax_sub_units", value: 100.125 } },
            { object: { id: "id", value: 56.625 } },
            { object: { id: "total_sub_units", value: 77.82499694824219 } },
            { object: { id: "charge_reasons", value: 164.9499969482422 } },
            { object: { id: "adjustment_type", value: 203.3249969482422 } },
          ]}
          customButtonName="Cancel Adjustment"
          data="{{queryShippingAdjustments.data}}"
          doubleClickToEdit={true}
          events={[]}
          onCustomButtonPressQueryName="queryDeleteAdjustment"
          showBoxShadow={false}
        />
      </View>
    </Container>
    <Alert
      id="alert2"
      buttonText="Ship Profile"
      description="This shipment has a max bundle size of {{queryShipment.data.bundle_config.max_bundle_size}}. Items with a different shipping profile will never get bundled with this shipment."
      events={[
        {
          ordered: [
            { event: "click" },
            { type: "util" },
            { method: "openApp" },
            { pluginId: "" },
            { targetId: null },
            {
              params: {
                ordered: [
                  { uuid: "4da65e82-bfd3-11eb-babe-e7bd5e60afd2" },
                  {
                    options: {
                      ordered: [
                        {
                          queryParams: [
                            {
                              ordered: [
                                { key: "id" },
                                {
                                  value:
                                    "{{queryShipment.data.bundle_config_shipping_profile_id}}",
                                },
                              ],
                            },
                          ],
                        },
                        { newTab: true },
                      ],
                    },
                  },
                ],
              },
            },
            { waitType: "debounce" },
            { waitMs: "0" },
          ],
        },
      ]}
      hidden="{{!!!queryShipment.data.bundle_config}}"
      title="Shipment has a max bundle size"
    />
  </Frame>
</Screen>
