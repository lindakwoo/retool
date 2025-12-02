<Container
  id="container132"
  disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle61"
      value="#### Current Roles"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle61"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ container132.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="container132"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Text
      id="text516"
      hidden="true"
      value="There are more than 120 roles, please search by Orbis ID or BVDID"
      verticalAlign="center"
    />
    <Table
      id="CurrentRolesTable3"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ CurrentRoles.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      defaultSort={[{ object: { columnId: "af82d", direction: "asc" } }]}
      emptyMessage={
        '{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500)\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "active"\n      ? "Bulk Active process is still in progress. Please check back after some time by clicking the refresh button."\n      : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "suppressed"\n        ? "Bulk Suppressed process is still in progress. Please check back after some time by clicking the refresh button."\n        : CurrentRoleTotalElements?.value > 120\n          ? "This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results."\n          : rolesApiTimeoutErrorFlag?.value\n            ? "API request timed out"\n            : "No Roles Available"\n}}\n\n'
      }
      enableSaveActions={true}
      groupByColumns={{}}
      heightType="auto"
      hidden="{{ GetCurrentFunctions.isFetching }}"
      overflowType="pagination"
      primaryKeyColumnId="a8759"
      rowBackgroundColor="{{ currentRow.state.toUpperCase() === 'SUPPRESSED' ? '#feb1b1' : '#fff' }}"
      rowHeight="medium"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="{{ RolesPageSize.value }}"
      toolbarPosition="bottom"
    >
      <Column
        id="3ca12"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="function"
        label="Orbis ID"
        placeholder="Enter value"
        position="center"
        referenceId="orbisId"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.orbisID }}"
      />
      <Column
        id="714e3"
        alignment="left"
        format="string"
        formatOptions={{ notation: "standard" }}
        groupAggregationMode="countDistinct"
        key="function"
        label="Company Id"
        placeholder="Enter value"
        position="center"
        size={113}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.idCompany }}"
      />
      <Column
        id="af82d"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="function"
        label="Company Name"
        placeholder="Enter value"
        position="center"
        referenceId="name"
        size={133}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.nameCompany }}"
      />
      <Column
        id="6224a"
        alignment="left"
        cellTooltipMode="overflow"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="function"
        label="Role"
        placeholder="Enter value"
        position="center"
        size={72}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.functionOriginals}}"
      />
      <Column
        id="a8759"
        alignment="left"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="entityId"
        label="entityId"
        placeholder="Enter value"
        position="center"
        referenceId="entityId"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="2b817"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="state"
        label="State"
        placeholder="Select option"
        position="center"
        size={126}
        summaryAggregationMode="none"
        valueOverride="{{ item === 'active' ? 'Not Suppressed' : 'Suppressed'}}"
      />
      <Column
        id="f390a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="function"
        label="Historization Status"
        placeholder="Enter value"
        position="center"
        referenceId="historizationStatus"
        size={136}
        summaryAggregationMode="none"
        valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
      />
      <Action
        id="5413e"
        disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed'  || suppressFlag.value }}"
        icon="bold/interface-edit-view"
        label="View"
      >
        <Event
          event="clickAction"
          method="setValue"
          params={{ ordered: [{ value: "{{ currentSourceRow }}" }] }}
          pluginId="CurrentSelectedRole"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="run"
          params={{
            ordered: [
              {
                src: "rolesModalOptions.setValue({readOnly: true, title: 'Current Roles'});\n\nRolesModal.show();",
              },
            ],
          }}
          pluginId=""
          type="script"
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
    </Table>
    <HTML
      id="loaderCurrent2"
      css={include("../lib/loaderCurrent2.css", "string")}
      hidden="{{ !GetCurrentFunctions.isFetching }}"
      html={'<div class="loader"></div>'}
    />
  </View>
</Container>
