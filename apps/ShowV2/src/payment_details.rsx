<Screen
  id="payment_details"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="8bad2afa-7e8c-4423-b515-28f19096fab2"
>
  <Folder id="refunds">
    <JavascriptQuery
      id="checkRefundReason"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/checkRefundReason.js", "string")}
      queryFailureConditions="[]"
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="createAndRejectRefundRequest"
      body={
        '[{"key":"message","value":"{{refund_reuqest_message}}"},{"key":"rejection_reason","value":"{{refund_reuqest_reason}}"},{"key":"order_id","value":"{{order_id}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="refunds/reject"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="failure"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "error" },
                  { title: "Error When Rejecting Refund Request" },
                  { description: "{{self.error}}" },
                  { duration: "8" },
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
    <State
      id="isBuyerPotentialRefundAbuser"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="false"
    />
    <State
      id="isBuyerPotentialRefundAbuserMdnr"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value=""
    />
    <JavascriptQuery
      id="queryBulkRefund"
      confirmationMessage={
        'Are you sure you want to refund {{tableShipmentsRefund.selectedIndex.length == 1 ? "the selected order" : "ALL of the selected orders"}}'
      }
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer.
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("../lib/queryBulkRefund.js", "string")}
      queryFailureConditions="[]"
      requireConfirmation={true}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
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
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="modalRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryNewRefund2_0"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <State
      id="queryBulkRefundRequestsState"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="[]"
    />
    <JavascriptQuery
      id="queryBulkReject"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/queryBulkReject.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="queryItemAuthenticityDropdown"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="dropdown/item_authenticity"
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
      id="queryNewRefund2_0"
      confirmationMessage="Are you sure you want to refund the order?"
      cookies="[]"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="refunds?order_id={{urlparams.id}}&fetch_ledger_transactions=true"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showFailureToaster={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      transformer={
        '// type your code here\n// example: return formatDataAsArray(data).filter(row => row.quantity > 20)\n\nlet count = data.refund_requests.length;\n\nlet amount_billed_back = data.refund_requests.reduce((sum, request) => {\n  return sum + (request.ledger_transaction ? request.ledger_transaction.amount_cents : 0);\n}, 0);\n\nlet amount_refunded = data.refund_requests.reduce((sum, request) => {\n  return sum + (request.status == "APPROVED" ? request.amount : 0);\n}, 0);\n\nlet transformedData = {\n  count: count,\n  amount_billed_back: amount_billed_back\n};\n\nreturn {\n  "amount_refunded_formated": (amount_refunded/ 100).toLocaleString("en-US", { style: "currency", currency: data.refund_requests[0]?.currency || "USD" }),\n  "has_rejected_refund":data.refund_requests.some(item => item.status === "REJECTED"),\n  "count": count,\n  "amount_billed_back": amount_billed_back,\n  "amount_billed_back_formatted": (amount_billed_back / 100).toLocaleString("en-US", { style: "currency", currency: data.refund_requests[0]?.currency || "USD" }),\n  "refund_requests": data.refund_requests.map(r => Object.assign({},r, r.context))\n}'
      }
      triggersOnFailure={[]}
      triggersOnSuccess={["queryRecord"]}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "{{queryNewRefund2_0.data}}" }] }}
        pluginId="stateNewRefund2_0"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="queryRefund"
      body={
        '[{"key":"amount_cents","value":"{{stateBulkRefundSelectedOrderInShipmentReqAmountCents}}"},{"key":"reason","value":"{{selectRefundReason.value}}"},{"key":"author_email","value":"{{current_user.email}}"},{"key":"returned","value":"{{selectReturned.value}}"},{"key":"notes","value":"{{textRefundNotes.value.length == 0 ? null : textRefundNotes.value}}"},{"key":"item_authenticity","value":"{{item_authenticity.value}}"},{"key":"charge_seller","value":"{{selectBillBackSeller.selectedItem?.value == true}}"},{"key":"refund_type","value":"{{(refundType.value).toUpperCase()}}"}]'
      }
      bodyType="json"
      confirmationMessage="Are you sure you want to refund the order?"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="orders/{{stateBulkRefundSelectedOrderInShipmentId}}/refunds"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={["queryRecord"]}
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SqlQueryUnified
      id="queryRefundAbuse"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("../lib/queryRefundAbuse.sql", "string")}
      resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
      resourceTypeOverride=""
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer={
        '// Default to all zero values in case buyer for order has no existing refunds\nreturn formatDataAsArray(data)?.[0] ?? {\n  DT: {{ moment().format("YYYY-MM-DD") }},\n  LIFETIME_TOTAL_SPEND: 0,   \n  LIFETIME_TOTAL_REFUND_COMPLETED_AMOUNT_DOLLARS_GAMEABLE: 0,\n  LIFETIME_COUNT_REFUND_COMPLETED_SHIPMENTS_PURCHASED_GAMEABLE: 0,\n  USER_ABOVE_REFUND_THRESHOLD: false\n};'
      }
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value: "{{queryRefundAbuse.data.USER_ABOVE_REFUND_THRESHOLD}}",
          },
        }}
        pluginId="isBuyerPotentialRefundAbuser"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value: "{{queryRefundAbuse.data.USER_ABOVE_REFUND_THRESHOLD_MDNR}}",
          },
        }}
        pluginId="isBuyerPotentialRefundAbuserMdnr"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="queryRefundFailureHandler"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundFailureHandler.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SqlQueryUnified
      id="queryRefundReasonAbuse"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundReasonAbuse.sql", "string")}
      resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return formatDataAsArray(data)?.[0]"
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="queryRefundReasonsDropdown_PaymentDetailsPage"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={'[{"key":"Accept","value":"application/json"}]'}
      query="refund_reasons/dropdown"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showSuccessToaster={false}
      transformer={
        "for (let i = 0; i < data.length; i++) {\n   var is_user_in_fraud = {{current_user.groups.map(group => group.name).includes('Fraud')}};\n   if (data[i].value == \"fraud\" && !is_user_in_fraud) {\n      data.splice(i, 1);\n   }\n}\n\nreturn data;"
      }
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="queryRefundSetAllAmountsTo"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetAllAmountsTo.js", "string")}
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
    <JavascriptQuery
      id="queryRefundSetAllPercentagesTo"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetAllPercentagesTo.js", "string")}
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
    <JavascriptQuery
      id="queryRefundSetShippingRefund"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetShippingRefund.js", "string")}
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
    <JavascriptQuery
      id="queryRefundSetSubtotalRefund"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetSubtotalRefund.js", "string")}
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
    <JavascriptQuery
      id="queryRefundSetTaxRefund"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetTaxRefund.js", "string")}
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
    <JavascriptQuery
      id="queryRefundSetTotalRefund"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSetTotalRefund.js", "string")}
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
    <RESTQuery
      id="queryRefundShipment"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="shipments/{{orderShipmentId.value}}?fetch_refund_requests=true"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer={
        'const items = data.items;\n\nlet order_id_to_refund_request = data.refund_requests\n  // Filter objects where external_entity_type is "order"\n  .filter(obj => obj.external_entity_type === "order")\n  // Create a dictionary with external_entity_id casted to int\n  .reduce((acc, obj) => {\n    acc[parseInt(obj.external_entity_id)] = obj;\n    return acc;\n  }, {});\n\n\nvar ret = [];\nfor (let i = 0; i < items.length; i++) {\n  // Add two custom keys to be used by users to edit the table and to keep them in sync\n  let subtotal_cents = items[i].amount_charged_cents - items[i].taxes_cents - items[i].shipping_price_cents;\n  let credit_cents = items[i].credit_cents\n  let total_cents = items[i].amount_charged_cents + credit_cents;\n  \n  let item_data = {\n    "order_id": items[i].order_id,\n    "subtotal_cents": subtotal_cents,\n    "taxes_cents": items[i].taxes_cents,\n    "shipping_price_cents": items[i].shipping_price_cents,\n    "credit_cents": credit_cents,\n    "total_cents": total_cents,\n    "amount_refunded_cents": items[i].amount_refunded_cents,\n    "user_refund_amount" : total_cents,                                              // Editable, default to total_cents\n    "user_refund_subtotal_percentage" : total_cents / subtotal_cents,                // Editable\n    "user_refund_total_percentage" : 1.00,                                           // Editable, default to 1 (100%)\n    "name" : items[i].name,\n    "id": items[i].id,\n    "created_at": items[i].created_at,\n  }\n  if (order_id_to_refund_request[items[i].order_id]) {\n    let refund_request = order_id_to_refund_request[items[i].order_id]\n    item_data.refund_request_id = refund_request.id;\n    item_data.refund_request_status = refund_request.status;\n  }\n  ret.push(item_data)\n}\nreturn ret;'
      }
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="selectRow"
        params={{
          ordered: [
            {
              rowIndex:
                "{{ tableShipmentsRefund.data.findIndex(row => row.order_id === queryRecord.data.id) }}",
            },
          ],
        }}
        pluginId="tableShipmentsRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="scrollIntoView"
        params={{
          ordered: [
            {
              options: { ordered: [{ block: "end" }, { behavior: "smooth" }] },
            },
          ],
        }}
        pluginId="tableShipmentsRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <JavascriptQuery
      id="queryRefundSuccessHandler"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryRefundSuccessHandler.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="queryRefundTableShipmentsRefundCellChangeHandler"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include(
        "../lib/queryRefundTableShipmentsRefundCellChangeHandler.js",
        "string"
      )}
      queryFailureConditions="[]"
      resourceName="JavascriptQuery"
      resourceTypeOverride=""
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: 'for(const row of queryBulkRefundRequestsState.value) {\n  if (row.order_id === stateBulkRefundSelectedOrderInShipmentId) {\n    row.status = "Success";\n  }\n}',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          ordered: [
            {
              src: 'let data = tableRefundSummary.data;\nfor (var i = 0; i < data.length; i++) {\n  if (data[i].order_id === 27258) {\n    console.log("queryRefund: Failed to refund order: " + data[i].order_id);\n    data[i].status = "Failed";\n  }\n}\n// tableRefundSummary.data.forEach(request => {\n//   //if (request.order_id === stateBulkRefundSelectedOrderInShipmentId) {\n//   if (request.order_id === 27258) {\n//     console.log("queryRefund: Failed to refund order: " + request.order_id);\n//     request.status = "Failed";\n//   }\n// });\ntableRefundSummary.setData(data);',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <State
      id="refundType"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="partial"
    />
    <RESTQuery
      id="rejectRefundRequest"
      body={
        '[{"key":"message","value":"{{refund_reuqest_message}}"},{"key":"rejection_reason","value":"{{refund_reuqest_reason}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="refunds/{{refund_reuqest_id}}/reject"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="failure"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "error" },
                  { title: "Error When Rejecting Refund Request" },
                  { description: "{{self.error}}" },
                  { duration: "8" },
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
    <State
      id="stateNewRefund2_0"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{
}"
    />
    <JavascriptQuery
      id="triggerOrderRefundModal"
      notificationDuration={4.5}
      query={include("../lib/triggerOrderRefundModal.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <OpenAPIQuery
      id="queryOrderRefunds"
      enableTransformer={true}
      isMultiplayerEdited={false}
      method="get"
      operationId="get_order_refunds_admin_api_orders__order_id__order_refunds_get"
      parameterDynamicStates={'{"order_id":false}'}
      parameterMetadata=""
      parameters={'{"order_id":"{{ Number(url.searchParams.id) }}"}'}
      path="/admin/api/orders/{order_id}/order_refunds"
      requestBodyMetadata=""
      resourceName="a1e74f74-65e1-4be7-a029-c8416432bf5a"
      resourceTypeOverride=""
      runWhenModelUpdates={true}
      transformer={
        'let order_seller_charge_amount = 0;\nlet order_seller_charge_currency = "USD";\n\norder_seller_charge_amount = data.reduce((sum, order_refund) => {\n  if(order_refund.refund_outcome && order_refund.refund_outcome.total_seller_charge) {\n    order_seller_charge_currency = order_refund.refund_outcome.total_seller_charge.currency;\n    return sum + Number(order_refund.refund_outcome.total_seller_charge.amount);\n  } else {\n    return sum;\n  }\n}, 0)\n\norder_seller_charge_amount *=-1;\n\nreturn {\n  "order_refunds": data,\n  "order_seller_charge_amount": order_seller_charge_amount,\n  "order_seller_charge_formatted": order_seller_charge_amount.toLocaleString("en-US", { style: "currency", currency: order_seller_charge_currency })\n}'
      }
    />
  </Folder>
  <RESTQuery
    id="queryPayout_PaymentDetailsPage"
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
    id="queryGiveawayCredits"
    query={include("../lib/queryGiveawayCredits.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="queryRefundArnStan"
    enableTransformer={true}
    isMultiplayerEdited={false}
    query={include("../lib/queryRefundArnStan.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    transformer={
      'if (!data.ARN_STAN) return "null";\n\nconst validARNs = data.ARN_STAN.filter(v => v != null && v !== "");\n\nreturn validARNs.length > 0 ? validARNs.join("<br>") : "null";\n'
    }
    warningCodes={[]}
  >
    <Event
      event="success"
      method="setValue"
      params={{ map: { value: "{{ self.data }}" } }}
      pluginId="stateArnStan"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ map: { value: '"Fetch failed, try again"' } }}
      pluginId="stateArnStan"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <RESTQuery
    id="queryRefundAuditLog"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Accept","value":"application/json"}]'}
    query="orders/{{queryRecord.data.id}}/refund-audit-log"
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
    id="querySellerEarnings"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="orders/{{urlparams.id}}/earnings"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenPageLoadsDelay="0"
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryUpdateItemAuthenticity"
    body={
      '[{"key":"item_authenticity","value":"{{item_auth_in_refund_audit_log.value}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="/orders/refund-audit-log/{{queryRefundAuditLog.data[0].id}}/item-authenticity"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    type="PATCH"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="queryRefundAuditLog"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="stateArnStan" value={'Click "Fetch ARN/STAN" button'} />
  <Function
    id="transformerPaymentDetails"
    funcBody={include("../lib/transformerPaymentDetails.js", "string")}
    runBehavior="debounced"
  />
  <JavascriptQuery
    id="twoDaysAgo"
    cacheKeyTtl={300}
    enableCaching={true}
    notificationDuration={4.5}
    query={include("../lib/twoDaysAgo.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="queryAppeals"
    notificationDuration={4.5}
    query="orders/{{queryRecord.data.id}}/appeals"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
  />
  <Include src="./mRejectRefund.rsx" />
  <Frame
    id="$main3"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Module
      id="orderRefundModule"
      heightType="fixed"
      moduleOrderId="{{ triggerOrderRefundModal.data }}"
      moduleRefundReason=""
      name="Order Refund"
      pageUuid="832ca325-8af0-4ea1-a776-6d0495e7552c"
    />
    <Button
      id="refundButton"
      _disclosedFields={{ array: [] }}
      disabled={
        "{{ queryRecord.data.payment?.status !== 'approved' && queryRecord.data.style !== \"GIVEAWAY\"}}"
      }
      hidden="true"
      loading="{{queryRefundAbuse.isFetching||queryRefundReasonAbuse.isFetching||queryRecord.isFetching || queryNewRefund2_0.isFetching}}"
      marginType="normal"
      text="Refund / Reject"
    >
      <Event
        enabled="{{!isBuyerPotentialRefundAbuser.value}}"
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="modalRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{isBuyerPotentialRefundAbuser.value}}"
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="refundWarningModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="reset"
        params={{ ordered: [] }}
        pluginId="queryRefundShipment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ stateNewRefund2_0.value.has_rejected_refund}}"
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="refundWarningModalRejectedRefundRequest"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonRejectRefundV2"
      hidden=""
      style={{ map: { background: "warning" } }}
      text="Refund / Reject"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="triggerOrderRefundModal"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./container3.rsx" />
    <Include src="./refundReasonWarningModal.rsx" />
    <Include src="./modalRefund.rsx" />
    <Include src="./modalQueryRefundSummary.rsx" />
    <Modal
      id="refundWarningModal"
      events={[]}
      hidden="true"
      modalHeight="400px"
      modalHeightType="auto"
      showInEditor={true}
    >
      <Text
        id="refundWarningMessage"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="## Warning:

The current buyer is in breach of our [refund thresholds for gameable reasons](https://whatnotinternal.zendesk.com/hc/en-us/articles/12990780856333-Buyer-Refund-Abuse-Thresholds) and is a potential refund abuser.


In their lifetime the buyer has refunded:
- **{{queryRefundAbuse.data.LIFETIME_COUNT_REFUND_COMPLETED_SHIPMENTS_PURCHASED_GAMEABLE}} shipments for gameable reasons**
- **{{queryRefundAbuse.data.LINKED_GAMEABLE_SHIPMENTS_REFUNDED}} shipments for gameable reasons across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**
- **{{(queryRefundAbuse.data.LIFETIME_PCT_SPEND_REFUNDED_GAMEABLE * 100).toFixed(2)}}% of total spend for gameable reasons**
-  **{{(queryRefundAbuse.data.LINKED_TOTAL_SPEND_REFUNDED_PCT * 100).toFixed(2)}}% of total spend for gameable reasons across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**

- **{{queryRefundAbuse.data.LINKED_FAST_LANE_SHIPMENTS_REFUNDED}} shipments for fast lane across linked accounts**
- **{{queryRefundAbuse.data.LINKED_BUYER_CANCELLATION_EDUCATION_EVENTS}} shipments for buyer cancellation education across linked accounts**
- **{{queryRefundAbuse.data.LIFETIME_REFUNDS_HVI}} shipments for HVI**

Gameable reasons include Damaged item/Damaged or misrepresented condition, Missing item, Wrong item, Return to sender, Incorrect address on purchase, Buyer/seller dispute, Misbid, Marked delivered, not received, One X allowance / fast lane refund, Buyer cancellation education, Tracking stuck (only for international shipping), Giveaway credits.

<br>
Refund abuse data for this user was last updated on {{queryRefundAbuse.data.DT}}."
        verticalAlign="center"
      />
      <Button
        id="proceedWithRefundConfirmationButton"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        style={{ ordered: [{ background: "danger" }] }}
        text="I understand, proceed with refund"
      >
        <Event
          event="click"
          method="open"
          params={{ ordered: [] }}
          pluginId="modalRefund"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="close"
          params={{ ordered: [] }}
          pluginId="refundWarningModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </Modal>
    <Modal
      id="refundWarningModalMdnr"
      events={[]}
      hidden="true"
      modalHeight="400px"
      modalHeightType="auto"
      showInEditor={true}
    >
      <Text
        id="refundWarningMessageMdnr"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="## Warning:

The current buyer is in breach of our [refund thresholds for either gameable reasons or MDNR reason (!!!)](https://whatnotinternal.zendesk.com/hc/en-us/articles/12990780856333-Buyer-Refund-Abuse-Thresholds) and is a potential refund abuser.

In their lifetime the buyer has these gameable refunds:
- **{{queryRefundAbuse.data.LIFETIME_COUNT_REFUND_COMPLETED_SHIPMENTS_PURCHASED_GAMEABLE}} shipments for gameable reasons**
- **{{queryRefundAbuse.data.LINKED_GAMEABLE_SHIPMENTS_REFUNDED}} shipments for gameable reasons across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**
- **{{(queryRefundAbuse.data.LIFETIME_PCT_SPEND_REFUNDED_GAMEABLE * 100).toFixed(2)}}% of total spend for gameable reasons**
-  **{{(queryRefundAbuse.data.LINKED_TOTAL_SPEND_REFUNDED_PCT * 100).toFixed(2)}}% of total spend for gameable reasons across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**

In their lifetime the buyer has these MDNR refund:
- **{{queryRefundAbuse.data.LIFETIME_COUNT_REFUND_COMPLETED_SHIPMENTS_PURCHASED_GAMEABLE_MDNR}} shipments for mdnr reason**
- **{{queryRefundAbuse.data.LINKED_GAMEABLE_SHIPMENTS_REFUNDED_MDNR}} shipments for mdnr reason across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**
- **{{(queryRefundAbuse.data.LIFETIME_PCT_SPEND_REFUNDED_GAMEABLE_MDNR * 100).toFixed(2)}}% of total spend for mdnr reason**
-  **{{(queryRefundAbuse.data.LINKED_TOTAL_SPEND_REFUNDED_MDNR_PCT * 100).toFixed(2)}}% of total spend for mdnr reason across {{queryRefundAbuse.data.STRONG_LINKS}} linked accounts**

<br>
Refund abuse data for this user was last updated on {{queryRefundAbuse.data.DT}}."
        verticalAlign="center"
      />
      <Button
        id="proceedWithRefundConfirmationButtonMdnr"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        style={{ ordered: [{ background: "danger" }] }}
        text="I understand, proceed with refund"
      >
        <Event
          event="click"
          method="trigger"
          params={{
            ordered: [
              {
                options: {
                  object: {
                    onSuccess: null,
                    onFailure: null,
                    additionalScope: null,
                  },
                },
              },
            ],
          }}
          pluginId="queryBulkRefund"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="open"
          params={{ ordered: [] }}
          pluginId="modalQueryRefundSummary"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="close"
          params={{ ordered: [] }}
          pluginId="refundWarningModalMdnr"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </Modal>
    <Modal
      id="refundWarningModalRejectedRefundRequest"
      events={[]}
      hidden="true"
      modalHeight="400px"
      modalHeightType="auto"
      showInEditor={true}
    >
      <Text
        id="refundWarningMessage2"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="## Warning:

This order already has a <b>rejected refund request</b>. Please check with your supervisor before refunding the order."
        verticalAlign="center"
      />
      <Button
        id="proceedWithRefundConfirmationButton2"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        style={{ ordered: [{ background: "danger" }] }}
        text="I understand, proceed with refund"
      >
        <Event
          event="click"
          method="open"
          params={{ ordered: [] }}
          pluginId="modalRefund"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="close"
          params={{ ordered: [] }}
          pluginId="refundWarningModalRejectedRefundRequest"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </Modal>
  </Frame>
</Screen>
