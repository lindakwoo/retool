<Screen
  id="business"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="business"
  urlSlug=""
  uuid="0aab1a11-ad80-49c6-9ed3-e10a81e37939"
>
  <State
    id="BusinessDescriptionsVariableList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{
  GlobalBusinessList?.value?.value?.length > 0
    ? GlobalBusinessList.value.value
    : BusinessDescriptionList.data.map(item => ({
        value: item.item?.value,
        language: item.item?.language,
        deleteFlag: false
      }))
}}
"
  />
  <State
    id="BusinessDescPutArray"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="newBusinessDescriptionDataList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={'[{value :"", language:""}]'}
  />
  <JavascriptQuery
    id="businessDeleteFlag"
    confirmationMessage="Are you sure you want to delete this BusinessDescription?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/businessDeleteFlag.js", "string")}
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
    id="businessDeleteCheckBox"
    confirmationMessage="Are you sure you want to delete this BusinessDescription?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/businessDeleteCheckBox.js", "string")}
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
    id="handleBusinessForm"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/handleBusinessForm.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="PUTMasteringRecordBusiness"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ACTIVE"},{"key":"activityDescriptions","value":"{{BusinessDescPutArrayValue.value.length > 0 ? BusinessDescPutArrayValue.value : null}}"},{"key":"names","value":"{{saveNamePutArray.value?.length === 0 ? null : saveNamePutArray.value}}"},{"key":"entityInfo","value":"{{saveEntityInfoPutArray.value?.length === 0 ? null : saveEntityInfoPutArray.value}}"},{"key":"addresses","value":"{{saveAddressPutArray.value.length > 0 ? saveAddressPutArray.value : null}}"},{"key":"digitalPresences","value":"{{saveDigitalPresencesPutArray.value.length > 0 ? saveDigitalPresencesPutArray.value : null}}"},{"key":"identifiers","value":"{{saveIdentifiersPutArray.value.length > 0 ? saveIdentifiersPutArray.value : null}}"}]'
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
            src: "const searchBoxInputValue = SearchedEntity.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxInputValue);\n// Trigger actions after a 5-second delay\nResetFormFieldsBusiness.trigger();\nsetTimeout(() => {\n  if (isFirstCharacterNumber) {\n    GetMasteringByOrbisIdBusiness.trigger(); \n    GetPremasteringbyORBISID.trigger();\n  } else {\n    GetMasteringByBvDID2.trigger();\n    GetPremasteringByBVDID.trigger();\n  }\n}, 5000); // 5 seconds delay\n",
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
          { pageName: "business" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="BusinessDescPutArrayValue" value="[]" />
  <JavascriptQuery
    id="ResetFormFieldsBusiness"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetFormFieldsBusiness.js", "string")}
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
    id="handleCloseBusiness"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleCloseBusiness.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="GetMasteringByOrbisIdBusiness"
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
            src: 'var response = GetMasteringByOrbisIdBusiness.data;\n//exclude deleted records ODY-13419 state: 1\n if (response.header.state !== 1 ) {\n var curRecord  = await FilterIdentifierFromAPIResponseBusinessPage.trigger();\n selectedCompany.setValue(curRecord);\n console.log("selectedCompany", selectedCompany);\n var a = [];\n a.push(curRecord);\n TableRecordsMastering.setValue(a);\n   nationalLegalFormUpdates.trigger();\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
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
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("business", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
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
    id="LinkCheckBusinesses"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/LinkCheckBusinesses.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="FilterIdentifierFromAPIResponseBusinessPage"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/FilterIdentifierFromAPIResponseBusinessPage.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main3"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <ButtonGroup2
      id="orbisMasterButtonGroup3"
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
                src: "loadingPopUp.show();\nlet entityId =selectedCompany?.value?.header?.entityID ? selectedCompany?.value?.header?.entityID : GlobalEntityId.value\nsetTimeout(()=>{\n  const trimmedInput = entityId;\nconst isFirstCharacterNumber = /^\\d/.test(trimmedInput);\n//ResetFormFields.trigger();\n\n//metadataTableLinkReset.trigger();\n  \nResetFormFieldsBusiness.trigger();\nresetAllGlobalVariables.trigger(); \n  \n  if (isFirstCharacterNumber) {\n    //  console.log(\"isFirstCharacterNumber\");\n    requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n    GetMasteringByOrbisIdBusiness.trigger();\n  } else {\n    //  console.log(\"isnot FirstCharacterNumber\");\n    //GetMasteringByBvDID.trigger();\n  requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n  }\n}, 100)\n",
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
                src: "lockEntity.setValue(false);\ntext533.setValue('');\n//metadataTableLinkReset.trigger();\nResetFormFieldsBusiness.trigger();\nresetAllGlobalVariables.trigger();",
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
          params={{ ordered: [] }}
          pluginId="preMasteringCallsForFirmoHome"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Include src="./EntityInfoActionsWrapper2.rsx" />
    <Container
      id="navigationContainer2"
      disabled="{{
  !(!businessForm.hidden && newBusinessDescLanguageInputField.value && newBusinessDescInputField.value || businessForm.hidden)
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
          id="containerTitle311"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f90d9" viewKey="View 1">
        <Container
          id="navigationAccordion4"
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
              id="collapsibleTitle68"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Information"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle69"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              style={{ ordered: [] }}
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion4.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion4"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigationBusiness"
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
                  pluginId="handleBusinessForm"
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
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
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
                  pluginId="handleBusinessForm"
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
              />
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion5"
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
              id="collapsibleTitle69"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Contact"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle70"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion5.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion5"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation16"
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
                  pluginId="handleBusinessForm"
                  type="datasource"
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
                  pluginId="handleBusinessForm"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion6"
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
              id="collapsibleTitle70"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Identifiers"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle71"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion6.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion6"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation17"
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
                        src: 'utils.openPage("identifiers", { newTab: false }); GetAvailableNewIdentifiers.trigger();',
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
                  pluginId="handleBusinessForm"
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
      id="FormWrapper2"
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
          id="containerTitle265"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Container
          id="MyEditsContainer4"
          _gap="0px"
          disabled=""
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          heightType="fixed"
          overflowType="hidden"
          padding="12px"
          showHeader={true}
          style={{ ordered: [] }}
          styleContext={{ ordered: [] }}
        >
          <Header>
            <IconText
              id="firmoGoldenRecordIcon2"
              iconPosition="right"
              style={{
                ordered: [
                  { fontSize: "h4Font" },
                  { fontWeight: "h4Font" },
                  { fontFamily: "h4Font" },
                ],
              }}
              text="Golden record ✪"
              tooltipText="Please hover the mouse over the name or field name to find the information provider name"
            />
            <Container
              id="BusinessDescriptionContainer4"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle310"
                  tooltipText="Please hover the mouse over the value(not language) to see the information provider's name."
                  value="**Business Description***"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="BusinessDescriptionList4"
                  _primaryKeys="{{item.itemObjectHash}}"
                  data="{{selectedCompany.value.activityDescriptions}}"
                  heightType="auto"
                  itemWidth="200px"
                  margin="0"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container195"
                    disabled=""
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    margin="0"
                    padding="0"
                    showBody={true}
                  >
                    <Header>
                      <Text
                        id="containerTitle309"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="855d7" viewKey="View 1">
                      <Select
                        id="businessDescLanguageInputField4"
                        allowCustomValue={true}
                        data="{{LanguagesList.value}}"
                        disabled=""
                        emptyMessage="No options"
                        label="Language"
                        labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                        marginType="normal"
                        overlayMaxHeight={375}
                        placeholder="Select an option"
                        readOnly="true"
                        showSelectionIndicator={true}
                        style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                        value="{{LanguagesList.value.filter((obj)=> {
  return obj.Language_code_ISO_639_1.toLocaleLowerCase() === item.item.language.toLocaleLowerCase()
})[0].labels.en}}"
                        values="{{ item.Language_code_ISO_639_1.toString() }}"
                      >
                        <Event
                          event="change"
                          method="run"
                          params={{
                            ordered: [
                              {
                                src: "var temp = BusinessDescriptionsVariableList.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\n//console.log('inside change of lang');\n//console.log(temp);\n\nif (businessDescLanguageInputField4.value.trim() !== '') {\n  //console.log('businessDescLanguage');\n  //console.log(businessDescLanguageInputField2.value)\n  temp[i].language = businessDescLanguageInputField4.value; \n //console.log(temp);\n  BusinessDescriptionsVariableList.setValue(temp);\n \n}",
                              },
                            ],
                          }}
                          pluginId=""
                          type="script"
                          waitMs="0"
                          waitType="debounce"
                        />
                      </Select>
                      <TextArea
                        id="businessDescInputField5"
                        autoResize={true}
                        disabled=""
                        hidden=""
                        label=""
                        labelPosition="top"
                        margin="0"
                        minLines={2}
                        readOnly="true"
                        spellCheck={true}
                        style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                        tooltipText="{{ 
  (() => {
    const source = item.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
                        value="{{item.item.value}}"
                      />
                    </View>
                  </Container>
                </ListViewBeta>
                <Button
                  id="addBusinessDescButton4"
                  disabled="{{ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                  hidden="true"
                  maintainSpaceWhenHidden={true}
                  marginType="normal"
                  style={{ ordered: [{ background: "info" }] }}
                  text="Add BusinessDescription"
                />
              </View>
            </Container>
          </Header>
          <View id="3eabc" viewKey="View 1" />
        </Container>
        <Container
          id="MyEditsContainer3"
          disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }} "
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle283"
              value="#### My Edits"
              verticalAlign="center"
            />
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Container
              id="BusinessDescriptionContainer"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle277"
                  value="**Business Description**"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="BusinessDescriptionList"
                  _primaryKeys="{{item.ItemObjectHash}}"
                  data="{{  GlobalBusinessList?.value?.value?.length>0 ? GlobalBusinessList?.value?.value : selectedCompany.value.activityDescriptions}}"
                  heightType="auto"
                  itemWidth="200px"
                  margin="0"
                  numColumns={3}
                  padding="0"
                >
                  <Include src="./container176.rsx" />
                </ListViewBeta>
                <Button
                  id="addBusinessDescButton3"
                  disabled="{{ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                  hidden="{{!businessForm.hidden}}"
                  maintainSpaceWhenHidden={true}
                  marginType="normal"
                  style={{ ordered: [{ background: "primary" }] }}
                  text="Add Business Description"
                >
                  <Event
                    event="click"
                    method="setHidden"
                    params={{ ordered: [{ hidden: false }] }}
                    pluginId="businessForm"
                    type="widget"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Button>
                <Form
                  id="businessForm"
                  disabled=""
                  footerPadding="4px 12px"
                  headerPadding="4px 12px"
                  hidden="{{ GlobalNewBusinessList?.value.length === 0 }}"
                  margin="0"
                  padding="0"
                  requireValidation={true}
                  resetAfterSubmit={true}
                  showBody={true}
                  showHeader={true}
                >
                  <Header>
                    <Icon
                      id="removeBusinessDesc2"
                      hidden=""
                      horizontalAlign="center"
                      icon="bold/interface-delete-circle-alternate"
                      marginType="normal"
                      tooltipText="Remove New Address"
                    >
                      <Event
                        event="click"
                        method="setHidden"
                        params={{ ordered: [{ hidden: true }] }}
                        pluginId="businessForm"
                        type="widget"
                        waitMs="0"
                        waitType="debounce"
                      />
                      <Event
                        event="click"
                        method="setHidden"
                        params={{ ordered: [{ hidden: false }] }}
                        pluginId="addBusinessDescButton"
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
                              src: "businessForm.hidden;\nnewBusinessDescInputField.clearValue();\nnewBusinessDescLanguageInputField.clearValue();\n",
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
                        params={{ ordered: [{ value: "[]" }] }}
                        pluginId="GlobalNewBusinessList"
                        type="state"
                        waitMs="0"
                        waitType="debounce"
                      />
                    </Icon>
                    <Text
                      id="newBusinessDesc2"
                      value="**New Business Description**"
                      verticalAlign="center"
                    />
                  </Header>
                  <Body>
                    <Select
                      id="newBusinessDescLanguageInputField"
                      allowCustomValue={true}
                      data="{{LanguagesList.value}}"
                      disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                      emptyMessage="No options"
                      label="Language"
                      labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                      marginType="normal"
                      overlayMaxHeight={375}
                      placeholder="Select an option"
                      required={true}
                      showSelectionIndicator={true}
                      style={{
                        ordered: [
                          {
                            background:
                              "{{ self.value ? '#99A7C8' : '#fff'  }}",
                          },
                        ],
                      }}
                      value="{{ GlobalNewBusinessList?.value.lang }}"
                      values="{{ item.Language_code_ISO_639_1.toString() }}"
                    >
                      <Event
                        event="change"
                        method="run"
                        params={{
                          ordered: [
                            {
                              src: 'var temp = newBusinessDescriptionDataList.value;\n\nif (newBusinessDescLanguageInputField.value.trim() !== \'\') {\n  \n  temp[i].language = newBusinessDescLanguageInputField.value; \n\n  newBusinessDescriptionDataList.setValue(temp);\n\n  const newObject = {\n    lang:  newBusinessDescLanguageInputField.value,\n    value: newBusinessDescInputField.value\n  };\n\n  //console.log("Setting GlobalNewBusinessList to:", newObject);\n\n  GlobalNewBusinessList.setValue(newObject);\n  //console.log("GlobalNewBusinessList", GlobalNewBusinessList);\n \n}\n',
                            },
                          ],
                        }}
                        pluginId=""
                        type="script"
                        waitMs="0"
                        waitType="debounce"
                      />
                    </Select>
                    <TextArea
                      id="newBusinessDescInputField"
                      autoResize={true}
                      disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                      hidden=""
                      label=""
                      labelPosition="top"
                      minLines={2}
                      placeholder="Enter value"
                      required={true}
                      spellCheck={true}
                      style={{
                        ordered: [
                          {
                            background:
                              "{{ self.value ? '#99A7C8' : '#fff'  }}",
                          },
                        ],
                      }}
                      value="{{ GlobalNewBusinessList?.value.value }}"
                    >
                      <Event
                        event="change"
                        method="run"
                        params={{
                          ordered: [
                            {
                              src: 'if (newBusinessDescInputField.value.trim() !== \'\') {\n  \n  var temp = newBusinessDescInputField.value;\n  newBusinessDescInputField.setValue(temp);  \n  \n   const newObject = {\n    lang:  newBusinessDescLanguageInputField.value,\n    value: newBusinessDescInputField.value\n  };\n\n  //console.log("Setting GlobalNewBusinessList to:", newObject);\n\n  GlobalNewBusinessList.setValue(newObject);\n  console.log("newBusinessDescriptionDataList", newBusinessDescInputField.value)\n}\n',
                            },
                          ],
                        }}
                        pluginId=""
                        type="script"
                        waitMs="0"
                        waitType="debounce"
                      />
                    </TextArea>
                  </Body>
                </Form>
              </View>
            </Container>
          </View>
        </Container>
      </View>
    </Container>
    <Button
      id="CloseMasterRecordBtnBusiness"
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
        pluginId="handleCloseBusiness"
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
      id="saveButtonBusiness"
      disabled="{{
  !(!businessForm.hidden && newBusinessDescLanguageInputField.value && newBusinessDescInputField.value || businessForm.hidden)
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
        params={{ ordered: [] }}
        pluginId="LinkCheckBusinesses"
        type="datasource"
        waitMs=""
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleBusinessForm"
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
