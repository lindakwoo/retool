<Screen
  id="manageRegistryUrls"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="3f40baf7-2237-4e15-9a68-9d616cdaad51"
>
  <RESTQuery
    id="GetRegistryUrls"
    body={
      '{\n  "urls": [\n    {\n      "country_code": {{countriesList.value}}\n    }\n  ]\n}'
    }
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/read-registry-url-record"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'var resp = GetRegistryUrls.data;\n\nif (resp.statusCode === 200) {\n  const temp = resp.body.map(item => ({\n    ...item,\n    state_name: (JSON.parse(item.state_name || "[]") || []).filter(Boolean),\n    state_code: (JSON.parse(item.state_code || "[]") || []).filter(Boolean)\n  }));\n  RegistryUrlsByCountry.setValue(temp);\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="RegistryUrlsByCountry"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="UpdateRegistryUrl"
    body={'[{"key":"urls","value":"{{ UpdateRegistryUrlPutReq.value }}"}]'}
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-registry-url-record"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'GetRegistryUrls.trigger();\nif (UpdateRegistryUrl.data.statusCode === 200){\n  if (UpdateRegistryUrl.data.body[0].statusCode === 200 ) {\n    editRegistryUrlForm.clear();\n  editRegistryUrlForm.setHidden(true);\n  }\n\n    utils.showNotification({\n  title : UpdateRegistryUrl.data.body[0].statusCode === 200 ? "Success" : "Error",\n  description: UpdateRegistryUrl.data.body[0].text,\n  notificationType: UpdateRegistryUrl.data.body[0].statusCode === 200 ? "success" : "error",\n  duration: 3,\n});\n} else {\n  utils.showNotification({\n  title : "Error",\n  description: UpdateRegistryUrl.data.body,\n  notificationType: "error",\n  duration: 3,\n});\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="HandleUpdateRegistryUrl"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleUpdateRegistryUrl.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="UpdateRegistryUrlPutReq"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="ResetRegistryUrlModal"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetRegistryUrlModal.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleDeleteRegistryUrl"
    confirmationMessage="Are you sure you want to Delete this Registry URL?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleDeleteRegistryUrl.js", "string")}
    requireConfirmation={true}
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
    id="CreateRegistryUrl"
    body={'{\n  "urls": {{ CreateRegistryURLPutReq.value }}\n}'}
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/create-registry-url-record"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'console.log(CreateRegistryUrl.data.statusCode);\nif(CreateRegistryUrl.data.statusCode === 200) {\n  console.log(CreateRegistryUrl.data.statusCode);\n  if (CreateRegistryUrl.data.body[0].statusCode === 200 ) {\n    createRegistryUrlForm.clear();\ncreateRegistryUrlForm.setHidden(true);\n  }\n\n  utils.showNotification({\n  title : CreateRegistryUrl.data.body[0].statusCode === 200 ? "Success" : "Error",\n  description: CreateRegistryUrl.data.body[0].text,\n  notificationType: CreateRegistryUrl.data.body[0].statusCode === 200 ? "success": "error",\n  duration: 3,\n});\n  GetRegistryUrls.trigger();\n} else {\n  utils.showNotification({\n  title : "Error",\n  description: CreateRegistryUrl.data.body[0].text,\n  notificationType: "error",\n  duration: 3,\n})\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="HandleCreateRegistryUrl"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCreateRegistryUrl.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="CreateRegistryURLPutReq"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <Include src="./header4.rsx" />
  <Frame
    id="$main12"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Form
      id="registryUrlForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle55" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="countriesList"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          emptyMessage="No options"
          label="Select a Country"
          labelPosition="top"
          labels="{{item.labels.en}}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showClear={true}
          showSelectionIndicator={true}
          values="{{ item.a2 }}"
        />
        <Button
          id="button26"
          disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}
"
          text="Create"
        >
          <Event
            event="click"
            method="setHidden"
            params={{ ordered: [{ hidden: false }] }}
            pluginId="createRegistryUrlForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "createRegistryUrlForm.clear();\n\ncreateRegistryUrlForm.data.status = 'Active';\ncreateRegistryUrlForm.data.email = current_user.email;",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="scrollIntoView"
            params={{
              ordered: [
                {
                  options: {
                    ordered: [{ block: "end" }, { behavior: "auto" }],
                  },
                },
              ],
            }}
            pluginId="createRegistryUrlForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="searchRegistryUrls"
          disabled="{{!countriesList2.value}}"
          loading=""
          submitTargetId=""
          text="Search"
        >
          <Event
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="GetRegistryUrls"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="show"
            params={{ ordered: [] }}
            pluginId="loadingPopUp"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Table
          id="urlsList"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ RegistryUrlsByCountry.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="37005"
          rowHeight="large"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="37005"
            alignment="left"
            editable="false"
            format="string"
            formatOptions={{ notation: "standard" }}
            groupAggregationMode="countDistinct"
            hidden="true"
            key="Id"
            label="ID"
            placeholder="Enter value"
            position="center"
            referenceId="Id"
            size={45}
            valueOverride="{{currentSourceRow.Id}}"
          />
          <Column
            id="f0a2a"
            alignment="left"
            cellTooltipMode="overflow"
            format="avatar"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="user_id"
            label="User"
            placeholder="No user"
            position="center"
            size={145}
          />
          <Column
            id="72377"
            alignment="left"
            caption="{{ currentSourceRow.email }}"
            cellTooltip="{{ item }}"
            format="tag"
            formatOptions={{
              automaticColors: true,
              icon: "bold/travel-map-flag",
            }}
            groupAggregationMode="none"
            key="country_code"
            label="Country"
            placeholder="Select option"
            position="center"
            size={219}
            summaryAggregationMode="none"
            textColor="{{ currentSourceRow.country_code}} - {{ currentSourceRow.country }}"
            valueOverride="{{ currentSourceRow.country_code}} - {{ currentSourceRow.country }}"
          />
          <Column
            id="5ddb0"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ showStepper: true }}
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="sum"
            key="state_name"
            label="State name"
            placeholder="Select options"
            position="center"
            referenceId="state_name"
            size={150}
            summaryAggregationMode="none"
          />
          <Column
            id="ab2eb"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="ip"
            label="IP"
            placeholder="Enter value"
            position="center"
            referenceId="ip"
            size={75}
          />
          <Column
            id="fbacb"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="official"
            label="Official"
            placeholder="Select option"
            position="center"
            size={79}
          />
          <Column
            id="22185"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="english_version"
            label="English version"
            placeholder="Enter value"
            position="center"
            size={122}
          />
          <Column
            id="878db"
            alignment="left"
            cellTooltipMode="overflow"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="registry_identifier"
            label="Registry identifier"
            placeholder="Enter value"
            position="center"
            size={126}
          />
          <Column
            id="a620e"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="orbis_identifier"
            label="Orbis identifier"
            placeholder="Enter value"
            position="center"
            size={105}
          />
          <Column
            id="acaee"
            alignment="left"
            cellTooltipMode="overflow"
            editable="{{(CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('create')) ? true : false}}"
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            groupAggregationMode="none"
            key="registry_url"
            label="Registry URL"
            position="center"
            referenceId="registry_url"
            size={160}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.registry_url.trim()}}"
          />
          <Column
            id="40a66"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="create_timestamp"
            label="Create timestamp"
            placeholder="Enter value"
            position="center"
            size={160}
          />
          <Column
            id="59c62"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="update_timestamp"
            label="Update timestamp"
            placeholder="Enter value"
            position="center"
            referenceId="update_timestamp"
            size={140}
          />
          <Action
            id="8f872"
            disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
            icon="bold/interface-edit-pencil"
            label="Edit"
          >
            <Event
              event="clickAction"
              method="setHidden"
              params={{ ordered: [{ hidden: false }] }}
              pluginId="editRegistryUrlForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="38d9f"
            disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
            icon="bold/interface-delete-bin-2"
            label="Delete"
          >
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="HandleDeleteRegistryUrl"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
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
              pluginId="urlsList"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="save"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="HandleUpdateRegistryUrl"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </Body>
    </Form>
    <Form
      id="createRegistryUrlForm"
      disableSubmit=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData=""
      padding="12px"
      requireValidation={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle56"
          value="#### Create Registry URL"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="countryListCreate"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          emptyMessage="No options"
          formDataKey="country_code"
          label="Country"
          labelPosition="top"
          labels="{{item.a2}} - {{item.labels.en}}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showClear={true}
          showSelectionIndicator={true}
          values="{{ item.a2 }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (countryListCreate.value === null || \n(countryListCreate.value !== 'US' && countryListCreate.value !== 'CA') ){\n  statesListCreate.clearValue();\n}\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Multiselect
          id="statesListCreate"
          disabled="{{  countryListCreate.value === null || 
(countryListCreate.value !== 'US' && countryListCreate.value !== 'CA') }}
"
          emptyMessage="No options"
          itemMode="static"
          label="States"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required="{{ countryListCreate.value==='US' || countryListCreate.value==='CA'}}"
          showClear={true}
          showSelectionIndicator={true}
          wrapTags={true}
        >
          <Option
            id="63af5"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Alabama"
            value="AL-Alabama"
          />
          <Option
            id="03eec"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Alaska"
            value="AK-Alaska"
          />
          <Option
            id="decb7"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Arizona"
            value="AZ-Arizona"
          />
          <Option
            id="ac250"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Arkansas"
            value="AR-Arkansas"
          />
          <Option
            id="0b1db"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="California"
            value="CA-California"
          />
          <Option
            id="688bb"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Colorado"
            value="CO-Colorado"
          />
          <Option
            id="a10e4"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Connecticut"
            value="CT-Connecticut"
          />
          <Option
            id="f727e"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Delaware"
            value="DE-Delaware"
          />
          <Option
            id="d161c"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Florida"
            value="FL-Florida"
          />
          <Option
            id="c3814"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Georgia"
            value="GA-Georgia"
          />
          <Option
            id="160af"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Hawaii"
            value="HI-Hawaii"
          />
          <Option
            id="d3d85"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Idaho"
            value="ID-Idaho"
          />
          <Option
            id="f6004"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Illinois"
            value="IL-Illinois"
          />
          <Option
            id="3ae42"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Indiana"
            value="IN-Indiana"
          />
          <Option
            id="c4d19"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Iowa"
            value="IA-Iowa"
          />
          <Option
            id="954b5"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Kansas"
            value="KS-Kansas"
          />
          <Option
            id="0be44"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Kentucky"
            value="KY-Kentucky"
          />
          <Option
            id="9ba68"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Louisiana"
            value="LA-Louisiana"
          />
          <Option
            id="9b1dc"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Maine"
            value="ME-Maine"
          />
          <Option
            id="afffd"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Maryland"
            value="MD-Maryland"
          />
          <Option
            id="65c15"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Massachusetts"
            value="MA-Massachusetts"
          />
          <Option
            id="d7aab"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Michigan"
            value="MI-Michigan"
          />
          <Option
            id="37830"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Minnesota"
            value="MN-Minnesota"
          />
          <Option
            id="61020"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Mississippi"
            value="MS-Mississippi"
          />
          <Option
            id="94636"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Missouri"
            value="MO-Missouri"
          />
          <Option
            id="b4c69"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Montana"
            value="MT-Montana"
          />
          <Option
            id="17ba5"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Nebraska"
            value="NE-Nebraska"
          />
          <Option
            id="9e0c1"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Nevada"
            value="NV-Nevada"
          />
          <Option
            id="f6871"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="New Hampshire"
            value="NH-New Hampshire"
          />
          <Option
            id="ca68e"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="New Jersey"
            value="NJ-New Jersey"
          />
          <Option
            id="7b8f3"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="New Mexico"
            value="NM-New Mexico"
          />
          <Option
            id="408c3"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="New York"
            value="NY-New York"
          />
          <Option
            id="24b0a"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="North Carolina"
            value="NC-North Carolina"
          />
          <Option
            id="065dd"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="North Dakota"
            value="ND-North Dakota"
          />
          <Option
            id="431db"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Ohio"
            value="OH-Ohio"
          />
          <Option
            id="e6100"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Oklahoma"
            value="OK-Oklahoma"
          />
          <Option
            id="4b020"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Oregon"
            value="OR-Oregon"
          />
          <Option
            id="efdb9"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Pennsylvania"
            value="PA-Pennsylvania"
          />
          <Option
            id="52212"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Rhode Island"
            value="RI-Rhode Island"
          />
          <Option
            id="104bd"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="South Carolina"
            value="SC-South Carolina"
          />
          <Option
            id="88075"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="South Dakota"
            value="SD-South Dakota"
          />
          <Option
            id="d46c3"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Tennessee"
            value="TN-Tennessee"
          />
          <Option
            id="728a6"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Texas"
            value="TX-Texas"
          />
          <Option
            id="471de"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Utah"
            value="UT-Utah"
          />
          <Option
            id="7acc9"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Vermont"
            value="VT-Vermont"
          />
          <Option
            id="a0227"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Virginia"
            value="VA-Virginia"
          />
          <Option
            id="5ea86"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Washington"
            value="WA-Washington"
          />
          <Option
            id="82ea7"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="West Virginia"
            value="WV-West Virginia"
          />
          <Option
            id="fbff3"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Wisconsin"
            value="WI-Wisconsin"
          />
          <Option
            id="ff70a"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Wyoming"
            value="WY-Wyoming"
          />
          <Option
            id="aa192"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="District of Columbia"
            value="DC-District of Columbia"
          />
          <Option
            id="41cea"
            disabled={false}
            hidden="{{ countryListCreate.value==='CA'}}"
            label="Puerto Rico"
            value="PR-Puerto Rico"
          />
          <Option
            id="9db6b"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Alberta"
            value="AB-Alberta"
          />
          <Option
            id="b7e71"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="British Columbia"
            value="BC-British Columbia"
          />
          <Option
            id="d4e73"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Manitoba"
            value="MB-Manitoba"
          />
          <Option
            id="b76c8"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="New Brunswick"
            value="NB-New Brunswick"
          />
          <Option
            id="5712a"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Newfoundland and Labrador"
            value="NL-Newfoundland and Labrador"
          />
          <Option
            id="2f143"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Northwest Territories"
            value="NT-Northwest Territories"
          />
          <Option
            id="4d52a"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Nova Scotia"
            value="NS-Nova Scotia"
          />
          <Option
            id="aaebf"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Nunavut"
            value="NU-Nunavut"
          />
          <Option
            id="39580"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Ontario"
            value="ON-Ontario"
          />
          <Option
            id="a3937"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Prince Edward Island"
            value="PE-Prince Edward Island"
          />
          <Option
            id="9c3a5"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Quebec"
            value="QC-Quebec"
          />
          <Option
            id="3b166"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Saskatchewan"
            value="SK-Saskatchewan"
          />
          <Option
            id="b1e37"
            disabled={false}
            hidden="{{ countryListCreate.value==='US'}}"
            label="Yukon"
            value="YT-Yukon"
          />
        </Multiselect>
        <TextInput
          id="ipTextInput"
          formDataKey="ip"
          label="IP"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
        <Select
          id="official"
          emptyMessage="No options"
          formDataKey="official"
          itemMode="static"
          label="Official"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="dae76" value="Yes" />
          <Option id="daa21" value="No" />
          <Option id="c1a47" value="N/A" />
        </Select>
        <Select
          id="englishVersion"
          emptyMessage="No options"
          formDataKey="english_version"
          itemMode="static"
          label="English version"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="dae76" value="Yes" />
          <Option id="c1a47" value="No" />
          <Option id="daa21" value="N/A" />
        </Select>
        <Select
          id="registryIdentifier"
          allowCustomValue={true}
          data="{{IdentifiersList.value.filter((obj)=> {
  return obj.isoCode === countryListCreate.value
})}}"
          emptyMessage="No options"
          formDataKey="registry_identifier"
          label="Registry identifier"
          labelPosition="top"
          labels="{{item.labels.en}}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          values="{{item.labels.en}}"
        />
        <Select
          id="orbisIdentifier"
          emptyMessage="No options"
          formDataKey="orbis_identifier"
          itemMode="static"
          label="Orbis identifier"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="dae76" value="Yes" />
          <Option id="c1a47" value="No" />
          <Option id="daa21" value="N/A" />
        </Select>
        <TextInput
          id="registryURL"
          autoCapitalize="words"
          formDataKey="registry_url"
          label="Registry URL"
          labelPosition="top"
          patternType="url"
          placeholder="Enter URL"
          required={true}
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = registryURL.value.toLocaleLowerCase();\n\nregistryURL.setValue(temp);",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="status"
          formDataKey="status"
          hidden="true"
          label="Status"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          value="Active"
        />
        <TextInput
          id="userEmail"
          formDataKey="email"
          hidden="true"
          label="User Email"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          value="{{current_user.email}}"
        />
      </Body>
      <Footer>
        <Button
          id="cancelRegistryUrl"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "createRegistryUrlForm.clear();\ncreateRegistryUrlForm.setHidden(true);",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="formButton45"
          submit={true}
          submitTargetId="createRegistryUrlForm"
          text="Create URL"
        />
      </Footer>
      <Event
        event="submit"
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
        pluginId="HandleCreateRegistryUrl"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Form
      id="editRegistryUrlForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData="{{ urlsList.selectedRow }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle57"
          value="#### Edit Registry URL"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="editRegistryUserName"
          disabled="true"
          formDataKey="user_id"
          label="User"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.user_id}}"
        />
        <TextInput
          id="editRegistryCountry"
          disabled="true"
          formDataKey="country_code"
          label="Country"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.country_code}}"
        />
        <Multiselect
          id="editRegistrysSatesList"
          disabled="{{ editRegistryCountry.value.substring(0, 2) !== 'CA' && editRegistryCountry.value.substring(0, 2) !== 'US' }}"
          emptyMessage="No options"
          itemMode="static"
          label="States"
          labelPosition="top"
          overlayMaxHeight={375}
          showSelectionIndicator={true}
          value="{{ urlsList.selectedRow?.state_name || '[]' }}
"
          wrapTags={true}
        >
          <Option
            id="63af5"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Alabama"
            value={'"Alabama"'}
          />
          <Option
            id="03eec"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Alaska"
            value={'"Alaska"'}
          />
          <Option
            id="decb7"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Arizona"
            value={'"Arizona"'}
          />
          <Option
            id="ac250"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Arkansas"
            value={'"Arkansas"'}
          />
          <Option
            id="0b1db"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="California"
            value={'"California"'}
          />
          <Option
            id="688bb"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Colorado"
            value={'"Colorado"'}
          />
          <Option
            id="a10e4"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Connecticut"
            value={'"Connecticut"'}
          />
          <Option
            id="f727e"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Delaware"
            value={'"Delaware"'}
          />
          <Option
            id="d161c"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Florida"
            value={'"Florida"'}
          />
          <Option
            id="c3814"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Georgia"
            value={'"Georgia"'}
          />
          <Option
            id="160af"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Hawaii"
            value={'"Hawaii"'}
          />
          <Option
            id="d3d85"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Idaho"
            value={'"Idaho"'}
          />
          <Option
            id="f6004"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Illinois"
            value={'"Illinois"'}
          />
          <Option
            id="3ae42"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Indiana"
            value={'"Indiana"'}
          />
          <Option
            id="c4d19"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Iowa"
            value={'"Iowa"'}
          />
          <Option
            id="954b5"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Kansas"
            value={'"Kansas"'}
          />
          <Option
            id="0be44"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Kentucky"
            value={'"Kentucky"'}
          />
          <Option
            id="9ba68"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Louisiana"
            value={'"Louisiana"'}
          />
          <Option
            id="9b1dc"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Maine"
            value={'"Maine"'}
          />
          <Option
            id="afffd"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Maryland"
            value={'"Maryland"'}
          />
          <Option
            id="65c15"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Massachusetts"
            value={'"Massachusetts"'}
          />
          <Option
            id="d7aab"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Michigan"
            value={'"Michigan"'}
          />
          <Option
            id="37830"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Minnesota"
            value={'"Minnesota"'}
          />
          <Option
            id="61020"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Mississippi"
            value={'"Mississippi"'}
          />
          <Option
            id="94636"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Missouri"
            value={'"Missouri"'}
          />
          <Option
            id="b4c69"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Montana"
            value={'"Montana"'}
          />
          <Option
            id="17ba5"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Nebraska"
            value={'"Nebraska"'}
          />
          <Option
            id="9e0c1"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Nevada"
            value={'"Nevada"'}
          />
          <Option
            id="f6871"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="New Hampshire"
            value={'"New Hampshire"'}
          />
          <Option
            id="ca68e"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="New Jersey"
            value={'"New Jersey"'}
          />
          <Option
            id="7b8f3"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="New Mexico"
            value={'"New Mexico"'}
          />
          <Option
            id="408c3"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="New York"
            value={'"New York"'}
          />
          <Option
            id="24b0a"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="North Carolina"
            value={'"North Carolina"'}
          />
          <Option
            id="065dd"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="North Dakota"
            value={'"North Dakota"'}
          />
          <Option
            id="431db"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Ohio"
            value={'"Ohio"'}
          />
          <Option
            id="e6100"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Oklahoma"
            value={'"Oklahoma"'}
          />
          <Option
            id="4b020"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Oregon"
            value={'"Oregon"'}
          />
          <Option
            id="efdb9"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Pennsylvania"
            value={'"Pennsylvania"'}
          />
          <Option
            id="52212"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Rhode Island"
            value={'"Rhode Island"'}
          />
          <Option
            id="104bd"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="South Carolina"
            value={'"South Carolina"'}
          />
          <Option
            id="88075"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="South Dakota"
            value={'"South Dakota"'}
          />
          <Option
            id="d46c3"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Tennessee"
            value={'"Tennessee"'}
          />
          <Option
            id="728a6"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Texas"
            value={'"Texas"'}
          />
          <Option
            id="471de"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Utah"
            value={'"Utah"'}
          />
          <Option
            id="7acc9"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Vermont"
            value={'"Vermont"'}
          />
          <Option
            id="a0227"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Virginia"
            value={'"Virginia"'}
          />
          <Option
            id="5ea86"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Washington"
            value={'"Washington"'}
          />
          <Option
            id="82ea7"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="West Virginia"
            value={'"West Virginia"'}
          />
          <Option
            id="fbff3"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Wisconsin"
            value={'"Wisconsin"'}
          />
          <Option
            id="a1630"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Wyoming"
            value={'"Wyoming"'}
          />
          <Option
            id="d8aec"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="District of Columbia"
            value={'"District of Columbia"'}
          />
          <Option
            id="ff70a"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'CA' }}
"
            label="Puerto Rico"
            value={'"Puerto Rico"'}
          />
          <Option
            id="9db6b"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Alberta"
            value={'"Alberta"'}
          />
          <Option
            id="b7e71"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="British Columbia"
            value={'"British Columbia"'}
          />
          <Option
            id="d4e73"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Manitoba"
            value={'"Manitoba"'}
          />
          <Option
            id="b76c8"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="New Brunswick"
            value={'"New Brunswick"'}
          />
          <Option
            id="5712a"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Newfoundland and Labrador"
            value={'"Newfoundland and Labrador"'}
          />
          <Option
            id="2f143"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Northwest Territories"
            value={'"Northwest Territories"'}
          />
          <Option
            id="4d52a"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Nova Scotia"
            value={'"Nova Scotia"'}
          />
          <Option
            id="aaebf"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Nunavut"
            value={'"Nunavut"'}
          />
          <Option
            id="39580"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Ontario"
            value={'"Ontario"'}
          />
          <Option
            id="a3937"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Prince Edward Island"
            value={'"Prince Edward Island"'}
          />
          <Option
            id="9c3a5"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Quebec"
            value={'"Quebec"'}
          />
          <Option
            id="3b166"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Saskatchewan"
            value={'"Saskatchewan"'}
          />
          <Option
            id="41cea"
            disabled={false}
            hidden="{{ editRegistryCountry.value.substring(0, 2) === 'US' }}"
            label="Yukon"
            value={'"Yukon"'}
          />
        </Multiselect>
        <TextInput
          id="editRegistryIp"
          disabled="true"
          formDataKey="ip"
          label="IP"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.ip}}"
        />
        <TextInput
          id="editRegistryOfficial"
          disabled="true"
          formDataKey="official"
          label="Official"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.official}}"
        />
        <TextInput
          id="editRegistryEngVersion"
          disabled="true"
          formDataKey="english_version"
          label="English version"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.english_version}}"
        />
        <TextInput
          id="editRegistryOrbisIdentifier"
          disabled="true"
          formDataKey="orbis_identifier"
          label="Orbis identifier"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          value="{{urlsList.selectedRow.orbis_identifier}}"
        />
        <TextInput
          id="editRegistryIdentifier"
          disabled="true"
          formDataKey="registry_identifier"
          label="Registry identifier"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.registry_identifier}}"
        />
        <TextInput
          id="editRegistryURL"
          formDataKey="registry_url"
          label="Registry URL"
          labelPosition="top"
          patternType="url"
          required={true}
          value="{{urlsList.selectedRow.registry_url}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = editRegistryURL.value.toLocaleLowerCase();\n\neditRegistryURL.setValue(temp);",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="editRegistryCreateTimeStamp"
          formDataKey="create_timestamp"
          hidden="true"
          label="Create timestamp"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.create_timestamp}}"
        />
        <TextInput
          id="editRegistryId"
          formDataKey="Id"
          hidden="true"
          label="ID"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.Id}}"
        />
        <TextInput
          id="editRegistryUpdateTimeStamp"
          formDataKey="update_timestamp"
          hidden="true"
          label="Update timestamp"
          labelPosition="top"
          placeholder="Enter value"
          value="{{urlsList.selectedRow.update_timestamp}}"
        />
      </Body>
      <Footer>
        <Button
          id="cancelEditRegistryUrl"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "editRegistryUrlForm.clear();\neditRegistryUrlForm.setHidden(true);\nurlsList.clearSelection()",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="editRegistrySave"
          submit={true}
          submitTargetId="editRegistryUrlForm"
          text="Save"
        />
      </Footer>
      <Event
        event="submit"
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
        pluginId="HandleUpdateRegistryUrl"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Frame>
</Screen>
