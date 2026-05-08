<Screen
  id="listing"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="d563ef3d-93b0-4a6a-9192-579fccaa87d0"
>
  <RESTQuery
    id="evaluateQualityListing"
    body="[]"
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [{ variable0: "{{ queryShipment.data.id }}" }],
    }}
    playgroundQueryName="Seller Invoice"
    playgroundQueryUuid="9257816c-176a-4515-b75d-a2aa869f7199"
    query="orders/{{queryRecord.data.id}}/evaluate-quality-listing"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    type="POST"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="getShippingRatesLogsURL_ListingPage"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={
      '{{"https://app.datadoghq.com/logs?query=%40http.url_details.path%3A%22%2Fadmin%2Fapi%2Fshipments%2F" + queryShipment.data.id + "%2Fshipping-rates%22%20&agg_m=count&agg_m_source=base&agg_t=count&cols=host%2Cservice&fromUser=true&messageDisplay=inline&refresh_mode=sliding&storage=hot&stream_sort=desc&viz=stream&from_ts=1652379062995&to_ts=1652379962995&live=true"}}'
    }
  />
  <JavascriptQuery
    id="getSneakerAttributes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getSneakerAttributes.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="listingId"
    value="{{ parseInt(queryRecord.data.items[0].listing.id) }}"
  />
  <Function
    id="orderQualityListingOverride"
    funcBody={include("../lib/orderQualityListingOverride.js", "string")}
    runBehavior="debounced"
  />
  <Function
    id="orderTransformer_ListingPage"
    funcBody={include("../lib/orderTransformer_ListingPage.js", "string")}
    runBehavior="debounced"
  />
  <RESTQuery
    id="queryCancellationReasons_ListingPage"
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
    id="queryCategoryId_ListingPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryCategoryId_ListingPage.sql", "string")}
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
  <RESTQuery
    id="queryDefaultBuyerAddress_ListingPage"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"x-whatnot-pii","value":"show"}]'}
    query="users/{{queryRecord.data.user.id}}/addresses/"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer="for (let i = 0; i < data.length; i++) {
  if (data[i].is_default) {
    return data[i];
  }
}
return null"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryIsGlobalCoupon_ListingPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryIsGlobalCoupon_ListingPage.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryListingAttributes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/listings/attribute_review/{{queryRecord.data.items[0].listing.id}}"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getSneakerAttributes"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <SqlQueryUnified
    id="queryListingRecord"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/queryListingRecord.sql", "string")}
    queryTimeout="20000"
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  >
    <Event
      event="success"
      method="setValue"
      params={{
        map: {
          value: "{{ parseInt(queryListingRecord.data.created_from_id) }}",
        },
      }}
      pluginId="listingParentId"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="queryListingSnapshot"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("../lib/queryListingSnapshot.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryRefundReasonsDropdown_ListingPage"
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
  <SqlQueryUnified
    id="querySellerOrderCancellationReason_ListingPage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/querySellerOrderCancellationReason_ListingPage.sql",
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
    id="queryShippingRates"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="order_items/{{stateOrderItemId.value}}/shipping_rates"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
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
  />
  <RESTQuery
    id="querySubmitAction"
    body={
      '[{"key":"action","value":"{{stateActionValue.value}}"},{"key":"cancellation_reason","value":"{{varSelectBulkCancellationReasonValue.value || null}}"},{"key":"seller_id","value":"{{orderSeller.value.id}}"},{"key":"buyer_username","value":"{{queryRecord.data.user.username}}"},{"key":"order_uuid","value":"{{queryRecord.data.uuid}}"},{"key":"channel_reference","value":"{{queryRecord.data.channel_reference || null}}"},{"key":"author_email","value":"{{current_user.email}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="order_items/{{stateOrderItemId.value}}/actions"
    requireConfirmation={true}
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
      params={{}}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryRecord"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="querySubmitActionShipIt"
    body={
      '[{"key":"courier","value":"{{queryShippingRates.data[radiogroupActionShipIt.value].courier}}"},{"key":"rate_id","value":"{{queryShippingRates.data[radiogroupActionShipIt.value].id}}"},{"key":"shipping_rate_source","value":"{{queryShippingRates.data[radiogroupActionShipIt.value].source}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="order_items/{{stateOrderItemId.value}}/actions/ship_it"
    requireConfirmation={true}
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
      params={{}}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="queryRecord"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setValue"
      params={{ map: { value: "{{ querySubmitActionShipIt.error }}" } }}
      pluginId="varQuerySubmitActionShipItError"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ map: { value: "{{ querySubmitActionShipIt.error }}" } }}
      pluginId="varQuerySubmitActionShipItError"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Function
    id="transformerActions"
    funcBody={include("../lib/transformerActions.js", "string")}
    runBehavior="debounced"
  />
  <Function
    id="transformerActionShipIt"
    funcBody={include("../lib/transformerActionShipIt.js", "string")}
    runBehavior="debounced"
  />
  <RESTQuery
    id="updateQualityListing"
    body={
      '[{"key":"low_quality_reasons","value":"{{multiselectListbox1.selectedItems.map(item => item.value)}}"},{"key":"override_quality_to","value":"{{!orderTransformer_ListingPage.value.has_quality_listing}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{ map: { variable0: "{{ queryShipment.data.id }}" } }}
    playgroundQueryName="Seller Invoice"
    playgroundQueryUuid="9257816c-176a-4515-b75d-a2aa869f7199"
    query="orders/{{queryRecord.data.id}}/override-quality-listing"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    type="POST"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Frame
    id="$main8"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ListView
      id="listviewOrderItems"
      instances="{{queryRecord.data.items.length}}"
      itemHeight="12"
      marginType="normal"
      paddingType="normal"
      rowKeys="{{queryRecord.data.items.map(x => x.id)}}"
      scroll={true}
    >
      <Text
        id="textOrderItemListingId"
        _defaultValue=""
        _disclosedFields={{ array: [] }}
        marginType="normal"
        style={{ ordered: [] }}
        value="#### Listing #{{queryRecord.data.items[i].listing.id}}"
        verticalAlign="center"
      />
      <Text
        id="text23"
        _disclosedFields={{ array: [] }}
        marginType="normal"
        value="#### Order Item #{{queryRecord.data.items[i].id}}"
        verticalAlign="center"
      />
      <KeyValueMap
        id="keyvaluemapOrderItem"
        data="{{queryRecord.data.items[i]}}"
        prevRowFormats={{
          price_cents: "usd_cents",
          cancellation_request: "datetime_tz",
        }}
        prevRowMappers={{
          listing:
            '{{self.title}}{{self.title ? " / " : ""}}{{self.condition}}',
          cancellation_request: '{{ self ? moment.utc(self.created_at) : "" }}',
        }}
        rowFormats={{
          ordered: [
            { price_cents: "usd_cents" },
            { cancellation_request: "datetime_tz" },
          ],
        }}
        rowHeaderNames={{
          id: "Order Item ID",
          listing: "Listing",
          name: "Name",
          price_cents: "Price",
          status: "Order Item Status",
          product_id: "Product ID",
          cancellation_request: "Cancellation Requested At",
        }}
        rowMappers={{
          ordered: [
            {
              listing:
                '{{self.title}}{{self.title ? " / " : ""}}{{self.condition}}',
            },
            {
              cancellation_request:
                '{{ self ? moment.utc(self.created_at) : "" }}',
            },
          ],
        }}
        rows={[
          "a",
          "b",
          "c",
          "actions",
          "id",
          "listing",
          "name",
          "price_cents",
          "product_id",
          "status",
          "cancellation_request",
          "shipment",
          "tracking_url",
          "quantity",
          "category",
          "order_item",
        ]}
        rowVisibility={{
          a: true,
          b: true,
          c: true,
          order_item: true,
          listing: true,
          tracking_url: false,
          quantity: true,
          product_id: false,
          name: true,
          status: true,
          cancellation_request: false,
          price_cents: true,
          shipment: false,
          id: true,
          actions: false,
          category: false,
        }}
      />
      <ButtonWidget
        id="buttonOpenListing"
        events={[
          {
            ordered: [
              { event: "click" },
              { type: "util" },
              { method: "openApp" },
              { pluginId: "" },
              {
                params: {
                  ordered: [
                    { uuid: "bc2b6754-3c53-11ee-8e6c-072d7b87776a" },
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
                                      "{{queryRecord.data.items[i].listing.id}}",
                                  },
                                ],
                              },
                              { ordered: [{ key: "" }, { value: "" }] },
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
        value="Open Listing"
      />
      <ButtonWidget
        id="buttonOpenProduct"
        events={[
          {
            ordered: [
              { event: "click" },
              { type: "util" },
              { method: "openApp" },
              { pluginId: "" },
              {
                params: {
                  ordered: [
                    { uuid: "05e8b604-bfd2-11eb-a473-e3aa09e6a93b" },
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
                                      "{{queryRecord.data.items[i].product_id}}",
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
        value="Open Product"
      />
      <Button
        id="buttonOpenCategory"
        marginType="normal"
        submitTargetId=""
        text="Open Category: {{queryCategoryId_ListingPage.data.LABEL[0]}}"
      >
        <Event
          event="click"
          method="openApp"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { newTab: true },
                    {
                      queryParams: [
                        {
                          key: "id",
                          value:
                            "{{parseInt(queryCategoryId_ListingPage.data.CATEGORY_ID[0])}}",
                        },
                      ],
                    },
                  ],
                },
              },
              { uuid: "bf02b65c-c249-11eb-a026-b339627a4c0e" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Include src="./modalOrderItemActions.rsx" />
      <Text
        id="text108"
        hidden={'{{queryRecord.data.items[0].category != "Sneakers"}}'}
        marginType="normal"
        value="#### Sneaker Attributes 👟"
        verticalAlign="center"
      />
      <ButtonWidget
        id="buttonOrderItemPrintOutgoingLabel"
        events={[
          {
            ordered: [
              { event: "click" },
              { type: "util" },
              { method: "openUrl" },
              { pluginId: "" },
              {
                params: {
                  ordered: [
                    {
                      options: {
                        ordered: [{ newTab: true }, { forceReload: false }],
                      },
                    },
                    { url: "{{queryRecord.data.items[i].shipment.file_url}}" },
                  ],
                },
              },
              { waitType: "debounce" },
              { waitMs: "0" },
            ],
          },
        ]}
        hidden="{{queryRecord.data.items[i].shipment === undefined || queryRecord.data.items[i].shipment === null || queryRecord.data.items[i].shipment.file_url === queryRecord.data.items[i].order_item.single_page_label}}"
        value="Print Outgoing Label"
      />
      <KeyValueMap
        id="keyvaluemapSneakerAttributes"
        data="{{getSneakerAttributes.data}}"
        hidden={'{{queryRecord.data.items[0].category != "Sneakers"}}'}
        prevRowFormats={{
          price_cents: "usd_cents",
          cancellation_request: "datetime_tz",
        }}
        prevRowMappers={{
          listing:
            '{{self.title}}{{self.title ? " / " : ""}}{{self.condition}}',
          cancellation_request: '{{ self ? moment.utc(self.created_at) : "" }}',
        }}
        rowFormats={{
          ordered: [
            { price_cents: "usd_cents" },
            { cancellation_request: "datetime_tz" },
          ],
        }}
        rowHeaderNames={{
          id: "Order Item ID",
          listing: "Listing",
          name: "Name",
          price_cents: "Price",
          status: "Order Item Status",
          product_id: "Product ID",
          cancellation_request: "Cancellation Requested At",
        }}
        rowMappers={{
          ordered: [
            {
              listing:
                '{{self.title}}{{self.title ? " / " : ""}}{{self.condition}}',
            },
            {
              cancellation_request:
                '{{ self ? moment.utc(self.created_at) : "" }}',
            },
          ],
        }}
        rows={[
          "a",
          "b",
          "c",
          "actions",
          "id",
          "listing",
          "name",
          "price_cents",
          "product_id",
          "status",
          "cancellation_request",
          "shipment",
          "tracking_url",
          "quantity",
          "category",
          "order_item",
          "pluginType",
          "queryRefreshTime",
          "paginationLimit",
          "streamResponse",
          "body",
          "lastReceivedFromResourceAt",
          "queryDisabledMessage",
          "servedFromCache",
          "offlineUserQueryInputs",
          "successMessage",
          "queryDisabled",
          "playgroundQuerySaveId",
          "workflowParams",
          "resourceNameOverride",
          "runWhenModelUpdates",
          "paginationPaginationField",
          "headers",
          "workflowRunId",
          "showFailureToaster",
          "paginationEnabled",
          "playgroundQueryUuid",
          "playgroundQueryId",
          "error",
          "workflowRunBodyType",
          "workflowBlockUuid",
          "runWhenPageLoadsDelay",
          "cookies",
          "isImported",
          "showSuccessToaster",
          "cacheKeyTtl",
          "requestSentTimestamp",
          "metadata",
          "workflowActionType",
          "queryRunTime",
          "changesetObject",
          "errorTransformer",
          "finished",
          "confirmationMessage",
          "isFetching",
          "changeset",
          "rawData",
          "queryTriggerDelay",
          "resourceTypeOverride",
          "enableErrorTransformer",
          "showLatestVersionUpdatedWarning",
          "paginationDataField",
          "timestamp",
          "enableTransformer",
          "showUpdateSetValueDynamicallyToggle",
          "version",
          "overrideOrgCacheForUserCache",
          "runWhenPageLoads",
          "transformer",
          "isMultiplayerEdited",
          "queryTimeout",
          "workflowId",
          "requireConfirmation",
          "type",
          "queryFailureConditions",
          "changesetIsObject",
          "enableCaching",
          "bodyType",
          "offlineQueryType",
          "queryThrottleTime",
          "updateSetValueDynamically",
          "notificationDuration",
          "query",
          "data",
          "shoe_size",
          "condition",
          "brand",
          "silhouette",
        ]}
        rowVisibility={{
          queryRefreshTime: true,
          paginationLimit: true,
          a: true,
          streamResponse: true,
          b: true,
          body: true,
          lastReceivedFromResourceAt: true,
          queryDisabledMessage: true,
          c: true,
          servedFromCache: true,
          offlineUserQueryInputs: true,
          order_item: true,
          listing: true,
          successMessage: true,
          queryDisabled: true,
          playgroundQuerySaveId: true,
          workflowParams: true,
          resourceNameOverride: true,
          runWhenModelUpdates: true,
          paginationPaginationField: true,
          headers: true,
          workflowRunId: true,
          showFailureToaster: true,
          paginationEnabled: true,
          brand: true,
          tracking_url: false,
          query: true,
          playgroundQueryUuid: true,
          playgroundQueryId: true,
          error: true,
          workflowRunBodyType: true,
          workflowBlockUuid: true,
          runWhenPageLoadsDelay: true,
          data: true,
          quantity: true,
          product_id: false,
          name: true,
          pluginType: true,
          isImported: true,
          showSuccessToaster: true,
          cacheKeyTtl: true,
          requestSentTimestamp: true,
          cookies: true,
          metadata: true,
          workflowActionType: true,
          queryRunTime: true,
          changesetObject: true,
          errorTransformer: true,
          finished: true,
          confirmationMessage: true,
          isFetching: true,
          changeset: true,
          rawData: true,
          status: true,
          cancellation_request: false,
          queryTriggerDelay: true,
          resourceTypeOverride: true,
          enableErrorTransformer: true,
          shoe_size: true,
          price_cents: true,
          showLatestVersionUpdatedWarning: true,
          paginationDataField: true,
          timestamp: true,
          enableTransformer: true,
          showUpdateSetValueDynamicallyToggle: true,
          version: true,
          silhouette: true,
          overrideOrgCacheForUserCache: true,
          runWhenPageLoads: true,
          transformer: true,
          isMultiplayerEdited: true,
          queryTimeout: true,
          workflowId: true,
          shipment: false,
          requireConfirmation: true,
          type: true,
          queryFailureConditions: true,
          id: true,
          condition: true,
          changesetIsObject: true,
          enableCaching: true,
          bodyType: true,
          actions: false,
          category: false,
          offlineQueryType: true,
          queryThrottleTime: true,
          updateSetValueDynamically: true,
          notificationDuration: true,
        }}
      />
      <Text
        id="textOutgoingShipmentId"
        _defaultValue=""
        _disclosedFields={{ array: [] }}
        hidden="{{queryRecord.data.items[i].shipment === undefined || queryRecord.data.items[i].shipment === null || queryRecord.data.items[i].shipment.file_url === queryRecord.data.items[i].order_item.single_page_label}}"
        marginType="normal"
        value="**Shipment ID:** {{ queryRecord.data.items[i].shipment.id || 'none' }}"
        verticalAlign="center"
      />
      <ButtonWidget
        id="buttonOpenOutgoingTrackingCode"
        disabled="{{!!!queryRecord.data.items[0].shipment.tracking_code}}"
        events={[
          {
            ordered: [
              { event: "click" },
              { type: "util" },
              { method: "openUrl" },
              { pluginId: "" },
              {
                params: {
                  ordered: [
                    { options: { ordered: [{ newTab: true }] } },
                    {
                      url: "https://tools.usps.com/go/TrackConfirmAction?tLabels={{queryRecord.data.items[0].shipment.tracking_code}}",
                    },
                  ],
                },
              },
              { waitType: "debounce" },
              { waitMs: "0" },
            ],
          },
        ]}
        hidden="{{queryRecord.data.items[i].shipment === undefined || queryRecord.data.items[i].shipment === null || queryRecord.data.items[i].shipment.file_url === queryRecord.data.items[i].order_item.single_page_label}}"
        value="Open"
      />
      <ButtonWidget
        id="buttonCopyOutgoingTrackingCode"
        disabled="{{!!!queryRecord.data.items[0].shipment.tracking_code}}"
        events={[
          {
            ordered: [
              { event: "click" },
              { type: "util" },
              { method: "copyToClipboard" },
              { pluginId: "" },
              {
                params: {
                  ordered: [
                    {
                      value:
                        "{{queryRecord.data.items[0].shipment.tracking_code}}",
                    },
                  ],
                },
              },
              { waitType: "debounce" },
              { waitMs: "0" },
            ],
          },
        ]}
        hidden="{{queryRecord.data.items[i].shipment === undefined || queryRecord.data.items[i].shipment === null || queryRecord.data.items[i].shipment.file_url === queryRecord.data.items[i].order_item.single_page_label}}"
        value="Copy"
      />
      <Text
        id="textOutgoingTrackingCode"
        _defaultValue=""
        _disclosedFields={{ array: [] }}
        hidden="{{queryRecord.data.items[i].shipment === undefined || queryRecord.data.items[i].shipment === null || queryRecord.data.items[i].shipment.file_url === queryRecord.data.items[i].order_item.single_page_label}}"
        marginType="normal"
        value="**Tracking Code:** {{ queryRecord.data.items[0].shipment.tracking_code || 'none' }}"
        verticalAlign="center"
      />
      <Include src="./container10.rsx" />
      <Text
        id="timedListingEventLabel"
        value="#### Related Timed Listing Event (Order created at: {{ queryRecord.data.created_at }})"
        verticalAlign="center"
      />
      <Text
        id="relatedTimedListingEventSubText"
        value={
          '> **NOTE:** If there are no timed listing events (e.g. Flash Sales).that show up on this table. This means that the order was placed outside of the timed listing event window. To check for flash close to the end page look at the <a href="/apps/Listings/Show?id={{listingParentId.value}}" target="_blank">parent listing page</a> and the timed listing event tab.'
        }
        verticalAlign="center"
      />
      <Table
        id="timedListingEventTable"
        cellSelection="none"
        clearChangesetOnSave={true}
        data="{{ queryTimedListingEvents.data }}"
        defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
        emptyMessage="No rows found"
        enableSaveActions={true}
        primaryKeyColumnId="c94cc"
        rowHeight="small"
        showBorder={true}
        showFooter={true}
        showHeader={true}
        toolbarPosition="bottom"
      >
        <Column
          id="c94cc"
          alignment="left"
          format="string"
          groupAggregationMode="none"
          key="id"
          label="ID"
          placeholder="Enter value"
          position="center"
          size={286}
          summaryAggregationMode="none"
        />
        <Column
          id="a3c7a"
          alignment="left"
          editableOptions={{ showStepper: true }}
          format="html"
          formatOptions={{ showSeparators: false, notation: "standard" }}
          groupAggregationMode="sum"
          key="listing_id"
          label="Parent Listing ID"
          placeholder="Enter value"
          position="center"
          size={130}
          summaryAggregationMode="none"
          valueOverride={
            '<a href="/apps/Listings/Show?id={{ item }}" target="_blank">{{ item }}</a>'
          }
        />
        <Column
          id="5de91"
          alignment="left"
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          key="type"
          label="Type"
          placeholder="Select option"
          position="center"
          size={129}
          summaryAggregationMode="none"
        />
        <Column
          id="dfc2e"
          alignment="left"
          format="datetime"
          formatOptions={{ timeFormat: "hh:mm:ss.SSS" }}
          groupAggregationMode="none"
          key="starts_at"
          label="Starts at"
          placeholder="Enter value"
          position="center"
          size={185}
          summaryAggregationMode="none"
        />
        <Column
          id="3b85c"
          alignment="left"
          format="datetime"
          formatOptions={{ timeFormat: "hh:mm:ss.SSS" }}
          groupAggregationMode="none"
          key="ends_at"
          label="Ends at"
          placeholder="Enter value"
          position="center"
          size={206}
          summaryAggregationMode="none"
        />
        <Column
          id="32961"
          alignment="left"
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          key="status"
          label="Status"
          placeholder="Select option"
          position="center"
          size={100}
          summaryAggregationMode="none"
        />
        <Column
          id="8bcd9"
          alignment="left"
          format="html"
          groupAggregationMode="none"
          key="listing_snapshot"
          label="Livestream ID"
          placeholder="Enter value"
          position="center"
          referenceId="livestreamId"
          size={297}
          summaryAggregationMode="none"
          valueOverride={
            '<a href="/apps/e835fc56-c7d4-11eb-a81a-838cdaaefd45/Livestreams/Show/main_page#id={{item.livestream_id}}&seekTo=" target="_blank">{{item.livestream_id}}</a>'
          }
        />
        <Column
          id="9ac10"
          alignment="left"
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          key="listing_snapshot"
          label="Original Starting Price Currency"
          placeholder="Select option"
          position="center"
          referenceId="original_starting_price_currency"
          size={207}
          summaryAggregationMode="none"
          valueOverride="{{ item.original_starting_price.currency }}"
        />
        <Column
          id="6268a"
          alignment="left"
          editableOptions={{ showStepper: true }}
          format="string"
          formatOptions={{ showSeparators: true, notation: "standard" }}
          groupAggregationMode="sum"
          key="listing_snapshot"
          label="Original Starting Price Subunits"
          placeholder="Enter value"
          position="center"
          referenceId="original_starting_price_subunits"
          size={245}
          summaryAggregationMode="none"
          valueOverride="{{ item.original_starting_price.sub_units }}"
        />
        <Column
          id="e9efa"
          alignment="left"
          format="string"
          groupAggregationMode="none"
          key="listing_snapshot"
          label="Starting Quantity"
          placeholder="Enter value"
          position="center"
          referenceId="starting_quantity"
          size={124}
          summaryAggregationMode="none"
          valueOverride="{{ item.starting_quantity }}"
        />
        <Column
          id="6df30"
          alignment="left"
          format="string"
          groupAggregationMode="none"
          key="listing_snapshot"
          label="Ending Quantity"
          placeholder="Enter value"
          position="center"
          referenceId="ending_quantity"
          size={100}
          summaryAggregationMode="none"
          valueOverride="{{ item.ending_quantity }}"
        />
        <Column
          id="e8abd"
          alignment="left"
          format="boolean"
          groupAggregationMode="none"
          key="settings"
          label="Is Available for Full Price?"
          placeholder="Enter value"
          position="center"
          referenceId="is_available_for_full_price"
          size={175}
          summaryAggregationMode="none"
          valueOverride="{{ item.is_available_for_full_price }}"
        />
        <Column
          id="43345"
          alignment="left"
          format="string"
          groupAggregationMode="none"
          key="settings"
          label="Duration (Seconds)"
          placeholder="Enter value"
          position="center"
          referenceId="duration_in_seconds"
          size={131}
          summaryAggregationMode="none"
          valueOverride="{{ item.duration_seconds }}"
        />
        <Column
          id="0cec4"
          alignment="left"
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          key="settings"
          label="Discount Type"
          placeholder="Select option"
          position="center"
          referenceId="discount_type"
          size={131}
          summaryAggregationMode="none"
          valueOverride="{{ _.upperCase(item.discount.type) }}"
        />
        <Column
          id="fe1e0"
          alignment="left"
          format="string"
          groupAggregationMode="none"
          key="settings"
          label="Discount Amount"
          placeholder="Enter value"
          position="center"
          referenceId="discount_amount"
          size={126}
          summaryAggregationMode="none"
          valueOverride="{{ item.discount.amount }}"
        />
        <Column
          id="0e9fd"
          alignment="left"
          format="datetime"
          formatOptions={{ timeFormat: "hh:mm:ss.SSS" }}
          groupAggregationMode="none"
          key="created_at"
          label="Created at"
          placeholder="Enter value"
          position="center"
          size={189}
          summaryAggregationMode="none"
        />
        <Column
          id="f7e44"
          alignment="left"
          format="datetime"
          formatOptions={{ timeFormat: "hh:mm:ss.SSS" }}
          groupAggregationMode="none"
          key="updated_at"
          label="Updated at"
          placeholder="Enter value"
          position="center"
          size={182}
          summaryAggregationMode="none"
        />
        <Column
          id="9419c"
          alignment="left"
          format="datetime"
          formatOptions={{ timeFormat: "hh:mm:ss.SSS" }}
          groupAggregationMode="none"
          key="deleted_at"
          label="Deleted at"
          placeholder="Enter value"
          position="center"
          size={188}
          summaryAggregationMode="none"
        />
        <Column
          id="a2d81"
          alignment="left"
          format="json"
          groupAggregationMode="none"
          hidden="true"
          key="settings"
          label="Settings"
          placeholder="Enter value"
          position="center"
          size={100}
          summaryAggregationMode="none"
        />
        <Column
          id="78203"
          alignment="left"
          format="json"
          groupAggregationMode="none"
          hidden="true"
          key="listing_snapshot"
          label="Listing snapshot"
          placeholder="Enter value"
          position="center"
          size={145}
          summaryAggregationMode="none"
          valueOverride="{{ item }}"
        />
        <ToolbarButton
          id="1a"
          icon="bold/interface-text-formatting-filter-2"
          label="Filter"
          type="filter"
        />
        <ToolbarButton
          id="3c"
          icon="bold/interface-download-button-2"
          label="Download"
          type="custom"
        >
          <Event
            event="clickToolbar"
            method="exportData"
            pluginId="timedListingEventTable"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToolbarButton>
        <ToolbarButton
          id="4d"
          icon="bold/interface-arrows-round-left"
          label="Refresh"
          type="custom"
        >
          <Event
            event="clickToolbar"
            method="refresh"
            pluginId="timedListingEventTable"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToolbarButton>
      </Table>
    </ListView>
  </Frame>
</Screen>
