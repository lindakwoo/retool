<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="e5aa6b40-546a-4fca-871b-1c1fc305b102"
>
  <RESTQuery
    id="query1"
    body={
      '[{"key":"grantype","value":"grant type"},{"key":"client","value":"client id"},{"key":"secret","value":"secrit"}]'
    }
    bodyType="json"
    enableTransformer={true}
    query="?"
    resourceDisplayName="test"
    resourceName="4660d61f-fcda-4f60-ba5c-f469cbef2c6c"
    runWhenModelUpdates={false}
    transformer="return JSON.stringify(data.access_token)"
    type="POST"
  />
  <RetoolAIQuery
    id="query2"
    notificationDuration={4.5}
    resourceDisplayName="retool_ai"
    resourceName="retool_ai"
    showSuccessToaster={false}
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  />
</Screen>
