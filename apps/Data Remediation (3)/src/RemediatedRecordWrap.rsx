<Container
  id="RemediatedRecordWrap"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
  style={{ ordered: [{ background: "rgb(232, 238, 250)" }] }}
>
  <Header>
    <Text
      id="containerTitle214"
      value={
        '###### {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.salutation}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}\n{{CountriesList.value.find((o)=>o.a2 === CurrentSelectedContact.value.personalInfo.item.birth.countryIso2).labels.en}}'
      }
      verticalAlign="center"
    />
    <Include src="./container142.rsx" />
  </Header>
  <View id="2e49b" viewKey="View 1">
    <Include src="./AboutContainer4.rsx" />
    <Include src="./EducationContainer6.rsx" />
    <Container
      id="collapsibleContainer24"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle64"
          value="#### Education"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle64"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ collapsibleContainer24.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="collapsibleContainer24"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="EducationList4"
          data="{{CurrentSelectedContact.value.educations}}"
          heightType="auto"
          itemWidth="900px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Include src="./container140.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="container141"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle65"
          value="#### Biography"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle65"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ container141.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="container141"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="BiographiesList4"
          data="{{ CurrentSelectedContact.value.biographies }}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <TextArea
            id="eachBiography4"
            autoResize={true}
            disabled="{{ eachBiographyDeleteFlag3.value }}"
            label=""
            labelPosition="top"
            minLines="1"
            value="{{ item.item.value }}"
          >
            <Event
              event="change"
              method="run"
              params={{
                ordered: [
                  {
                    src: "var temp = BiographyValuesList.value;\n\ntemp[i].value = eachBiography4.value;\n\nBiographyValuesList.setValue(temp);",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </TextArea>
        </ListViewBeta>
      </View>
    </Container>
    <Include src="./preSeachContactContainer2.rsx" />
    <Container
      id="RemCurrentFunctionsContainer"
      disabled="{{CheckUserRole.data ||  BulkProcessButtonEnabled.value }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="preAndRemCollapsibleTitle2"
          value="#### Current Roles"
          verticalAlign="center"
        />
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ToggleButton
          id="collapsibleToggle67"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ RemCurrentFunctionsContainer.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="RemCurrentFunctionsContainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
        <Table
          id="preAndRemCurrentRolesTableRows2"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ RemCurrentRolePreMasteringList.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage={
            '{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500 )\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled.value && bulkStatusValue.value === "active"\n      ? "The bulk activation process is still in progress. Please click the refresh button to check again shortly. Once the current process is complete, to suppress records, please perform a bulk suppression from the \'My Edits\' page under the Golden Record section."\n      : BulkProcessButtonEnabled.value && bulkStatusValue.value === "suppressed"\n        ? "The bulk suppression process is still in progress. Please click the refresh button to check again shortly. Once the current process is complete, to activate records, please perform a bulk activation from the \'My Edits\' page under the Golden Record section."\n        : RolesApiTimeoutErrorFlagOrbisPreMastering.value || RolesApiTimeoutErrorFlagPreMastering.value\n          ? "The API request timed out. Please try again later."\n          : (CurrentPreRoleTotalElements.value > 120 || RemCurrentRolePreMasteringList.value.length > 120\n            ? "This UCI has more than 120 roles. Please use the Orbis ID search to retrieve more refined results."\n            : "No roles available.")\n}}\n'
          }
          enableSaveActions={true}
          groupByColumns={{}}
          heightType="auto"
          overflowType="pagination"
          primaryKeyColumnId="714e3"
          rowBackgroundColor="{{currentRow.status === 'Suppressed' ? '#feb1b1' : '#fff' }}"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          templatePageSize="{{ RolesPageSize.value }}"
          toolbarPosition="bottom"
        >
          <Column
            id="164fa"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="function"
            label="Orbis ID"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={145}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.orbisID }}"
          />
          <Column
            id="714e3"
            alignment="left"
            editable={false}
            format="json"
            formatOptions={{ notation: "standard" }}
            groupAggregationMode="countDistinct"
            key="function"
            label="Company Id"
            placeholder="Enter value"
            position="center"
            size={168.1875}
            valueOverride="{{ item.item.misc.idCompany }}"
          />
          <Column
            id="af82d"
            alignment="left"
            format="json"
            groupAggregationMode="none"
            key="function"
            label="Company Name"
            placeholder="Enter value"
            position="center"
            referenceId="name"
            size={329.390625}
            valueOverride="{{ item.item.misc.nameCompany }}"
          />
          <Column
            id="6224a"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ showStepper: true }}
            format="json"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="function"
            label="Role"
            placeholder="Enter value"
            position="center"
            size={364.1875}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.functionOriginals}}"
          />
          <Column
            id="e2984"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="state"
            label="State"
            placeholder="Select option"
            position="center"
            referenceId="status"
            size={132.625}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="f5fcf"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={146}
            summaryAggregationMode="none"
            valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
          />
          <Action id="5413e" icon="bold/interface-edit-view" label="View">
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="RolePreAndRemModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{ currentSourceRow }}" }] }}
              pluginId="CurrentSelectedRole"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="dc7a9"
            disabled="{{ bulkEditRolesDisable.value || !['admin', 'uci_analyst', 'super_admin'].includes(CurrentUserObj?.value?.user_role[0]) }}


"
            hidden="{{ PreAndRemFlagRefresh.value ||   CurrentUserObj.value.level === 'level0' }}"
            icon="bold/interface-delete-bin-2"
            label="Delete"
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
              method="trigger"
              params={{ ordered: [] }}
              pluginId="DeleteFunctionRoles"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="loadingPopUp"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "false" }] }}
              pluginId="NoFilterForPreCheck"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "[]" }] }}
              pluginId="RemCurrentRolePreMasteringList"
              type="state"
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
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="refresh"
              pluginId="CurrentRolesTable2"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="RemPreviousFunctionsContainer"
      disabled="{{CheckUserRole.data ||  BulkProcessButtonEnabled.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle67"
          value="#### Previous Roles"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle68"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ RemPreviousFunctionsContainer.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="RemPreviousFunctionsContainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <Table
          id="preAndRemPreviousRolesTableRows2"
          actionsOverflowPosition={2}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ RemPreviousRolePreMasteringList.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage={
            '\n{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500)\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled.value && bulkStatusValue.value === "active"\n      ? "The bulk activation process is still in progress. Please click the refresh button to check again shortly. Once the current process is complete, to suppress records, please perform a bulk suppression from the \'My Edits\' page under the Golden Record section."\n      : BulkProcessButtonEnabled.value && bulkStatusValue.value === "suppressed"\n        ? "The bulk suppression process is still in progress. Please click the refresh button to check again shortly. Once the current process is complete, to activate records, please perform a bulk activation from the \'My Edits\' page under the Golden Record section."\n        : RolesApiTimeoutErrorFlagOrbisPreMastering.value || RolesApiTimeoutErrorFlagPreMastering.value\n          ? "API request timed out. Please try again later."\n          : (PreviousPreRoleTotalElements.value > 120 || RemPreviousRolePreMasteringList.value.length > 120\n            ? "This UCI has more than 120 roles. Please use the Orbis ID search to retrieve more refined results."\n            : "No roles available.")\n}}\n'
          }
          enableSaveActions={true}
          groupByColumns={{}}
          heightType="auto"
          limitOffsetRowCount="{{ PreviousRoleTotalElements.value }}"
          overflowType="pagination"
          primaryKeyColumnId="51167"
          rowBackgroundColor="{{currentRow.status === 'Suppressed' ? '#feb1b1' : '#fff' }}"
          rowHeight="small"
          selectSingleRowsOnActionClick="no"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          templatePageSize="{{ RolesPageSize.value }}"
          toolbarPosition="bottom"
        >
          <Include src="./preAndRemPreviousRolesTableRows2ExpandedRow.rsx" />
          <Column
            id="b53ef"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="function"
            label="Orbis Id"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={136}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.orbisID }}"
          />
          <Column
            id="51167"
            alignment="left"
            editable="false"
            format="json"
            groupAggregationMode="none"
            key="function"
            label="Company Id"
            placeholder="Enter value"
            position="center"
            size={172.1875}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.idCompany }}"
          />
          <Column
            id="96394"
            alignment="left"
            editable={false}
            format="json"
            groupAggregationMode="none"
            key="function"
            label="Company Name"
            placeholder="Enter value"
            position="center"
            referenceId="nameCompany"
            size={342.390625}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.nameCompany }}"
          />
          <Column
            id="c7da9"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="json"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="function"
            label="Role"
            placeholder="Enter value"
            position="center"
            size={363.390625}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.functionOriginals}}"
          />
          <Column
            id="6a4ba"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="state"
            label="State"
            placeholder="Select option"
            position="center"
            referenceId="status"
            size={132.421875}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="14de6"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={125}
            summaryAggregationMode="none"
            valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
          />
          <Action id="3ac5b" icon="bold/interface-edit-view" label="View">
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="RolePreAndRemModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{ currentSourceRow }}" }] }}
              pluginId="CurrentSelectedRole"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <Action
            id="ef946"
            disabled="{{ bulkEditRolesDisable.value || !['admin', 'uci_analyst', 'super_admin'].includes(CurrentUserObj?.value?.user_role[0]) }}"
            hidden="{{ PreAndRemFlagRefresh.value || CurrentUserObj.value.level === 'level0' }}"
            icon="bold/interface-delete-bin-2"
            label="Delete"
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
              method="trigger"
              params={{ ordered: [] }}
              pluginId="DeleteFunctionRoles"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="loadingPopUp"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "false" }] }}
              pluginId="NoFilterForPreCheck"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "[]" }] }}
              pluginId="RemPreviousRolePreMasteringList"
              type="state"
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
      </View>
    </Container>
  </View>
</Container>
