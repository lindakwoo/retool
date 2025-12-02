<Screen
  id="home"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Default Page"
  urlSlug=""
  uuid="b6b33931-635b-473e-af36-783ee26c9aaf"
>
  <RESTQuery
    id="GetContactInfoByUCI"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering?entity_id={{SearchedEntity.value.trim().toUpperCase()}}"
    resourceName="52eb7c30-a6b2-48cd-bda4-3d4a923af8bd"
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
            src: "var a = [];\nvar response = GetContactInfoByUCI.data;\na.push(response);\nContactsList.setValue(a);\nif(DeleteFunctionRoleFlag.value === false){\n  CurrentSelectedContact.setValue(response);\n  }\n\n\nif (response.header.state.toLowerCase() === 'deleted') {\n  utils.showNotification({\n    title: 'UCI Deleted',\n    description: 'The UCI is Deleted',\n    notificationType: 'error',\n    duration: '5',\n  })\n} else if (response.header.state.toLowerCase() !== 'deleted' && response.header.state.toLowerCase() !== 'active' && response.header.state.toLowerCase() !== 'suppressed') {\n  utils.showNotification({\n    title: 'UCI Unknown',\n    description: 'The UCI state ' +\n      response.header.state + ' is not supported',\n    notificationType: 'error',\n    duration: '5',\n  })\n}\nelse {\n  if(DeleteFunctionRoleFlag.value === false){\n    UserDetailsModal.show(); \n  }\n}\n\n\nloadingPopUp.setHidden(true);",
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="RoleBasedFeildsForEditable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="run"
      params={{ ordered: [{ src: "loadingPopUp.hide();" }] }}
      pluginId=""
      type="script"
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
                { notificationType: "warning" },
                { title: "Warning" },
                { description: "Record Not Found" },
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
  <RESTQuery
    id="GetContactInfoByUCIPreMastering"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering?entity_id={{SearchedEntity.value.trim().toUpperCase()}}"
    resourceName="52eb7c30-a6b2-48cd-bda4-3d4a923af8bd"
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
            src: "var curIPRecords = GetContactInfoByUCIPreMastering.data.filter((a) => a.header.source !== 'REMEDIATED');\n\nvar curRemediatedRecords = GetContactInfoByUCIPreMastering.data.filter((a) => a.header.source === 'REMEDIATED');\n\nContactIPRecordsList.setValue(curIPRecords);\nContactRemediatedRecordsList.setValue(curRemediatedRecords);\n//loadingPopUp.setHidden(true);",
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
      pluginId="ContactIPRecordsList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="RemCurrentRolePreMasteringList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="RemPreviousRolePreMasteringList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="ContactRemediatedRecordsList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="CurrentRolePreMasteringList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="PreviousRolePreMasteringList"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="contactListLength"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="0"
  />
  <State
    id="ModifiedCompany"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'{\n  Data : "",\n  Address : 0,\n  Name : 0,\n  Network : 0\n  }'}
  />
  <State
    id="Namebody"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{
}"
  />
  <JavascriptQuery
    id="SegregatedGet"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/SegregatedGet.js", "string")}
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
    id="ShowRegistryModal"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <JavascriptQuery
    id="kompanyButtonScript"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/kompanyButtonScript.js", "string")}
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
    id="businessDescription"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <State
    id="currentNavSelectedItem"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="0"
  />
  <State
    id="companySearchData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={
      '{{ GetMasteringByOrbisId.data.Names.filter(function(eachName) {\n  return (eachName.Item.type === "1" && eachName.Item.localizedNames[0].language.toLocaleLowerCase() === "ii")\n})[0].Item.localizedNames[0].name}}'
    }
  />
  <JavascriptQuery
    id="GetDataOnPageLoad"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetDataOnPageLoad.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="batchProcess"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <State
    id="ProcessBtnClick"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <JavascriptQuery
    id="batchProcessDataSet"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/batchProcessDataSet.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="UploadPDFPutBatchProcess"
    body="{{browseExcelFile.value[0]}}"
    bodyType="binary"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={
      '[{"key":"Content-Type","value":"{{browseExcelFile.value[0].type}}"}]'
    }
    isHidden={false}
    isMultiplayerEdited={false}
    query="{{ UploadPdfBatchProcess.data.body }}"
    resourceName="REST-WithoutResource"
    runWhenModelUpdates={false}
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
            src: "var updateData = await UploadPDFPutBatchProcess.metadata\nif (updateData.status === 200) {\n  UploadBatchRecord.trigger();  \n}\nconsole.log('updateData', updateData);",
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
      params={{ ordered: [{ src: "loadingPopUp.setHidden(true);" }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="UploadBatchRecord"
    body={
      '[{"key":"batch_file","value":"{{browseExcelFile.value[0].name}}"},{"key":"batch_id","value":"{{(batchProcessTable.data.length !== 0 && batchProcessTable.data[0].batch_id) ?batchProcessTable.data[0].batch_id : uuid.v4() }}"},{"key":"{{(batchProcessTable.data.length !== 0 && batchProcessTable.data[0].batch_id) ? \\"refresh\\": \\"\\"}}","value":"{{(batchProcessTable.data.length !== 0 && batchProcessTable.data[0].batch_id) ? \\"true\\": \\"false\\"}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/upload-batch-records"
    queryTimeout="30000"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
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
            src: "loadingPopUp.setHidden(true);\n\nvar response = await UploadBatchRecord;\n\nlet showNotificationData = (notificationValue) => {\n  utils.showNotification({\n      title : \"Success\",\n      description: notificationValue,\n      notificationType: \"Success\",\n      duration: 3,\n    });\n    \n}\n\nif (response.data.statusCode === 200) {\n  // If process button click then reset value.\n  //  console.log('ProcessBtnClick.value', ProcessBtnClick.value);\n  \n  // Change key of country Iso to country iso code.\n  let updateKey = [];\n  if (response.data.body.length !== 0) {\n    updateKey = response.data.body.map(obj => {\n      obj.country_iso_code = obj.country_iso;\n      delete obj.country_iso;\n      return obj;\n    });\n  }\n  //  console.log('updateKey', updateKey);\n  VarBatchProcessData.setValue(updateKey);\n  let checkOldValueExists = false;\n  let errorDataCount = 0, goodDataCount = 0, notProcessCount = 0 ;\n  // Check if flow cancel process or process button click \n  //  console.log('CancelProcessBtnClicked', CancelProcessBtnClicked.value);\n  //    console.log('ProcessBtnClick', ProcessBtnClick.value);\n  if (CancelProcessBtnClicked.value || ProcessBtnClick.value) {\n    \n    \n    \n    // Check if calling multiple time\n    let increaseCount = CountUploadBatchRecordCall.value + 1;\n    CountUploadBatchRecordCall.setValue(increaseCount);\n    if (response.data.body.length !== 0) {\n      checkOldValueExists = response.data.body.some(item => item.status === 'validation_failed' || item.status === 'validation_completed');\n    }\n    console.log('CountUploadBatchRecordCall1', CountUploadBatchRecordCall.value);\n    if (checkOldValueExists && CountUploadBatchRecordCall.value <= 15) {\n        loadingPopUp.setHidden(false);\n        UploadBatchRecord.trigger();\n        return;\n    }\n    console.log('CountUploadBatchRecordCall', CountUploadBatchRecordCall);\n    if (CountUploadBatchRecordCall.value >= 16) {\n       utils.showNotification({\n        title : \"Error\",\n        description: 'Batch processing taking longer than expected, please check history tab for current status of batch.',\n        notificationType: \"error\",\n        duration: 3,\n      });\n    }\n\n    CountUploadBatchRecordCall.setValue(0);\n    if (!checkOldValueExists) {\n      updateKey.forEach((data) => {\n      if (data.status === \"process_failed\") {\n        errorDataCount++;\n      } else if (data.status === \"process_completed\" ) {\n        goodDataCount++;\n      } else if (data.status === \"not_sent_for_process\" ) {\n        notProcessCount++;\n      }\n      })\n      AlertMessageDetail.setValue(`Process complete: ${goodDataCount} \\n \\nProcess failed: ${errorDataCount} \\n \\nNot send for process records. ${notProcessCount}`);\n      PopUpOpen.trigger();\n    }\n  }\n  \n  \n\n  if (CancelProcessBtnClicked.value) {\n    // Clear the selection of row.\n    batchProcessTable.clearSelection();\n    UploadBtnControl.setValue(false);\n    // If cancel process fail.\n    if (CountUploadBatchRecordCall.value < 16) {\n      showNotificationData('Cancel Process successful.');\n    }\n    \n    CancelProcessBtnClicked.setValue(false);\n    ProcessBtnClick.setValue(false);\n    \n  } else if (ProcessBtnClick.value) {\n  \n    // Clear the selection of row.\n    batchProcessTable.clearSelection();\n    \n    // Reset the value of disable or enable upload.\n    UploadBtnControl.setValue(false);\n    // If process fail.\n    if (CountUploadBatchRecordCall.value < 16) {\n      showNotificationData('Process data successful.');\n    }\n    ProcessBtnClick.setValue(false);\n  } else {\n    // Selected row.    \n    console.log('updateKey.length', updateKey.length);\n    UploadBtnControl.setValue(true);\n\n    showNotificationData('Upload data successful.');\n    \n    // Show pop up after browse file.\n    updateKey.forEach((data) => {\n      if (data.status === \"validation_failed\") {\n        errorDataCount++;\n      } else if (data.status === \"validation_completed\" ) {\n        goodDataCount++;\n      }\n    })\n    AlertMessageDetail.setValue(`Validation pass: ${goodDataCount} \\n\\n Validation failed: ${errorDataCount}`);\n    //  PopUpOpen.setHidden(false);\n    PopUpOpen.trigger();\n\n   batchProcessTable.selectRow({ index: _.range(0, updateKey.length) });\n  }\n  loadingPopUp.setHidden(true);\n} else {\n  console.log('Process fail')\n  loadingPopUp.setHidden(true);\n   //  ProcessBtnClick.setValue(false);\n  utils.showNotification({\n    title : \"Error\",\n    description: response.data.body,\n    notificationType: \"error\",\n    duration: 3,\n  });\n}\n\n",
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
            src: "console.log('testing fail');\nloadingPopUp.setHidden(true);",
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
    id="BatchProcessApiVar"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'{\n"records_to_process" : [],\n"records_not_to_process": []\n}'}
  />
  <State
    id="AlertMessageDetail"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="''"
  />
  <JavascriptQuery
    id="batchProcessDataSet2"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/batchProcessDataSet2.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="PopUpOpen"
    confirmationMessage="{{AlertMessageDetail.value}}"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="CancelProcessBtnClicked"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <State
    id="CountUploadBatchRecordCall"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="0"
  />
  <State
    id="ContactsList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="CurrentSelectedContact"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="BiographiesListValue"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{BiographiesList.data.map(item => item.FunctionOriginalAndDepOriginalLanguage)}}"
  />
  <State
    id="CurrentRoleDeleteFlagList"
    value="{{ CurrentSelectedContact.value.MEMBERSHIP.map((o)=>  false) }}"
  />
  <State id="ContactIPRecordsList" value="[]" />
  <State id="ContactRemediatedRecordsList" value="[]" />
  <JavascriptQuery
    id="HandleSaveContact"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleSaveContact.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="PUTContactMasteringRecord"
    body={
      '[{"key":"entityID","value":"{{CurrentSelectedContact.value.header.entityID}}"},{"key":"recordStatus","value":"{{ suppressFlag.value ? \'SUPPRESSED\' : \'ACTIVE\' }}"},{"key":"names","value":"{{ContactNamePutArray.value.length > 0 ? ContactNamePutArray.value : null}}"},{"key":"personalInfo","value":"{{ Object.keys(PersonalInfoPutObj.value).length > 0 ? PersonalInfoPutObj.value : null }}"},{"key":"addresses","value":"{{AddressesPutArr.value.length > 0 ? AddressesPutArr.value : null}}"},{"key":"educations","value":"{{ EducationPutArr.value.length > 0 ? EducationPutArr.value: null }}"},{"key":"biographies","value":"{{ BiographyPutArr.value.length > 0 ? BiographyPutArr.value : null }}"},{"key":"disqualifications","value":"{{DisqualificationPutArr.value.length > 0 ? DisqualificationPutArr.value : null}}"},{"key":"miscellaneous","value":"{{Object.keys(MiscellaneousPutReq.value).length > 0 ? MiscellaneousPutReq.value : null}}"},{"key":"identifiers","value":"{{IdentifierPutReq.value.length > 0 ? IdentifierPutReq.value : null}}"},{"key":"contactInformations","value":"{{ ContactPutArr.value.length > 0 ? ContactPutArr.value : null }}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering"
    resourceName="52eb7c30-a6b2-48cd-bda4-3d4a923af8bd"
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
      params={{ ordered: [{ src: "ResetIndividualFormFields.trigger();" }] }}
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
            src: "loadingPopUp.show();\nsetTimeout(() => {\n  GetContactInfoByUCI.trigger();\n      GetContactInfoByUCIPreMastering.trigger();\n  GetDirectorsIdsManagerAllData.trigger();\n  GetDisplayDirectorIds.trigger();\n  GetAllRoles.trigger();\n\n}, 5000);",
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
            src: "const response = PUTContactMasteringRecord.data;\n\nif (response.header.state === 'suppressed') {\n  utils.showNotification(\n    {\n    title: 'Success',\n    description: 'Individual has been successfully suppressed',\n    notificationType: 'success',\n      duration: 3\n  })\n} else if (response.header.state === 'active' && !activeFlag.hidden) {\n  utils.showNotification(\n    {\n    title: 'Success',\n    description: 'Individual has been successfully made active',\n    notificationType: 'success',\n      duration: 3\n  })\n} else {\n  utils.showNotification(\n    {\n    title: 'Success',\n    description: 'Individual has been successfully updated',\n    notificationType: 'success',\n      duration: 4.5\n  })\n}",
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="GetDisplayDirectorIds"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "createAuditTrail.trigger()\n//  AuditTrailList.setValue({})\n\n//  loadingPopUp.hide(true)",
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
  </RESTQuery>
  <State
    id="PersonalInfoPutObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="DeleteRemediatedContactRecord"
    body={
      '[{"key":"entityId","value":"{{ContactRemediatedRecordsList?.value[0]?.header?.entityId}}"},{"key":"recordStatus","value":"ARCHIVED"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering"
    resourceName="52eb7c30-a6b2-48cd-bda4-3d4a923af8bd"
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
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "Success" },
                { description: "Record has been successfully deleted" },
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
      method="setValue"
      params={{ ordered: [{ value: "[]" }] }}
      pluginId="ContactRemediatedRecordsList"
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
            src: '//AUDIT TRAIL List Creation\n\n        var audit_trail = {}\n        audit_trail.entity_id = ContactRemediatedRecordsList?.value[0]?.header?.entityId\n        audit_trail.orbis_id = ""\n        audit_trail.bvd_id = ""\n        audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()\n        audit_trail.items = audit_trail.items = [{\n"new_value": "",\n"prev_value": "",\n"field_path": "",\n"item_hash": "", "remediation_action": "ARCHIVE"}\n]\n        audit_trail.ticket_id = urlparams.ticket\n        audit_trail.object_type = "uci"\n        audit_trail.source = "REMEDIATED"\n\n\n        AuditTrailList.setValue(audit_trail)\ncreateAuditTrail.trigger()',
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
            src: 'loadingPopUp.show(); // Show loading popup\n\n// Execute other logic\nCurrentPreRoles.setValue([]);\nPreviousPreRoles.setValue([]);\nGetContactInfoByUCIPreMastering.trigger();\nDeleteGetAllHistorizationStatusPreMastering.trigger();\nPreAndRemFlagDelete.setValue(true);\nCurrentSelectedContact.setValue({});\n\n// Wait 5 seconds before triggering GetContactInfoByUCI\nsetTimeout(() => {\n   console.log("GetContactInfoByUCI  trigger after 5 seconds :");\n  GetContactInfoByUCI.trigger();\n  console.log("modalclose trigger:");\n  modalclose.trigger();\n\n  // Hide the loader after executing everything\n  loadingPopUp.hide(true);\n  \n\n}, 5000);\n\n\n\n\n\n',
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
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "warning" },
                { title: "Warning" },
                { description: "Record Could not be deleted" },
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
      method="run"
      params={{ ordered: [{ src: " loadingPopUp.setHidden(true);" }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="EducationValuesList"
    value="{{CurrentSelectedContact.value.educations ? CurrentSelectedContact.value.educations.map((o)=> o.item): []}}"
  />
  <State
    id="EducationPutArr"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="AddressesPutArr"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="BiographyValuesList"
    value="{{CurrentSelectedContact.value.biographies.map((o)=> o.item)}}"
  />
  <State
    id="BiographyPutArr"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="handleDeleteField"
    _additionalScope={["fieldName"]}
    confirmationMessage="Are you sure you want to delete?"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleDeleteField.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="EducationsDeleteFlags"
    value="{{CurrentSelectedContact.value.educations.map((o)=> false)}}"
  />
  <JavascriptQuery
    id="HandleEducationDelete"
    confirmationMessage="Are you sure you want to Delete?"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/HandleEducationDelete.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleBiographyDelete"
    confirmationMessage="Are you sure you want to Delete?"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/HandleBiographyDelete.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="BiographyDeleteFlags"
    value="{{CurrentSelectedContact.value.biographies.map((o)=> false)}}"
  />
  <JavascriptQuery
    id="ResetIndividualFormFields"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetIndividualFormFields.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="DisqualificationPutArr" value="[]" />
  <State id="MiscellaneousPutReq" value="{}" />
  <State
    id="directorsIdInputState"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="directorsIdsManagerApi"
    body="{{directorsIdInputState.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/director-ids-manager"
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
            src: 'var resp = directorsIdsManagerApi.data;\n//directorsIdsManagerAllData.trigger();\nif (resp.statusCode === 200) {\n  var results = [].concat(resp.body.result); // Ensure results is always an array\n\n  if (results.length > 0) {\n    //console.log("directorsIdManager data", results);\n\n    // Set the value of the temporary state directorsIdManager\n    directorsIdManagerData.setValue(results);\n    loadingPopUp.setHidden(true);\n     utils.showNotification({\n      title: "Success",\n      description: "Data Fetched/Updated Successfully",\n      notificationType: "Success",\n      duration: 1 // Duration in seconds\n    });\n  } else {\n    console.log("directorsIdManager no results found.");\n    loadingPopUp.setHidden(true);\n    directorsIdManagerData.setValue(null);\n\n    // Show warning notification\n    utils.showNotification({\n      title: "Warning",\n      description: "No results found.",\n      notificationType: "warning",\n      duration: 2 // Duration in seconds\n    });\n  }\n} else if (resp.statusCode === 409) {\n  // Handle entityIPSource already exists scenario\n  console.log("Error: entityIPSource already exists.");\n  loadingPopUp.setHidden(true);\n\n  // Show error notification\n  utils.showNotification({\n    title: "Conflict",\n    description: "The entityIPSource already exists.",\n    notificationType: "error",\n    duration: 2 // Duration in seconds\n  });\n} else {\n  console.log("Error: directorsIdManager API call unsuccessful.");\n  loadingPopUp.setHidden(true);\n\n  // Show error notification\n  utils.showNotification({\n    title: "Error",\n    description: "The directorsIdManager API call was unsuccessful.",\n    notificationType: "error",\n    duration: 2 // Duration in seconds\n  });\n}\n',
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
      pluginId="directorIdsEditForm"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setHidden"
      params={{ ordered: [] }}
      pluginId="directorIdsAddForm"
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
            src: "if (CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin'))) {\n \n  createEntityIPButton.setDisabled(false);\n  \n} else {\n  \n  console.log(\"true\");\n  createEntityIPButton.setDisabled(true);\n}\n",
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
    id="directorsIdManagerData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <JavascriptQuery
    id="editDirectorsIdData"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/editDirectorsIdData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetDirectorsIdsManagerAllData"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/director-ids-manager"
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
            src: 'var resp = GetDirectorsIdsManagerAllData.data;\n\nif (resp.statusCode === 200) {\n  var results = [].concat(resp.body.result); // Ensure results is always an array\n\n  if (results.length > 0) {\n   // console.log("directorsIdManager data", results);\n\n    //// Set the value of the temporary state directorsIdManager\n    directorsIdsFullData.setValue(results);\n    loadingPopUp.setHidden(true);\n    //   utils.showNotification({\n    //    title: "Success",\n    //    description: "Data Fetched Successfully",\n    //    notificationType: "Success",\n    //    duration: 1 // Duration in seconds\n    //  });\n    GetDisplayDirectorIds.trigger();\n  } \n} else {\n  console.log("Error: directorsIdManager API call unsuccessful.");\n  loadingPopUp.setHidden(true);\n\n  // Show error notification\n  utils.showNotification({\n    title: "Error",\n    description: "The directorsIdManager All API call was unsuccessful.",\n    notificationType: "error",\n    duration: 1 // Duration in seconds\n  });\n}\n',
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
      pluginId="directorIdsEditForm"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setHidden"
      params={{ ordered: [] }}
      pluginId="directorIdsAddForm"
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
            src: "if (CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin'))) {\n  createEntityIPButton.setDisabled(false)\n}else\n{\n  console.log(\"true\")\n  createEntityIPButton.setDisabled(true)\n}",
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
    id="directorsIdsFullData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
  />
  <JavascriptQuery
    id="CreateDirectorsIdData"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/CreateDirectorsIdData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="IdentifierPutReq" value="[]" />
  <JavascriptQuery
    id="GetDisplayDirectorIds"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetDisplayDirectorIds.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="DisplayDirectorIds" value="[]" />
  <JavascriptQuery
    id="HandleDirectorIdDelete"
    confirmationMessage="Are you sure you want to Delete?"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/HandleDirectorIdDelete.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleDirectorIdChange"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleDirectorIdChange.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="NonDisplayDirectorIds" value="[]" />
  <State id="OriginalDisplayDirectorIds" value="[]" />
  <State id="ContactPutArr" value="[]" />
  <State id="CurrentRoles" value="[]" />
  <RESTQuery
    id="GetCurrentFunctions"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&historization_status=1&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="RoleBasedFeildsForEditable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="CurrentSelectedRole" value="{}" />
  <State id="CurrentRolesCurPage" value="1" />
  <State id="RolesPageSize" value="2" />
  <State id="CurrentRolesTotalPages" value="0" />
  <JavascriptQuery
    id="HandleRolesData"
    _additionalScope={["rolesData"]}
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleRolesData.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="PreviousRoles" value="[]" />
  <State id="PreviousRolesTotalPages" value="0" />
  <State id="PreviousRolesCurPage" value="0" />
  <JavascriptQuery
    id="GetPaginatiedRoles"
    _additionalScope={["page", "pageSize", "items"]}
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/GetPaginatiedRoles.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetPreviousFunctions"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&historization_status=2&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="RoleBasedFeildsForEditable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="CurrentRoleTotalElements" value="120" />
  <State id="PreviousRoleTotalElements" value="120" />
  <JavascriptQuery
    id="HandlePreviousRolesData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandlePreviousRolesData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleSaveRole"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleSaveRole.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetCurrentFunctionsPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering?uci={{search_box.value.trim()}}&historization_status=1&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleCurrentPreMasteringRolesData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCurrentPreMasteringRolesData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="CurrentPreRoles" value="[]" />
  <State id="CurrentPreRolesTotalPages" value="0" />
  <State id="CurrentPreRoleTotalElements" value="1" />
  <RESTQuery
    id="GetPreviousFunctionsPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering?uci={{search_box.value.trim()}}&historization_status=2&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandlePreviousPreMasteringRolesData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandlePreviousPreMasteringRolesData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="PreviousPreRoles" value="[]" />
  <State id="PreviousPreRolesTotalPages" value="0" />
  <State id="PreviousPreRoleTotalElements" value="1" />
  <State id="CurrentRolePreMasteringList" value="[]" />
  <State id="PreviousRolePreMasteringList" value="[]" />
  <JavascriptQuery
    id="filteredRemRoles"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/filteredRemRoles.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="FunctionPutReq" value="{}" />
  <RESTQuery
    id="PUTFunctionMastering"
    body={
      '[{"key":"entityId","value":"{{ FunctionPutReq.value.entityId }}"},{"key":"recordStatus","value":"{{ FunctionPutReq.value.recordStatus}}"},{"key":"functions","value":"{{ FunctionPutReq.value.functions }}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="record/premastering"
    queryTimeout="30000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
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
          { src: "//RolesModal.hide();\n//ResetRolesFields.trigger();\n" },
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
            src: "loadingPopUp.show();\nsetTimeout(() => {\n  GetAllRoles.trigger();\nvar curResponse = PUTFunctionMastering.data;\nvar obj = {\n  entityId: curResponse.entityId,\n  state: curResponse.recordStatus,\n  function: curResponse.functions[0],\n  functionCodes: curResponse.header.functionCodes  \n}\n//  CurrentSelectedRole.setValue(obj)\n  GetLatestFunctionRecord.trigger({\n    additionalScope: {\n      curRecord: obj\n    }\n  });\n}, 5000);",
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
                { description: "Role has been successfully updated" },
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
      method="run"
      params={{
        ordered: [
          {
            src: "createAuditTrail.trigger()\n//  AuditTrailList.setValue({})\n\n//  loadingPopUp.hide(true)",
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
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "warning" },
                { title: "Warning" },
                { description: "Role Not Updated" },
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
  </RESTQuery>
  <JavascriptQuery
    id="ResetRolesFields"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetRolesFields.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetCurrentRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ searchOrbisId.value }}&historization_status=1"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleCurrentRolesByOrbisData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCurrentRolesByOrbisData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="rolesModalOptions"
    value="{{ {readOnly: false, title: 'Current Roles'} }}"
  />
  <RESTQuery
    id="DeleteFunctionRoles"
    body={
      '[{"key":"entityId","value":"{{CurrentSelectedRole.value.entityId}}"},{"key":"recordStatus","value":"{{ \\n  CurrentSelectedRole?.value?.state?.toLowerCase() === \'suppressed\' && CurrentSelectedRole?.value?.function?.action === \'OVERWRITE\' \\n    ? \\"Active\\" \\n    : \\"ARCHIVED\\" \\n}}\\n"}]'
    }
    bodyType="json"
    cookies="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
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
            src: '  utils.showNotification({\n       title: "Success",\n       description: "Record has been successfully deleted",\n       notificationType: "Success",\n        duration: 1 // Duration in seconds\n      });',
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
            src: "DeleteGetAllHistorizationStatusPreMastering.trigger();\nsetTimeout(() => {\n  GetAllRoles.trigger();\n  console.log('modalclose trigger:');\n  modalclose.trigger();\n  \n  remPreSearchOrbisId.clearValue();\n  loadingPopUp.setHidden(true);\n}, 5000);\n  ",
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
            src: '//AUDIT TRAIL List Creation\n    var audit_trail = {}\n    audit_trail.entity_id = CurrentSelectedRole.value.entityId.split(\'_\')[0]\n    audit_trail.orbis_id = CurrentSelectedRole.value.function.item.misc.orbisID\n    audit_trail.bvd_id = CurrentSelectedRole.value.function.item.misc.idCompany\n\n    audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()\n    audit_trail.items = audit_trail.items = [{\n"new_value": "",\n"prev_value": "",\n"field_path": "",\n"item_hash": "", "remediation_action": "ARCHIVE"}\n]\n    audit_trail.ticket_id = urlparams.ticket\n    audit_trail.object_type = "uci/role"\n    audit_trail.source = "REMEDIATED"\n\n\n    AuditTrailList.setValue(audit_trail)\ncreateAuditTrail.trigger()',
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
            src: '  utils.showNotification({\n       title: "Warning",\n       description: "Record Could not be deleted",\n       notificationType: "warning",\n        duration: 1 // Duration in seconds\n      });',
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
            src: " loadingPopUp.setHidden(true);\nremPreSearchOrbisId.clearValue();",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="PreAndRemFlagRefresh" value="false" />
  <State id="PreAndRemFlagDelete" value="false" />
  <RESTQuery
    id="GetPreviousRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ searchOrbisId.value }}&historization_status=2"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandlePreviousRolesByOrbisData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandlePreviousRolesByOrbisData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="MonthsList"
    value={
      '[\n  { name: "January", value: "01" },\n  { name: "February", value: "02" },\n  { name: "March", value: "03" },\n  { name: "April", value: "04" },\n  { name: "May", value: "05" },\n  { name: "June", value: "06" },\n  { name: "July", value: "07" },\n  { name: "August", value: "08" },\n  { name: "September", value: "09" },\n  { name: "October", value: "10" },\n  { name: "November", value: "11" },\n  { name: "December", value: "12" },\n]'
    }
  />
  <JavascriptQuery
    id="RoleBasedFeildsForEditable"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/RoleBasedFeildsForEditable.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="GetLatestFunctionRecord"
    _additionalScope={["curRecord"]}
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetLatestFunctionRecord.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetCurrentRolesByFunctionCode"
    _additionalScope={["historization_status", "function_codes", "target_id"]}
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ target_id }}&historization_status={{ historization_status }}&function_codes={{ function_codes }}"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
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
            src: "ResetRolesFields.trigger();\nCurrentSelectedRole.setValue({});\n\nconst rolesData = GetCurrentRolesByFunctionCode.data;\n\nconsole.log('Inside Handle Single Current Role')\nif (rolesData && rolesData.content) {\n\n  console.log(rolesData)\n  const rolesContent = rolesData.content;\n  console.log(rolesContent);\n\n  rolesContent.forEach((eachRole) => {\n    const curRole = JSON.parse(eachRole);\n    console.log(curRole);\n    curRole.functions.forEach((eachFun) => {\n      console.log(curRole);\n      var obj = {\n        entityId: curRole.entityId,\n        functionCodes: curRole.header.functionCodes,\n        function: eachFun,\n        state: curRole.header.state\n      }\n      CurrentSelectedRole.setValue(obj);\n    });\n  });\n} else {\n  CurrentSelectedRole.setValue({});\n}",
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
  </RESTQuery>
  <State
    id="RoleBiographyListValues"
    value="{{  CurrentSelectedRole.value.function.item.biographies}}"
  />
  <JavascriptQuery
    id="getNominationStartYears"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationStartYears.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getNominationEndYears"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationEndYears.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetAllRolesByOrbisIdPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query={
      'record/premastering?uci={{search_box.value.trim()}}&target_id={{preSearchOrbisId.value === ""? remPreSearchOrbisId.value : preSearchOrbisId.value}}'
    }
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandleCurrentRolesByOrbisDataPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/HandleCurrentRolesByOrbisDataPreMastering.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetPreviousRolesByOrbisIdPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query={
      'record/premastering?uci={{search_box.value.trim()}}&target_id={{preSearchOrbisId.value === ""? remPreSearchOrbisId.value : preSearchOrbisId.value}}'
    }
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="HandlePreviousRolesByOrbisDataPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/HandlePreviousRolesByOrbisDataPreMastering.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State id="NoFilterForPreCheck" value="false" />
  <JavascriptQuery
    id="preMasteringFilterOnClear"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/preMasteringFilterOnClear.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="searchRoleFlagForPreAndRem" value="false" />
  <JavascriptQuery
    id="getNominationStartMonths"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationStartMonths.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getNominationStartDays"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationStartDays.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getNominationEndMonths"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationEndMonths.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getNominationEndDays"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getNominationEndDays.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <State id="Search" value="false" />
  <RESTQuery
    id="GetNoUpdateFunctions"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&historization_status=3&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetNoRecentFunctions"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&historization_status=5&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="GetAllRoles"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetAllRoles.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="GetAllRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetAllRolesByOrbisId.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetNoUpdateRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ searchOrbisId.value }}&historization_status=3"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetNoRecentRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ searchOrbisId.value }}&historization_status=5"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetNoUpdateFunctionsPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering?uci={{search_box.value.trim()}}&historization_status=3&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="GetAllHistorizationStatusPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetAllHistorizationStatusPreMastering.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetNoRecentFunctionsPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering?uci={{search_box.value.trim()}}&historization_status=5&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetNoUpdateRolesByOrbisIdPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query={
      'record/premastering?uci={{search_box.value.trim()}}&target_id={{preSearchOrbisId.value === ""? remPreSearchOrbisId.value : preSearchOrbisId.value}}'
    }
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetNoRecentRolesByOrbisIdPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query={
      'record/premastering?uci={{search_box.value.trim()}}&target_id={{preSearchOrbisId.value === ""? remPreSearchOrbisId.value : preSearchOrbisId.value}}'
    }
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="GetAllHistorizationStatusRolesByOrbisIdPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/GetAllHistorizationStatusRolesByOrbisIdPreMastering.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="DeleteFunctionRoleFlag" value="false" />
  <State id="RemCurrentRolePreMasteringList" value="[]" />
  <State id="RemPreviousRolePreMasteringList" value="[]" />
  <JavascriptQuery
    id="DeleteGetAllHistorizationStatusPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/DeleteGetAllHistorizationStatusPreMastering.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="PreFunctionRolesGreaterThan120" value="[]" />
  <JavascriptQuery
    id="PreMasteringFunctionRoleGreaterThan120"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/PreMasteringFunctionRoleGreaterThan120.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetAllFunctionsAPI"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="RoleBasedFeildsForEditable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="rolesApiTimeoutErrorFlag" value="false" />
  <RESTQuery
    id="GetAllFunctionsRolesPreMastering"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/premastering?uci={{search_box.value.trim()}}&size=120"
    queryFailureConditions={'[{"condition":"","message":""}]'}
    queryTimeout="120000"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          { src: "RolesApiTimeoutErrorFlagPreMastering.setValue(false);" },
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
            src: "CurrentPreRoles.setValue([]);\nPreviousPreRoles.setValue([]);\nPreviousPreRoleTotalElements.setValue(1);\nPreviousPreRoleTotalElements.setValue(1);\nloadingPopUp.setHidden(true);\nCurrentRolePreMasteringList.setValue([]);\nPreviousRolePreMasteringList.setValue([]);\nRemCurrentRolePreMasteringList.setValue([]);\nRemPreviousRolePreMasteringList.setValue([]);\nif (GetAllFunctionsRolesPreMastering?.data?.message?.includes('network timeout at')) {\n    RolesApiTimeoutErrorFlagPreMastering.setValue(true);\n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="RolesApiTimeoutErrorFlagPreMastering" value="false" />
  <State id="RolesApiTimeoutErrorFlagOrbisPreMastering" value="false" />
  <JavascriptQuery
    id="getDeathYears"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getDeathYears.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getDeathMonths"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getDeathMonths.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getDeathDays"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getDeathDays.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getBirthDays"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getBirthDays.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="getBirthMonths"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getBirthMonths.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="modalclose"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/modalclose.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="DisableForLevelZeroUser"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/DisableForLevelZeroUser.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="CheckUserRole"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/CheckUserRole.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetCyRemovedRolesByOrbisId"
    isHidden={false}
    isMultiplayerEdited={false}
    query="record/mastering?uci={{search_box.value.trim()}}&target_id={{ searchOrbisId.value }}&historization_status=4"
    resourceName="a2b8b2e1-22d1-4d8e-b130-bdad3fcdeee9"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="GetUserRolesForHomePage"
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
            src: 'var resp = GetUserRolesForHomePage.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\nCurrentUserObj.setValue(temp);\n  if(PageLoadCall.value === true) {\n    console.log("GetDataOnPageLoad trigger");\n  }\n  GetDataOnPageLoad.trigger();\n \n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="ContactNamePutArray" value="[]" />
  <RESTQuery
    id="PutFunctionBulkProcess"
    body="{{ BulkProcessPayload.value }}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="functions-api/api/v1/batchStatus"
    resourceName="7fb60270-e98c-4f77-948e-97b1267af2ba"
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="GetFunctionBulkProcess"
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
                { notificationType: "warning" },
                { title: "PutFunctionBulkProcess API call failed" },
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
  <RESTQuery
    id="GetFunctionBulkProcess"
    bodyType="raw"
    cookies={'[{"key":"","value":""}]'}
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="status/api/v1/status?requestId={{ SearchedEntity.value}}&type=uci"
    queryTimeout=""
    resourceName="7fb60270-e98c-4f77-948e-97b1267af2ba"
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
            src: 'bulkEditRolesDisable.setValue(false);\n\n//console.log(\'GetFunctionBulkProcess.data.requestedState\', GetFunctionBulkProcess?.data?.requestedState);\n//console.log(\'GetFunctionBulkProcess.data.state.code\', GetFunctionBulkProcess?.data?.state?.code);\nconst requestedState = GetFunctionBulkProcess?.data?.requestedState;\nconst code = GetFunctionBulkProcess?.data?.state?.code;\n\n\nif (\n    ["suppressed", "active"].includes(GetFunctionBulkProcess?.data?.requestedState) &&\n    [\n        "CDM_FUN_100",\n        "CDM_FUN_PM_200",\n        "CDM_FUN_PM_201",\n        "CDM_FUN_PM_202",\n        "CDM_FUN_M_300",\n        "CDM_FUN_M_302"\n    ].includes(code)\n) {\n    CurrentRoles.setValue([]);\n    PreviousRoles.setValue([]);\n    RemPreviousRolePreMasteringList.setValue([]);\n    RemCurrentRolePreMasteringList.setValue([]);\n    //console.log(\'GetFunctionBulkProcess is still inprogess\');\n    BulkProcessButtonEnabled.setValue(true);\n    bulkStatusValue.setValue(requestedState);\n    if ((CurrentRoleTotalElements?.value + PreviousRoleTotalElements?.value) <= 120) {\n        // Example: start polling\n        if (code === "CDM_FUN_M_301") {\n            console.log("Polling stopped — mastering completed!");\n            if (requestedState === \'suppressed\') {\n                bulkEditRolesDisable.setValue(true);\n            }\n            //console.log(\'GetFunctionBulkProcess is no inprogess\');\n            BulkProcessButtonEnabled.setValue(false);\n            GetAllRoles.trigger();\n          } \n        //else {\n        //      // Keep polling after 5 seconds\n        //      console.log(\'polling is still inprogess\');\n        //      setTimeout(() => {\n        //          GetFunctionBulkProcess.trigger();\n        //      }, 15000)\n\n        //  }\n\n\n    }\n\n} else {\n    if (requestedState === \'suppressed\') {\n        bulkEditRolesDisable.setValue(true);\n    }\n    console.log(\'GetFunctionBulkProcess is Mastering Completed status\');\n    BulkProcessButtonEnabled.setValue(false);\n    GetAllRoles.trigger();\n\n}\n',
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
            src: 'if(GetFunctionBulkProcess.data.metadata.status === 404) {\n  \n   BulkProcessButtonEnabled.setValue(false);\n  \n} else {\n  BulkProcessButtonEnabled.setValue(true);\n   CurrentRoles.setValue([]);\n    PreviousRoles.setValue([]);\n    RemPreviousRolePreMasteringList.setValue([]);\n    RemCurrentRolePreMasteringList.setValue([]);\n  utils.showNotification({\n    title: "Error",\n    description: "API failure. Please retry or contact the development team.",\n    notificationType: "error",\n    duration: 5\n  });\n}',
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
      params={{ ordered: [{ value: "''" }] }}
      pluginId="bulkStatusValue"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="HandleCreateUser2"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCreateUser2.js", "string")}
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
    id="variable225"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <JavascriptQuery
    id="HandleEditUser2"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleEditUser2.js", "string")}
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
    id="variable226"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <State
    id="variable227"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <Include src="./header.rsx" />
  <Include src="./batchProcessing.rsx" />
  <Include src="./RemContactModal.rsx" />
  <Include src="./RolePreAndRemModal.rsx" />
  <Include src="./RolesModal.rsx" />
  <Include src="./showRegistryModal.rsx" />
  <Include src="./sidebar1.rsx" />
  <Include src="./UserDeatilsIpAndRemedation.rsx" />
  <Include src="./UserDetailsModal.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="0"
    paddingType="normal"
    sticky={null}
    style={{ ordered: [{ canvas: "rgb(255, 255, 255)" }] }}
    type="main"
  >
    <Include src="./BodyView.rsx" />
    <HTML
      id="html3"
      css={include("../lib/html3.css", "string")}
      hidden="{{ !ReferenceDataAPIFailure.value }}"
      html={include("../lib/html3.html", "string")}
    />
  </Frame>
</Screen>
