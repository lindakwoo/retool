<Container
  id="container113"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <View id="2e49b" viewKey="View 1">
    <Text
      id="text441"
      value="**Contact ID:** {{
  CurrentSelectedContact?.value?.header?.entityId ||
   PreviousRolePreMasteringList?.value[0]?.entityId?.split('_')[0] ||
   CurrentRolePreMasteringList?.value[0]?.entityId?.split('_')[0]
}}
"
      verticalAlign="center"
    />
    <Text
      id="text512"
      value={
        '**State:** {{ CurrentSelectedContact?.value.header.state === "suppressed" ? "Suppressed": "Not Suppressed" }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text510"
      tooltipText="120(*) :Record count in CurrentRoles exceeds threshold of 120 entries"
      value={
        '**Current Roles:** {{CurrentPreRoleTotalElements.value>120 ? "120(*)":CurrentRolePreMasteringList.value.length}}'
      }
      verticalAlign="center"
    />
    <Text
      id="text511"
      tooltipText="120(*) :Record count in PreviousRoles exceeds threshold of 120 entries"
      value={
        '**Previous Roles:** {{PreviousPreRoleTotalElements.value >120 ? "120(*)" :PreviousRolePreMasteringList.value.length}}'
      }
      verticalAlign="center"
    />
    <Icon
      id="deleteContactIcon"
      disabled="{{!CurrentUserObj.value.permission.includes('delete') }}"
      hidden="{{PreAndRemFlagDelete.value}}
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
    </Icon>
  </View>
</Container>
