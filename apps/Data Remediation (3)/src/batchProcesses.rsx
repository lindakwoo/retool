<Screen
  id="batchProcesses"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="3462cbca-cf99-49c2-84cb-5f9bc3860552"
>
  <RESTQuery
    id="BatchProcessData"
    body={
      '[{"key":"batch_id","value":"{{batchProcessTable.data[0].batch_id}}"},{"key":"records_to_process","value":"{{BatchProcessApiVar.value.records_to_process}}"},{"key":"records_not_to_process","value":"{{BatchProcessApiVar.value.records_not_to_process}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    query="/process-batch-records"
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
            src: "browseExcelFile.resetValue();\nUploadBatchRecord.trigger();\nProcessBtnClick.setValue(true);\nlet response = await BatchProcessData;\nif (response.data.statusCode !== 200) {\n  loadingPopUp.setHidden(true); \n}\n",
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
            src: "let response = await BatchProcessData\nif (response.error.includes('network timeout')) {\n  BatchProcessData.trigger();\n}\n",
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
    id="UploadPdfBatchProcess"
    body={'[{"key":"filename","value":"{{browseExcelFile2?.value[0]?.name}}"}]'}
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/upload-pdf"
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
  >
    <Event
      event="success"
      method="run"
      params={{ ordered: [{ src: "UploadPDFPutBatchProcess.trigger();" }] }}
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
  <State
    id="UploadBtnControl"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="false"
  />
  <State
    id="VarBatchProcessData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="batchHistoryData"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="batchFileList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <RESTQuery
    id="GetBatchFileName"
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    notificationDuration={4.5}
    query="/read-batch-ids"
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
            src: "let response = await GetBatchFileName;\nloadingPopUp.setHidden(true);\nif (response.data.statusCode === 200) {\n  batchFileList.setValue(response.data.body)\n}",
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
  <RESTQuery
    id="GetBatchHistroyInfo"
    body={
      "[{\"key\":\"search_by\",\"value\":\"{{radioSearchSelection2.value}}\"},{\"key\":\"{{radioSearchSelection2.value === 'batch_name' ? 'batch_id_list' : ''}}\",\"value\":\"{{radioSearchSelection2.value === 'batch_name' ? dropDownHistorySearchBatchName2.selectedItems.map((data) => data.batch_id) : ''}}\"},{\"key\":\"{{radioSearchSelection2.value === 'batch_date' ? 'start_data' : ''}}\",\"value\":\"{{radioSearchSelection2.value === 'batch_date' ? moment(batchHistoryFromDate2.value).format('YYYY-MM-DD')  : '' }}\"},{\"key\":\"{{radioSearchSelection2.value === 'batch_date' ? 'end_data' : ''}}\",\"value\":\"{{radioSearchSelection2.value === 'batch_date' ? moment(batchHistoryToDate2.value).format('YYYY-MM-DD') : '' }}\"}]"
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/search-batch-history"
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
      method="hide"
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
            src: 'let response = await GetBatchHistroyInfo;\nif(response.data.statusCode === 200) {\n  utils.showNotification({\n    title : "Success",\n    description: \'Successfully fetched history data!\',\n    notificationType: "success",\n    duration: 3,\n  });batchHistoryData.setValue(response.data.body);\n} else {\n  batchHistoryData.setValue([]);\n  historyBatchTable2.clearFilterStack();\n   utils.showNotification({\n    title : "Error",\n    description: response.data.body,\n    notificationType: "error",\n    duration: 3,\n  });\n}',
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
                { title: "" },
                { description: "{{GetBatchHistroyInfo.error}}" },
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
  <Include src="./header7.rsx" />
  <Frame
    id="$main17"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Include src="./batchProcessContainer2.rsx" />
  </Frame>
</Screen>
