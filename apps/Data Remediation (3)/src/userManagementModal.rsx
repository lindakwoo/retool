<ModalFrame
  id="userManagementModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text id="modalTitle2" value="### User Management" verticalAlign="center" />
    <Button
      id="modalCloseButton2"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="userManagementModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Multiselect
      id="createUserRole1"
      emptyMessage="No options"
      formDataKey="user_role"
      hidden="true"
      itemMode="static"
      label="User Role"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select User Role"
      showSelectionIndicator={true}
      wrapTags={true}
    >
      <Option id="9dde6" label="Admin" value="admin" />
      <Option id="8986a" label="Data Analyst" value="data_analyst" />
      <Option id="5670b" label="Standard User" value="standard_user" />
    </Multiselect>
  </Body>
  <Footer>
    <Multiselect
      id="multiselect6"
      emptyMessage="No options"
      formDataKey="user_role"
      hidden="true"
      itemMode="static"
      label="User Role"
      labelPosition="top"
      labels={null}
      overlayMaxHeight={375}
      placeholder="Select options"
      showSelectionIndicator={true}
      value="{{userListTable.selectedRow.user_role}}"
      values={null}
      wrapTags={true}
    >
      <Option id="9dde6" label="Admin" value="admin" />
      <Option id="8986a" label="Data Analyst" value="data_analyst" />
      <Option id="5670b" label="Standard User" value="standard_user" />
    </Multiselect>
  </Footer>
  <Event
    event="show"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="GetListOfUsers"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="run"
    params={{
      ordered: [
        {
          src: "createUserForm.clear();\ncreateUserForm.setHidden(true);\neditUserForm.clear();\neditUserForm.setHidden(true);",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="show"
    method="show"
    params={{ ordered: [] }}
    pluginId="loadingPopUp"
    type="widget"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
