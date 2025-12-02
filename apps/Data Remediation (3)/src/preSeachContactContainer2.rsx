<Container
  id="preSeachContactContainer2"
  disabled="{{  BulkProcessButtonEnabled.value }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle216"
      value="#### Search Roles"
      verticalAlign="center"
    />
    <Text
      id="text540"
      style={{
        ordered: [
          { color: "warning" },
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
      value={
        "{{\n  GetFunctionBulkProcess.data.requestedState === 'suppressed' && GetFunctionBulkProcess.data.state?.code === 'CDM_FUN_M_301'\n    ? \"Roles are bulk suppressed. They can be activated only by bulk activation from the 'My Edits' page.\"\n    : \"\"\n}}\n"
      }
      verticalAlign="center"
    />
  </Header>
  <View id="af8aa" viewKey="View 1">
    <TextInput
      id="remPreSearchOrbisId"
      label="ORBIS ID"
      labelPosition="top"
      placeholder="Enter value"
    >
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ remPreSearchOrbisId.value }}" }] }}
        pluginId="searchOrbisId2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="preClear2"
      disabled="{{ remPreSearchOrbisId.value === '' }}"
      style={{ ordered: [{ background: "canvas" }] }}
      text="CLEAR"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'if(PreAndRemFlagRefresh.value ===false){\n   NoFilterForPreCheck.setValue(false);\n} else{\n  NoFilterForPreCheck.setValue(true);\n}\n console.log("NoFilterForPreCheck value .",NoFilterForPreCheck.value );\nconsole.log("PreAndRemFlagRefresh value .",PreAndRemFlagRefresh.value );\nGetAllHistorizationStatusPreMastering.trigger();',
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
        pluginId="remPreSearchOrbisId"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "0" }] }}
        pluginId="CurrentPreRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "0" }] }}
        pluginId="PreviousPreRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="RolesApiTimeoutErrorFlagOrbisPreMastering"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="RolesApiTimeoutErrorFlagPreMastering"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="preSearchButton2"
      disabled="{{ remPreSearchOrbisId.value === '' }}"
      iconAfter="bold/interface-search"
      text="SEARCH"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetAllHistorizationStatusRolesByOrbisIdPreMastering"
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
        params={{ ordered: [{ value: "1" }] }}
        pluginId="CurrentPreRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "1" }] }}
        pluginId="PreviousPreRoleTotalElements"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="RolesApiTimeoutErrorFlagOrbisPreMastering"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="RolesApiTimeoutErrorFlagPreMastering"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
