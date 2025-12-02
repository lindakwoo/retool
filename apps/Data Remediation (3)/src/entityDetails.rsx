<Screen
  id="entityDetails"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="c06cdd96-fcb3-4e6c-b652-6e92fe7e0734"
>
  <RESTQuery
    id="GetMasteringByBvDID"
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
            src: '\nvar response = GetMasteringByBvDID.data;\n//exclude deleted records ODY-13419 state: 1\nif (response.header.state !== 1 ) {\n var a = [];\n var curRecord = await FilterIdentifierFromAPIResponseEntityPage.trigger();\n  selectedCompany.setValue(curRecord)\n  GlobalEntityId.setValue(response?.header?.entityID);\n  a.push(curRecord);\n  TableRecordsMastering.setValue(a);\n    (async () => {\n        try {\n            // Reset values\n            // Trigger all 3 in parallel and wait for all to complete\n            await Promise.all([\n                ReadMetadataRecord.trigger(),\n                searchRegistryUrl.trigger(),\n                kompanyRecordEnableCheck.trigger()\n            ]);\n\n            // This runs only after ALL above triggers are done\n            EntityDetailsShow.trigger();\n\n        } catch (error) {\n            console.error("One or more triggers failed:", error);\n        }\n    })()\n\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
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
      method="run"
      params={{
        ordered: [
          {
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("homeFirmo", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
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
    id="GetMasteringByOrbisId"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering?entity_id={{GlobalEntityId.value ? GlobalEntityId.value : SearchedEntity.value.trim().toUpperCase()}}"
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
            src: '\nvar response = GetMasteringByOrbisId.data;\n//exclude deleted records ODY-13419 state: 1\nif (response.header.state !== 1 ) {\n var a = [];\n var curRecord = await FilterIdentifierFromAPIResponseEntityPage.trigger();\n  selectedCompany.setValue(curRecord)\n  GlobalEntityId.setValue(response?.header?.entityID);\n  a.push(curRecord);\n  TableRecordsMastering.setValue(a);\n    (async () => {\n        try {\n            // Reset values\n            // Trigger all 3 in parallel and wait for all to complete\n            await Promise.all([\n                ReadMetadataRecord.trigger(),\n                searchRegistryUrl.trigger(),\n                kompanyRecordEnableCheck.trigger()\n            ]);\n\n            // This runs only after ALL above triggers are done\n            EntityDetailsShow.trigger();\n\n        } catch (error) {\n            console.error("One or more triggers failed:", error);\n        }\n    })()\n\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
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
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="resetAllGlobalVariables"
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
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("homeFirmo", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
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
    id="PUTMasteringRecord"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ACTIVE"},{"key":"names","value":"{{NamePutArray.value.length > 0 ? NamePutArray.value : null}}"},{"key":"activityDescriptions","value":"{{saveActivityDescriptions.value.length > 0 ? saveActivityDescriptions.value : null}}"},{"key":"entityInfo","value":"{{saveEntityInfoPutArray.value?.length === 0 ? null : saveEntityInfoPutArray.value}}"},{"key":"addresses","value":"{{saveAddressPutArray.value.length > 0 ? saveAddressPutArray.value : null}}"},{"key":"digitalPresences","value":"{{saveDigitalPresencesPutArray.value.length > 0 ? saveDigitalPresencesPutArray.value : null}}"},{"key":"identifiers","value":"{{saveIdentifiersPutArray.value.length > 0 ? saveIdentifiersPutArray.value : null}}"}]'
    }
    bodyType="json"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering"
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` v
return "
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
            src: '//  updateLinkedAttributes.trigger()\n\n//  var response = UpdateMetadataRecord.trigger()\n//  console.log("UpdateMetadataRecord Links RESPONSE : ", response)\n\n//updateLinkedAttributes.trigger()\n//  AuditTrailList.setValue({})\n\n//  loadingPopUp.hide(true)',
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
            src: "const searchBoxInputValue = SearchedEntity.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxInputValue);\n// Trigger actions after a 5-second delay\nResetFormFields.trigger();\nsetTimeout(() => {\n  if (isFirstCharacterNumber) {\n    GetMasteringByOrbisId.trigger(); \n    GetPremasteringbyORBISID.trigger();\n  } else {\n    GetMasteringByBvDID.trigger();\n    GetPremasteringByBVDID.trigger();\n  }\n}, 5000); // 5 seconds delay\n",
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
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "Success" },
                { description: "Record has been successfully updated" },
                { duration: "2" },
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
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="resetAllGlobalVariables"
      type="datasource"
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
                { notificationType: "error" },
                { title: "Error" },
                { description: "Record Not Updated" },
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
      method="openPage"
      params={{
        ordered: [
          { options: { ordered: [{ passDataWith: "urlParams" }] } },
          { pageName: "entityDetails" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="NamePutObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="NamePutArray"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="handleSaveForm"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/handleSaveForm.js", "string")}
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
    id="CompanyNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{companyNamesList.data}}"
  />
  <State
    id="CompanyLocalNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{companyLocalNamesList.data}}"
  />
  <State
    id="prevLocalNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{prevLocalNamesList.data}}"
  />
  <State
    id="akaLocalNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{akaLocalNamesList.data}}"
  />
  <State
    id="prevNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{prevNamesList.data}}"
  />
  <State
    id="akaNames"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{akaNamesList.data}}"
  />
  <JavascriptQuery
    id="ResetFormFields"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetFormFields.js", "string")}
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
    id="GetUserRoles"
    body={'{\n  "email": {{current_user.email}}\n}'}
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
            src: 'var resp = GetUserRoles.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\nCurrentUserObj.setValue(temp);\n  if(PageLoadCall.value === true) {\n    console.log("GetDataOnPageLoad trigger");\n  }\n  GetDataOnEntityPageLoad.trigger();\n \n}\n',
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
    id="companyNameFieldChange"
    confirmationMessage="Are you sure you want to delete this Company Name?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/companyNameFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="companyLocalNameFieldChange"
    confirmationMessage="Are you sure you want to delete this Company Name Local?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/companyLocalNameFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="prevNameFieldChange"
    confirmationMessage="Are you sure you want to delete this Prev Name?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/prevNameFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="prevNameLocalFieldChange"
    confirmationMessage="Are you sure you want to delete this Prev Name Local?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/prevNameLocalFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="akaNameFieldChange"
    confirmationMessage="Are you sure you want to delete this AKA Name?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/akaNameFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="akaNameLocalFieldChange"
    confirmationMessage="Are you sure you want to delete this AKA Name Local?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/akaNameLocalFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="searchRegistryUrl"
    body={
      '{\n  "urls": [\n    {\n      "country_code": {{searchRegistryId.value}}\n    }\n  ]\n}'
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
            src: ' if(GetMasteringByOrbisId.data !== null || GetMasteringByBvDID.data!== null){\n   var resp = searchRegistryUrl.data;\n\n  if (resp.statusCode === 200) {\n    //console.log("searchRegristryUrl");\n    var temp = resp.body;\n  searchRegistryData.setValue(temp);\n  }\n\n }\n',
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
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="searchRegistryData"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="searchRegistryId"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{GetMasteringByOrbisId?.data?.header?.bvdID?.substring(0,2) || GetMasteringByBvDID?.data?.header?.bvdID?.substring(0,2)}}"
  />
  <State
    id="DeleteFieldMesageObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="CompanyLocalNameLanguages"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{companyLocalNamesList}}"
  />
  <JavascriptQuery
    id="HandleCloseMasterRecord"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCloseMasterRecord.js", "string")}
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
    id="GetDataOnEntityPageLoad"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetDataOnEntityPageLoad.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="EntityDetailsShow"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/EntityDetailsShow.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="IsGetUserRolesCallRequired"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/IsGetUserRolesCallRequired.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="LinkCheckNames"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/LinkCheckNames.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="FilterIdentifierFromAPIResponseEntityPage"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/FilterIdentifierFromAPIResponseEntityPage.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Include src="./MasterRecordEdit.rsx" />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Container
      id="DetailsTitleContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <View id="3a056" viewKey="View 1">
        <Text
          id="containerTitle264"
          hidden="{{ jiraClick.value }}"
          value="### Golden Record - Edits"
          verticalAlign="center"
        />
        <ButtonGroup2
          id="orbisMasterButtonGroup"
          alignment="right"
          hidden="{{ jiraClick.value }}"
          overflowPosition={2}
        >
          <ButtonGroup2-Button
            id="de099"
            backgroundColor="rgb(204, 204, 204)"
            icon="bold/interface-arrows-synchronize"
            iconPosition="left"
            styleVariant="custom"
            text="Refresh"
          >
            <Event
              event="click"
              method="run"
              params={{
                ordered: [
                  {
                    src: "loadingPopUp.show();\nlet entityId =selectedCompany?.value?.header?.entityID ? selectedCompany?.value?.header?.entityID : GlobalEntityId.value\n\nsetTimeout(()=>{\n  const trimmedInput = entityId;\nconst isFirstCharacterNumber = /^\\d/.test(trimmedInput);\n//ResetFormFields.trigger();\n\n//metadataTableLinkReset.trigger();\n  \nResetFormFields.trigger();\nresetAllGlobalVariables.trigger();  \n  if (isFirstCharacterNumber ){\n    console.log(\"FirstCharacterNumber\");\n    requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n    GetMasteringByOrbisId.trigger();\n  } else {\n    //  console.log(\"isnot FirstCharacterNumber\");\n    GetMasteringByBvDID.trigger();\n  requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n  }\n}, 100)\n",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </ButtonGroup2-Button>
          <ButtonGroup2-Button
            id="a38a2"
            icon="bold/interface-arrows-left-alternate"
            iconPosition="left"
            styleVariant="solid"
            text="Home"
          >
            <Event
              event="click"
              method="openPage"
              params={{
                ordered: [
                  { options: { ordered: [{ passDataWith: "urlParams" }] } },
                  { pageName: "firmohome" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="run"
              params={{
                ordered: [
                  {
                    src: "lockEntity.setValue(false);\ntext533.setValue('');\n//metadataTableLinkReset.trigger();\nResetFormFields.trigger();\nresetAllGlobalVariables.trigger();",
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
              method="setValue"
              params={{ ordered: [{ value: "false" }] }}
              pluginId="loaderHideFlag"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
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
              pluginId="resetAllGlobalVariables"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
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
              pluginId="preMasteringCallsForFirmoHome"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </ButtonGroup2-Button>
        </ButtonGroup2>
        <Text
          id="text535"
          disableMarkdown={true}
          hidden="true"
          horizontalAlign="center"
          style={{
            ordered: [
              { fontSize: "h5Font" },
              { fontWeight: "h5Font" },
              { fontFamily: "h5Font" },
              { color: "danger" },
            ],
          }}
          value="{{ ValidateBvdId.data ? 'Validate BVDID' 
 : '' || 
 ValidateOrbisId.data ? 'Validate Orbis' 
 : ''|| 
 ValidateUserRole.data ? 'Validate User Role' 
 : ''}}"
          verticalAlign="center"
        />
        <Text
          id="text533"
          disableMarkdown={true}
          hidden="{{ lockEntity.value === false ? true : false }}"
          horizontalAlign="center"
          style={{
            ordered: [
              { fontSize: "h5Font" },
              { fontWeight: "h5Font" },
              { fontFamily: "h5Font" },
              { color: "danger" },
            ],
          }}
          value={
            '{{ "This entity is locked by user " + varLockMessage.value }}'
          }
          verticalAlign="center"
        />
      </View>
    </Container>
    <Include src="./EntityInfoActionsWrapper.rsx" />
    <Container
      id="navigationContainer"
      disabled="{{ValidateUserRole.data || lockEntity.value || !textErrorPrevName.hidden ||
 ValidateBvdId.data || ValidateOrbisId.data ||(CompanyNames.value.filter((name)=> name.trim() !== '').length === 0 && newCompanyName.value.trim() === '') || !companyLocalErrorMsg.hidden 
}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ jiraClick.value }}"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
    >
      <Header>
        <Text
          id="containerTitle79"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f90d9" viewKey="View 1">
        <Container
          id="navigationAccordion"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle9"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Information"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle9"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              style={{ ordered: [] }}
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigationNames"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/shopping-business-card"
                iconPosition="left"
                itemType="custom"
                label="Names"
                screenTargetId="entityDetails"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      {
                        options: {
                          ordered: [
                            { passDataWith: "urlParams" },
                            {
                              queryParams: [
                                {
                                  ordered: [
                                    { key: "orbisId" },
                                    {
                                      value:
                                        "{{ TableRecordsMastering.value[0].header.entityID }}",
                                    },
                                  ],
                                },
                                {
                                  ordered: [
                                    { key: "bvdId" },
                                    {
                                      value:
                                        "{{ TableRecordsMastering.value[0].header.bvdID }}",
                                    },
                                  ],
                                },
                                {
                                  ordered: [
                                    { key: "ticket" },
                                    {
                                      value:
                                        "{{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
                                    },
                                  ],
                                },
                              ],
                            },
                            { persistUrlParams: true },
                          ],
                        },
                      },
                      { pageName: "entityDetails" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="486e3"
                icon="bold/legal-justice-scale-1"
                iconPosition="left"
                itemType="custom"
                label="Legal Information"
                screenTargetId="legalInformation"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      {
                        options: {
                          ordered: [
                            { passDataWith: "urlParams" },
                            { persistUrlParams: false },
                            { globalVariable: "" },
                          ],
                        },
                      },
                      { pageName: "legalInformation" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="0e62c"
                icon="bold/shopping-business-table"
                iconPosition="left"
                itemType="custom"
                label="Business Description"
                screenTargetId="business"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "business" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion2"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle10"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Contact"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle10"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion2.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion2"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation13"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/computer-connection-network"
                iconPosition="left"
                itemType="custom"
                label="Digital Presence"
                screenTargetId="digitalPresence"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "digitalPresence" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method={null}
                  params={{ ordered: [] }}
                  pluginId=""
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="0e62c"
                icon="bold/programming-web-address-field-alternate"
                iconPosition="left"
                itemType="custom"
                label="Addresses"
                screenTargetId="address"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "address" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'let curRecord = { ...selectedCompany.value };\nconsole.log("Original:", curRecord);\nlet expandedAddresses = [];\ncurRecord.addresses.forEach(addr => {\n    if (addr.item.localizedAddresses && addr.item.localizedAddresses.length > 1) {\n        addr.item.localizedAddresses.forEach(localized => {\n            let newAddr = JSON.parse(JSON.stringify(addr)); // Deep copy\n            newAddr.item.localizedAddresses = [localized];\n            expandedAddresses.push(newAddr);\n        });\n    } else {\n        expandedAddresses.push(addr);\n    }\n});\n\n\nlet sortedAddresses = expandedAddresses.sort((a, b) =>\n  Number(a?.item?.types?.[0] ?? 0) - Number(b?.item?.types?.[0] ?? 0)\n);\nconsole.log("Sorted:", sortedAddresses);\n\ncurRecord.addresses = sortedAddresses;\nAddressesList.setValue(sortedAddresses);\nconsole.log("AddressesList :", AddressesList);\nconst deleteFlags = sortedAddresses.map(() => false);\nAddressDeleteFlags.setValue(deleteFlags);\n\nselectedCompany.setValue(curRecord);\nconsole.log("Updated company:", curRecord);\n',
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
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion3"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle11"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Identifiers"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle11"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion3.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion3"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation14"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/interface-id-iris-scan-alternate"
                iconPosition="left"
                itemType="custom"
                label="Identifiers"
                screenTargetId="identifiers"
              >
                <Event
                  event="click"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'utils.openPage("identifiers", { newTab: false });\nGetAvailableNewIdentifiers.trigger();\n',
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
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="FormWrapper"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ jiraClick.value }}"
      padding="12px"
      showBody={true}
      styleContext={{ ordered: [] }}
    >
      <Header>
        <Text
          id="containerTitle66"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Include src="./MyEditsContainer2.rsx" />
        <Include src="./MyEditsContainer.rsx" />
      </View>
    </Container>
    <Button
      id="CloseMasterRecordBtn"
      disabled=""
      hidden="{{ jiraClick.value }}"
      marginType="normal"
      style={{ ordered: [{ background: "#f6f6f6" }] }}
      submitTargetId=""
      text="Close"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleCloseMasterRecord"
        type="datasource"
        waitMs="200"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="metadataTableLinkReset"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="saveButton"
      disabled="{{ValidateUserRole.data || lockEntity.value || !textErrorPrevName.hidden ||
 ValidateBvdId.data || ValidateOrbisId.data ||(CompanyNames.value.filter((name)=> name.trim() !== '').length === 0 && newCompanyName.value.trim() === '') || !companyLocalErrorMsg.hidden 
}}"
      hidden="{{ jiraClick.value }}"
      marginType="normal"
      style={{ ordered: [{ background: "primary" }] }}
      submitTargetId=""
      text="Save"
    >
      <Event
        event="click"
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
        pluginId="LinkCheckNames"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleSaveForm"
        type="datasource"
        waitMs="200"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'loadingPopUp.show()\n\nconst linkCheck = await linkDisableSave.trigger()\n\nif (linkCheck[0] == false){\n  savePutFlag.setValue(true)\n  \n} else {\n  loadingPopUp.setHidden(true);\n  utils.showNotification({\n        title: "Warning",\n        //  description: `Atleast 1 Edited Attribute Needs to Be Linked Before Saving: \\n ${disable_save[1]}`,\n        //  "Upload or link the required document as evidence for the Updates as evidence. This is a required step for data transparerency."\n        description: `Please upload or link the required sections ${linkCheck[1]} …`,\n        notificationType: "warning",\n        duration: 3,\n    });\n    \n}',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs=""
        waitType="debounce"
      />
    </Button>
  </Frame>
</Screen>
