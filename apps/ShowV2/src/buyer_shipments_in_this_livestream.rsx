<Screen
  id="buyer_shipments_in_this_livestream"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="d2ce9152-502e-4c75-ae68-64eedcd9fb03"
>
  <RESTQuery
    id="queryLivestreamShippingSettings"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query="seller-livestream-shipping-settings/{{queryRecord.data.channel_reference}}"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      enabled="{{queryLivestreamShippingSettings.data !== null}}"
      event="success"
      method="setValue"
      params={{
        ordered: [{ value: "{{queryLivestreamShippingSettings.data[0]}}" }],
      }}
      pluginId="livestreamShippingSettings"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="livestreamShippingSettings"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <Frame
    id="$main6"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./shipmentsInLivestreamContainer.rsx" />
    <Text
      id="text134"
      hidden={'{{queryRecord.data.sales_channel != "standard"}}'}
      style={{ map: { color: "info" } }}
      value="### No Livestream Related to this Order"
      verticalAlign="center"
    />
  </Frame>
</Screen>
