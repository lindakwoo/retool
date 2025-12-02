<Container
  id="container134"
  disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed' || suppressFlag.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle199"
      value="#### Search Roles"
      verticalAlign="center"
    />
    <ButtonGroup2
      id="bulkButtonGroup"
      alignment="right"
      heightType="auto"
      hidden=""
      margin="0"
      overflowPosition={2}
    >
      <ButtonGroup2-Button
        id="31423"
        disabled={
          "{{\n  (CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\") ||\n  (GetFunctionBulkProcess.data?.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code !== 'CDM_FUN_M_301') ||\n  (GetFunctionBulkProcess.data?.requestedState === 'active' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301') ||\n  ((CurrentRoleTotalElements?.value + PreviousRoleTotalElements?.value) > 120) ||\n  (GetFunctionBulkProcess.data?.metadata?.status === 400) ||\n  (GetFunctionBulkProcess.data?.metadata?.status === 404) || \n  (GetFunctionBulkProcess.data?.metadata?.status === 500) ||\n  (CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level0\") ||\n    (BulkProcessButtonEnabled?.value && bulkStatusValue?.value === \"active\")\n}}\n"
        }
        styleVariant="solid"
        text="Bulk Active"
        tooltip={
          '\n{{  (CurrentRoleTotalElements?.value + PreviousRoleTotalElements?.value) > 120 ? "Bulk activation is currently enabled for UCIs with up to 120 roles.":"" }}'
        }
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
        disabled={
          "{{\n  (CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\") ||\n  (GetFunctionBulkProcess.data?.requestedState === 'active' && GetFunctionBulkProcess.data.state?.code !== 'CDM_FUN_M_301') ||\n  (GetFunctionBulkProcess.data?.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301') ||\n  ( (CurrentRoleTotalElements?.value + PreviousRoleTotalElements?.value) > 120 ) ||\n  (GetFunctionBulkProcess.data?.metadata?.status === 400) ||\n  (GetFunctionBulkProcess.data?.metadata?.status === 500) ||  \n  (CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level0\") ||\n  (BulkProcessButtonEnabled?.value && bulkStatusValue?.value === \"suppressed\")\n  \n}}\n"
        }
        styleVariant="solid"
        text="Bulk Suppress"
        tooltip={
          '{{  (CurrentRoleTotalElements?.value + PreviousRoleTotalElements?.value) > 120 ? "Bulk suppression is currently enabled for UCIs with up to 120 roles.":"" }}'
        }
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
      id="suppressPopMsg"
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
      id="searchOrbisId"
      disabled="{{  BulkProcessButtonEnabled.value}} "
      label="ORBIS ID"
      labelPosition="top"
      placeholder="Enter value"
      tooltipText="If Orbis ID search does not yield results, Search by BVDID as some roles maybe missing Orbis ID"
    >
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ searchOrbisId.value }}" }] }}
        pluginId="searchOrbisId2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="button12"
      disabled="{{ BulkProcessButtonEnabled.value }} "
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
      id="button11"
      disabled="{{ searchOrbisId.value === '' || BulkProcessButtonEnabled.value }}"
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
        pluginId="PreviousRoles"
        type="state"
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
        params={{ ordered: [{ value: "false" }] }}
        pluginId="rolesApiTimeoutErrorFlag"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
