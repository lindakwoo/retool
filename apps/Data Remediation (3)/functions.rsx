<GlobalFunctions>
  <State
    id="selectedCompany"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="GetPremasteringbyORBISID"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering?entity_id={{SearchedEntity.value.trim()}}"
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
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: '\n\n\n  \nawait Datastored.setIn(["data",Datastored.value.i],GetPremasteringbyORBISID.data)\nDatastored.setIn(["i"] ,Datastored.value.i +1)\n\nif(!loaderHideFlag.value) {\n  loadingPopUp.hide();\n}',
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
      method="setValue"
      params={{
        ordered: [
          {
            value:
              '{{ GetPremasteringbyORBISID.data.filter(function(item) {\n  return (item.header.source !== "REMEDIATED")\n})}}',
          },
        ],
      }}
      pluginId="TableRecordPremastering"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setValue"
      params={{
        ordered: [
          {
            value:
              '{{ GetPremasteringbyORBISID.data.filter(function(item) {\n  return (item.header.source === "REMEDIATED")\n})}}',
          },
        ],
      }}
      pluginId="TableRecordRemediated"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="run"
      params={{
        ordered: [
          {
            src: 'utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\nloadingPopUp.hide();',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="GetPremasteringByBVDID"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering?bvd_id={{SearchedEntity.value.trim().toUpperCase()}}"
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
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'await Datastored.setIn(["data",Datastored.value.i],GetPremasteringByBVDID.data.modifiedData)\nDatastored.setIn(["i"] ,Datastored.value.i +1)\n\nif(!loaderHideFlag.value) {\n  loadingPopUp.hide();\n}\n\n',
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
      method="setValue"
      params={{
        ordered: [
          {
            value:
              '{{ GetPremasteringByBVDID.data.filter(function(item) {\n  return (item.header.source !== "REMEDIATED")\n})}}',
          },
        ],
      }}
      pluginId="TableRecordPremastering"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setValue"
      params={{
        ordered: [
          {
            value:
              '{{ GetPremasteringByBVDID.data.filter(function(item) {\n  return (item.header.source === "REMEDIATED")\n})}}',
          },
        ],
      }}
      pluginId="TableRecordRemediated"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="RunAllArray"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="run"
      params={{
        ordered: [
          {
            src: 'utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n\nloadingPopUp.hide();\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="TableRecordsMastering"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="TableRecordPremastering"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="RefreshPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering?entity_id={{selectedCompany.value.header.entityID}}"
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
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: ' \nawait Datastored.setIn(["data",Datastored.value.i],GetPremasteringbyORBISID.data)\nDatastored.setIn(["i"] ,Datastored.value.i +1)',
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
      method="setValue"
      params={{ ordered: [{ value: "{{ RefreshPage.data }}" }] }}
      pluginId="TableRecordPremastering"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getSourceCode"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-sources"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getSourceCode.data}}" }] }}
      pluginId="sourceCodes"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("sourceCode", getSourceCode.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getLegalForm"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-legal-forms-unified-standardized"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getLegalForm.data}}" }] }}
      pluginId="legalForms"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("getLegalForm", getLegalForm.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="sourceCodes"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="legalForms"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="getCountries"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-countries"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "\nvar curCountries = getCountries.data;\n  var temp = _.sortBy(curCountries, function(o) { return o.labels.en; });\n\nCountriesList.setValue(temp);\nconsole.log('CountriesList', CountriesList.value)\nlocalStorage.setValue(\"CountriesList\", temp);",
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="CountriesList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="getAddressTypes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-addresses-types"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getAddressTypes.data}}" }] }}
      pluginId="AddressTypesList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("AddressTypesList", getAddressTypes.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="AddressTypesList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="handleAddNewAddress"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="handleRemoveAddress"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="showNewAddressForm"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <RESTQuery
    id="getLanguages"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-languages"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getLanguages.data}}" }] }}
      pluginId="LanguagesList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("languageData", getLanguages.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="LanguagesList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="getIdentifiers"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-identifiers"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{
        ordered: [
          {
            value:
              '{{ getIdentifiers.data.filter(e => e.code !== "992") }}\n\n',
          },
        ],
      }}
      pluginId="IdentifiersList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("IdentifiersList", getIdentifiers.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="IdentifiersList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="CurrentUserObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="ClearFieldFlag"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <State
    id="CurrentFieldClicked"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value=""
  />
  <State
    id="kompanyInputState"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <JavascriptQuery
    id="kompanyEnableCheck"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/kompanyEnableCheck.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="kompanyApiRecord"
    body="{{kompanyInputState.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/kompany-api-record"
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
            src: 'var resp = kompanyApiRecord.data;\n\nif (resp.statusCode === 200) {\n  var results = resp.body.result;\n\n  // Check if the results array is not empty\n  if (results.length > 0) {\n    var temp = results;\n    //console.log("kompanyrecordapi data", temp);\n\n    // Set the value of the temporary state kompanyApiRecordData\n    kompanyApiRecordData.setValue(temp);\n    loadingPopUp.setHidden(true);\n\n    // Retrieve the kompany_api value\n    var kompanyApiValue = temp.kompany_api;\n\n    //  // Show success notification\n    //  utils.showNotification({\n    //    title: "Success",\n    //    description: `Data retrieved successfully`,\n    //    notificationType: "success",\n    //    duration: 2// Duration in seconds\n    //  });\n\n  } else {\n    console.log("kompanyrecordapi no results found.");\n       loadingPopUp.setHidden(true);\n    kompanyApiRecordData.setValue(null);\n\n    // Show warning notification\n    utils.showNotification({\n      title: "Warning",\n      description: "No results found.",\n      notificationType: "warning",\n      duration: 2 // Duration in seconds\n    });\n  }\n} else {\n  console.log("Error: kompanyrecord api call unsuccessful.");\n   loadingPopUp.setHidden(true);\n  // Show error notification\n  utils.showNotification({\n    title: "Error",\n    description: "The kompanyApiRecord API call was unsuccessful.",\n    notificationType: "error",\n    duration: 2 // Duration in seconds\n  });\n}\n',
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
      method="setHidden"
      params={{ ordered: [] }}
      pluginId="kompanyEditForm"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "info" },
                { title: "Internal KompanyApi Call Failure" },
                { duration: "0.2" },
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
    id="kompanyApiRecordData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <JavascriptQuery
    id="idSearch"
    _additionalScope={["showDrawer"]}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/idSearch.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetKompanyIDSearch"
    body="{{kompanySearchPayload.value}}
"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"user_key","value":"37789545a223d68ae0a792e63ddc558e"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="/idSearch"
    queryTimeout="30000"
    resourceName="c1abed7a-a801-4cb2-ad85-4ae8804f0f49"
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
      event="failure"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="kompanyDataSetSearch"
    body="{{ kompanyDataSetSearchInput.value }}
"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"user_key","value":"37789545a223d68ae0a792e63ddc558e"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="/dataset"
    queryTimeout="30000"
    resourceName="ff2f5041-d364-4d82-b84c-00772f10adc5"
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
  />
  <State
    id="kompanyDataSetSearchInput"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="kompanyDataSetSearchResponse"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="kompanyFlag"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'{value :""}'}
  />
  <JavascriptQuery
    id="editKompanyData"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/editKompanyData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="kompanyRecordEnableCheck"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/kompanyRecordEnableCheck.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="liveSearchJsonToPdf"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/liveSearchJsonToPdf.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="liveSearchJsonPdfInput"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <RESTQuery
    id="kompanyLiveDataUpload"
    body={'{\n  "filename": {{ liveSearchJsonPdfInput.value}}\n}'}
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/upload-pdf"
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
  />
  <State
    id="EntityTypes"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="GetEntityTypes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="ref-entity-types"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetEntityTypes.data}}" }] }}
      pluginId="EntityTypes"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("EntityTypes", GetEntityTypes.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="kompanySearchPayload"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="JiraStatusUpdate"
    body="{{ jiraParamas.value }}"
    bodyType="raw"
    cookies="[]"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{urlparams.uci ?  '/gdpr-jsm-dr' : '/complete-jsm-dr'}}"
    resourceName="e7cdd968-0885-4655-ba06-43ca045ca968"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="PUT"
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
            src: 'let response = await JiraStatusUpdate;\nloadingPopUp.setHidden(true);\nif(response.metadata.status === 200) {\n  utils.showNotification({\n    title : "Success",\n    description: response.data.message,\n    notificationType: "success",\n    duration: 3,\n  });\n  if (url.searchParams.orbisId) {\n    jiraClick.setValue(false);\n    utils.openPage("entityDetails", { queryParams: { bvdId: selectedCompany.value.header.bvdID, orbisId: selectedCompany.value.header.entityID, ticket:JiraTicketNumber.value  }, newTab: false });\n    //  NewJiraFirmo.setHidden(true);\n  } else {\n    jiraUCIClick.setValue(false)\n    //  containerJiraUCI.setHidden(true);\n  }\n  if ((url?.searchParams?.orbisId && url?.searchParams?.ticket) || (url?.searchParams?.bvdid && url?.searchParams?.ticket)) {\n    requestTypeLockUnlock.setValue(\'unlock\');\n    setLockUnlockParams.trigger();\n  }\n  // If value true then false \n  if (JiraFlow.value === true){\n    JiraFlow.setValue(false);\n  }\n} else {\n   utils.showNotification({\n    title : "Error",\n    description:response.error,\n    notificationType: "error",\n    duration: 3,\n  });\n}',
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
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="run"
      params={{
        ordered: [
          {
            src: 'let message = JSON.parse(JiraStatusUpdate.data.message);\nutils.showNotification({\n    title : "Error",\n    description:  message?.errorMessages?.[0] ?message.errorMessages[0] :  message.error,\n    notificationType: "error",\n    duration: 3,\n  });',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="kompanyLiveSearch"
    body="{{ liveSearchKompanyInput.value }}
"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"user_key","value":"37789545a223d68ae0a792e63ddc558e"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="/liveSearch"
    queryTimeout="30000"
    resourceName="ff2f5041-d364-4d82-b84c-00772f10adc5"
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
    id="liveSearchKompanyInput"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <State
    id="nationalLegalForm"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="getNationalLegalForm"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-legal-forms-national-standardized"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getNationalLegalForm.data}}" }] }}
      pluginId="nationalLegalForm"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("nationalLegalForm", getNationalLegalForm.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getNationalLegalCountry"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-legal-forms-national-standardized-per-country"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getNationalLegalCountry.data}}" }] }}
      pluginId="nationalLegalCountry"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("nationalLegalCountry", getNationalLegalCountry.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="nationalLegalCountry"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="GetNationalities"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-nationalities"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetNationalities.data}}" }] }}
      pluginId="NationalitiesList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("NationalitiesList", GetNationalities.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="NationalitiesList" value="[]" />
  <RESTQuery
    id="GetGenders"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-genders"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetGenders.data}}" }] }}
      pluginId="GendersList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("GendersList", GetGenders.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="GendersList" value="[]" />
  <RESTQuery
    id="getIndividualIdentifiers"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-individuals-identifiers"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{getIndividualIdentifiers.data}}" }] }}
      pluginId="IndividualIdentifiersList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("IndividualIdentifiersList", getIndividualIdentifiers.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="IndividualIdentifiersList" value="[]" />
  <RESTQuery
    id="GetCurrencies"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-currencies"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetCurrencies.data}}" }] }}
      pluginId="Currencies"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: 'localStorage.setValue("Currencies", GetCurrencies.data);' },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="Currencies" />
  <RESTQuery
    id="GetFunctionCodes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-individuals-functioncodes"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetFunctionCodes.data}}" }] }}
      pluginId="FunctionCodesList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("FunctionCodesList", GetFunctionCodes.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="FunctionCodesList" value="[]" />
  <RESTQuery
    id="GetExecutivePowerList"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-individuals-functions-executivepower"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetExecutivePowerList.data}}" }] }}
      pluginId="ExecutivePowerList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("ExecutivePowerList", GetExecutivePowerList.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="ExecutivePowerList" value="[]" />
  <RESTQuery
    id="GetShareholderList"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-individuals-functions-shareholder"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetShareholderList.data}}" }] }}
      pluginId="ShareholderList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("ShareholderList", GetShareholderList.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="ShareholderList" value="[]" />
  <RESTQuery
    id="GetRoleStatusList"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/ref-individuals-functions-statuses"
    resourceName="04675a23-fc5e-40bc-9878-109c700d087f"
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
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{GetRoleStatusList.data}}" }] }}
      pluginId="RoleStatusList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: 'localStorage.setValue("RoleStatusList", GetRoleStatusList.data);',
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
      method="setValue"
      params={{ ordered: [{ value: "true" }] }}
      pluginId="ReferenceDataAPIFailure"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="RoleStatusList" value="[]" />
  <RESTQuery
    id="readAuditTrail"
    body="{{ readAuditParams.value }}"
    bodyType="raw"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/read-audit-trail"
    queryTimeout="30000"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="show"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "let response = await readAuditTrail;\n\n// Function to convert JSON to desired string format\nfunction convertJsonToString(obj) {\n    let result = [];\n\n    function recurse(obj, current) {\n        for (let key in obj) {\n            let value = obj[key];\n            if (value && typeof value === 'object' && !Array.isArray(value)) {\n                recurse(value, current ? `${current}.${key}` : key);\n            } else if (Array.isArray(value)) {\n                value.forEach((item) => {\n                    if (typeof item === 'object') {\n                        recurse(item, `${current ? `${current}.` : ''}${key}`);\n                    } else {\n                        result.push(`${current ? `${current}.` : ''}${key}='${item}'`);\n                    }\n                });\n            } else {\n                result.push(`${current ? `${current}.` : ''}${key}='${value}'`);\n            }\n        }\n    }\n    recurse(obj, '');\n    return result.join(', ');\n}\n\nfunction convertEpocToDate(epocDate) {\n    const epochMilliseconds = epocDate * 24 * 60 * 60 * 1000;\n    // Create a Moment object from the milliseconds\n    const date = moment.utc(epochMilliseconds);\n    // Format the date as needed\n    const formattedDate = date.format('YYYY-MM-DD');\n    return formattedDate;\n}\n\n// check the date is epoc or not \nfunction checkString(strPath) {\n    const arrStr = [\n        \"educations/item/graduationdate\",\n        \"entityinfo/item/incorporationdate\",\n        \"functions/item/exemption/todate\"\n    ]\n    const fromDateSubstring = '/fromdate';\n    const dateSubstring = '/date';\n    //  return strPath.includes(fromDateSubstring) || strPath.includes(dateSubstring);\n    if (strPath && (strPath.includes(fromDateSubstring) || strPath.includes(dateSubstring) || arrStr.includes(strPath))) {\n        return true;\n    } else {\n        return false;\n    }\n}\n\nfunction checkNominationDate(strNomination) {\n    const arrStr = [\n        \"current/function/item/nominationdate\",\n        \"current/function/item/nominationenddate\",\n        \"current/function/item/exemption/todate\",\n        \"functions/item/nominationdate\",\n        \"functions/item/nominationenddate\"\n    ]\n    if (strNomination && arrStr.includes(strNomination)) {\n        return true;\n    } else {\n        return false;\n    }\n}\n\n// Replace null value to empty string.\nfunction replaceNullWithEmpty(obj) {\n    for (let key in obj) {\n        if (obj[key] === null || obj[key] === 'null') {\n            obj[key] = \"\";\n        }\n    }\n    return obj;\n}\n\n// New lable formate string.\nfunction formatString(inputString) {\n    const parts = inputString.split('/');\n    if (parts.length === 3 && parts[2] === 'value') {\n\n        return `${parts[0]}`;\n    }\n    if (parts.length === 3) {\n        return `${parts[0]}-${parts[2]}`;\n    }\n    const arrCheckPath = ['current/function/item/misc/workaddress/state', 'current/function/item/misc/workaddress/countryiso2', 'current/function/item/misc/workaddress/phone',\n        'current/function/item/misc/workaddress/email', 'current/function/item/misc/workaddress/addresslines'];\n    const arrAddressPath = ['addresses/item/reported/postcode', 'addresses/item/reported/mailmarker'];\n    if (inputString === 'miscellaneous/item/age/value') {\n        return 'age';\n    } else if (inputString === 'personalinfo/item/birth/date') {\n        return 'birthdate';\n    } else if (inputString === 'addresses/item/reported/addresslines') {\n        return `${parts[parts.length - 1]}`;\n    } else if (arrCheckPath.includes(inputString)) {\n        return `${parts[parts.length - 2]}-${parts[parts.length - 1]}`;\n    } else if (arrAddressPath.includes(inputString)) {\n        return `${parts[0]}-${parts[parts.length - 1]}`;\n    }\n    const itemIndex = parts.indexOf('item');\n    if (itemIndex === -1) {\n        return parts.join('-');\n    }\n\n    if (itemIndex === parts.length - 1) {\n        return parts.slice(0, itemIndex).join('-');\n    }\n    return parts.slice(itemIndex + 1).join('-');\n}\n\n// Compair value and show only different\nfunction compareValueGetDiff(objAddress, searchDiffValue) {\n    //  console.log('newValue, prevValue, fieldPath', newValue, prevValue, fieldPath);\n    let splitPath = objAddress.field_path.replace(/\\//g, '.');\n    let removePath\n    if (splitPath.includes('adddresses')) {\n        removePath = splitPath.replace(/^adddresses\\.item\\./, '');\n    } else if (splitPath.includes('addresses')) {\n        removePath = splitPath.replace(/^addresses\\.item\\./, '');\n    }\n\n    //  console.log('objAddress.id = ', objAddress.id);\n    let updateNewValue, updatePreValue, newUpdateValue;\n    //  console.log('objAddress.new_value', objAddress.new_value);\n    if (searchDiffValue === 'new_value') {\n        if (typeof (objAddress.new_value) === 'object') {\n            //  console.log('objAddress.new_value', objAddress.new_value);\n            //  jsonDataNewValue = JSON.parse(objAddress.new_value);\n            updateNewValue = convertJsonToString(objAddress.new_value);\n            // console.log('convertJson New value =', JSON.parse(objAddress.new_value));\n        }\n    } else if (searchDiffValue === 'prev_value') {\n        if (typeof (objAddress.prev_value) === 'object') {\n            //  jsonDataPrevValue = JSON.parse(objAddress.prev_value);\n            updatePreValue = convertJsonToString(objAddress.prev_value);\n            //  console.log('objAddress.prev_value = ', updatePreValue)\n            // console.log('convertJson old value = ', JSON.parse(objAddress.prev_value));\n        }\n    }\n\n    if (updateNewValue || updatePreValue) {\n        let convertLowerCase;\n        if (searchDiffValue === 'new_value') {\n            convertLowerCase = (updateNewValue.toLowerCase()).replace(/'/g, '');\n        } else {\n            convertLowerCase = (updatePreValue.toLowerCase()).replace(/'/g, '');\n        }\n\n        if (removePath === 'geoclassifications') {\n            // Filter only geoClassifications keys\n            newUpdateValue = convertLowerCase.split(\", \")\n                .filter(pair => pair.startsWith(\"geoclassifications.\"))\n                .join(\", \");\n        } else {\n            //  console.log('removePath = ', removePath);\n            //  console.log('convertLowerCase =', convertLowerCase);\n            newUpdateValue = convertLowerCase.split(\", \").find(pair => pair.startsWith(`${removePath}=`))?.split(\"=\")[1];\n        }\n    }\n    //  console.log('removePath = ', removePath);\n\n    return newUpdateValue;\n}\n\n\n// Compare local name and get differnt newvalue and prev name\nfunction differentData(obj1, obj2, fieldPath) {\n    //  console.log('length', obj1)\n    if (obj1.localizedNames.length === 0 && obj2.localizedNames.length !== 0) {\n        return convertJsonToString(obj1) + ', localizedNames=[]';\n    } else if (obj1.localizedNames.length === obj2.localizedNames.length) {\n        const differences = {};\n        obj1.localizedNames.forEach((obj1, index) => {\n            const arr2 = obj2.localizedNames[index];\n            if (!arr2) return;\n\n            Object.keys(obj1).forEach(key => {\n                if (key === 'language') {\n                    if (obj1[key].toLowerCase() !== arr2[key].toLowerCase()) {\n                        differences[key] = obj1[key];\n                    }\n                } else if (obj1[key] !== arr2[key]) {\n                    differences[key] = obj1[key];\n                }\n            });\n        });\n        if (Object.values(differences).length === 1 && \"name\" in differences) {\n            return differences.name;\n        } else if (fieldPath.includes(\"localizednames/name\")) {\n            return differences.name;\n        } else if (fieldPath.includes(\"localizednames/language\")) {\n            return differences.language;\n        } else {\n            return convertJsonToString(differences);\n        }\n    } else if (obj1.localizedNames.length > obj2.localizedNames.length) {\n        return convertJsonToString(obj1);\n    } else if (obj1.localizedNames.length < obj2.localizedNames.length) {\n        return convertJsonToString(obj1);\n    }\n}\n\nfunction compareLocalizeNameGetDiff(objData, searchDiffValue) {\n    let convertStrNewObj, convertStrPreObj;\n    //  if (objData.id === 8443) {\n    //  console.log('Full obj =', objData);\n    if (typeof (objData.new_value) === 'object') {\n        //  console.log('convertJson value =', objData.new_value);\n        convertStrNewObj = differentData(objData.new_value, objData.prev_value, objData.field_path);\n        //  console.log('convertJson New value =', convertStrNewObj);\n    } else {\n        convertStrNewObj = objData.new_value;\n    }\n    if (typeof (objData.prev_value) === 'object') {\n        convertStrPreObj = differentData(objData.prev_value, objData.new_value, objData.field_path);\n    } else {\n        convertStrPreObj = objData.prev_value;\n    }\n\n    //  let outputStr \n    // Compare value\n    if (searchDiffValue === 'new_value') {\n        return convertStrNewObj;\n        //  outputStr = getDifferences(convertStrNewObj,convertStrPreObj);\n\n    } else if (searchDiffValue === 'prev_value') {\n        //  console.log('prev outputStr =', convertStrPreObj);\n        return convertStrPreObj;\n\n        //  outputStr = getDifferences(convertStrPreObj,convertStrNewObj);\n        //  console.log('prev outputStr =', outputStr);\n    }\n    //  }\n}\n\n// If two or more localize address need to find where actually changes this code.\nvar arrOfLocalizeAddress = [\n    \"addresses/item/localizedaddresses/reportedaddress/county\",\n    \"addresses/item/localizedaddresses/reportedaddress/faxnumbers\",\n    \"addresses/item/localizedaddresses/reportedaddress/phonenumbers\",\n    \"addresses/item/localizedaddresses/reportedaddress/pobox\",\n    \"addresses/item/localizedaddresses/reportedaddress/city\",\n    \"addresses/item/localizedaddresses/reportedaddress/postcode\",\n    \"addresses/item/localizedaddresses/reportedaddress/addresslines\",\n    \"addresses/item/localizedaddresses/language\",\n    \"addresses/item/localizedaddresses\"\n]\n\n// Each address check and compare.\nfunction differentAddressData(obj1, obj2, fieldPath, searchDiffValue) {\n    let fieldPathArr = fieldPath.split('/');\n    let string = fieldPathArr[fieldPathArr.length - 1];\n\n    if (fieldPath === 'addresses/item/localizedaddresses') {\n        return convertJsonToString({\n            localizedAddresses: searchDiffValue === 'new_value'\n                ? obj1.localizedAddresses\n                : obj2.localizedAddresses\n        });\n    }\n\n    let typeData = '';\n    switch (string) {\n        case 'language':\n            typeData = typeof obj1.localizedAddresses?.[0]?.language;\n            break;\n        case 'postcode':\n            typeData = typeof obj1.localizedAddresses?.[0]?.reportedAddress?.postCode;\n            string = 'postCode';\n            break;\n        case 'addresslines':\n            typeData = 'array';\n            string = 'addressLines';\n            break;\n        case 'phonenumbers':\n            typeData = 'array';\n            string = 'phoneNumbers';\n            break;\n        case 'faxnumbers':\n            typeData = 'array';\n            string = 'faxNumbers';\n            break;\n        case 'pobox':\n            typeData = typeof obj1.localizedAddresses?.[0]?.reportedAddress?.poBox;\n            string = 'poBox';\n            break;\n        case 'city':\n            typeData = typeof obj1.localizedAddresses?.[0]?.reportedAddress?.city;\n            string = 'city';\n            break;\n        case 'county':\n            typeData = typeof obj1.localizedAddresses?.[0]?.reportedAddress?.county;\n            string = 'county';\n            break;\n        default:\n            return null;\n    }\n\n    let localizeAddress = [];\n\n    const getValue = (obj, index) => {\n        if (string === 'language') {\n            return obj.localizedAddresses?.[index]?.language;\n        } else {\n            return obj.localizedAddresses?.[index]?.reportedAddress?.[string];\n        }\n    };\n\n    const joinArray = (arr) => Array.isArray(arr) ? arr.join(', ') : arr;\n\n    const len1 = obj1.localizedAddresses?.length || 0;\n    const len2 = obj2.localizedAddresses?.length || 0;\n\n    if (len1 === 0 && len2 !== 0) {\n        return convertJsonToString(obj1) + ', localizedAddresses=[]';\n    }\n\n    const minLen = Math.min(len1, len2);\n    for (let i = 0; i < minLen; i++) {\n        const val1 = getValue(obj1, i);\n        const val2 = getValue(obj2, i);\n\n        if (typeData === 'string') {\n            if (val1 !== val2) {\n                localizeAddress.push(searchDiffValue === 'new_value' ? val1 : val2);\n            }\n        } else if (typeData === 'array') {\n            const joined1 = joinArray(val1);\n            const joined2 = joinArray(val2);\n            if (joined1 !== joined2) {\n                return searchDiffValue === 'new_value' ? joined1 : joined2;\n            }\n        }\n    }\n\n    localizeAddress = localizeAddress.filter(val => val !== '');\n\n    if (localizeAddress.length === 0) {\n        return null; // or return ''\n    } else if (localizeAddress.length === 1) {\n        return localizeAddress[0];\n    } else {\n        return localizeAddress.join(', ');\n    }\n\n    // If localization address length change then display.\n    if (len1 !== len2) {\n        return convertJsonToString({\n            localizedAddresses: searchDiffValue === 'new_value' ? obj1.localizedAddresses : obj2.localizedAddresses\n        });\n    }\n\n    return null;\n}\n\n\n// Comapair value if and check each object.\nfunction compareLocalizeAddressGetDiff(objData, searchDiffValue) {\n    let convertStrNewObj, convertStrPreObj;\n    if (typeof (objData.new_value) === 'object') {\n        //  console.log('objData', objData.id);\n        convertStrNewObj = differentAddressData(\n            objData.new_value,\n            objData.prev_value,\n            objData.field_path,\n            searchDiffValue\n        );\n    } else {\n        convertStrPreObj = objData.new_value;\n    }\n    if (typeof (objData.prev_value) === 'object') {\n        //  console.log('objData', objData.id);\n        convertStrPreObj = differentAddressData(\n            objData.new_value,\n            objData.prev_value,\n            objData.field_path\n        );\n    } else {\n        convertStrPreObj = objData.prev_value;\n    }\n    if (searchDiffValue === 'new_value') {\n        //  console.log(\"convertStrNewObj\", convertStrNewObj);\n        return convertStrNewObj;\n\n    } else if (searchDiffValue === 'prev_value') {\n        //  console.log(\"convertStrPreObj\", convertStrPreObj);\n        return convertStrPreObj;\n    }\n}\n\nif (response.data.statusCode === 200) {\n    let tempResponse = response.data.body;\n    let newResponseData = JSON.parse(JSON.stringify(response.data.body));\n    for (let i = 0; i < newResponseData.length; i++) {\n\n        // Check null then replace with empty string.\n        tempResponse[i] = replaceNullWithEmpty(tempResponse[i]);\n\n        let newValue = '';\n        let oldValue = newResponseData[i]?.new_value ? newResponseData[i]?.new_value : '';\n        let fieldPathValue = newResponseData[i]?.field_path ? checkString(newResponseData[i]?.field_path) : '';\n        var entityIdData = newResponseData[i]?.entity_id ? newResponseData[i]?.entity_id : '';\n        //  console.log('typeof(oldValue)', typeof(oldValue));\n\n        // Parse the input string to an array\n        let pathOfIdentifier = '';\n        if (typeof (oldValue) === 'object') {\n\n            // Object then date since and date utill convert epoc to regular date. \n            if (oldValue.dateSince && (newResponseData[i]?.remediated_action === 'overwrite' || newResponseData[i]?.remediated_action === 'recreate')) {\n                //  console.log('newResponseData[i]?.id', newResponseData[i]?.id)\n                oldValue.dateSince = convertEpocToDate(oldValue.dateSince);\n                newValue = oldValue.dateSince;\n            } if (oldValue.dateUntil && (newResponseData[i]?.remediated_action === 'overwrite' || newResponseData[i]?.remediated_action === 'recreate')) {\n                oldValue.dateUntil = convertEpocToDate(oldValue.dateUntil);\n                newValue = oldValue.dateUntil;\n            }\n            if ((oldValue.dateSince || oldValue.dateUntil) && newResponseData[i]?.remediated_action === 'new') {\n                oldValue.dateSince = oldValue.dateSince ? convertEpocToDate(oldValue.dateSince) : '';\n                oldValue.dateUntil = oldValue.dateUntil ? convertEpocToDate(oldValue.dateUntil) : '';\n                newValue = convertJsonToString(oldValue);\n            } else if (newResponseData[i]?.field_path.includes('digitalpresences/item')) {\n                newValue = newResponseData[i]?.new_value?.value ? newResponseData[i]?.new_value?.value : ''\n            } else if (!oldValue.dateSince && !oldValue.dateUntil) {\n                newValue = convertJsonToString(oldValue);\n            }\n\n            if (newResponseData[i]?.field_path === \"identifiers/item/id\" || newResponseData[i]?.field_path === \"identifiers/item\") {\n                const splitIdentifier = newValue.split(',');\n                newValue = splitIdentifier[1].replace('id=', '').replace(/'/g, '');\n                pathOfIdentifier = splitIdentifier[0]\n                //  console.log('pathOfIdentifier', pathOfIdentifier);\n            } else if ((newResponseData[i]?.remediated_action === 'recreate' || newResponseData[i]?.remediated_action === 'overwrite') && ((newResponseData[i]?.field_path.includes('addresses/item')) || (newResponseData[i]?.field_path.includes('adddresses/item')))) {\n                if (newResponseData[i].id === 8789) {\n                    console.log('data', newResponseData[i].id)\n                }\n                // check if this json objec or not.\n                if (arrOfLocalizeAddress.includes(newResponseData[i]?.field_path)) {\n                    newValue = compareLocalizeAddressGetDiff(newResponseData[i], 'new_value');\n                } else if (typeof newValue === 'string') {\n                    //  console.log('value', newValue);\n                    const getUpdatedValue = compareValueGetDiff(newResponseData[i], 'new_value');\n                    //  console.log('getUpdatedValue', getUpdatedValue);\n                    newValue = getUpdatedValue;\n                } else {\n                    newValue = oldValue;\n                }\n            } else if ((newResponseData[i]?.field_path.includes('localizednames/name')) || (newResponseData[i]?.field_path.includes('localizednames/language'))) {\n                if (newResponseData[i].remediated_action === 'overwrite' || newResponseData[i].remediated_action === 'recreate') {\n                    newValue = compareLocalizeNameGetDiff(newResponseData[i], 'new_value');\n                    //  console.log('newValue update = ', newValue);\n                } else {\n                    newValue = newValue.replace(/'/g, '').toLowerCase().split(\", \").find(pair => pair.startsWith(`localizednames.name=`))?.split(\"=\")[1];\n                }\n            }\n\n        } else {\n            // When suppress value then show status\n            const strData = oldValue.length > 0 && oldValue.includes(\"entityId\") && oldValue.includes(\"recordStatus\") ? true : false;\n            //  console.log('strData',strData);\n            let jsonValue = '';\n            if (strData) {\n                jsonValue = JSON.parse(oldValue)\n                //  console.log('jsonValue',jsonValue);\n            }\n            if (strData && jsonValue.recordStatus === 'SUPPRESSED' || jsonValue.recordStatus === 'ACTIVE') {\n                newValue = jsonValue.recordStatus.toLowerCase();\n                //  console.log('entity_id=', jsonValue.entityId);\n                //  tempResponse[i].entity_id = jsonValue.entityId;\n            } else if (checkNominationDate(newResponseData[i]?.field_path)) {\n                //  console.log('data Json', typeof(oldValue));\n                newValue = oldValue === '' ? oldValue : convertEpocToDate(oldValue);\n            } else if (fieldPathValue) {\n\n                if (newResponseData[i].field_path === 'names/item/datesince') {\n                    //  console.log('oldValue', typeof(oldValue))\n                    if (typeof (oldValue) === 'object') {\n                        newValue = convertEpocToDate(oldValue.dateSince);\n                    } else if (typeof (oldValue) === 'number') {\n                        newValue = convertEpocToDate(oldValue)\n                    }\n                } else if (newResponseData[i].field_path === 'names/item/dateuntil') {\n                    if (typeof (oldValue) === 'object') {\n                        oldValue = oldValue.dateUntil;\n                    } else if (typeof (oldValue) === 'number') {\n                        newValue = convertEpocToDate(oldValue)\n                    }\n                }\n                // convert epoch date to regular date.\n                const formattedDate = oldValue === '' ? oldValue : convertEpocToDate(oldValue);\n                //  console.log('data Json1', formattedDate)\n                newValue = formattedDate;\n            } else if (newResponseData[i].field_path === 'header/state') {\n                newValue = oldValue.toLowerCase();\n            } else {\n                newValue = oldValue;\n            }\n        }\n\n        if (newValue === null || newValue === 'null') {\n            newValue = '';\n        }\n\n        // change pre value\n        let newPreValue = '';\n        let oldPreValue = newResponseData[i]?.prev_value ? newResponseData[i]?.prev_value : '';\n        // Parse the input string to an array\n        if (typeof (oldPreValue) === 'object') {\n            // Object then date since and date utill convert epoc to regular date.\n            if (oldValue.dateSince) {\n                newPreValue = oldPreValue.dateSince\n            } if (oldValue.dateUntil) {\n                newPreValue = oldPreValue.dateUntil\n            } if (newResponseData[i]?.field_path.includes('digitalpresences/item')) {\n                newPreValue = newResponseData[i]?.prev_value?.value ? newResponseData[i]?.prev_value?.value : ''\n            } else if (!oldValue.dateSince && !oldValue.dateUntil) {\n                newPreValue = convertJsonToString(oldPreValue);\n            }\n\n            if (newResponseData[i]?.field_path === \"identifiers/item/id\" || newResponseData[i]?.field_path === \"identifiers/item\") {\n                if (newResponseData[i]?.remediated_action === 'delete') {\n                    const splitIdentifier = newPreValue.split(',');\n                    newPreValue = splitIdentifier[1].replace('id=', '').replace(/'/g, '');\n                    pathOfIdentifier = splitIdentifier[0]\n                } else {\n                    const splitIdentifier = newPreValue.split(',');\n                    newPreValue = splitIdentifier[1].replace('id=', '').replace(/'/g, '');\n                }\n\n            } else if ((newResponseData[i]?.remediated_action === 'recreate' || newResponseData[i]?.remediated_action === 'overwrite') && ((newResponseData[i]?.field_path.includes('addresses/item')) || (newResponseData[i]?.field_path.includes('adddresses/item')))) {\n                // if(newResponseData[i].id === 6913) {\n                //   console.log('typeOf', typeof(oldValue))\n                //  console.log('new value =',newResponseData[i].new_value)\n                //  console.log('id value =', newResponseData[i])\n                //}\n                // check if this json objec or not.\n                if (arrOfLocalizeAddress.includes(newResponseData[i]?.field_path)) {\n                    newPreValue = compareLocalizeAddressGetDiff(newResponseData[i], 'prev_value');\n                } else if (typeof newPreValue === 'string') {\n\n                    // check the field address then different prev name \n                    const getUpdatedValue = compareValueGetDiff(newResponseData[i], 'prev_value')\n                    //  console.log('getUpdatedValue =', getUpdatedValue);\n                    newPreValue = getUpdatedValue;\n                } else {\n                    newPreValue = oldValue;\n                }\n            } else if ((newResponseData[i]?.field_path.includes('localizednames/name')) || (newResponseData[i]?.field_path.includes('localizednames/language'))) {\n                if (newResponseData[i].remediated_action === 'overwrite' || newResponseData[i].remediated_action === 'recreate') {\n                    newPreValue = compareLocalizeNameGetDiff(newResponseData[i], 'prev_value');\n                } else {\n                    newPreValue = newPreValue.replace(/'/g, '').toLowerCase().split(\", \").find(pair => pair.startsWith(`localizednames.name=`))?.split(\"=\")[1];\n                }\n            }\n        } else {\n            //  console.log('string not json');\n            // epoch date is object\n            if (checkNominationDate(newResponseData[i]?.field_path) && newResponseData[i]?.prev_value !== null) {\n                //  newPreValue = convertEpocToDate(oldPreValue);\n                newPreValue = newResponseData[i]?.prev_value === null ? '' : oldPreValue;\n            } else {\n                newPreValue = newResponseData[i]?.prev_value === null ? '' : oldPreValue;\n            }\n        }\n        if (newPreValue === null || newPreValue === 'null') {\n            newPreValue = '';\n        }\n\n        tempResponse[i].new_value = newValue;\n        tempResponse[i].prev_value = newPreValue;\n\n        // Add new field label\n        let fieldPathData = newResponseData[i]?.field_path ? newResponseData[i]?.field_path : '';\n        if (fieldPathData.length !== 0) {\n            if (fieldPathData === \"identifiers/item/id\" || fieldPathData === \"identifiers/item\") {\n                if (newResponseData[i]?.remediated_action === 'delete') {\n                    pathOfIdentifier = pathOfIdentifier.replace('type=', '').replace(/'/g, '').replace(/ /g, '-');\n                    fieldPathData = `identifiers-${pathOfIdentifier.replace('type=', '')}`\n                    //  console.log('pathOfIdentifier', pathOfIdentifier)\n                } else {\n                    pathOfIdentifier = pathOfIdentifier.replace('type=', '').replace(/'/g, '').replace(/ /g, '-');\n                    fieldPathData = `identifiers-${pathOfIdentifier.replace('type=', '')}`\n                }\n\n            } else if (fieldPathData.includes('digitalpresences')) {\n                // If digital present then attahed email and website.\n                //  console.log('tempResponse[i].new_value =',  tempResponse[i]);\n                if (((tempResponse[i].new_value).includes('website')) || ((tempResponse[i].prev_value).includes('website'))) {\n                    fieldPathData = 'digitalpresences-' + 'website';\n                } else {\n                    fieldPathData = 'digitalpresences-' + 'email';\n                }\n            } else if (fieldPathData.includes('localizednames/name')) {\n                let newFormateField = fieldPathData.split('/');\n                let newUpdate = newResponseData[i]?.new_value?.type ? newResponseData[i]?.new_value?.type.replace(/_/g, \"-\") : '';\n                if (newUpdate.length !== 0) {\n                    fieldPathData = newFormateField[newFormateField.length - 2] + '-' + newUpdate\n                } else {\n                    fieldPathData = formatString(fieldPathData);\n                }\n            } else if (fieldPathData.includes('localizednames/language')) {\n                let newFormateField = fieldPathData.split('/');\n                let newUpdate = newResponseData[i]?.new_value?.type ? newResponseData[i]?.new_value?.type.replace(/_/g, \"-\") : '';\n                if (newUpdate.length !== 0) {\n                    fieldPathData = newFormateField[newFormateField.length - 2] + '-' + newUpdate + '-' + newFormateField[newFormateField.length - 1];\n                } else {\n                    fieldPathData = formatString(fieldPathData);\n                }\n            } else {\n                fieldPathData = formatString(fieldPathData);\n            }\n        }\n\n        // Convert domain object_type = function or individual\n        switch (tempResponse[i].object_type) {\n            case 'uci/role':\n                tempResponse[i].object_type = 'Function/Role';\n                tempResponse[i].uciIdData = entityIdData.split('_')[0];\n                break;\n            case 'uci':\n                tempResponse[i].object_type = 'Individual';\n                tempResponse[i].uciIdData = tempResponse[i].entity_id;\n                break;\n        }\n\n        const remediationAction = tempResponse[i].remediated_action ? tempResponse[i].remediated_action.toLowerCase() : ''\n        switch (remediationAction) {\n            case 'overwrite':\n            case 'recreate':\n                tempResponse[i].remediated_action = 'Update';\n                break;\n        }\n\n        // check the path categories\n        let fieldPathInfo = newResponseData[i]?.field_path ? newResponseData[i]?.field_path : '';\n        fieldPathInfo = fieldPathInfo.split('/');\n        fieldPathInfo = fieldPathInfo[0].length !== 0 ? fieldPathInfo[0] : '';\n        let fieldName = '';\n        switch (fieldPathInfo) {\n            case 'names':\n                fieldName = 'Name section';\n                break;\n            case 'entityinfo':\n                fieldName = 'Legal information';\n                break;\n            case 'activitydescriptions':\n                fieldName = 'Business Description';\n                break;\n            case 'digitalpresences':\n                fieldName = 'Digital Presence';\n                break;\n            case 'adddresses':\n            case 'addresses':\n                fieldName = 'Address';\n                break;\n            case 'identifiers':\n                fieldName = 'Identifiers';\n                break;\n        }\n        //  console.log('category', fieldName);\n        tempResponse[i].category = fieldName;\n        tempResponse[i].field_value = fieldPathData;\n        // CWP - The domain should be GDPR and for CDR - Firmographics \n        if (tempResponse[i].ticket_id.startsWith('CWP')) {\n            tempResponse[i].request_type = 'GDPR';\n        } else if (tempResponse[i].ticket_id.startsWith('CDR')) {\n            tempResponse[i].request_type = 'Firmographics';\n        } else {\n            tempResponse[i].request_type = '';\n        }\n\n\n    }\n    if (tempResponse.length === 0) {\n        utils.showNotification({\n            title: \"Info\",\n            description: 'Record not found.',\n            notificationType: \"info\",\n            duration: 3,\n        });\n    }\n    //  console.log('final arra', tempResponse);\n    if (JiraFlow.value === true) {\n        auditJsonForJiraValue.setValue(tempResponse);\n        ConvertJson.trigger();\n    } else {\n        VarAuditTrailData.setValue(tempResponse);\n    }\n} else {\n    utils.showNotification({\n        title: \"Error\",\n        description: response.data.body,\n        notificationType: \"error\",\n        duration: 3,\n    });\n}\nloadingPopUp.setHidden(true);",
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
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="readAuditParams" value="{}" />
  <State id="VarAuditTrailData" value="[]" />
  <State id="ReferenceDataAPIFailure" value="false" />
  <JavascriptQuery
    id="jiraModelParams"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/jiraModelParams.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="jiraParamas" value="{}" />
  <State id="PageLoadCall" value="true" />
  <State id="lockUnlockParams" value="{}" />
  <State id="requestTypeLockUnlock" value={'""'} />
  <State id="pageLoadValidEntity" value="false" />
  <JavascriptQuery
    id="ConvertJson"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/ConvertJson.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="JsonJira" value="{}" />
  <State id="auditJsonForJiraValue" value="{}" />
  <State id="jiraClick" value="false" />
  <State id="JiraFlow" value="false" />
  <JavascriptQuery
    id="setLocalStorageData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setLocalStorageData.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <State id="SearchedEntity" value="" />
  <State id="GDDJiraStausFirmo2" value={'"Remediation - Completed"'} />
  <State id="GtxtboxCommentFirmo2" />
  <JavascriptQuery
    id="createAuditTrail"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/createAuditTrail.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="auditItem" />
  <RESTQuery
    id="CreateAuditTrail"
    body="{{ auditItem.value }}"
    bodyType="raw"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/create-audit-trail"
    queryFailureConditions={
      '[{"condition":"{{ metadata.status != 200 }}","message":"Error When Creating Audit Trail.\\nPlease Contact The Development Team"}]'
    }
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
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
            src: 'var resp = CreateAuditTrail.data;\nconsole.log("Create AuditTrail Resp: ", resp)\n\nAuditTrailList.setValue({})\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="UploadPDF"
    body="{
  'filename': {{documentID.value + '.' + uploadFileExtension.value }}
}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/upload-pdf"
    queryDisabled={'{{documentFileDrop.value == ""}}'}
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
            src: 'var resp = UploadPDF.data;\n\nconsole.log("UPLOAD LINK: ", UploadPDF.body)\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\n  //  console.log("UploadPDFS3 Being Called")\n  //  UploadPDFS3.trigger()\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="uploadContentType"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <State
    id="uploadFileExtension"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <State
    id="documentID"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <RESTQuery
    id="CreateMetadataRecord"
    body="{{ Object.assign({}, createMetadataItem.value, {'doc_id' : documentID.value}) }}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/create-metadata-record"
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
            src: 'var resp = CreateMetadataRecord.data;\n\nif (resp.statusCode === 200) {\n  \n  var temp = resp.body;\n  //  console.log("CreateMetadataRecord Body: ", temp)\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="createMetadataItem"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="ReadMetadataRecord"
    body={'{\n  "orbis_id": {{selectedCompany.value.entityID}}\n}'}
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/read-metadata-record"
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
      enabled="{{ ReadMetadataRecord.data.statusCode == 200 }}"
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "var existingData = entityMetadataList.value\n\n\nif (existingData.length != 0){  \n\n  for (let i = 0; i < ReadMetadataRecord.data.body.length; i++){\n  \n    if (newDocumentLinks.value.length > 0 && i == (ReadMetadataRecord.data.body.length - 1)){\n      ReadMetadataRecord.data.body[i].link = newDocumentLinks.value[1]\n      \n    } else {\n      try{\n        ReadMetadataRecord.data.body[i].link = existingData[i].link\n      } catch (e){\n        ReadMetadataRecord.data.body[i].link = []\n      }\n        }\n  }\n} else {\n      ReadMetadataRecord.data.body.forEach(obj => {  obj.link = []; });\n  \n  if (newDocumentLinks.value.length > 0){\n      ReadMetadataRecord.data.body[ReadMetadataRecord.data.body.length-1].link = newDocumentLinks.value[1]\n    }\n  \n}\n\nentityMetadataList.setValue(ReadMetadataRecord.data.body)\nnewDocumentLinks.setValue([])",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ ReadMetadataRecord.data.statusCode == 400 }}"
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="entityMetadataList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { onSuccess: null },
                { onFailure: null },
                { additionalScope: null },
              ],
            },
          },
        ],
      }}
      pluginId="loadMasterLinkedFields"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="UploadPdfLiveSearchData"
    body="{{ pdfBinaryVariable.value}}"
    bodyType="binary"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"\\"application/pdf\\""}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{kompanyLiveDataUpload.data.body}}"
    resourceName="REST-WithoutResource"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="PUT"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      enabled="{{ UploadPdfLiveSearchData.data.hasOwnProperty('message') }}
"
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "IndexSearch data successfully uploaded." },
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
    <Event
      enabled="{{UploadPdfLiveSearchData.error != null}}"
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "error" },
                {
                  title:
                    "Error Occurred When Uploading PDF in IndexSearchJsonToPdf",
                },
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
    id="pdfBinaryVariable"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State id="sessionLinkedFields" value="{}" />
  <State
    id="entityMetadataList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="loadMasterLinkedFields"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/loadMasterLinkedFields.js", "string")}
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
    id="masterRecordLinkedRemFields"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="linkingIconLinkDict"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="iconHiddenFlag"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value=" {} "
  />
  <State id="AuditTrailList" />
  <State
    id="JiraTicketNumber"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="''"
  />
  <JavascriptQuery
    id="ValidateUserRole"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/ValidateUserRole.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="SearchedBy" />
  <RESTQuery
    id="entityLockOrUnlockAPI"
    body="{{ lockUnlockParams.value }}"
    bodyType="raw"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/entity-assignment"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "let response = await entityLockOrUnlockAPI;\nif (response.data.statusCode === 200 || response.data.statusCode === 400) {\n  if ((response?.data?.body?.status  === 'locked' || response?.data?.body?.status  === 'already_locked') && response?.data?.body?.user_id !== CurrentUserObj.value.user_id) {\n    if (response?.data?.body?.status  === 'already_locked') {\n      \n    // Original string\n    let originalString = response?.data?.body?.message ? response.data.body.message : '';\n    \n    // Substrings to check and remove\n    let substring1 = \"This entity is already locked to user:\";\n    \n    // Check if the string contains the specified substrings and remove them\n    if (originalString.includes(substring1)) {\n        originalString = (originalString.replace(substring1, \"\"));\n    }\n\n    console.log('originalString', originalString);\n      varLockMessage.setValue(originalString);\n    }\n    lockEntity.setValue(true);\n    requestTypeLockUnlock.setValue('read');\n  } else {\n     lockEntity.setValue(false);\n    requestTypeLockUnlock.setValue('read');\n  }\n} \n\n",
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
    id="setLockUnlockParams"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setLockUnlockParams.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="jiraUCIClick" value="false" />
  <State id="jiraUCISelectValue" value={'"Remediation - Completed"'} />
  <State id="txtboxCommUCI" />
  <RESTQuery
    id="UploadPDFS3"
    body="{{ documentFileDrop.value[0] }}"
    bodyType="binary"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"{{ uploadContentType.value }}"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{UploadPDF.data.body}}"
    resourceName="REST-WithoutResource"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="PUT"
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
            src: '//  var resp = await UploadPDFS3.data;\n\ndocumentFileDrop.clearValue()\n//  console.log("UploadPDFS3 Response: ", UploadPDFS3.query)\n//  console.log("UploadPDFS3 BODY: ", UploadPDFS3.body)\n\n//  if (resp.statusCode === 200) {\n//    var temp = resp.body;\n  \n//    signedUploadLink.setValue(temp)\n//    UploadPDFS3.trigger()\n//  }\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="TableRecordRemediated"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State id="varLockMessage" value="''" />
  <State id="lockEntity" value="false" />
  <State
    id="updatedNationalLegalForm"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="CompanyNamesList"
    value={
      '{{\n  selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "1" && item.item.localizedNames.some(loc => loc.language.toLowerCase() === "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() === "ii").name)\n}}\n\n\n\n'
    }
  />
  <State
    id="CompanyNamesLocalList"
    value={
      '{{ \n  (selectedCompany?.value?.names ?? [])\n    .filter(item => item?.item?.type === "1")\n    .flatMap(item =>\n      (item?.item?.localizedNames ?? [])\n        .filter(loc => loc?.language?.toLowerCase() !== "ii")\n        .map(loc => ({\n          name: loc?.name ?? "",\n          language: loc?.language ?? ""\n        }))\n    )\n}}\n\n\n'
    }
  />
  <State
    id="PreviousNamesList"
    value={
      '  {{ selectedCompany.value.names\n    ?.map(item => ({\n      ...item,\n      item: {\n        ...item.item,\n        localizedNames: item.item.localizedNames.filter(\n          ln => ln.language?.toLowerCase() === "ii"\n        )\n      }\n    }))\n    .filter(item => item.item.type === "3" && item.item.localizedNames.length)\n    .map(item => ({\n      name: item.item.localizedNames[0].name,\n      dateSince: !isNaN(Date.parse(item.item.dateSince)) ? item.item.dateSince : null,\n      dateUntil: !isNaN(Date.parse(item.item.dateUntil)) ? item.item.dateUntil : null\n    })).sort((a, b) => {\n        // Convert dates to moment objects upfront\n        const dateA = a.dateUntil ? moment(a.dateUntil) : null;\n        const dateB = b.dateUntil ? moment(b.dateUntil) : null;\n        \n        // Primary sort by dateUntil (descending)\n        if (dateA && dateB) {\n            return dateB.diff(dateA);\n        }\n        \n        // Handle mixed cases where one record has dateUntil and other doesn\'t\n        if (!dateA && dateB) {\n            // Records without dateUntil go after records with dateUntil\n            return 1;\n        }\n        if (dateA && !dateB) {\n            // Records with dateUntil go before records without dateUntil\n            return -1;\n        }\n        \n        // Both records lack dateUntil - sort by dateSince (descending)\n        if (!dateA && !dateB) {\n            const sinceA = a.dateSince ? moment(a.dateSince) : null;\n            const sinceB = b.dateSince ? moment(b.dateSince) : null;\n            \n            if (sinceA && sinceB) {\n                return sinceB.diff(sinceA);\n            }\n            \n            // Handle missing dateSince values\n            if (!sinceA && sinceB) return 1;\n            if (sinceA && !sinceB) return -1;\n        }\n        \n        return 0;\n    })}}'
    }
  />
  <State
    id="PreviousNameLocalsList"
    value={
      '{{\n  selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "3" && item.item.localizedNames.some(loc => loc.language.toLowerCase() !== "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() !== "ii").name)\n}}'
    }
  />
  <State
    id="AKANamesList"
    value={
      '{{\n  selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() === "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() === "ii").name)\n}}'
    }
  />
  <State
    id="AKANameLocalsList"
    value={
      '{{ _.uniq(selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() !== "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() !== "ii").name))\n }}'
    }
  />
  <State id="showAllPrevNames" value="false" />
  <State id="BulkProcessPayload" />
  <State id="BulkProcessButtonEnabled" value="false" />
  <State id="bulkEditRolesDisable" value="false" />
  <State id="bulkStatusValue" value="null" />
  <State
    id="Datastored"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{i : 0,
data :[]}
"
  />
  <State id="newDocumentLinks" value="[]" />
  <State id="stateCode" value="false" />
  <State id="loaderHideFlag" value="false" />
  <JavascriptQuery
    id="manualLoadingIconHide"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/manualLoadingIconHide.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="GetAvailableNewIdentifiers"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/GetAvailableNewIdentifiers.js", "string")}
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
    id="AddressesList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="ValidateBvdId"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/ValidateBvdId.js", "string")}
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
    id="ValidateOrbisId"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/ValidateOrbisId.js", "string")}
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
    id="createMasterHashDict"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/createMasterHashDict.js", "string")}
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
    id="masterRecordAllAttributeHashDict"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <JavascriptQuery
    id="linkDisableSave"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/linkDisableSave.js", "string")}
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
    id="updateLinkedAttributes"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/updateLinkedAttributes.js", "string")}
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
    id="unlinkedAttributesToLink"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{'names' : [],
                          'entityInfo' : [],
                          'businessDescriptions' : [],
                          'digitalPresences' : [],
                          'addresses' : [],
                          'identifiers' : []}"
  />
  <State
    id="searchRegistryData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="NewEmails"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="NewWebsites"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="AddressDeleteFlags"
    value="{{ AddressesList.value.map(()=> false)}}
"
  />
  <State
    id="IdentifierExclusionCriteriaData"
    value={
      '{\n  "id": "150",  // Exclude type 150 for Indonesia (ID)\n  "mk": "193",  // Exclude type 193 for North Macedonia (MK)\n  "ls": "221",  // Exclude type 221 for Lesotho (LS)\n  "in": "229",  // Exclude type 229 for India (IN)\n  "kh": "260",  // Exclude type 260 for Cambodia (KH)\n  "tz": "276",  // Exclude type 276 for Tanzania (TZ)\n  "sc": "279",  // Exclude type 279 for Seychelles (SC)\n  "gh": "297",  // Exclude type 297 for Ghana (GH)\n  "sk": "308",  // Exclude type 308 for Slovakia (SK)\n  "ml": "309",  // Exclude type 309 for Mali (ML)\n  "et": "310",  // Exclude type 310 for Ethiopia (ET)\n  "gn": "312",   // Exclude type 312 for Guinea (GN)\n  "ph": "320"   // Exclude type 320 for Philippines (PH)\n}'
    }
  />
  <JavascriptQuery
    id="googleCompanyData"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/googleCompanyData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="googleRegristryData"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/googleRegristryData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="metadataTableSaveChanges"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/metadataTableSaveChanges.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="metadataTableLinkReset"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/metadataTableLinkReset.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State
    id="UsersList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State id="firmoIpandRemFlag" value="false" />
  <State id="SearchedValue" value="null" />
  <RESTQuery
    id="GetMasteringByBvDID2"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering??bvd_id={{SearchedEntity.value.trim().toUpperCase()}}"
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
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "\nvar response = GetMasteringByBvDID.data;\n//exclude deleted records ODY-13419 state: 1\nif (response.header.state !== 1 ) {\n\nvar curRecord = await FilterIdentifierFromAPIResponseIdentifierPage.trigger();\n\nvar sortedAddresses = curRecord.addresses.sort((a, b) => {\n    // Convert types to numbers for proper numerical sorting\n    return Number(a.item.types[0]) - Number(b.item.types[0]);\n});\n\ncurRecord.addresses = sortedAddresses;\nAddressesList.setValue(sortedAddresses);\n const deleteFlags = sortedAddresses.map(()=> false);\nAddressDeleteFlags.setValue(deleteFlags);\n\nselectedCompany.setValue(curRecord)\n\n//  if (pageLoadValidEntity.value) {\n//    if (GetMasteringByBvDID.data === 200) {\n//      requestTypeLockUnlock.setValue('lock');\n//      setLockUnlockParams.trigger();\n//      pageLoadValidEntity.setValue(false);\n//    }\n//  }\n}",
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
      method="run"
      params={{
        ordered: [
          {
            src: 'var response = GetMasteringByBvDID.data;\n//exclude deleted records ODY-13419 state: 1\nif (response.header.state !== 1 ) {\nvar a = [];\na.push(await FilterIdentifierFromAPIResponseIdentifierPage.trigger());\nTableRecordsMastering.setValue(a);\n\niconHiddenFlag.setValue({})\nmasterRecordLinkedRemFields.setValue({})\n\n\nPromise.all([ReadMetadataRecord.trigger(),\nsearchRegistryUrl.trigger(),\n  kompanyRecordEnableCheck.trigger()\n            ]).then(()=>{\n  loadingPopUp.hide();\n  //GetAvailableNewIdentifiers.trigger();\n  EntityDetailsShow.trigger();\n //  MasterRecordEdit.show();\n \n  \n});\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
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
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("firmohome", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="GetListOfUsersData"
    body={'{\n  "email": "all"\n}'}
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/read-user-record"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
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
            src: "var resp = GetListOfUsersData.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\nUsersList.setValue(temp);\n}\n",
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
  <State id="saveNamePutArray" value="[]" />
  <State id="savePutFlag" value="[]" />
  <State id="saveEntityPutArray" value="[]" />
  <State id="saveAddressPutArray" value="[]" />
  <State id="saveDigitalPresencesPutArray" value="[]" />
  <State id="saveEntityInfoPutArray" value="[]" />
  <State id="saveIdentifiersPutArray" value="[]" />
  <State id="saveActivityDescriptions" value="[]" />
  <State
    id="GlobalListOfCompanyName"
    value={
      '{{\n  GlobalListOfCompanyName.value === \'\' || GlobalListOfCompanyName.value == null\n    ? (\n       selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "1" && item.item.localizedNames.some(loc => loc.language.toLowerCase() === "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() === "ii").name)\n      )\n    : GlobalListOfCompanyName.value\n}}\n'
    }
  />
  <State
    id="GlobalListOfLocalCompanyName"
    value={
      '{{\n  GlobalListOfLocalCompanyName.value === \'\' || GlobalListOfLocalCompanyName.value == null\n    ? (selectedCompany?.value?.names ?? [])\n    .filter(item => item?.item?.type === "1")\n    .flatMap(item =>\n      (item?.item?.localizedNames ?? [])\n        .filter(loc => loc?.language?.toLowerCase() !== "ii")\n        .map(loc => ({\n          name: loc?.name ?? "",\n          language: loc?.language ?? ""\n        }))\n    )\n    : GlobalListOfLocalCompanyName.value\n}}\n'
    }
  />
  <State
    id="GlobalListOfPrevLocalName"
    value={
      '{{\n  GlobalListOfPrevLocalName.value === \'\' || GlobalListOfPrevLocalName.value == null\n    ? (selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "3" && item.item.localizedNames.some(loc => loc.language.toLowerCase() !== "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() !== "ii").name)\n    )\n    : GlobalListOfPrevLocalName.value\n}}\n'
    }
  />
  <State
    id="GlobalListOfAkaName"
    value={
      '{{\n  GlobalListOfAkaName.value === \'\' || GlobalListOfAkaName.value == null\n    ? (selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() === "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() === "ii").name)\n    )\n    : GlobalListOfAkaName.value\n}}\n'
    }
  />
  <State
    id="GlobalListOfAkaNameLocal"
    value={
      '{{\n  GlobalListOfAkaNameLocal?.value === \'\' || GlobalListOfAkaNameLocal?.value == null\n    ? (_.uniq(selectedCompany.value.names &&\n  selectedCompany.value.names\n    .filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() !== "ii"))\n    .map(item => item.item.localizedNames.find(loc => loc.language.toLowerCase() !== "ii").name))\n    )\n    : GlobalListOfAkaNameLocal.value\n}}\n'
    }
  />
  <State
    id="GlobalLegalInformation"
    value={
      '{\n "legal" :"",\n "national" : "",\n "stateOfInc": "",\n "year" : "",\n "month":"",\n "date":""\n}'
    }
  />
  <State id="GlobalBusinessList" value="[]" />
  <State id="GlobalWebsitesList" value="[]" />
  <State id="GlobalEmailsList" value="[]" />
  <State id="GlobalAddressList" value="[]" />
  <State id="GlobalNewAddress" value="null" />
  <State id="GlobalIdentifierList" value="[]" />
  <State id="GlobalNewIdentifierDropDownList" value="[]" />
  <State id="GlobalNewIdentifierValueList" value="[]" />
  <State
    id="GlobalListOfPrevName"
    value={
      '{{\n  GlobalListOfPrevName?.value === \'\' || GlobalListOfPrevName?.value == null\n    ? (selectedCompany.value.names\n    ?.map(item => ({\n      ...item,\n      item: {\n        ...item.item,\n        localizedNames: item.item.localizedNames.filter(\n          ln => ln.language?.toLowerCase() === "ii"\n        )\n      }\n    }))\n    .filter(item => item.item.type === "3" && item.item.localizedNames.length)\n    .map(item => ({\n      name: item.item.localizedNames[0].name,\n      dateSince: !isNaN(Date.parse(item.item.dateSince)) ? item.item.dateSince : null,\n      dateUntil: !isNaN(Date.parse(item.item.dateUntil)) ? item.item.dateUntil : null\n    })).sort((a, b) => {\n        // Convert dates to moment objects upfront\n        const dateA = a.dateUntil ? moment(a.dateUntil) : null;\n        const dateB = b.dateUntil ? moment(b.dateUntil) : null;\n        \n        // Primary sort by dateUntil (descending)\n        if (dateA && dateB) {\n            return dateB.diff(dateA);\n        }\n        \n        // Handle mixed cases where one record has dateUntil and other doesn\'t\n        if (!dateA && dateB) {\n            // Records without dateUntil go after records with dateUntil\n            return 1;\n        }\n        if (dateA && !dateB) {\n            // Records with dateUntil go before records without dateUntil\n            return -1;\n        }\n        \n        // Both records lack dateUntil - sort by dateSince (descending)\n        if (!dateA && !dateB) {\n            const sinceA = a.dateSince ? moment(a.dateSince) : null;\n            const sinceB = b.dateSince ? moment(b.dateSince) : null;\n            \n            if (sinceA && sinceB) {\n                return sinceB.diff(sinceA);\n            }\n            \n            // Handle missing dateSince values\n            if (!sinceA && sinceB) return 1;\n            if (sinceA && !sinceB) return -1;\n        }\n        \n        return 0;\n    })\n    )\n    : GlobalListOfPrevName.value\n}}\n'
    }
  />
  <JavascriptQuery
    id="resetAllGlobalVariables"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/resetAllGlobalVariables.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="GlobalSubmitDisable" value="false" />
  <State id="ipAndRemAddressRecord" value="[]" />
  <State id="GlobalNewBusinessList" value="[]" />
  <State id="NewGlobalWebsitesList" value="[]" />
  <State id="GlobalAddAddress" value="[]" />
  <JavascriptQuery
    id="preMasteringCallsForFirmoHome"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/preMasteringCallsForFirmoHome.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="nationalLegalFormUpdates"
    isHidden={false}
    notificationDuration={4.5}
    query={include("./lib/nationalLegalFormUpdates.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="GlobalEntityId" value="null" />
  <RESTQuery
    id="UpdateMetadataRecord"
    body="{{ updateMetadataItem.value }}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-metadata-record?"
    queryFailureConditions={
      '[{"condition":"{{  metadata.status != 200 }}","message":"\\"There was an error saving document metadata. Please contact development team.\\""}]'
    }
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="updateMetadataItem"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="ProcessingPDF"
    body={
      '{"file_name" : {{ documentID.value }},\n"url" : {{ documentUrl.value }} }'
    }
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/processing-pdf"
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
  />
  <RESTQuery
    id="DownloadPDF"
    body={
      "{\n  \"filename\" : {{'documents/' + documentID.value + '.' + uploadFileExtension.value}}\n}"
    }
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/download-pdf"
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
            src: 'var resp = await DownloadPDF.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\n  //  console.log("PDF DOwnloaded: ", DownloadPDF.body)\n  //  console.log("temp Url: ", DownloadPDF.data.body)\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="downloadPDFLock"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="true"
  />
  <RESTQuery
    id="getPDF"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"{{uploadContentType.value}}"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{ DownloadPDF.data.body }}"
    resourceName="REST-WithoutResource"
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
      event="success"
      method="run"
      params={{
        ordered: [{ src: '//  console.log("getPDF Body: ", getPDF.query)\n' }],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="docUploadScript"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/docUploadScript.js", "string")}
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
    id="doc_linked_remediated_fields"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="doc_remediated_action"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'""'}
  />
  <State
    id="doc_verification_source"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'""'}
  />
  <State
    id="editDisableFlag"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <JavascriptQuery
    id="docUpdateScript"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/docUpdateScript.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="editDocFile" />
  <RESTQuery
    id="UploadPDFS3Doc"
    body="{{ documentFileDrop.value[0] }}"
    bodyType="binary"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"{{ uploadContentType.value }}"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{UploadPDF.data.body}}"
    resourceName="REST-WithoutResource"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="PUT"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{ ordered: [{ src: "documentFileDrop.clearValue()\n" }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="jiraComingFrom" value="''" />
</GlobalFunctions>
