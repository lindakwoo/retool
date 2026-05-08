<GlobalFunctions>
  <Folder id="Queries" />
  <Folder id="Snippets" />
  <Folder id="unknownUsage">
    <RESTQuery
      id="queryUser"
      _additionalScope={["shouldShowPii", "userId"]}
      headers={
        '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"}]'
      }
      isMultiplayerEdited={false}
      query="users/{{ userId }}"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
    />
    <JavascriptQuery
      id="querySellerCountryCode"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/querySellerCountryCode.js", "string")}
      queryFailureConditions="[]"
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <GoogleSheetsQuery
      id="read_entire_notes"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      runWhenModelUpdates={false}
      sheetTitle="shipment_notes_working_copy"
      spreadsheetId="1iWEmpRXxYwm3S844PwpethmBBvGGvpRbnXYaClmvFF8"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      useRawSpreadsheetId={true}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State
      id="refundResponses"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{}"
    />
    <Function
      id="getReturnLabelReturnAddress"
      funcBody={include("./lib/getReturnLabelReturnAddress.js", "string")}
      runBehavior="debounced"
    />
    <JavascriptQuery
      id="convertRefundData"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="JavascriptQuery"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <GoogleSheetsQuery
      id="exportRefundFailures"
      actionType="append"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      runWhenModelUpdates={false}
      sheetName="failed"
      sheetUpdate="{{ refundFailureExportData.value }}"
      spreadsheetId="1CUynTEB_h2QzOUZzoND1-RytiuIR_4c1z_mDrF6AwRE"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State
      id="refundFailureExportData"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="null"
    />
    <GoogleSheetsQuery
      id="query66"
      actionType="append"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      sheetUpdate="{{ refundFailureExportData.value }}"
      showSuccessToaster={false}
      spreadsheetId="1CUynTEB_h2QzOUZzoND1-RytiuIR_4c1z_mDrF6AwRE"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <Function
      id="mapCountryCode"
      funcBody={include("./lib/mapCountryCode.js", "string")}
      runBehavior="debounced"
    />
    <State
      id="tempCountryCode"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="query98"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="shipmentTrackingHistory"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="/shipment/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/tracking-history"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method={null}
        params={{ ordered: [] }}
        pluginId=""
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="sellerAddress"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="selectedCourierParcelTemplateId"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <RESTQuery
      id="queryCoupon"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="coupons/{{urlparams.id}}"
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
  </Folder>
  <Folder id="globalCode">
    <Function
      id="errorTransformer"
      funcBody={include("./lib/errorTransformer.js", "string")}
      runBehavior="debounced"
    />
    <SqlQueryUnified
      id="fetchDisputes"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/fetchDisputes.sql", "string")}
      resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <OpenAPIQuery
      id="getUserPermissions"
      method="get"
      operationId="get_user_permissions_admin_api_admin2_authorizations_user_permissions_get"
      parameterMetadata=""
      path="/admin/api/admin2_authorizations/user_permissions"
      requestBodyMetadata=""
      resourceName="a1e74f74-65e1-4be7-a029-c8416432bf5a"
      runWhenModelUpdates={true}
    />
    <SqlQueryUnified
      id="hasFreeShippingForFtb"
      notificationDuration={4.5}
      query={include("./lib/hasFreeShippingForFtb.sql", "string")}
      resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="queryBuyer"
      _additionalScope={["buyerId", "shouldShowPii"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/queryBuyer.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <RESTQuery
      id="queryRecord"
      _additionalScope={["shouldShowPii"]}
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"}]'
      }
      isMultiplayerEdited={false}
      playgroundQuerySaveId={0}
      query="orders/{{urlparams.id}}"
      queryFailureConditions={
        '[{"condition":"{{ metadata.status === 404 }}","message":"Not Found"},{"condition":"{{ metadata.status !== 404 && metadata.status !== 200 }}","message":"Something wrong happened. Server code {{ metadata.status }}"},{"condition":"","message":""}]'
      }
      queryTimeout="70001"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showSuccessConfetti={false}
      showSuccessToaster={false}
      transformer={
        '// ---- Existing refund logic ----\nvar charged = data.payment?.amount_charged_cents;\nvar refunded = data.payment?.amount_refunded_cents;\n\nvar refund = null;\nif (refunded > 0 && refunded === charged) {\n  refund = "FULL REFUND";\n} else if (refunded > 0) {\n  refund = "PARTIAL REFUND";\n}\n\nif (data.payment) {\n  data.payment.refund = refund;\n}\n\n// ---- Total weight across buyer shipments in this livestream (display string) ----\nconst shipments = data.buyer_shipments_in_livestream || [];\n\nif (shipments.length === 0) {\n  data.totalWeightAllBuyerShipmentsInLivestream = null;\n  return data;\n}\n\nconst firstScale = shipments[0]?.weight?.scale;\nconst isMetric = ["GRAM", "KILO"].includes(firstScale);\nconst isImperial = ["OUNCE", "POUND"].includes(firstScale);\n\nif (!isMetric && !isImperial) {\n  data.totalWeightAllBuyerShipmentsInLivestream = null;\n  return data;\n}\n\n// Conversion helpers\nconst toGrams = (amount, scale) => {\n  switch (scale) {\n    case "GRAM": return amount;\n    case "KILO": return amount * 1000;\n    case "OUNCE": return amount * 28.349523125;\n    case "POUND": return amount * 453.59237;\n    default: return null;\n  }\n};\n\nconst toOunces = (amount, scale) => {\n  switch (scale) {\n    case "OUNCE": return amount;\n    case "POUND": return amount * 16;\n    case "GRAM": return amount / 28.349523125;\n    case "KILO": return amount * 35.27396195;\n    default: return null;\n  }\n};\n\nlet totalGrams = 0;\nlet totalOunces = 0;\n\nshipments.forEach((shipment) => {\n  const w = shipment?.weight;\n  if (!w || w.amount == null || !w.scale) return;\n\n  const g = toGrams(w.amount, w.scale);\n  if (g != null) totalGrams += g;\n\n  const oz = toOunces(w.amount, w.scale);\n  if (oz != null) totalOunces += oz;\n});\n\n// Format convenience string (round to 2 decimals)\nif (isMetric) {\n  const grams = totalGrams.toFixed(2);\n  const kilos = (totalGrams / 1000).toFixed(2);\n  data.total_weight_all_buyer_shipments_in_livestream = `${grams} g (${kilos} kg)`;\n} else {\n  const ounces = totalOunces.toFixed(2);\n  const pounds = (totalOunces / 16).toFixed(2);\n  data.total_weight_all_buyer_shipments_in_livestream = `${ounces} oz (${pounds} lb)`;\n}\n\nreturn data;\n'
      }
      triggersOnFailure={[]}
      triggersOnSuccess={[]}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        enabled=""
        event="success"
        method="setValue"
        params={{ map: { value: "{{queryRecord.data.items[0].shipment.id}}" } }}
        pluginId="orderShipmentId"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{
          map: { value: "{{queryRecord.data.items[0].listing.owner}}" },
        }}
        pluginId="orderSeller"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ map: { value: "{{queryRecord.data.user.id}}" } }}
        pluginId="orderBuyer"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value:
              '{{queryRecord.data.sales_channel === "livestream" ? queryRecord.data.channel_reference : null}}',
          },
        }}
        pluginId="orderLivestreamId"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{
          map: {
            options: {
              map: {
                additionalScope: {
                  buyerId: "{{queryRecord.data.user.id}}",
                  shouldShowPii: "false",
                },
              },
            },
          },
        }}
        pluginId="queryBuyer"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{
          map: {
            options: {
              map: {
                additionalScope: {
                  shouldShowPii: "false",
                  sellerId: "{{queryRecord.data.items[0].listing.owner.id}}",
                },
              },
            },
          },
        }}
        pluginId="querySeller"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <JavascriptQuery
      id="querySeller"
      _additionalScope={["shouldShowPii", "sellerId"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/querySeller.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <RESTQuery
      id="queryShipment"
      _additionalScope={["shouldShowPii"]}
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"}]'
      }
      playgroundQuerySaveId={0}
      query="shipments/{{orderShipmentId.value}}"
      queryDisabled="{{orderShipmentId.value == null}}"
      queryFailureConditions={
        '[{"condition":"{{ metadata.status === 404 }}","message":"Not Found"},{"condition":"{{ metadata.status !== 404 && metadata.status !== 200 }}","message":"Something wrong happened. Server code {{ metadata.status }}"},{"condition":"","message":""}]'
      }
      queryTimeout="15000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showFailureToaster={false}
      showSuccessConfetti={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={[]}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{queryShipment.data.requires_flat_rate_box && !queryShipment.data.courier_parcel_template_id}}",
            },
          ],
        }}
        pluginId="requiresFlatRateBox"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <SqlQueryUnified
      id="queryTimedListingEvents"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/queryTimedListingEvents.sql", "string")}
      resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="globalVariables">
    <State id="listingParentId" value="null" />
    <State
      id="createWithShippoRateStateCRL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="getRatesCRLResult"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="false"
    />
    <State
      id="getRatesCRLErrorMsg"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="orderBuyer"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value=""
    />
    <State
      id="orderLivestreamId"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="orderSeller"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="orderShipmentId"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State id="payOrderID" value="{{  urlparams.id }}" />
    <State id="promptPayoutConfirmation" value="true" />
    <State
      id="ratesFromQueryCRL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="requiresFlatRateBox"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="stateActionValue"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="stateOrderItemId"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="varQuerySubmitActionShipItError"
      value="{{ querySubmitActionShipIt.error }}"
    />
    <State id="varSelectBulkCancellationReasonValue" />
  </Folder>
  <SqlQueryUnified
    id="queryShipmentScanTraits"
    query={include("./lib/queryShipmentScanTraits.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    warningCodes={[]}
  />
  <connectResource id="query99" _componentId={null} />
</GlobalFunctions>
