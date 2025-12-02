<Screen
  id="address"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="9beff9f1-ed45-443c-a9dc-496253c3623c"
>
  <State
    id="AddressPutArray"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <JavascriptQuery
    id="addressDeleteFlag"
    confirmationMessage="Are you sure you want to delete this Address?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/addressDeleteFlag.js", "string")}
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
    id="AddressesListEdited"
    value={
      '{{ AddressesList.value.flatMap(address => address.item.localizedAddresses.slice(0, 1).map(localized => ({ \n  addressLanguage: localized.language, \n  addressLine: localized.reportedAddress.addressLines.join(", "), \n  addressType: address.item.types[0], \n  city: localized.reportedAddress.city, \n  country: "Japan", \n  countryISO: address.item.countryISO2, \n  countryRegion: address.item.geoClassifications && address.item.geoClassifications.length > 0 &&  address.item.geoClassifications.filter(g => g.type === "2").length > 0 ? address.item.geoClassifications.find(g => g.type === "2").code : "", \n  faxNumber: localized.reportedAddress.faxNumbers ? localized.reportedAddress.faxNumbers.join(", ") : "", \n  phoneNumber: localized.reportedAddress.phoneNumbers ? localized.reportedAddress.phoneNumbers.join(", ") : "", \n  poBox: localized.reportedAddress.poBox || "", \n  postCode: localized.reportedAddress.postCode, \n  regionGeoCode: address.item.geoClassifications && address.item.geoClassifications.length > 0 &&  address.item.geoClassifications.filter(g => g.type === "1").length > 0 ? address.item.geoClassifications.find(g => g.type === "1").code : "", \n  state: "", \n  worldRegion: "" ,\n  county: localized.reportedAddress.county ? localized.reportedAddress.county : \'\',\n  street: localized?.reportedAddress?.street ? localized?.reportedAddress?.street : \'\',\n  minorTown: localized?.reportedAddress?.minorTown ? localized?.reportedAddress?.minorTown : \'\'\n}))) }}'
    }
  />
  <RESTQuery
    id="PUTMasteringRecordAddress"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ACTIVE"},{"key":"addresses","value":"{{AddressPutArray.value.length > 0 ? AddressPutArray.value : null}}"},{"key":"activityDescriptions","value":"{{saveActivityDescriptions.value.length > 0 ? saveActivityDescriptions.value : null}}"},{"key":"entityInfo","value":"{{saveEntityInfoPutArray.value?.length === 0 ? null : saveEntityInfoPutArray.value}}"},{"key":"digitalPresences","value":"{{saveDigitalPresencesPutArray.value.length > 0 ? saveDigitalPresencesPutArray.value : null}}"},{"key":"identifiers","value":"{{saveIdentifiersPutArray.value.length > 0 ? saveIdentifiersPutArray.value : null}}"},{"key":"names","value":"{{saveNamePutArray.value?.length === 0 ? null : saveNamePutArray.value}}"}]'
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
            src: "const searchBoxInputValue = SearchedEntity.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxInputValue);\n// Trigger actions after a 5-second delay\nResetFormAddressFields.trigger();\nsetTimeout(() => {\n  if (isFirstCharacterNumber) {\n    GetMasteringByOrbisIdAddress.trigger(); \n    GetPremasteringbyORBISID.trigger();\n  } else {\n    GetMasteringByBvDID2.trigger();\n    GetPremasteringByBVDID.trigger();\n  }\n}, 5000); // 5 seconds delay\n",
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
          { pageName: "address" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="GetMasteringByOrbisIdAddress"
    cookies="[]"
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
            src: '// Get response\nvar response = GetMasteringByOrbisIdAddress.data;\n\n// Check for deleted record (ODY-13419: state = 1 means deleted)\nif (response.header.state !== 1) {\n  // Clone response\n  let curRecord = { ...response };\n\n  // Sort addresses by first type\n  let sortedAddresses = [...curRecord.addresses].sort((a, b) =>\n    Number(a?.item?.types?.[0] ?? 0) - Number(b?.item?.types?.[0] ?? 0)\n  );\n\n  // Set sorted addresses in record\n  curRecord.addresses = sortedAddresses;\n\n  // Update UI components\n  AddressesList.setValue(sortedAddresses);\n\n  const deleteFlags = sortedAddresses.map(() => false);\n  AddressDeleteFlags.setValue(deleteFlags);\n\n  // Call filter trigger (asynchronous)\n  curRecord = await FilterIdentifierFromAPIResponseAddressPage.trigger();\n\n  // Set selected company\n  selectedCompany.setValue(curRecord);\n  console.log("Updated selectedCompany:", curRecord);\n\n  // Set to table\n  TableRecordsMastering.setValue([curRecord]);\n  nationalLegalFormUpdates.trigger();\n} else {\n  // If record is deleted\n  loadingPopUp.hide();\n  utils.showNotification({\n    title: "Error",\n    description: "No matching record found.",\n    notificationType: "error",\n    duration: 3,\n  });\n}\n',
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
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("address", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
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
    id="handleSaveFormAddress"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/handleSaveFormAddress.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="ResetFormAddressFields"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ResetFormAddressFields.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="handleCloseAddress"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleCloseAddress.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="LinkCheckAddresses"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/LinkCheckAddresses.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="addNewAddressData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/addNewAddressData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="FilterIdentifierFromAPIResponseAddressPage"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/FilterIdentifierFromAPIResponseAddressPage.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main5"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <ButtonGroup2
      id="orbisMasterButtonGroup5"
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
                src: "loadingPopUp.show();\nlet entityId =selectedCompany?.value?.header?.entityID ? selectedCompany?.value?.header?.entityID : GlobalEntityId.value\nsetTimeout(()=>{\n  const trimmedInput = entityId;\nconst isFirstCharacterNumber = /^\\d/.test(trimmedInput);\n//ResetFormFields.trigger();\n\n//metadataTableLinkReset.trigger();\n  \nResetFormAddressFields.trigger();\nresetAllGlobalVariables.trigger(); \n  if (isFirstCharacterNumber) {\n    //  console.log(\"isFirstCharacterNumber\");\n    requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n    GetMasteringByOrbisIdAddress.trigger();\n  } else {\n    //  console.log(\"isnot FirstCharacterNumber\");\n   // GetMasteringByBvDID.trigger();\n  requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n  }\n}, 100)\n",
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
          pluginId="GlobalAddAddress"
          type="state"
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
                src: "lockEntity.setValue(false);\ntext533.setValue('');\n//metadataTableLinkReset.trigger();\n\nResetFormAddressFields.trigger();\nresetAllGlobalVariables.trigger();",
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
    <Include src="./EntityInfoActionsWrapper4.rsx" />
    <Container
      id="navigationContainer4"
      disabled="{{!(!newAddressForm.hidden && country2.value && newAddressType.value && language2.value && !newAddressLineValidation.value && !newPostCodeValidation.value
     || newAddressForm.hidden) || ( AddressesListEdited.value.some((a, i) => ((a.postCode?.trim() !== AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode?.trim()) 
     && ((a.countryISO === 'US' && a.postCode?.trim() === '')
      || (a.countryISO === 'BR' && !/^\d{5}-\d{3}$/.test(a.postCode?.trim() || '')))) 
      || ((a.addressLine?.trim() !== AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLine?.trim()) && (a.countryISO === 'US' 
        && a.addressLine?.trim() === ''))))
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
          id="containerTitle328"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f90d9" viewKey="View 1">
        <Container
          id="navigationAccordion10"
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
              id="collapsibleTitle74"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Information"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle75"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              style={{ ordered: [] }}
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion10.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion10"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation21"
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
                                        "{{ TableRecordsMastering.value[0].header.entityID }}\n\n",
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
                                    { key: "ticket " },
                                    {
                                      value:
                                        " {{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
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
                  pluginId="handleSaveFormAddress"
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
                screenTargetId="business"
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
                  pluginId="handleSaveFormAddress"
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
                  pluginId="handleSaveFormAddress"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion11"
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
              id="collapsibleTitle75"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Contact"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle76"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion11.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion11"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation22"
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
                  pluginId="handleSaveFormAddress"
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
                  method="scrollIntoView"
                  params={{
                    ordered: [
                      {
                        options: {
                          ordered: [{ block: "start" }, { behavior: "smooth" }],
                        },
                      },
                    ],
                  }}
                  pluginId="AddressContainer"
                  type="widget"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "4" }] }}
                  pluginId="currentNavSelectedItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion12"
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
              id="collapsibleTitle76"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Identifiers"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle77"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion12.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion12"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation23"
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
                  pluginId="handleSaveFormAddress"
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
      id="FormWrapper4"
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
          id="containerTitle329"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Container
          id="MyEditsContainer8"
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
              id="firmoGoldenRecordIcon4"
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
            <Include src="./AddressFilters4.rsx" />
            <Container
              id="AddressContainer4"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="0"
              showBody={true}
              showBorder={false}
            >
              <Header>
                <Text
                  id="containerTitle365"
                  value="#### Container title"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="AddressListView4"
                  data="{{AddressesList.value}}"
                  heightType="auto"
                  itemWidth="200px"
                  margin="0"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container219"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    margin="0"
                    padding="0"
                    showBody={true}
                    showBorder={false}
                    showHeader={true}
                  >
                    <Header>
                      <Icon
                        id="icon233"
                        horizontalAlign="center"
                        icon="bold/travel-map-location-pin"
                      />
                      <Text
                        id="containerTitle364"
                        margin="0"
                        tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.addresses[i].source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
                        value="##### Address {{i+1}}*"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="c85c9" viewKey="View 1">
                      <Form
                        id="eachAddressForm5"
                        disabled=""
                        disableSubmit=""
                        footerPadding="4px 12px"
                        headerPadding="4px 12px"
                        margin="0"
                        padding="0"
                        requireValidation={true}
                        resetAfterSubmit={true}
                        showBody={true}
                        showBorder={false}
                      >
                        <Header>
                          <Text
                            id="formTitle47"
                            value="#### Form title"
                            verticalAlign="center"
                          />
                        </Header>
                        <Body>
                          <Select
                            id="addressType6"
                            allowCustomValue={true}
                            data="{{AddressTypesList.value}}"
                            disabled=""
                            emptyMessage="No options"
                            label="Type"
                            labelPosition="top"
                            labels="{{item.code}} - {{item.labels.en}}"
                            marginType="normal"
                            overlayMaxHeight={375}
                            placeholder="Select an option"
                            readOnly="true"
                            showSelectionIndicator={true}
                            style={{ ordered: [] }}
                            tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.addresses[i].source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
                            value="{{AddressesList.value[i].item.types[0]}}"
                            values="{{item.code}}"
                          />
                          <Select
                            id="addressLanguage6"
                            allowCustomValue={true}
                            data="{{LanguagesList.value}}"
                            disabled=""
                            emptyMessage="No options"
                            label="Language"
                            labelPosition="top"
                            labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                            marginType="normal"
                            overlayMaxHeight={375}
                            placeholder="Select an option"
                            readOnly="true"
                            showSelectionIndicator={true}
                            style={{ ordered: [{ background: "" }] }}
                            value="{{AddressesList.value[i].item.localizedAddresses[0].language}}"
                            values="{{ item.Language_code_ISO_639_1.toString() }}"
                          />
                          <TextInput
                            id="addressLine14"
                            disabled=""
                            hideLabel={false}
                            label="Address Line"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{
                              ordered: [
                                { background: "" },
                                { border: "#ffffff" },
                              ],
                            }}
                            value="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ')}}"
                          />
                          <TextInput
                            id="city14"
                            disabled=""
                            label="City"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.city}}"
                          />
                          <TextInput
                            id="postCode14"
                            disabled=""
                            label="PostCode"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode}}"
                          />
                          <TextInput
                            id="poBox9"
                            disabled=""
                            label="Po_Box"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox}}"
                          />
                          <TextInput
                            id="state14"
                            disabled="true"
                            label="State"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            style={{
                              ordered: [
                                {
                                  background:
                                    "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.state && AddressesList.value[i].item.localizedAddresses[0].reportedAddress.state !== self.value ? '#99A7C8' : '#fff'}}",
                                },
                              ],
                            }}
                          />
                          <Select
                            id="country14"
                            data="{{ _.uniq(CountriesList.value) }}"
                            disabled=""
                            emptyMessage="No options"
                            label="Country"
                            labelPosition="top"
                            labels="{{ item.labels.en }}"
                            marginType="normal"
                            overlayMaxHeight={375}
                            placeholder="Select an option"
                            readOnly="true"
                            showSelectionIndicator={true}
                            style={{ ordered: [{ background: "" }] }}
                            value="{{CountriesList.value.filter(function (item){
  return item.a2 === AddressesList.value[i].item.countryISO2
})[0].labels.en}}"
                            values="{{ item.labels.en }}"
                          />
                          <TextInput
                            id="countryISO9"
                            disabled="true"
                            label="Country Isocode"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country14.value
})[0].a2 }}"
                          />
                          <TextInput
                            id="county6"
                            disabled=""
                            label="County"
                            labelPosition="top"
                            marginType="normal"
                            readOnly="true"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county}}"
                          />
                          <TextInput
                            id="countryRegion9"
                            disabled="true"
                            label="Country Region"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            style={{ ordered: [{ background: "" }] }}
                            value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country14.value
})[0].a2 }}"
                          />
                          <TextInput
                            id="worldRegion9"
                            disabled="true"
                            label="World Region"
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            value="{{selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.worldRegion}}"
                          />
                          <TextInput
                            id="regionGeoCode8"
                            disabled=""
                            label="Region Geocode"
                            labelPosition="top"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{ ordered: [{ background: "" }] }}
                            value={
                              '{{AddressesList.value[i].item.geoClassifications.filter((obj) => obj.type === "1")[0].code}}\n'
                            }
                          />
                          <IconText
                            id="phoneNumLabel22"
                            icon="bold/interface-alert-information-circle"
                            iconPosition="right"
                            style={{
                              ordered: [
                                { fontSize: "12" },
                                { fontWeight: "700" },
                              ],
                            }}
                            text="Phone Numbers"
                            textSize="h6"
                            tooltipText="Add multiple Phone Numbers using comma (,) separated"
                          />
                          <IconText
                            id="faxNumberLabel9"
                            icon="bold/interface-alert-information-circle"
                            iconPosition="right"
                            style={{
                              ordered: [
                                { fontSize: "12" },
                                { fontWeight: "700" },
                              ],
                            }}
                            text="Fax Numbers"
                            textSize="h6"
                            tooltipText="Add multiple Fax Numbers using comma (,) separated"
                          />
                          <TextInput
                            id="phoneNumber15"
                            disabled=""
                            hidden=""
                            iconBefore="bold/phone-telephone-circle"
                            label=""
                            labelPosition="top"
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{
                              ordered: [
                                { background: "" },
                                { border: "#ffffff" },
                              ],
                            }}
                            value={
                              '{{_.compact(AddressesList.value[i].item.localizedAddresses[0].reportedAddress.phoneNumbers).join(", ")}}'
                            }
                          />
                          <TextInput
                            id="faxNumber15"
                            disabled=""
                            hidden=""
                            iconBefore="bold/mail-inbox-envelope-open"
                            label=""
                            labelPosition="top"
                            labelWrap={true}
                            marginType="normal"
                            placeholder="Enter value"
                            readOnly="true"
                            style={{
                              ordered: [
                                { background: "" },
                                { border: "#ffffff" },
                              ],
                            }}
                            value={
                              '{{_.compact(AddressesList.value[i].item.localizedAddresses[0].reportedAddress.faxNumbers).join(", ")}}'
                            }
                          />
                        </Body>
                        <Footer>
                          <Button
                            id="formButton44"
                            submit={true}
                            submitTargetId="eachAddressForm5"
                            text="Submit"
                          />
                        </Footer>
                      </Form>
                    </View>
                  </Container>
                </ListViewBeta>
                <Button
                  id="addNewAddress4"
                  disabled="{{ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                  hidden="true"
                  maintainSpaceWhenHidden={true}
                  marginType="normal"
                  style={{ ordered: [{ background: "info" }] }}
                  text="Add New Address"
                >
                  <Event
                    event="click"
                    method="setHidden"
                    params={{ ordered: [{ hidden: false }] }}
                    pluginId="newAddressForm2"
                    type="widget"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Button>
              </View>
            </Container>
          </View>
        </Container>
        <Container
          id="MyEditsContainer7"
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
              id="containerTitle347"
              value="#### My Edits"
              verticalAlign="center"
            />
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Include src="./AddressFilters.rsx" />
            <Container
              id="AddressContainer3"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="0"
              showBody={true}
            >
              <Header>
                <Text
                  id="containerTitle331"
                  value="#### Container title"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <ListViewBeta
                  id="AddressListView"
                  data="{{GlobalAddressList?.value.length>0 ? GlobalAddressList?.value :
  AddressesList.value}}"
                  heightType="auto"
                  hidden=""
                  itemWidth="200px"
                  margin="0"
                  numColumns={3}
                  padding="0"
                >
                  <Include src="./container200.rsx" />
                </ListViewBeta>
                <Include src="./newAddressForm.rsx" />
                <Button
                  id="addNewAddress"
                  disabled="{{ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                  hidden="{{!newAddressForm.hidden}}"
                  marginType="normal"
                  style={{ ordered: [{ background: "primary" }] }}
                  text="Add New Address"
                >
                  <Event
                    event="click"
                    method="setHidden"
                    params={{ ordered: [{ hidden: false }] }}
                    pluginId="newAddressForm"
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
                          src: "newAddressType.resetValue();\nlanguage2.resetValue();\naddressLine2.resetValue();\npostCode2.resetValue();\ncity2.resetValue();\npoBox2.resetValue();\nstate2.resetValue();\ncountry2.resetValue();\ncountryISO2.resetValue();\nphoneNumber2.resetValue();\nfaxNumber2.resetValue();\nregionGeoCode2.resetValue();",
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Button>
              </View>
            </Container>
          </View>
        </Container>
      </View>
    </Container>
    <Button
      id="closeButtonAddress"
      style={{ ordered: [{ background: "#f6f6f6" }] }}
      text="Close"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleCloseAddress"
        type="datasource"
        waitMs="0"
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
      id="saveButtonAddress"
      disabled="{{!(!newAddressForm.hidden && country2.value && newAddressType.value && language2.value && !newAddressLineValidation.value && !newPostCodeValidation.value
     || newAddressForm.hidden) || ( AddressesListEdited.value.some((a, i) => ((a.postCode?.trim() !== AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode?.trim()) 
     && ((a.countryISO === 'US' && a.postCode?.trim() === '')
      || (a.countryISO === 'BR' && !/^\d{5}-\d{3}$/.test(a.postCode?.trim() || '')))) 
      || ((a.addressLine?.trim() !== AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLine?.trim()) && (a.countryISO === 'US' 
        && a.addressLine?.trim() === ''))))
}}"
      text="Save"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="LinkCheckAddresses"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleSaveFormAddress"
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
        waitMs="100"
        waitType="debounce"
      />
    </Button>
  </Frame>
</Screen>
