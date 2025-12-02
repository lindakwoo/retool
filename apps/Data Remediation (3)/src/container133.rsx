<Container
  id="container133"
  disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle62"
      value="#### Previous Roles"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle62"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ container133.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="container133"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Text
      id="text518"
      hidden="true"
      value="There are more than 120 roles, please search by Orbis ID or BVDID"
      verticalAlign="center"
    />
    <Table
      id="PreviousRolesTable3"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ PreviousRoles.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      defaultSort={[{ object: { columnId: "4d3fe", direction: "asc" } }]}
      dynamicColumnProperties={{ formatByIndex: "auto" }}
      emptyMessage={
        '{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500)\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "active"\n      ? "Bulk Active process is still in progress. Please check back after some time by clicking the refresh button."\n      : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "suppressed"\n        ? "Bulk Suppressed process is still in progress. Please check back after some time by clicking the refresh button."\n        : PreviousRoleTotalElements?.value > 120\n          ? "This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results."\n          : rolesApiTimeoutErrorFlag?.value\n            ? "API request timed out"\n            : "No Roles Available"\n}}\n\n'
      }
      enableSaveActions={true}
      groupByColumns={{}}
      heightType="auto"
      hidden="{{ GetPreviousFunctions.isFetching }}"
      limitOffsetRowCount="{{ PreviousRoleTotalElements.value }}"
      overflowType="pagination"
      primaryKeyColumnId="729d0"
      rowBackgroundColor="{{ currentRow.state.toUpperCase() === 'SUPPRESSED' ? '#feb1b1' : '#fff' }}"
      rowHeight="medium"
      rowSelection="none"
      selectSingleRowsOnActionClick="no"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="{{ RolesPageSize.value }}"
      toolbarPosition="bottom"
    >
      <Include src="./PreviousRolesTable3ExpandedRow.rsx" />
      <Column
        id="d7b22"
        alignment="left"
        editable={false}
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
        id="8a0b1"
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
        id="4d3fe"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        formatOptions={{
          icon: '{{ item === "success" ? "/icon:bold/interface-validation-check-circle" : "/icon:bold/interface-alert-warning-circle" }}',
        }}
        groupAggregationMode="none"
        key="function"
        label="Company Name"
        placeholder="Enter value"
        position="center"
        referenceId="nameCompany"
        size={139}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.nameCompany }}"
      />
      <Column
        id="6215f"
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
        size={73}
        summaryAggregationMode="none"
        valueOverride="{{ item.item.misc.functionOriginals}}"
      />
      <Column
        id="729d0"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
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
        id="37d67"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="state"
        label="State"
        placeholder="Select option"
        position="center"
        size={129}
        summaryAggregationMode="none"
        valueOverride="{{ item === 'active' ? 'Not Suppressed' : 'Suppressed'}}"
      />
      <Column
        id="b9fb9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="function"
        label="Historization Status"
        placeholder="Enter value"
        position="center"
        referenceId="historizationStatus"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
      />
      <Action
        id="3ac5b"
        disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed'  || suppressFlag.value}}"
        icon="bold/interface-edit-view"
        label="View Function"
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
                src: "rolesModalOptions.setValue({readOnly: true, title: 'Previous Roles'});\n\nRolesModal.show();",
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
      id="loaderCurrent4"
      css={include("../lib/loaderCurrent4.css", "string")}
      hidden="{{ !GetPreviousFunctions.isFetching }}"
      html={'<div class="loader"></div>'}
    />
  </View>
</Container>
