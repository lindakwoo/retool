<Container
  id="container135"
  disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed' }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle200"
      value="#### Search Roles"
      verticalAlign="center"
    />
    <ButtonGroup2
      id="bulkButtonGroup2"
      alignment="right"
      heightType="auto"
      hidden="true"
      margin="0"
      overflowPosition={2}
    >
      <ButtonGroup2-Button
        id="31423"
        disabled="{{ GetFunctionBulkProcess.data.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code !== 'CDM_FUN_M_301' || GetFunctionBulkProcess.data.requestedState === 'active' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301'  }}"
        styleVariant="solid"
        text="Bulk Active"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: 'loadingPopUp.show();\n\nlet bulkSuppressInput = {\n    uci: CurrentSelectedContact.value.header.entityID,\n    roleStateChange: "active"\n};\n\nBulkProcessPayload.setValue(bulkSuppressInput);\nPutFunctionBulkProcess.trigger();\n\n// Hide loader after 5 seconds\nsetTimeout(() => {\n    loadingPopUp.setHidden(true);\n\n}, 5000);\n',
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
        id="afb81"
        disabled="{{ GetFunctionBulkProcess.data.requestedState === 'active' && GetFunctionBulkProcess.data.state?.code !== 'CDM_FUN_M_301' || GetFunctionBulkProcess.data.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301'  }}"
        styleVariant="solid"
        text="Bulk Suppress"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: ' loadingPopUp.show();\n\nlet bulkSuppressInput = {\n    "uci": CurrentSelectedContact.value.header.entityID,\n    "roleStateChange": "suppressed"\n};\nBulkProcessPayload.setValue(bulkSuppressInput);\nPutFunctionBulkProcess.trigger();\n\n// Hide loader after 5 seconds\nsetTimeout(() => {\n  loadingPopUp.setHidden(true);\n   \n}, 5000);\n\n\n',
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
      id="suppressMsg"
      horizontalAlign="center"
      style={{
        ordered: [
          { color: "warning" },
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
      value={
        "{{\n  GetFunctionBulkProcess.data.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301'\n    ? \"Roles are disabled for editing as they are bulk suppressed. Perform bulk activate first to enable editing.\"\n    : \"\"\n}}\n"
      }
      verticalAlign="center"
    />
  </Header>
  <View id="af8aa" viewKey="View 1">
    <TextInput
      id="searchOrbisId2"
      label="ORBIS ID"
      labelPosition="top"
      placeholder="Enter value"
    >
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ searchOrbisId2.value }}" }] }}
        pluginId="searchOrbisId"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="button14"
      style={{ ordered: [{ background: "canvas" }] }}
      text="CLEAR"
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
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="searchOrbisId"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="searchOrbisId2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="CurrentRoles"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="PreviousRoles"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button13"
      disabled="{{ searchOrbisId2.value === '' }}"
      iconAfter="bold/interface-search"
      text="SEARCH"
    >
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "120" }] }}
        pluginId="CurrentRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "120" }] }}
        pluginId="PreviousRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetAllRolesByOrbisId"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="CurrentRoles"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="PreviousRoles"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="rolesApiTimeoutErrorFlag"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
