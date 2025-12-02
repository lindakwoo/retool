<Screen
  id="digitalPresence"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="dd85c1fe-2f77-47ee-94c4-67093fcc67ee"
>
  <State
    id="NetworkArray"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="Emails"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{ 
  GlobalEmailsList.value?.value?.length > 0 
    ? GlobalEmailsList.value.value 
    : emailList.data.map(obj => obj.item.value) 
}}
"
  />
  <State
    id="Websites"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{ ListOfWebsites?.data.map((obj) => obj?.item?.value ?? obj) }}
"
  />
  <JavascriptQuery
    id="websiteFieldChange"
    confirmationMessage="Are you sure you want to delete this Website?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/websiteFieldChange.js", "string")}
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
    id="emailFieldChange"
    confirmationMessage="Are you sure you want to delete this Email?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/emailFieldChange.js", "string")}
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
  <State
    id="WebsiteValidation"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{ListOfWebsites.data.map(() => false)}}"
  />
  <State
    id="EmailValidation"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{emailList.data.map(() => false)}}"
  />
  <State
    id="NewWebsiteListValidation"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="NewEmailListValidation"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="WebsitesListVals"
    value="{{  selectedCompany.value.digitalPresences && selectedCompany.value.digitalPresences.filter(item => item.item.type === '1').map(item => item.item.value)}}"
  />
  <RESTQuery
    id="GetMasteringByOrbisIdDigitalPresence"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering?entity_id={{GlobalEntityId.value ? GlobalEntityId.value : SearchedEntity.value.trim().toUpperCase()}}
"
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
            src: '\nvar response = GetMasteringByOrbisIdDigitalPresence.data;\n//exclude deleted records ODY-13419 state: 1\n if (response.header.state !== 1 ) {\n var curRecord  = await FilterIdentifierFromAPIResponseDigitalPage.trigger();\n selectedCompany.setValue(curRecord);\n console.log("selectedCompany", selectedCompany);\n var a = [];\n a.push(curRecord);\n TableRecordsMastering.setValue(a);  \n nationalLegalFormUpdates.trigger();\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
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
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("digitalPresence", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
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
  <JavascriptQuery
    id="ResetDigitalPresence"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetDigitalPresence.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="PUTMasteringRecordDigitalPresence"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ACTIVE"},{"key":"digitalPresences","value":"{{NetworkArray.value.length > 0 ? NetworkArray.value : null}}"},{"key":"names","value":"{{saveNamePutArray.value.length > 0 ? saveNamePutArray.value : null}}"},{"key":"addresses","value":"{{saveAddressPutArray.value.length > 0 ? saveAddressPutArray.value : null}}"},{"key":"entityInfo","value":"{{saveEntityInfoPutArray.value?.length === 0 ? null : saveEntityInfoPutArray.value}}"},{"key":"identifiers","value":"{{saveIdentifiersPutArray.value.length > 0 ? saveIdentifiersPutArray.value : null}}"},{"key":"activityDescriptions","value":"{{saveActivityDescriptions.value.length > 0 ? saveActivityDescriptions.value : null}}"}]'
    }
    bodyType="json"
    cookies="[]"
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
            src: "const searchBoxInputValue = SearchedEntity.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxInputValue);\n// Trigger actions after a 5-second delay\nResetDigitalPresence.trigger();\nsetTimeout(() => {\n  if (isFirstCharacterNumber) {\n    GetMasteringByOrbisIdDigitalPresence.trigger(); \n    GetPremasteringbyORBISID.trigger();\n  } else {\n    GetMasteringByBvDID2.trigger();\n    GetPremasteringByBVDID.trigger();\n  }\n}, 5000); // 5 seconds delay\n",
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
          { pageName: "digitalPresence" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="HandleFormSaveDigitalPresence"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/HandleFormSaveDigitalPresence.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="handleCloseDigitalPresence"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleCloseDigitalPresence.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="LinkCheckDigitalPresences"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/LinkCheckDigitalPresences.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State
    id="originalWebSitesData"
    value="
{{ selectedCompany?.value?.digitalPresences
    ?.filter(dp => dp?.item?.type === '1')
    ?.map(dp => dp?.item?.value) 
}}
"
  />
  <State
    id="originalEmailListData"
    value="
{{ selectedCompany?.value?.digitalPresences
    ?.filter(dp => dp?.item?.type === '2')
    ?.map(dp => dp?.item?.value) 
}}
"
  />
  <JavascriptQuery
    id="FilterIdentifierFromAPIResponseDigitalPage"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/FilterIdentifierFromAPIResponseDigitalPage.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main4"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <ButtonGroup2
      id="orbisMasterButtonGroup4"
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
                src: "loadingPopUp.show();\nlet entityId =selectedCompany?.value?.header?.entityID ? selectedCompany?.value?.header?.entityID : GlobalEntityId.value\nsetTimeout(()=>{\n  const trimmedInput = entityId;\nconst isFirstCharacterNumber = /^\\d/.test(trimmedInput);\n//ResetFormFields.trigger();\n\n//metadataTableLinkReset.trigger();\n  \nResetDigitalPresence.trigger(); \n  resetAllGlobalVariables.trigger(); \n  if (isFirstCharacterNumber) {\n    //  console.log(\"isFirstCharacterNumber\");\n    requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n    GetMasteringByOrbisIdDigitalPresence.trigger();\n  } else {\n    //  console.log(\"isnot FirstCharacterNumber\");\n   // GetMasteringByBvDID.trigger();\n  requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n  }\n}, 100)\n",
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
                src: "lockEntity.setValue(false);\ntext533.setValue('');\n//metadataTableLinkReset.trigger();\nResetDigitalPresence.trigger(); resetAllGlobalVariables.trigger();",
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
    <Include src="./EntityInfoActionsWrapper3.rsx" />
    <Container
      id="navigationContainer3"
      disabled="{{
    (NewEmailListValidation.value.filter((item) => item === true).length > 0) 
    || (NewWebsiteListValidation.value.filter((item) => item === true).length > 0)
      || (WebsiteValidation.value.filter((item) => item === true).length > 0) 
      || (EmailValidation.value.filter((item) => item === true).length > 0)

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
          id="containerTitle314"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f90d9" viewKey="View 1">
        <Container
          id="navigationAccordion7"
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
              id="collapsibleTitle71"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Information"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle72"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              style={{ ordered: [] }}
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion7.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion7"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation18"
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
                                        "{{ TableRecordsMastering.value[0].header.entityID }}\n",
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
                  pluginId="HandleFormSaveDigitalPresence"
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
                  pluginId="HandleFormSaveDigitalPresence"
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
                  pluginId="HandleFormSaveDigitalPresence"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion8"
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
              id="collapsibleTitle72"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Contact"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle73"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion8.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion8"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigationDigital"
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
                itemType="page"
                label="Digital Presence"
                screenTargetId="digitalPresence"
              />
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
                  pluginId="HandleFormSaveDigitalPresence"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion9"
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
              id="collapsibleTitle73"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Identifiers"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle74"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion9.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion9"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation20"
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
                  pluginId="HandleFormSaveDigitalPresence"
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
      id="FormWrapper3"
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
          id="containerTitle315"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Container
          id="MyEditsContainer6"
          _gap="0px"
          disabled=""
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
          style={{ ordered: [] }}
          styleContext={{ ordered: [] }}
        >
          <Header>
            <IconText
              id="firmoGoldenRecordIcon3"
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
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Container
              id="WebsitesContainer3"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showBorder={false}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle319"
                  value="**Websites***"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="ListOfWebsites3"
                  _primaryKeys="{{ i }}"
                  computeAllInstanceValues={true}
                  data="{{ selectedCompany.value.digitalPresences 
  ? selectedCompany.value.digitalPresences.filter(item => item.item.type === '1') 
  : [] 
}}
"
                  heightType="auto"
                  hidden="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '1'
}).length === 0 : true}}"
                  itemWidth="200px"
                  margin="0"
                  marginType="none"
                  numColumns={3}
                  padding="0"
                >
                  <TextInput
                    id="eachWebsite3"
                    disabled=""
                    iconBefore="bold/interface-link"
                    label=""
                    labelPosition="top"
                    margin="0"
                    patternType="url"
                    readOnly="true"
                    style={{ ordered: [] }}
                    tooltipText="{{ 
  (() => {
    const source = item.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
                    value="{{item.item.value}}"
                  >
                    <Event
                      event="change"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: "var temp = Websites.value;\nvar tempValidations = WebsiteValidation.value;\nvar oldValue = temp[i];\n\nif (eachWebsite3.value.trim() !== '') {\n  temp[i] = eachWebsite3.value;\n  if(eachWebsite3.validationMessage.length > 0) {\n    tempValidations[i] = true;\n  } else{\n    tempValidations[i] = false;\n  }\n  WebsiteValidation.setValue(tempValidations);\nWebsites.setValue(temp);\n} else {\n  websiteFieldChange.trigger();    eachWebsite3.setValue(item.item.value);\n} ",
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                </ListViewBeta>
                <IconText
                  id="iconText9"
                  hidden="true"
                  icon="bold/interface-add-square"
                  maintainSpaceWhenHidden={true}
                  text="Add Website"
                  textSize="default"
                >
                  <Event
                    event="click"
                    method="run"
                    params={{
                      ordered: [
                        {
                          src: "var temp = NewWebsites.value;\ntemp.push('');\n\nNewWebsites.setValue(temp);",
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </IconText>
              </View>
            </Container>
            <Container
              id="EmailsContainer3"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showBorder={false}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle322"
                  value="**Emails***"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="emailList3"
                  _primaryKeys="{{ i }}"
                  computeAllInstanceValues={true}
                  data="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '2'
}): []}}"
                  heightType="auto"
                  hidden="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '2'
}).length === 0 : true}}"
                  itemWidth="200px"
                  margin="0"
                  marginType="none"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container197"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    heightType="fixed"
                    marginType="normal"
                    padding="0"
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle323"
                        marginType="normal"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="ee81e" viewKey="View 1" />
                  </Container>
                  <TextInput
                    id="eachEmail3"
                    disabled=""
                    iconBefore="bold/mail-send-envelope"
                    label=""
                    labelPosition="top"
                    margin="0"
                    patternType="email"
                    readOnly="true"
                    style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                    tooltipText="{{ 
  (() => {
    const source = item.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}




"
                    value="{{item.item.value}}"
                  >
                    <Event
                      event="change"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: "var temp = Emails.value;\n\nvar oldValue = temp[i]; // Assuming you want to store the old value\n\nif (eachEmail3.value.trim() !== '') {\n  temp[i] = eachEmail3.value;\n  \n  Emails.setValue(temp);\n}\n",
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                  <Icon
                    id="icon221"
                    hidden="true"
                    horizontalAlign="center"
                    icon="bold/interface-delete-bin-2"
                    maintainSpaceWhenHidden={true}
                    style={{ ordered: [{ background: "canvas" }] }}
                    styleVariant="background"
                  >
                    <Event
                      event="click"
                      method="trigger"
                      params={{ ordered: [] }}
                      pluginId="emailFieldChange"
                      type="datasource"
                      waitMs="0"
                      waitType="debounce"
                    />
                    <Event
                      event="click"
                      method="setValue"
                      params={{
                        ordered: [
                          {
                            value:
                              '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "email",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.email[i][1],\n  "remediation_action" : "delete"}\n}}',
                          },
                        ],
                      }}
                      pluginId="linkAttributeItem"
                      type="state"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Icon>
                </ListViewBeta>
                <IconText
                  id="iconText11"
                  hidden="true"
                  icon="bold/interface-add-square"
                  maintainSpaceWhenHidden={true}
                  text="Add Email"
                  textSize="default"
                >
                  <Event
                    enabled=""
                    event="click"
                    method="run"
                    params={{
                      ordered: [
                        {
                          src: "var temp = NewEmails.value;\ntemp.push('');\n\nNewEmails.setValue(temp);",
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </IconText>
              </View>
            </Container>
          </View>
        </Container>
        <Container
          id="MyEditsContainer5"
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
              id="containerTitle318"
              value="#### My Edits"
              verticalAlign="center"
            />
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Container
              id="WebsitesContainer"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle432"
                  value="**Websites**"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="ListOfWebsites"
                  _primaryKeys="{{item}}"
                  computeAllInstanceValues={true}
                  data="{{  GlobalWebsitesList?.value?.value?.length>0 ? GlobalWebsitesList?.value?.value :
   selectedCompany?.value?.digitalPresences?.filter(item => item.item?.type === '1')
}}

"
                  heightType="auto"
                  hidden="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '1'
}).length === 0 : true}}"
                  itemWidth="200px"
                  margin="0"
                  marginType="none"
                  numColumns={3}
                  padding="0"
                >
                  <TextInput
                    id="eachWebsite"
                    disabled=""
                    iconBefore="bold/interface-link"
                    label=""
                    labelPosition="top"
                    margin="0"
                    patternType="url"
                    readOnly="{{(CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('edit')) ? false : true}}"
                    style={{
                      ordered: [
                        {
                          background:
                            "{{\n  GlobalWebsitesList?.value?.value?.length > 0\n    ? (item !== originalWebSitesData.value[i] ? '#99A7C8' : '#fff')\n    : (item?.item?.value !== originalWebSitesData.value[i] ? '#99A7C8' : '#fff')\n}}\n",
                        },
                      ],
                    }}
                    value="{{GlobalWebsitesList?.value?.value?.length>0 ?item: item.item.value}}
"
                  >
                    <Event
                      event="change"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: 'var temp = Websites.value;\nvar tempValidations = WebsiteValidation.value;\nvar oldValue = temp[i];\n\nif (eachWebsite.value.trim() !== \'\') {\n  temp[i] = eachWebsite.value;\n  if(eachWebsite.validationMessage.length > 0) {\n    tempValidations[i] = true;\n  } else{\n    tempValidations[i] = false;\n  }\n  WebsiteValidation.setValue(tempValidations);\n  Websites.setValue(temp);\n\n  GlobalWebsitesList.setValue(\n    { "change": true,\n      "value": temp, \n    "newKey":GlobalWebsitesList.value?.newKey ||""\n    }\n  )\n  \n} else {\n  websiteFieldChange.trigger();   \n  eachWebsite.setValue(item.item.value);\n} ',
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                  <Icon
                    id="icon3"
                    disabled=""
                    hidden="{{((CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('edit')) ? false : true) ||
  ValidateBvdId.data || ValidateOrbisId.data || ValidateUserRole.data || lockEntity.value}}"
                    horizontalAlign="center"
                    icon="bold/interface-delete-bin-2"
                    style={{ ordered: [{ background: "canvas" }] }}
                    styleVariant="background"
                  >
                    <Event
                      event="click"
                      method="trigger"
                      params={{ ordered: [] }}
                      pluginId="websiteFieldChange"
                      type="datasource"
                      waitMs="0"
                      waitType="debounce"
                    />
                    <Event
                      event="click"
                      method="setValue"
                      params={{
                        ordered: [
                          {
                            value:
                              '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "website",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.website[i][1],\n  "remediation_action" : "delete"}\n}}',
                          },
                        ],
                      }}
                      pluginId="linkAttributeItem"
                      type="state"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Icon>
                </ListViewBeta>
                <IconText
                  id="iconText7"
                  hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }} "
                  icon="bold/interface-add-square"
                  maintainSpaceWhenHidden={true}
                  text="Add Website"
                  textSize="default"
                >
                  <Event
                    event="click"
                    method="run"
                    params={{
                      ordered: [
                        {
                          src: "var temp = NewWebsites.value;\ntemp.push('');\n\nNewWebsites.setValue(temp);",
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </IconText>
                <ListViewBeta
                  id="NewWebsitesList"
                  _primaryKeys=""
                  data="{{ NewWebsites?.value }}
"
                  heightType="auto"
                  hidden="
{{   (NewWebsites?.value?.length === 0) }}"
                  itemWidth="200px"
                  maxHeight="100vh"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container251"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    heightType="fixed"
                    margin="0"
                    overflowType="hidden"
                    padding="0"
                    showBody={true}
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle433"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="dc9c2" viewKey="View 1">
                      <TextInput
                        id="eachNewWebsite"
                        disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                        iconBefore="bold/interface-link"
                        label=""
                        labelPosition="top"
                        patternType="url"
                        placeholder="Add Website"
                        style={{
                          ordered: [
                            {
                              background:
                                "{{ self.value ? '#99A7C8' : '#fff' }}",
                            },
                          ],
                        }}
                        value="{{item}}"
                      >
                        <Event
                          event="blur"
                          method="run"
                          params={{
                            ordered: [
                              {
                                src: "var temp = NewWebsites.value;\nvar tempValidations = NewWebsiteListValidation.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\n//added by ryan\nif (eachNewWebsite.value.trim() == '') {\n  temp[i] = \"\";\n  NewWebsites.setValue(temp);\n}\n\nif (eachNewWebsite.value.trim() !== '') {\n  //console.log('rad', i);\n  //console.log(temp);\n  temp[i] = eachNewWebsite.value;\n\n  if(eachNewWebsite.validationMessage.length > 0) {\n    tempValidations[i] = true;\n  } else{\n    tempValidations[i] = false;\n  }\n  NewWebsiteListValidation.setValue(tempValidations);\n  \n  NewWebsites.setValue(temp);\n  NewGlobalWebsitesList.setValue(temp);\n  \n} else {\n  tempValidations[i] = false;\nNewWebsiteListValidation.setValue(tempValidations);\n}",
                              },
                            ],
                          }}
                          pluginId=""
                          type="script"
                          waitMs="0"
                          waitType="debounce"
                        />
                      </TextInput>
                    </View>
                  </Container>
                </ListViewBeta>
              </View>
            </Container>
            <Container
              id="EmailsContainer"
              disabled=""
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle324"
                  value="**Emails**"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="emailList"
                  _primaryKeys="{{ item }}"
                  computeAllInstanceValues={true}
                  data="{{ GlobalEmailsList?.value?.value?.length>0 ? 
       GlobalEmailsList?.value?.value : selectedCompany.value.digitalPresences.filter(item => item.item.type === '2')
  }}"
                  heightType="auto"
                  hidden="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '2'
}).length === 0 : true}}"
                  itemWidth="200px"
                  margin="0"
                  marginType="none"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container198"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    heightType="fixed"
                    marginType="normal"
                    padding="0"
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle325"
                        marginType="normal"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="ee81e" viewKey="View 1" />
                  </Container>
                  <TextInput
                    id="eachEmail"
                    disabled=""
                    iconBefore="bold/mail-send-envelope"
                    label=""
                    labelPosition="top"
                    margin="0"
                    patternType="email"
                    placeholder="you@example.com"
                    readOnly=""
                    style={{
                      ordered: [
                        {
                          background:
                            "{{\n  GlobalEmailsList?.value?.value?.length > 0\n    ? (item !== originalEmailListData.value[i] ? '#99A7C8' : '#fff')\n    : (item?.item?.value !== originalEmailListData.value[i] ? '#99A7C8' : '#fff')\n}}\n",
                        },
                      ],
                    }}
                    value="{{GlobalEmailsList?.value?.value?.length>0 ?item: item.item.value}}
"
                  >
                    <Event
                      event="change"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: 'console.log(\'Emails.value\',Emails.value);\n\nvar temp = Emails.value;\nvar tempEmailValidations = EmailValidation.value;\n\nvar oldValue = temp[i]; // Assuming you want to store the old value\n\nif (eachEmail.value.trim() !== \'\') {\n  temp[i] = eachEmail.value;\n  if(eachEmail.validationMessage.length > 0) {\n    tempEmailValidations[i] = true;\n  } else{\n    tempEmailValidations[i] = false;\n  }\n  console.log(tempEmailValidations);\nEmailValidation.setValue(tempEmailValidations);\n  Emails.setValue(temp);\n  console.log(\'temp.value\',temp);\n//      GlobalEmailsList.setValue({ "change": true,\n//                                  "value": temp, \n//                                  "newKey":GlobalEmailsList.value.newKey ||""\n//  })\n     GlobalEmailsList.setValue(\n    { "change": true,\n      "value": temp, \n    "newKey":GlobalEmailsList.value?.newKey ||""\n     }\n   )\n  \n  \n} else {\n  emailFieldChange.trigger();\neachEmail.setValue(item.item.value);\n}\n\n',
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                  <Icon
                    id="icon222"
                    hidden="{{((CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('edit')) ? false : true) ||
  ValidateBvdId.data || ValidateOrbisId.data || ValidateUserRole.data || lockEntity.value}}"
                    horizontalAlign="center"
                    icon="bold/interface-delete-bin-2"
                    style={{ ordered: [{ background: "canvas" }] }}
                    styleVariant="background"
                  >
                    <Event
                      event="click"
                      method="trigger"
                      params={{ ordered: [] }}
                      pluginId="emailFieldChange"
                      type="datasource"
                      waitMs="0"
                      waitType="debounce"
                    />
                    <Event
                      event="click"
                      method="setValue"
                      params={{
                        ordered: [
                          {
                            value:
                              '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "email",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.email[i][1],\n  "remediation_action" : "delete"}\n}}',
                          },
                        ],
                      }}
                      pluginId="linkAttributeItem"
                      type="state"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Icon>
                </ListViewBeta>
                <IconText
                  id="iconText12"
                  hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }} "
                  icon="bold/interface-add-square"
                  maintainSpaceWhenHidden={true}
                  text="Add Email"
                  textSize="default"
                >
                  <Event
                    enabled=""
                    event="click"
                    method="run"
                    params={{
                      ordered: [
                        {
                          src: "var temp = NewEmails.value;\ntemp.push('');\n\nNewEmails.setValue(temp);",
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </IconText>
                <ListViewBeta
                  id="NewEmailsList"
                  _primaryKeys=""
                  data="{{NewEmails?.value }}"
                  heightType="auto"
                  hidden="{{ 
   (NewEmails?.value?.length === 0) 
}}
"
                  itemWidth="200px"
                  margin="0"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container199"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    heightType="fixed"
                    margin="0"
                    padding="0"
                    showBody={true}
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle326"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="d81f7" viewKey="View 1">
                      <TextInput
                        id="eachNewEmail"
                        disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                        iconBefore="bold/mail-inbox-envelope-add-1"
                        label=""
                        labelPosition="top"
                        patternType="email"
                        placeholder="Add Email"
                        style={{
                          ordered: [
                            {
                              background:
                                "{{ self.value ? '#99A7C8' : '#fff' }}",
                            },
                          ],
                        }}
                        value="{{item}}"
                      >
                        <Event
                          event="blur"
                          method="run"
                          params={{
                            ordered: [
                              {
                                src: "var temp = NewEmails.value;\nvar tempValidations = NewEmailListValidation.value;\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\n//added by ryan\nif (eachNewEmail.value.trim() == '') {\n  temp[i] = \"\";\n  NewEmails.setValue(temp);\n}\n\nif (eachNewEmail.value.trim() !== '') {  \n  temp[i] = eachNewEmail.value;\n  if(eachNewEmail.validationMessage.length > 0) {\n    tempValidations[i] = true;\n  } else{\n    tempValidations[i] = false;\n  }\n  NewEmailListValidation.setValue(tempValidations);\n  \n  NewEmails.setValue(temp);\n\n\n  let existing = GlobalEmailsList.value || {}; // use existing or create new object \n  // Add new key \n  existing.newKey = NewEmails.value\n    GlobalEmailsList.setValue(existing);\n  \n} else {\n  tempValidations[i] = false;\n  NewEmailListValidation.setValue(tempValidations);\n}",
                              },
                            ],
                          }}
                          pluginId=""
                          type="script"
                          waitMs="0"
                          waitType="debounce"
                        />
                      </TextInput>
                    </View>
                  </Container>
                </ListViewBeta>
              </View>
            </Container>
          </View>
        </Container>
      </View>
    </Container>
    <Button
      id="CloseMasterRecordBtnDigital"
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
        pluginId="handleCloseDigitalPresence"
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
      id="saveButtonDigitalPresence"
      disabled="{{
    (NewEmailListValidation.value.filter((item) => item === true).length > 0) 
    || (NewWebsiteListValidation.value.filter((item) => item === true).length > 0)
      || (WebsiteValidation.value.filter((item) => item === true).length > 0) 
      || (EmailValidation.value.filter((item) => item === true).length > 0)

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
        pluginId="LinkCheckDigitalPresences"
        type="datasource"
        waitMs=""
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleFormSaveDigitalPresence"
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
