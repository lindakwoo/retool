<Screen
  id="kompanySearch"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="bcbde5d3-2f3c-4b82-8576-20abcf8909f9"
>
  <JavascriptQuery
    id="kompanyLiveSearchDataForRegistration"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/kompanyLiveSearchDataForRegistration.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="KompanyGlobalSearch"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/KompanyGlobalSearch.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetMasteringByBvDIDForKompany"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering??bvd_id={{SearchedValue.value.trim()}}"
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="failure"
      method="run"
      params={{ ordered: [{ src: "loadingPopUp.setHidden(true);\n" }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="GetMasteringByOrbisIdForKompany"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering?entity_id={{SearchedValue.value.trim()}}"
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="failure"
      method="run"
      params={{ ordered: [{ src: "loadingPopUp.setHidden(true);" }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Include src="./header8.rsx" />
  <Include src="./KompanySearchGlobalModal.rsx" />
  <Frame
    id="$main13"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <RadioGroup
      id="searchByRadio"
      groupLayout="wrap"
      heightType="fixed"
      itemMode="static"
      label="Search By"
      labelPosition="top"
      value="{{ self.values[0] }}"
    >
      <Option id="d08e4" label="Orbis Id" value="orbisId" />
      <Option id="9e4fb" label="BVDID" value="bvdId" />
      <Option id="a068e" hidden="true" label="Name" value="name" />
      <Option
        id="79c3d"
        disabled={false}
        hidden={false}
        label="Registration Number"
        value="registrationNumber"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="searchInput"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="kompanyCountry"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="searchInput"
      hidden="{{!searchByRadio.value}}"
      label="{{searchByRadio.data.find((obj) => obj.value === searchByRadio.value) ? searchByRadio.data.find((obj) => obj.value === searchByRadio.value).label: '' }}"
      labelPosition="top"
      placeholder="Enter {{searchByRadio.data.find((obj) => obj.value === searchByRadio.value).label}}"
      showClear={true}
    />
    <Select
      id="kompanyCountry"
      data="{{ CountriesList.value }}"
      emptyMessage="No options"
      hidden="{{searchByRadio.value !== 'registrationNumber'}}"
      label="Country"
      labelPosition="top"
      labels="{{ item.a2 }} - {{ item.labels.en }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      values="{{item.a2}}"
    >
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="kompanyState"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="kompanyState"
      data="{{ kompanyApiRecordData.value.filter((o)=> o.country_iso === 'US') }}"
      emptyMessage="No options"
      hidden="{{kompanyCountry.value !== 'US'}}"
      label="State"
      labelPosition="top"
      labels="{{ item.state_code }} - {{ item.state_name }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      values="{{ item.state_code }}"
    />
    <Button
      id="button27"
      disabled="{{(searchInput.value.trim() === '' )|| (searchByRadio.value === 'registrationNumber' && kompanyCountry.value === '') || ('registrationNumber' && kompanyCountry.value === 'US' && kompanyState.value === '')}}"
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="KompanyGlobalSearch"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "{}" }] }}
        pluginId="kompanyDataSetSearchResponse"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "{}" }] }}
        pluginId="kompanySearchPayload"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./KompanyDataContainer3.rsx" />
  </Frame>
</Screen>
