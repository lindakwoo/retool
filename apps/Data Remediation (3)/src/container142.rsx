<Container
  id="container142"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <View id="2e49b" viewKey="View 1">
    <Text
      id="text525"
      value="**Contact ID:** {{
  CurrentSelectedContact?.value?.header?.entityId ||
   RemPreviousRolePreMasteringList?.value[0]?.entityId?.split('_')[0] ||
   RemCurrentRolePreMasteringList?.value[0]?.entityId?.split('_')[0] ||
    PreFunctionRolesGreaterThan120?.value[0]?.header?.entityId
}}
"
      verticalAlign="center"
    />
    <Text
      id="text528"
      value={
        '**State:** {{ CurrentSelectedContact?.value.header && CurrentSelectedContact?.value.header.state === "suppressed" ? "Suppressed": "Not Suppressed" }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text526"
      tooltipText="120(*) :Record count in CurrentRoles exceeds threshold of 120 entries"
      value={
        '**Current Roles:** {{CurrentPreRoleTotalElements.value>120 ? "120(*)": RemCurrentRolePreMasteringList.value.length}}'
      }
      verticalAlign="center"
    />
    <Text
      id="text527"
      tooltipText="120(*) :Record count in PreviousRoles exceeds threshold of 120 entries"
      value={
        '**Previous Roles:** {{PreviousPreRoleTotalElements.value> 120 ? "120(*)" : RemPreviousRolePreMasteringList.value.length}}'
      }
      verticalAlign="center"
    />
    <Icon
      id="deleteRemContactIcon"
      disabled="{{ CurrentUserObj?.value?.user_role[0] !== 'admin' && CurrentUserObj?.value?.user_role[0] !== 'uci_analyst' && CurrentUserObj?.value?.user_role[0] !== 'super_admin'}}
"
      hidden="{{PreAndRemFlagDelete.value || CurrentUserObj?.value.level === 'level0'}}
"
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      tooltipText="Delete Contact Details Only"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="DeleteRemediatedContactRecord"
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
        method="run"
        params={{ ordered: [{ src: "remPreSearchOrbisId.clearValue();" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "true" }] }}
        pluginId="DeleteFunctionRoleFlag"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
  </View>
</Container>
