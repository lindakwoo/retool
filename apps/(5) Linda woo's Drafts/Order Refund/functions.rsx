<GlobalFunctions>
  <SqlTransformQuery
    id="triggerOnModuleValue"
    enableTransformer={true}
    query={include("./lib/triggerOnModuleValue.sql", "string")}
    resourceName="SQL Transforms"
    resourceTypeOverride=""
  >
    <Event
      enabled={'{{ moduleOrderId.value != null && moduleOrderId.value != "" }}'}
      event="success"
      method="trigger"
      params={{
        map: {
          options: {
            map: {
              additionalScope: {
                map: { orderIdParam: "{{ moduleOrderId.value }}" },
              },
            },
          },
        },
      }}
      pluginId="queryOrder"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlTransformQuery>
  <JavascriptQuery
    id="triggerOnPageLoad"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/triggerOnPageLoad.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="queryOrder"
    _additionalScope={["orderIdParam"]}
    isMultiplayerEdited={false}
    query="orders/{{orderIdParam}}"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
  >
    <Event
      enabled=""
      event="success"
      method="setValue"
      params={{ map: { value: "{{queryOrder.data.items[0].shipment.id}}" } }}
      pluginId="orderShipmentId"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryShipment"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryRefundReasons"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="orderShipmentId" />
  <RESTQuery
    id="queryShipment"
    enableTransformer={true}
    isMultiplayerEdited={false}
    query="shipments/{{orderShipmentId.value}}?fetch_refund_requests=true"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    transformer={
      'const items = data.items;\n\nlet orderIdRefundRequests = data.refund_requests\n  .filter(obj => obj.external_entity_type === "order")\n  .reduce((acc, obj) => {\n    acc[parseInt(obj.external_entity_id)] = obj;\n    return acc;\n  }, {});\n\n\nvar ret = [];\nfor (let i = 0; i < items.length; i++) {\n  let item_data = {\n    "order_id": items[i].order_id,\n    "name" : items[i].name,\n    "created_at": items[i].created_at,\n    "total_cents": items[i].total_cents,\n    "total_currency": items[i].total_currency,\n    "status":items[i].status,\n    "order_style":items[i].order_style,\n  }\n  if (orderIdRefundRequests[items[i].order_id] && orderIdRefundRequests[items[i].order_id].status != \'APPROVED\') {\n    let refund_request = orderIdRefundRequests[items[i].order_id];\n    item_data.refund_request_id = refund_request.id;\n    item_data.refund_request_status = refund_request.status;\n    item_data.refund_requested_amount = refund_request.amount_requested_sub_units;\n    item_data.refund_requested_currency = refund_request.currency;\n  }\n  ret.push(item_data)\n}\nreturn ret;'
    }
  >
    <Event
      event="success"
      method="setValue"
      params={{ map: { value: "{{ queryShipment.data }}" } }}
      pluginId="ordersInShipment"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryOrderReversibles"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryRejectRefundsState"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="querySetRefundWarningMessage"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryAllOrdeRefunds"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="ordersInShipment" />
  <JavascriptQuery
    id="calculateTotalReversibles"
    isMultiplayerEdited={false}
    query={include("./lib/calculateTotalReversibles.js", "string")}
    resourceName="JavascriptQuery"
  />
  <JavascriptQuery
    id="resetRefundForms"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/resetRefundForms.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="clearRefundReqPayloads"
    notificationDuration={4.5}
    query={include("./lib/clearRefundReqPayloads.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="queryOrderReversibles"
    isMultiplayerEdited={false}
    query={include("./lib/queryOrderReversibles.js", "string")}
    resourceName="JavascriptQuery"
  >
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="calculateTotalReversibles"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryEnabledRefundForms"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="markRefundMethods"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="markRefundMethods"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/markRefundMethods.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="validateSelectedOrderRefundMethods"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/validateSelectedOrderRefundMethods.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="queryReversibles"
    _additionalScope={["orderIdParam"]}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/orders/{{orderIdParam}}/reversibles"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="queryOrderRefunds"
    _additionalScope={["orderIdParam"]}
    isMultiplayerEdited={false}
    query="/orders/{{orderIdParam}}/order_refunds"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
  />
  <JavascriptQuery
    id="queryAllOrdeRefunds"
    isMultiplayerEdited={false}
    query={include("./lib/queryAllOrdeRefunds.js", "string")}
    resourceName="JavascriptQuery"
  />
  <State id="orderRefunds" value="" />
  <RESTQuery
    id="queryRefundReasons"
    enableTransformer={true}
    headers="[]"
    query="/refund_reasons/dropdown"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    transformer={
      'let resultList = [];\nlet is_user_in_fraud = {{current_user.groups.map(group => group.name).includes(\'Fraud\')}};\n\nfor (let i = 0; i < data.length; i++) {\n  if(data[i].value.startsWith("blanket_")) {\n    continue;\n  }\n  if (data[i].value === "fraud" && !is_user_in_fraud) {\n    continue;\n  }\n  if (data[i].value === "tax_code_correction") {\n    continue;\n  }\n  if (data[i].value === "cross_border_tax_adjustment") {\n    continue;\n  }\n  if (data[i].value === "postage_due") {\n    continue;\n  }\n  resultList.push(data[i]);\n}\n\nreturn resultList;'
    }
  />
  <RESTQuery
    id="queryCreateOrderRefund"
    _additionalScope={["requestPayload", "orderIdParam"]}
    body="{{ requestPayload }}"
    bodyType="raw"
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/orders/{{orderIdParam}}/order_refunds?"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  />
  <RESTQuery
    id="queryCreateLegacyRefund"
    _additionalScope={["requestPayload", "orderIdParam"]}
    body="{{ requestPayload }}"
    bodyType="raw"
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    isMultiplayerEdited={false}
    query="/orders/{{orderIdParam}}/legacy_refund"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    type="POST"
  />
  <JavascriptQuery
    id="queryRejectRefundsState"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/queryRejectRefundsState.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="variableRejectButtonEnabled" value="false" />
  <State id="variableRejectRefundMessages" />
  <RESTQuery
    id="queryRejectRefund"
    _additionalScope={[
      "refund_request_id",
      "refund_request_reject_message",
      "refund_request_reject_reason",
    ]}
    body={
      '[{"key":"message","value":"{{refund_request_reject_message}}"},{"key":"rejection_reason","value":"{{refund_request_reject_reason}}"}]'
    }
    bodyType="json"
    enableTransformer={true}
    isMultiplayerEdited={false}
    query="refunds/{{refund_request_id}}/reject"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    type="POST"
  />
  <JavascriptQuery
    id="queryRejectSelectedRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/queryRejectSelectedRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="variableRejectRefundResultMessage" />
  <State id="variableRefundWarningMessage" />
  <JavascriptQuery
    id="querySetRefundWarningMessage"
    notificationDuration={4.5}
    query={include("./lib/querySetRefundWarningMessage.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="syncPartialRefundAmountAndPercentage"
    _additionalScope={["direction", "reversibleKey"]}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/syncPartialRefundAmountAndPercentage.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="prepareFullOrderRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/prepareFullOrderRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="prepareItemPriceRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/prepareItemPriceRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="prepareBuyerShippingRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/prepareBuyerShippingRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="prepareGiveawayRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/prepareGiveawayRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="prepareLegacyRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/prepareLegacyRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="prepareTaxOrderRefundRequests"
    isMultiplayerEdited={false}
    query={include("./lib/prepareTaxOrderRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="preparePostageDueRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/preparePostageDueRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="calculateQuotations"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <RESTQuery
    id="queryGetQuotation"
    _additionalScope={["orderIdParam", "requestPayload"]}
    body="{{ requestPayload }}"
    bodyType="raw"
    cookies="[]"
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/orders/{{orderIdParam}}/order_refunds/quotation?"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  />
  <JavascriptQuery
    id="calculateQuotations"
    isMultiplayerEdited={false}
    query={include("./lib/calculateQuotations.js", "string")}
    resourceName="JavascriptQuery"
  >
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="initConfirmMessage"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="queryEnabledRefundForms"
    isMultiplayerEdited={false}
    query={include("./lib/queryEnabledRefundForms.js", "string")}
    resourceName="JavascriptQuery"
  />
  <JavascriptQuery
    id="initConfirmMessage"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/initConfirmMessage.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="show"
      params={{}}
      pluginId="modalFrameConfirmRefund"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <JavascriptQuery
    id="submitOrderRefundForm"
    notificationDuration={4.5}
    query={include("./lib/submitOrderRefundForm.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="executeOrderRefundRequests"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/executeOrderRefundRequests.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="resetRefundForms"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setValue"
      params={{ map: { value: "{{ executeOrderRefundRequests.data }}" } }}
      pluginId="executionResult"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{}}
      pluginId="modalFrameConfirmRefund"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="show"
      params={{}}
      pluginId="modalFrameProcessing"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{}}
      pluginId="modalFrameReversiblesAndRefund"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryShipment"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="getOrderRefundExecutionResult"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <State id="executionResult" value="" />
  <JavascriptQuery
    id="getOrderRefundExecutionResult"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/getOrderRefundExecutionResult.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <GlobalWidgetQuery
    id="moduleCallback"
    defaultValue=""
    resourceName="GlobalWidgetQuery"
    value=""
  />
</GlobalFunctions>
