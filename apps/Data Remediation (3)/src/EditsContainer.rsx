<Container
  id="EditsContainer"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ jiraUCIClick.value }}"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
  style={{ ordered: [{ background: "rgb(232, 238, 250)" }] }}
>
  <Header>
    <Text id="containerTitle132" value="#### My Edits" verticalAlign="center" />
    <Switch
      id="suppressFlag"
      disabled={
        "{{ CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\" }}"
      }
      hidden="{{ CurrentSelectedContact.value.header.state === 'suppressed' }}"
      label="Suppress"
      labelAlign="right"
      labelPosition="left"
    />
    <Switch
      id="activeFlag"
      disabled={
        "{{ CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\" }}"
      }
      hidden="{{ CurrentSelectedContact.value.header && CurrentSelectedContact.value.header.state === 'active' }}"
      label="Active"
      labelAlign="right"
      labelPosition="left"
    />
  </Header>
  <View id="2e49b" viewKey="View 1">
    <Container
      id="container78"
      disabled="{{ValidateUserRole.data }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle130"
          value={
            '###### {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.salutation}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}\n{{NationalitiesList.value.filter((o)=> CurrentSelectedContact.value.personalInfo.item.nationalities.includes(o.code)).map((a) => a.labels.en)}}'
          }
          verticalAlign="center"
        />
      </Header>
      <View id="2e49b" viewKey="View 1">
        <Text
          id="text365"
          style={{ ordered: [] }}
          value="**Contact ID:** {{ CurrentSelectedContact.value.header.entityID}}"
          verticalAlign="center"
        />
        <Text
          id="text367"
          value="**Current Roles:** {{CurrentRoleTotalElements.value > 120 ? '120(*)' : CurrentRoleTotalElements.value }}"
          verticalAlign="center"
        />
        <Text
          id="text366"
          value="**Previous Roles:** {{PreviousRoleTotalElements.value > 120 ? '120(*)' : PreviousRoleTotalElements.value }}"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Include src="./AboutContainer1.rsx" />
    <Include src="./IdentifierContainer.rsx" />
    <Container
      id="EducationContainer1"
      disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle28"
          value="#### Education"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle28"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ EducationContainer1.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="EducationContainer1"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="EducationList"
          data="{{CurrentSelectedContact.value.educations}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Include src="./container95.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="biographyContainer"
      disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle29"
          value="#### Biography"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle29"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ biographyContainer.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="biographyContainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="BiographiesList"
          data="{{ CurrentSelectedContact.value.biographies }}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Checkbox
            id="eachBiographyDeleteFlag"
            hidden="{{ !eachBiographyDeleteFlag.value }}"
            label="Delete"
            labelWidth="100"
            value="{{ BiographyDeleteFlags.value[i] }}"
          />
          <Icon
            id="eachBiographyDelete"
            disabled=""
            hidden={
              '{{ eachBiographyDeleteFlag.value || ValidateUserRole.data || CurrentUserObj.value.level === "level0" }}'
            }
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
          >
            <Event
              enabled="{{ !eachBiographyDelete.disabled}}"
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="HandleBiographyDelete"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
          <TextArea
            id="eachBiography"
            autoResize={true}
            disabled="{{ eachBiographyDeleteFlag.value }}"
            label=""
            labelPosition="top"
            maxLines="6"
            minLines="1"
            style={{
              ordered: [
                {
                  background:
                    "{{ item.item.value !== eachBiography.value ? '#99A7C8' : '#FFFFFF' }}",
                },
              ],
            }}
            value="{{ item.item.value }}"
          >
            <Event
              event="change"
              method="run"
              params={{
                ordered: [
                  {
                    src: "var temp = BiographyValuesList.value;\n\ntemp[i].value = eachBiography.value;\n\nBiographyValuesList.setValue(temp);",
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
    <Include src="./container134.rsx" />
    <Container
      id="container81"
      disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle34"
          value="#### Current Roles"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle34"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ container81.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="container81"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <Table
          id="CurrentRolesTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ CurrentRoles.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          defaultSort={[{ object: { columnId: "af82d", direction: "asc" } }]}
          emptyMessage={
            '{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500)\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "active"\n      ? "Bulk Active process is still in progress. Please check back after some time by clicking the refresh button."\n      : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "suppressed"\n        ? "Bulk Suppressed process is still in progress. Please check back after some time by clicking the refresh button."\n        : CurrentRoleTotalElements?.value > 120\n          ? "This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results."\n          : rolesApiTimeoutErrorFlag?.value\n            ? "API request timed out"\n            : "No Roles Available"\n}}\n\n\n'
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
            id="6f422"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="function"
            label="Orbis ID"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={85}
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
            size={124}
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
            size={74}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.functionOriginals}}"
          />
          <Column
            id="a8759"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="json"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="function"
            label="entityId"
            placeholder="Enter value"
            position="center"
            referenceId="itemObjectHash"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ item.itemObjectHash }}"
          />
          <Column
            id="e79c8"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="state"
            label="State"
            placeholder="Select option"
            position="center"
            size={130}
            summaryAggregationMode="none"
            valueOverride="{{ item === 'active' ? 'Not Suppressed' : 'Suppressed'}}"
          />
          <Column
            id="63245"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={155}
            summaryAggregationMode="none"
            valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
          />
          <Action
            id="5413e"
            disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed'  || suppressFlag.value}}"
            icon="bold/interface-edit-pencil"
            label="Edit"
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
                    src: "console.log(CurrentSelectedRole.value);\nrolesModalOptions.setValue({readOnly: false, title: 'Current Roles'});\ngetNominationStartYears.trigger();\ngetNominationEndYears.trigger();\ngetNominationStartMonths.trigger();\ngetNominationStartDays.trigger();\ngetNominationEndMonths.trigger();\ngetNominationEndDays.trigger();\nRolesModal.show();",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="RoleBasedFeildsForEditable"
              type="datasource"
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
          id="loaderCurrent"
          css={include("../lib/loaderCurrent.css", "string")}
          hidden="{{ !GetCurrentFunctions.isFetching }}"
          html={'<div class="loader"></div>'}
        />
      </View>
    </Container>
    <Container
      id="container129"
      disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle58"
          value="#### Previous Roles"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle58"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ container129.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="container129"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <Table
          id="PreviousRolesTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ PreviousRoles.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          defaultSort={[{ object: { columnId: "4d3fe", direction: "asc" } }]}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage={
            '{{\n  (GetFunctionBulkProcess.data?.metadata?.status === 400 ||  GetFunctionBulkProcess.data?.metadata?.status === 500)\n    ? "Bulk Status Check API failure. Please retry or contact the development team."\n    : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "active"\n      ? "Bulk Active process is still in progress. Please check back after some time by clicking the refresh button."\n      : BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "suppressed"\n        ? "Bulk Suppressed process is still in progress. Please check back after some time by clicking the refresh button."\n        : PreviousRoleTotalElements?.value > 120\n          ? "This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results."\n          : rolesApiTimeoutErrorFlag?.value\n            ? "API request timed out"\n            : "No Roles Available"\n}}\n'
          }
          enableSaveActions={true}
          groupByColumns={{}}
          heightType="auto"
          hidden="{{ GetPreviousFunctions.isFetching }}"
          limitOffsetRowCount="{{ PreviousRoleTotalElements.value }}"
          overflowType="pagination"
          primaryKeyColumnId="bf2f4"
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
          <Include src="./PreviousRolesTableExpandedRow.rsx" />
          <Column
            id="e497b"
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
            size={133}
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
            size={64}
            summaryAggregationMode="none"
            valueOverride="{{ item.item.misc.functionOriginals}}"
          />
          <Column
            id="bf2f4"
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
            id="028db"
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
            valueOverride="{{ item === 'active' ? 'Not Suppressed' : 'Suppressed' }}"
          />
          <Column
            id="edced"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={135}
            summaryAggregationMode="none"
            valueOverride="{{ RoleStatusList.value.filter((obj) => obj.code === item.item.historizationStatus)[0].labels.en }}"
          />
          <Action
            id="3ac5b"
            disabled="{{ CurrentSelectedContact.value.header.state.toLowerCase() === 'suppressed' || suppressFlag.value }}"
            icon="bold/interface-edit-pencil"
            label="Edit Function"
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
                    src: "rolesModalOptions.setValue({readOnly: false, title: 'Previous Roles'});\n\nconsole.log(CurrentSelectedRole.value);\ngetNominationStartYears.trigger();\ngetNominationEndYears.trigger();\ngetNominationStartMonths.trigger();\ngetNominationStartDays.trigger();\ngetNominationEndMonths.trigger();\ngetNominationEndDays.trigger();\nRolesModal.show();",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="RoleBasedFeildsForEditable"
              type="datasource"
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
          id="loaderCurrent3"
          css={include("../lib/loaderCurrent3.css", "string")}
          hidden="{{ !GetPreviousFunctions.isFetching }}"
          html={'<div class="loader"></div>'}
        />
      </View>
    </Container>
  </View>
</Container>
