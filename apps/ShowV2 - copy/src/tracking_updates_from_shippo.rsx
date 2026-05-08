<Screen
  id="tracking_updates_from_shippo"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="e83f821b-a9c4-4dfb-b769-0466d165300f"
>
  <SqlQueryUnified
    id="queryShipmentTrackingUpdatesSnowflake"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include(
      "../lib/queryShipmentTrackingUpdatesSnowflake.sql",
      "string"
    )}
    resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Frame
    id="$main11"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./container8.rsx" />
  </Frame>
</Screen>
