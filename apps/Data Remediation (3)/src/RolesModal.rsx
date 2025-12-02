<ModalFrame
  id="RolesModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text
      id="modalTitle11"
      value="### {{ rolesModalOptions.value.title }}"
      verticalAlign="center"
    />
    <ButtonGroup2 id="buttonGroup5" alignment="right" overflowPosition={2}>
      <ButtonGroup2-Button
        id="3b2f8"
        backgroundColor="#cccccc"
        disabled="{{ bulkEditRolesDisable.value }}"
        styleVariant="custom"
        text="Refresh"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetAllRoles"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
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
                  ordered: [
                    { additionalScope: { ordered: [{ curRecord: "" }] } },
                  ],
                },
              },
            ],
          }}
          pluginId="GetLatestFunctionRecord"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="354a7"
        icon="bold/interface-delete-1"
        iconPosition="replace"
        styleVariant="transparent"
        text="Close"
      >
        <Event
          event="click"
          method="hide"
          params={{ ordered: [] }}
          pluginId="RolesModal"
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
                src: "//refresh data for Remidiate record in background\nGetAllHistorizationStatusPreMastering.trigger();\n\n",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Text
      id="text505"
      value="**Orbis ID:** {{ CurrentSelectedRole.value.function.item.misc.orbisID }}"
      verticalAlign="center"
    />
    <Text
      id="text506"
      value="**Company ID:** {{ CurrentSelectedRole.value.function.item.misc.idCompany }}"
      verticalAlign="center"
    />
    <Text
      id="text513"
      value="**UCI:** {{search_box.value}}"
      verticalAlign="center"
    />
    <Text
      id="text514"
      value="**Role:** {{CurrentSelectedRole.value.function.item.misc.functionOriginals}}"
      verticalAlign="center"
    />
    <Text
      id="text507"
      value="**Company Name:** {{ CurrentSelectedRole.value.function.item.misc.nameCompany }}"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Text
      id="text504"
      hidden="{{ Object.keys(CurrentSelectedRole.value).length > 0 ?  CurrentSelectedRole.value.state.toLowerCase() !== 'suppressed' : true }}"
      horizontalAlign="center"
      style={{ ordered: [{ color: "danger" }] }}
      value="##### The Role has been Suppressed"
      verticalAlign="center"
    />
    <Include src="./GoldenRecordRoleContainer.rsx" />
    <Include src="./myEditsRoleContainer.rsx" />
  </Body>
  <Footer>
    <Button
      id="SaveFunction"
      disabled="{{ rolesModalOptions.value.readOnly || (exemptionFromDate.value && !exemptionToDate.value) || (!exemptionFromDate.value && exemptionToDate.value) ||
  rolePhone.validationMessage.length > 0 || CheckUserRole.data || bulkEditRolesDisable.value}}"
      text="SAVE"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleSaveRole"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    event="hide"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="ResetRolesFields"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
