<Screen
  id="firmohome"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="fbe57bee-5b4c-4f66-b33e-fac002e31598"
>
  <JavascriptQuery
    id="GetDataOnPageLoadFirmo"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/GetDataOnPageLoadFirmo.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="SegregatedGetFirmo"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/SegregatedGetFirmo.js", "string")}
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
    id="DeleteRemediatedRecord"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ARCHIVED"}]'
    }
    bodyType="json"
    confirmationMessage="Are you sure you want to delete all the remediation done?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/record/premastering"
    requireConfirmation={true}
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
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
            src: "const searchBoxValue = search_box_firmo.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxValue);\n\n// Trigger the first action based on the first character\nif (isFirstCharacterNumber) {\n  GetPremasteringbyORBISID.trigger();\n} else {\n  GetPremasteringByBVDID.trigger();\n  \n}\n\n// Set a timeout to trigger again after 5 seconds\nsetTimeout(() => {\n  SegregatedGetFirmo.trigger();\n  //  if (isFirstCharacterNumber) {\n  //    GetMasteringByOrbisId.trigger();\n  //  } else {\n  //    GetMasteringByBvDID.trigger();\n  //  }\n  // loadingPopUp.setHidden(true); // Uncomment if you want to hide the loading popup\n}, 5000);  // 5 seconds delay\n",
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
            src: 'var audit_trail = {}\naudit_trail.entity_id = selectedCompany.value.header.entityID\naudit_trail.orbis_id = selectedCompany.value.header.entityID\naudit_trail.bvd_id = selectedCompany.value.header.bvdID\naudit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()\naudit_trail.items = [{\n"new_value": "",\n"prev_value": "",\n"field_path": "",\n"item_hash": "", "remediation_action": "ARCHIVE"}\n]\naudit_trail.ticket_id = urlparams.ticket\naudit_trail.object_type = "firmographics"\naudit_trail.source = "REMEDIATED"\n\n\n    AuditTrailList.setValue(audit_trail)\n\n\ncreateAuditTrail.trigger()',
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
            src: 'try { loadingPopUp.hide?.(); } catch {}\n\nutils.showNotification({\n  title: "Error",\n  description: "Unable to delete remediation. Please try again later.",\n  notificationType: "error",\n  duration: 5\n});\n',
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
    id="GetUserRolesFirmoHome"
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
            src: "var resp = GetUserRolesFirmoHome.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\nCurrentUserObj.setValue(temp);\n  console.log('CurrentUserObj', CurrentUserObj)\n}\n",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Include src="./header2.rsx" />
  <Include src="./sidebar2.rsx" />
  <Frame
    id="$main10"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Include src="./BodyView2.rsx" />
    <HTML
      id="html4"
      css={include("../lib/html4.css", "string")}
      hidden="{{ !ReferenceDataAPIFailure.value }}"
      html={include("../lib/html4.html", "string")}
    />
  </Frame>
</Screen>
