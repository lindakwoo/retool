<Screen
  id="userManagement"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="56742bd9-7249-4342-b74f-b8f4cde35f4b"
>
  <RESTQuery
    id="GetListOfUsers"
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
            src: "var resp = GetListOfUsers.data;\n\nif (resp.statusCode === 200) {\n  var temp = resp.body;\nUsersList.setValue(temp);\n}\n",
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
  <RESTQuery
    id="CreateNewUserAPI"
    body="{{CreateUserReqObj.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/create-user-record"
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
            src: 'if(CreateNewUserAPI.data.statusCode === 200) {\n  createUserForm.clear();\ncreateUserForm.setHidden(true);\n  GetListOfUsers.trigger();\n  utils.showNotification({\n  title : "Success",\n  description: CreateNewUserAPI.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(CreateNewUserAPI.data.statusCode === 400) {\n  loadingPopUp.setHidden(true);\n  utils.showNotification({\n  title : "Error",\n  description: CreateNewUserAPI.data.body,\n  notificationType: "error",\n  duration: 2,\n});\n  \n}\n',
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
    id="EditUserAPI"
    body="{{EditUserReqObj.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-user-record"
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
            src: 'if(EditUserAPI.data.statusCode === 200) {\n  editUserForm.clear();\n  editUserForm.setHidden(true);\n  GetListOfUsers.trigger();\n  createUser.setDisabled(false);\n  //GetUserRolesForHomePage.trigger();\n   utils.showNotification({\n  title : "Success",\n  description: EditUserAPI.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(EditUserAPI.data.statusCode === 400) {\n  utils.showNotification({\n  title : "Error",\n  description: EditUserAPI.data.body,\n  notificationType: "error",\n  duration: 3,\n});\n}\n',
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
  <RESTQuery
    id="DeleteUserAPI"
    body={
      '{\n  "email" : {{userListTable.selectedRow.email}},\n  "isActive": "False"\n}'
    }
    bodyType="raw"
    confirmationMessage="Are you you want to Delete this User?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-user-record"
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
            src: 'if(DeleteUserAPI.data.statusCode === 200) {  \n  GetListOfUsers.trigger();\n   utils.showNotification({\n  title : "Success",\n  description: DeleteUserAPI.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(DeleteUserAPI.data.statusCode !== 200) {\n  utils.showNotification({\n  title : "Error",\n  description: DeleteUserAPI.data.body,\n  notificationType: "error",\n  duration: 3,\n});\n}\n',
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
    id="HandleCreateUser"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCreateUser.js", "string")}
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
    id="CreateUserReqObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <JavascriptQuery
    id="HandleEditUser"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleEditUser.js", "string")}
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
    id="EditUserReqObj"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <RESTQuery
    id="CreateNewUserAPIFirmo"
    body="{{CreateUserReqObjFirmo?.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/create-user-record"
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
            src: 'if(CreateNewUserAPIFirmo.data.statusCode === 200) {\n  createUserFormFrimo.clear();\ncreateUserFormFrimo.setHidden(true);\n  GetListOfUsersData.trigger();\n  utils.showNotification({\n  title : "Success",\n  description: CreateNewUserAPIFirmo.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(CreateNewUserAPIFirmo.data.statusCode === 400) {\n  loadingPopUp.setHidden(true);\n  utils.showNotification({\n  title : "Error",\n  description: CreateNewUserAPIFirmo.data.body,\n  notificationType: "error",\n  duration: 2,\n});\n  \n}\n',
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
    id="EditUserAPIFrimo"
    body="{{EditUserReqObjFirmo.value}}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-user-record"
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
            src: 'if(EditUserAPIFrimo.data.statusCode === 200) {\n  editUserFormFirmo.clear();\n  editUserFormFirmo.setHidden(true);\n  GetListOfUsersData.trigger();\n  //GetUserRolesForHomePage.trigger();\n   utils.showNotification({\n  title : "Success",\n  description: EditUserAPIFrimo.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(EditUserAPIFrimo.data.statusCode === 400) {\n  utils.showNotification({\n  title : "Error",\n  description: EditUserAPIFrimo.data.body,\n  notificationType: "error",\n  duration: 3,\n});\n}\n',
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
  <RESTQuery
    id="DeleteUserAPIFirmo"
    body={
      '{\n  "email" : {{userListTableFirmo.selectedRow.email}},\n  "isActive": "False"\n}'
    }
    bodyType="raw"
    confirmationMessage="Are you you want to Delete this User?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/update-user-record"
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
            src: 'if(DeleteUserAPIFirmo.data.statusCode === 200) {  \n  GetListOfUsersData.trigger();\n   utils.showNotification({\n  title : "Success",\n  description: DeleteUserAPIFirmo.data.body,\n  notificationType: "success",\n  duration: 3,\n});\n}\n\nif(DeleteUserAPIFirmo.data.statusCode !== 200) {\n  utils.showNotification({\n  title : "Error",\n  description: DeleteUserAPIFirmo.data.body,\n  notificationType: "error",\n  duration: 3,\n});\n}\n',
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
    id="HandleCreateUserFirmo"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleCreateUserFirmo.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="CreateUserReqObjFirmo" value="{}" />
  <State id="EditUserReqObjFirmo" value="{}" />
  <JavascriptQuery
    id="HandleEditUserFirmo"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/HandleEditUserFirmo.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Include src="./header3.rsx" />
  <Include src="./userManagementModal.rsx" />
  <Frame
    id="$main11"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Container
      id="container241"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Button
          id="createUser"
          disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
          text="Create User"
        >
          <Event
            event="click"
            method="setHidden"
            params={{ ordered: [{ hidden: false }] }}
            pluginId="createUserForm"
            type="widget"
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
            pluginId="createUserForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Header>
      <View id="61061" viewKey="View 1">
        <Table
          id="userListTable"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ UsersList.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No Users found"
          enableSaveActions={true}
          groupByColumns={{}}
          primaryKeyColumnId="a4c39"
          rowHeight="large"
          showFooter={true}
          showHeader={true}
          templatePageSize="4"
          toolbarPosition="bottom"
        >
          <Column
            id="a4c39"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="Id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={58}
            summaryAggregationMode="none"
          />
          <Column
            id="da14a"
            alignment="left"
            cellTooltipMode="overflow"
            format="avatar"
            formatOptions={{ image: "" }}
            groupAggregationMode="none"
            key="user_name"
            label="User"
            placeholder="No user"
            position="center"
            size={277}
            valueOverride={
              '{{currentSourceRow.user_name + "\\n" + currentSourceRow.email}}'
            }
          />
          <Column
            id="f575b"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="user_id"
            label="User ID"
            placeholder="Enter value"
            position="center"
            size={163}
          />
          <Column
            id="50478"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="email"
            label="Email"
            placeholder="Enter value"
            position="center"
            size={222}
          />
          <Column
            id="ae67c"
            alignment="left"
            cellTooltip="{{ item }}"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="user_role"
            label="User Role"
            placeholder="Select options"
            position="center"
            size={153}
          />
          <Column
            id="44777"
            alignment="left"
            editable="false"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="level"
            label="Level"
            placeholder="Enter value"
            position="center"
            referenceId="level"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="0f4cb"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="product"
            label="Product"
            placeholder="Select option"
            position="center"
            size={176}
            summaryAggregationMode="none"
          />
          <Column
            id="cf7f8"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="region"
            label="Region"
            placeholder="Select options"
            position="center"
            size={196}
          />
          <Column
            id="268f5"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="country_iso"
            label="Country ISO"
            placeholder="Select options"
            position="center"
            size={139}
          />
          <Column
            id="5caac"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="country"
            label="Country"
            placeholder="Select options"
            position="center"
            size={196}
          />
          <Column
            id="7570d"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="team"
            label="Team"
            placeholder="Select options"
            position="center"
            size={157}
          />
          <Column
            id="3cec6"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="create_timestamp"
            label="Create timestamp"
            placeholder="Enter value"
            position="center"
            size={140}
          />
          <Column
            id="6ed5e"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="update_timestamp"
            label="Update timestamp"
            placeholder="Enter value"
            position="center"
            size={116}
          />
          <Column
            id="64ad3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="status"
            label="Status"
            placeholder="Enter value"
            position="center"
            size={100}
          />
          <Column
            id="fd662"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="all_countries_selected"
            label="All countries selected"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{item}}"
          />
          <Action
            id="e69db"
            disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}
"
            icon="bold/interface-edit-pencil"
            label="Edit User"
          >
            <Event
              event="clickAction"
              method="setHidden"
              params={{ ordered: [{ hidden: false }] }}
              pluginId="editUserForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="scrollIntoView"
              params={{
                ordered: [
                  {
                    options: { object: { block: "nearest", behavior: "auto" } },
                  },
                ],
              }}
              pluginId="editUserForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setDisabled"
              params={{ ordered: [] }}
              pluginId="createUser"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="2532a"
            disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
            icon="bold/interface-delete-bin-2"
            label="Delete User"
          >
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="DeleteUserAPI"
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
              pluginId="userListTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Form
      id="createUserForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData=""
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
          id="formTitle53"
          value="#### Create User"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="textInput122"
          formDataKey="user_name"
          label="Name"
          labelPosition="top"
          placeholder="Enter Full Name"
          required={true}
        />
        <TextInput
          id="textInput123"
          formDataKey="email"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          placeholder="you@example.com"
          required={true}
        />
        <Select
          id="productList"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled=""
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          formDataKey="product"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Product"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select a Product"
          required={true}
          showSelectionIndicator={true}
          tooltipByIndex=""
          value=""
          values=""
        >
          <Option
            id="13112"
            disabled="{{createUserRole2.value==='super_admin' || createUserRole2.value==='uci_analyst' || CurrentUserObj.value.product === 'uci'}}"
            label="Firmographics"
            value="firmographics"
          />
          <Option
            id="9122f"
            disabled="{{createUserRole2.value==='super_admin' || createUserRole2.value === 'data_analyst'|| createUserRole2.value === 'standard_user' || CurrentUserObj.value.product === 'firmographics' }}"
            hidden={false}
            label="UCI"
            value="uci"
          />
          <Option
            id="bf196"
            disabled="{{CurrentUserObj.value.product !== 'all' && createUserRole2.value !== 'super_admin' }}"
            hidden={false}
            label="ALL"
            value="all"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: 'if(productList.value === "all"){\n  createUserRole2.setValue("super_admin");\n}\n\nif(productList.value === "uci" && createUserRole2.value === "uci_analyst"){\n  addListLevel.setValue("level0");\n} \n\nif(productList.value === "firmographics" && createUserRole2.value === "uci_analyst"){\n  addListLevel.clearValue();\n  createUserRole2.clearValue();\n}\nif(productList.value === "uci" && createUserRole2.value !== "uci_analyst" && createUserRole2.value !== "admin"){\n  addListLevel.clearValue();\n  createUserRole2.clearValue();\n}\nelse{\n  addListLevel.clearValue();\n  addListLevel.setDisabled(true);\n}',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="createUserRole2"
          emptyMessage="No options"
          formDataKey="user_role"
          itemMode="static"
          label="User Role"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required="true"
          showSelectionIndicator={true}
          value="admin"
        >
          <Option
            id="77799"
            disabled="{{  CurrentUserObj?.value?.user_role[0] !=='super_admin' }}"
            label="Super Admin"
            value="super_admin"
          />
          <Option id="19745" label="Admin" value="admin" />
          <Option
            id="980e0"
            disabled="{{CurrentUserObj.value.product === 'uci'}}"
            label="Data Analyst"
            value="data_analyst"
          />
          <Option
            id="7bfd8"
            disabled="{{CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all'}}"
            label="UCI Analyst"
            value="uci_analyst"
          />
          <Option
            id="ce0ff"
            disabled="{{CurrentUserObj.value.product === 'uci'}}"
            label="Standard User"
            value="standard_user"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: 'checkbox3.setValue(false);\naddListLevel.clearValue();\nproductList.clearValue();\n\nif(createUserRole2.value === "data_analyst" || createUserRole2.value === "standard_user" ){\n productList.setValue("firmographics");\n}\nif(createUserRole2.value === "uci_analyst"){\n productList.setValue("uci"); \n addListLevel.setValue("level0") \n}\nif(createUserRole2.value === "super_admin"){\n productList.setValue("all"); \n productList.data[0].setDisabled(true);\n productList.data[1].setDisabled(true);\n}',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="addListLevel"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled="{{createUserRole2.value==='admin' || createUserRole2.value==='super_admin'|| productList.value === 'firmographics'}}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          formDataKey="level"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Level"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select a Level"
          showSelectionIndicator={true}
          tooltipByIndex=""
          value=""
          values=""
        >
          <Option
            id="9122f"
            disabled={false}
            hidden={false}
            label="Level 0"
            value="level0"
          />
          <Option id="13112" disabled={false} label="Level 1" value="level1" />
          <Option
            id="43d2a"
            disabled={false}
            hidden={false}
            label="Level 2"
            value="level2"
          />
        </Select>
        <Multiselect
          id="multiselect11"
          disabled="true"
          emptyMessage="No options"
          formDataKey="region"
          itemMode="static"
          label="Region"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select a Region"
          showSelectionIndicator={true}
          values={null}
          wrapTags={true}
        >
          <Option id="085cf" value="Option 1" />
          <Option id="3ac29" value="Option 2" />
          <Option id="a051b" value="Option 3" />
        </Multiselect>
        <Multiselect
          id="countryList"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          disabled="{{createUserRole2.value==='uci_analyst' || createUserRole2.value==='admin' ||  createUserRole2.value==='standard_user' || createUserRole2.value==='super_admin'}}"
          emptyMessage="No options"
          formDataKey="country"
          iconByIndex="bold/travel-map-location-pin-alternate"
          label="Country"
          labelPosition="top"
          labels="{{item.labels.en}}"
          overlayMaxHeight={375}
          placeholder="Select a Country"
          required={true}
          showSelectionIndicator={true}
          value="{{ createUserRole2.value === 'uci_analyst' || createUserRole2.value === 'admin' || createUserRole2.value === 'standard_user' || createUserRole2.value === 'super_admin'? ['United States of America'] : [] }}
"
          values="{{ item.labels.en }}"
          wrapTags={true}
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: 'var selectedCountries = getCountries.data.filter((obj)=> {\n  return countryList.value.includes(obj.labels.en)\n});\n\nvar selectedCodes = selectedCountries.map((obj)=> obj.a2);\nif(selectedCountries.length === getCountries.data.length){\n  //console.log("true");\n  checkbox3.setValue(true);\n}else{\n   //console.log("false");\n  checkbox3.setValue(false);\n}\ncreateCountryCodeList.setValue(selectedCodes);',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Multiselect>
        <Multiselect
          id="createCountryCodeList"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          disabled="true"
          emptyMessage="No options"
          formDataKey="country_iso"
          label="Country code"
          labelPosition="top"
          labels="{{item.a2}}"
          overlayMaxHeight={375}
          placeholder="Select a Country Code"
          required={true}
          showSelectionIndicator={true}
          value="{{ createUserRole2.value === 'uci_analyst' || createUserRole2.value === 'admin' || createUserRole2.value === 'super_admin' || createUserRole2.value === 'standard_user'? ['US'] :  CountriesList.value.filter((a) => {
    return countryList.value.includes(a.labels.en)
  }).map(a => a.a2) }}
"
          values="{{ item.a2 }}"
          wrapTags={true}
        />
        <Multiselect
          id="multiselect12"
          disabled="true"
          emptyMessage="No options"
          formDataKey="team"
          itemMode="static"
          label="Team"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select a Team"
          showSelectionIndicator={true}
          values={null}
          wrapTags={true}
        >
          <Option id="085cf" value="Option 1" />
          <Option id="3ac29" value="Option 2" />
          <Option id="a051b" value="Option 3" />
        </Multiselect>
        <Checkbox
          id="checkbox3"
          disabled="{{createUserRole2.value==='uci_analyst' || createUserRole2.value==='admin' || createUserRole2.value==='standard_user' || createUserRole2.value==='super_admin'}}"
          label="Click check box to select/deselect all countries"
          labelWidth={100}
          value=""
        >
          <Event
            event="true"
            method="run"
            params={{
              ordered: [
                {
                  src: '//console.log("Selected Countries:");\nif(checkbox3.value === true){\nvar selectedCountries = CountriesList.value.map((obj) => obj.labels.en);\nvar selectedCodes =CountriesList.value.map((obj) => obj.a2);\n\n// Update \'editCountryList\' with the English names\ncountryList.setValue(selectedCountries);\n\n//console.log("Selected Countries:", selectedCountries);\n//console.log("Selected Codes (a2 values):", selectedCodes);\n\n// Step 2: Set all \'a2\' values to \'editCountryCode\'\ncreateCountryCodeList.setValue(selectedCodes);\n//console.log("createCountryCodeList:", editCountryCode);\n}\n\n',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if(checkbox3.value===false){\n  countryList.setValue([]);\n  createCountryCodeList.setValue([]);\n}",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Checkbox>
      </Body>
      <Footer>
        <Button
          id="cancel"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "createUserForm.clear();\ncreateUserForm.setHidden(true);",
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
          id="AddUser"
          submit={true}
          submitTargetId="createUserForm"
          text="Add User"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleCreateUser"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Form
      id="editUserForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData=""
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle54" value="#### Edit User" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput124"
          formDataKey="user_name"
          label="User"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
          value="{{userListTable.data.filter((obj) => obj.Id === userListTable.selectedRow.Id)[0].user_name}}"
        />
        <TextInput
          id="textInput125"
          disabled="true"
          formDataKey="email"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          placeholder="you@example.com"
          value="{{ userListTable.selectedRow.email}}"
        />
        <Select
          id="productListEdit"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled=""
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          formDataKey="product"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Product"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select a Product"
          required={true}
          showSelectionIndicator={true}
          tooltipByIndex=""
          value="{{ userListTable.selectedRow.product}}"
          values=""
        >
          <Option
            id="65ccf"
            disabled="{{editUserRole.value ==='super_admin'|| editUserRole.value ==='uci_analyst' || CurrentUserObj.value.product === 'uci' }}"
            hidden="false"
            label="Firmographics"
            value="firmographics"
          />
          <Option
            id="9122f"
            disabled="{{editUserRole.value==='super_admin' || editUserRole.value==='data_analyst' || editUserRole.value==='standard_user' || CurrentUserObj.value.product === 'firmographics' }}"
            hidden={false}
            label="UCI"
            value="uci"
          />
          <Option
            id="13112"
            disabled="{{CurrentUserObj.value.product !== 'all' && editUserRole.value !=='super_admin'}}"
            hidden="false"
            label="ALL"
            value="all"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: 'if(productListEdit.value === "all"){\n  editUserRole.setValue("super_admin");\n}\n\nif(productListEdit.value === "uci" && editUserRole.value === "uci_analyst"){\n  editListLevel.setValue("level0");\n} \n\nif(productListEdit.value === "firmographics" && editUserRole.value === "uci_analyst"){\n  editListLevel.clearValue();\n  editUserRole.clearValue();\n}\nif(productListEdit.value === "uci" && editUserRole.value !== "uci_analyst" && editUserRole.value !== "admin"){\n  editListLevel.clearValue();\n  editUserRole.clearValue();\n}\nelse{\n  editListLevel.clearValue();\n  editListLevel.disabled();\n}',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="editUserRole"
          emptyMessage="No options"
          formDataKey="user_role"
          itemMode="static"
          label="User Role"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required="true"
          showSelectionIndicator={true}
          value="{{userListTable.data.filter((obj) => obj.Id === userListTable.selectedRow.Id)[0].user_role[0]}}"
        >
          <Option
            id="522b7"
            disabled="{{CurrentUserObj?.value?.user_role[0] !=='super_admin' }}"
            label="Super Admin"
            value="super_admin"
          />
          <Option id="19745" label="Admin" value="admin" />
          <Option
            id="d7cfb"
            disabled="{{CurrentUserObj.value.product === 'uci'}}"
            label="Data Analyst"
            value="data_analyst"
          />
          <Option
            id="7bfd8"
            disabled="{{CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all'}}"
            label="UCI Analyst"
            value="uci_analyst"
          />
          <Option
            id="29c37"
            disabled="{{CurrentUserObj.value.product === 'uci'}}"
            label="Standard User"
            value="standard_user"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: '\n  editListLevel.clearValue();\n productListEdit.clearValue();\n\n\nif(editUserRole.value === "data_analyst" || editUserRole.value === "standard_user" ){\n productListEdit.setValue("firmographics");\n}\nif(editUserRole.value === "uci_analyst"){\n productListEdit.setValue("uci"); \n editListLevel.setValue("level0");\n}\nif(editUserRole.value === "super_admin"){\n productListEdit.setValue("all"); \n  productListEdit.data[0].setDisabled(true);\n  productListEdit.data[1].setDisabled(true);\n}',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="editListLevel"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled="{{editUserRole.value==='admin' || editUserRole.value==='super_admin' || productListEdit.value == 'firmographics' }}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          formDataKey="level"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Level"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select Level"
          showSelectionIndicator={true}
          tooltipByIndex=""
          value="{{ userListTable.selectedRow.level}}"
          values=""
        >
          <Option
            id="ae312"
            disabled={false}
            hidden={false}
            label="Level 0"
            value="level0"
          />
          <Option
            id="9122f"
            disabled={false}
            hidden={false}
            label="Level 1"
            value="level1"
          />
          <Option
            id="2b8dc"
            disabled={false}
            hidden={false}
            label="Level 2"
            value="level2"
          />
        </Select>
        <Multiselect
          id="multiselect14"
          disabled="true"
          emptyMessage="No options"
          formDataKey="region"
          itemMode="static"
          label="Region"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select options"
          showSelectionIndicator={true}
          value="{{userListTable.selectedRow.region}}"
          values={null}
          wrapTags={true}
        >
          <Option id="9dde6" value="Option 1" />
          <Option id="8986a" value="Option 2" />
          <Option id="5670b" value="Option 3" />
        </Multiselect>
        <Multiselect
          id="editCountryList"
          colorByIndex="{{ item.currency }}"
          data="{{ CountriesList.value }}"
          disabled="{{editUserRole.value === 'uci_analyst' || editUserRole.value === 'admin' || editUserRole.value === 'super_admin' || editUserRole.value === 'standard_user' }}"
          emptyMessage="No options"
          formDataKey="country"
          iconByIndex="bold/travel-map-location-pin-alternate"
          label="Country"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select options"
          required={true}
          showSelectionIndicator={true}
          value="{{ editUserRole.value === 'uci_analyst' || editUserRole.value === 'admin' || editUserRole.value === 'super_admin' || editUserRole.value === 'standard_user'  ? ['United States of America'] : userListTable.selectedRow.country }}"
          values="{{ item.labels.en }}"
          wrapTags={true}
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: '\n\n\nvar selectedCountries = getCountries.data.filter((obj)=> {\n  return editCountryList.value.includes(obj.labels.en)\n});\n\nvar selectedCodes = selectedCountries.map((obj)=> obj.a2);\n//console.log("false");\nif(selectedCountries.length === getCountries.data.length){\n  //console.log("true");\n  checkbox2.setValue(true);\n}else{\n   //console.log("false");\n  checkbox2.setValue(false);\n}\n\n  editCountryCode.setValue(selectedCodes);',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Multiselect>
        <Multiselect
          id="editCountryCode"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          disabled="true"
          emptyMessage="No options"
          formDataKey="country_iso"
          label="Country Code"
          labelPosition="top"
          labels="{{item.a2}}"
          overlayMaxHeight={375}
          placeholder="Select options"
          required={true}
          showSelectionIndicator={true}
          value="{{ editUserRole.value === 'uci_analyst' || editUserRole.value === 'admin' ||  editUserRole.value === 'super_admin' ||  editUserRole.value === 'standard_user'? ['US'] : 
  CountriesList.value.filter((a) => {
    return editCountryList.value.includes(a.labels.en)
  }).map(a => a.a2)
}}"
          values="{{ item.a2 }}"
          wrapTags={true}
        />
        <Multiselect
          id="multiselect13"
          disabled="true
"
          emptyMessage="No options"
          formDataKey="team"
          itemMode="static"
          label="Team"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select a Team"
          showSelectionIndicator={true}
          values={null}
          wrapTags={true}
        >
          <Option id="9dde6" value="Option 1" />
          <Option id="8986a" value="Option 2" />
          <Option id="5670b" value="Option 3" />
        </Multiselect>
        <Checkbox
          id="checkbox2"
          disabled="{{editUserRole.value==='uci_analyst' || editUserRole.value==='admin' || editUserRole.value==='super_admin' || editUserRole.value==='standard_user' }}"
          hidden=""
          label="Click check box to select/deselect all countries"
          labelWidth={100}
          value="{{userListTable.selectedRow.all_countries_selected}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: '//console.log("Selected Countries:");\nif(checkbox2.value === true){\nvar selectedCountries = CountriesList.value.map((obj) => obj.labels.en);\nvar selectedCodes = CountriesList.value.map((obj) => obj.a2);\n\n// Update \'editCountryList\' with the English names\neditCountryList.setValue(selectedCountries);\n\n//console.log("Selected Countries:", selectedCountries);\n//console.log("Selected Codes (a2 values):", selectedCodes);\n\n// Step 2: Set all \'a2\' values to \'editCountryCode\'\neditCountryCode.setValue(selectedCodes);\n//console.log("editCountryCode:", editCountryCode);\n}\n\n',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if(checkbox2.value===false ){\n  editCountryList.setValue([]);\n  editCountryCode.setValue([]);\n}",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Checkbox>
      </Body>
      <Footer>
        <Button
          id="button25"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "//editUserForm.clear();\neditUserForm.setHidden(true);\n//  let tempCountry = userListTable.selectedRow.country;\n//  let isoCode =userListTable.selectedRow.country_iso;\n//  let role = editUserForm.data.user_role;\n//  //editCountryCode.setValue(userListTable.selectedRow.country_iso);\n\n//  if(userListTable.selectedRow.all_countries_selected){\n//    checkbox2.setValue(true)\n//  }else{\n//    checkbox2.setValue(false)\n//  }\n\n//    if(button4.clickable){\n//      console.log('clickable')\n//    editCountryList.setValue(tempCountry);\n//    editCountryCode.setValue(isoCode);\n//    editUserRole.setValue(role);    \n//     console.log('editUserForm', editUserForm)\n//  }\n//GetListOfUsers.trigger();",
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
            method="run"
            params={{ ordered: [{ src: "createUser.setDisabled(false)" }] }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="EditUserSave"
          submit={true}
          submitTargetId="editUserForm"
          text="Save Changes"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleEditUser"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Frame>
</Screen>
