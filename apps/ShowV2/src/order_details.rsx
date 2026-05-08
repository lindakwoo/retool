<Screen
  id="order_details"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="cff1a48c-b0cc-4e91-b438-0855a4085114"
>
  <SqlQueryUnified
    id="querySellerOrderCancellationReason_OrderDetailsPage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/querySellerOrderCancellationReason_OrderDetailsPage.sql",
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
    id="queryIsGlobalCoupon_OrderDetailsPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryIsGlobalCoupon_OrderDetailsPage.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Function
    id="orderTransformer_OrderDetailsPage"
    funcBody={include("../lib/orderTransformer_OrderDetailsPage.js", "string")}
    runBehavior="debounced"
  />
  <RESTQuery
    id="buyerManualTags"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="users/{{queryRecord.data.user.id}}/ts_tag_actions/"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="buyerAutomatedTags"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/buyerAutomatedTags.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="computeSeekTo"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/computeSeekTo.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryAvalaraFeesURL"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryAvalaraFeesURL.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    resourceTypeOverride=""
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return formatDataAsArray(data)[0].avatax_url"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryBuyerTSStanding"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("../lib/queryBuyerTSStanding.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    transformer={
      'res = {"Banned": false, "Suspended": false, "Shadowbanned":false}\nif (data != null && "ACTION" in data) {\n  actions = data["ACTION"]\n  for (let i = 0; i < actions.length; i++) {\n    if (actions[i] == "BAN") {\n      res["Banned"] = true;\n    };\n    if (actions[i] == "SUSPEND" || actions[i] == "SUSPEND_2D_KEEP_EARLY_PAYOUT") {\n      res["Suspended"] = true;\n    };\n    if (actions[i] == "SHADOWBAN") {\n      res["Shadowbanned"] = true;\n    };\n  }; \n};\n\nreturn res'
    }
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryCancelOffer"
    body={
      '[{"key":"action","value":"cancel_offer"},{"key":"author_email","value":"{{current_user.email}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="order_items/{{queryRecord.data.items[0].id}}/actions"
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
  <RESTQuery
    id="queryLivestream"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    playgroundQuerySaveId={0}
    query="livestreams/{{orderLivestreamId.value}}"
    queryDisabled="{{ !orderLivestreamId || orderLivestreamId.value === null }}"
    queryFailureConditions={
      '[{"condition":"{{ metadata.status === 404 }}","message":"Not Found"},{"condition":"{{ metadata.status !== 404 && metadata.status !== 200 }}","message":"Something wrong happened. Server code {{ metadata.status }}"},{"condition":"","message":""}]'
    }
    queryTimeout="10001"
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="computeSeekTo"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <SqlQueryUnified
    id="querySellerTSStanding"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("../lib/querySellerTSStanding.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    transformer={
      'res = {"Banned": false, "Suspended": false, "Shadowbanned":false}\nif (data != null && "ACTION" in data) {\n  actions = data["ACTION"]\n  for (let i = 0; i < actions.length; i++) {\n    if (actions[i] == "BAN") {\n      res["Banned"] = true;\n    };\n    if (actions[i] == "SUSPEND" || actions[i] == "SUSPEND_2D_KEEP_EARLY_PAYOUT") {\n      res["Suspended"] = true;\n    };\n    if (actions[i] == "SHADOWBAN") {\n      res["Shadowbanned"] = true;\n    };\n  }; \n};\n\nreturn res'
    }
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="sellerAutomatedTags"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("../lib/sellerAutomatedTags.sql", "string")}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
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
    id="sellerManualTags"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="users/{{ orderSeller.value.id}}/ts_tag_actions/"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="tempQueryAvalaraURL"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/tempQueryAvalaraURL.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    resourceTypeOverride=""
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return formatDataAsArray(data)[0].avatax_url"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./container2.rsx" />
  </Frame>
</Screen>
