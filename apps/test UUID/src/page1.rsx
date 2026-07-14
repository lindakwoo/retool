<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="ac060219-b3b3-4330-910d-68009d782cde"
>
  <RESTQuery
    id="query1"
    bodyType="json"
    notificationDuration={4.5}
    query="post"
    resourceDisplayName="test uuid mapping for httpbun"
    resourceName="b6d79dd3-7072-44b9-a1d3-bf22de6e2c24"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  />
  <SqlQueryUnified
    id="query2"
    notificationDuration={4.5}
    query={include("../lib/query2.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
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
