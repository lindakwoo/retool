<Container
  id="GoldenContainer2"
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
      id="containerTitle162"
      value={
        '###### {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.salutation}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}\n{{CountriesList.value.find((o)=>o.a2 === CurrentSelectedContact.value.personalInfo.item.birth.countryIso2).labels.en}}'
      }
      verticalAlign="center"
    />
    <Include src="./container113.rsx" />
  </Header>
  <View id="2e49b" viewKey="View 1">
    <Include src="./AboutContainer3.rsx" />
    <Include src="./EducationContainer5.rsx" />
    <Container
      id="collapsibleContainer23"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle48"
          value="#### Education"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle48"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ collapsibleContainer23.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="collapsibleContainer23"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="EducationList3"
          data="{{CurrentSelectedContact.value.educations}}"
          heightType="auto"
          itemWidth="900px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Include src="./container125.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="container112"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle49"
          value="#### Biography"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle49"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ container112.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="container112"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="BiographiesList3"
          data="{{ CurrentSelectedContact.value.biographies }}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <TextArea
            id="eachBiography3"
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
                    src: "var temp = BiographyValuesList.value;\n\ntemp[i].value = eachBiography3.value;\n\nBiographyValuesList.setValue(temp);",
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
    <Container
      id="preSeachContactContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle201"
          value="#### Search Roles"
          verticalAlign="center"
        />
      </Header>
      <View id="af8aa" viewKey="View 1">
        <TextInput
          id="preSearchOrbisId"
          label="ORBIS ID"
          labelPosition="top"
          placeholder="Enter value"
        >
          <Event
            event="change"
            method="setValue"
            params={{ ordered: [{ value: "{{ preSearchOrbisId.value }}" }] }}
            pluginId="searchOrbisId2"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Button
          id="preClear"
          disabled="{{ preSearchOrbisId.value === '' }}"
          style={{ ordered: [{ background: "canvas" }] }}
          text="CLEAR"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: '\nif(PreAndRemFlagRefresh.value ===false){\n   NoFilterForPreCheck.setValue(false);\n} else{\n  NoFilterForPreCheck.setValue(true);\n}\n console.log("NoFilterForPreCheck value .",NoFilterForPreCheck.value );\nconsole.log("PreAndRemFlagRefresh value .",PreAndRemFlagRefresh.value );\nGetAllHistorizationStatusPreMastering.trigger();',
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
            pluginId="preSearchOrbisId"
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
          id="preSearchButton"
          disabled="{{ preSearchOrbisId.value === '' }}"
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
            params={{ ordered: [{ value: "120" }] }}
            pluginId="CurrentPreRoleTotalElements"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ ordered: [{ value: "120" }] }}
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
    <Container
      id="preAndRemFunctionsContainer"
      disabled="{{CheckUserRole.data}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="preAndRemCollapsibleTitle"
          value="#### Current Roles"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle59"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ preAndRemFunctionsContainer.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="preAndRemFunctionsContainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <Table
          id="preAndRemCurrentRolesTableRows"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ CurrentRolePreMasteringList.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="{{ 
(GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500)
  ? 'Bulk Status Check API failure. Please retry or contact the development team.'
  : (RolesApiTimeoutErrorFlagOrbisPreMastering.value || RolesApiTimeoutErrorFlagPreMastering.value 
    ? 'API request timed out' 
    : (CurrentPreRoleTotalElements.value > 120 || CurrentRolePreMasteringList.value.length > 120 
      ? 'This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results.' 
      : 'No Roles Available'))


}}

"
          enableSaveActions={true}
          groupByColumns={{}}
          heightType="auto"
          overflowType="pagination"
          primaryKeyColumnId="714e3"
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
            editable={false}
            format="json"
            formatOptions={{ notation: "standard" }}
            groupAggregationMode="countDistinct"
            key="function"
            label="Company Id"
            placeholder="Enter value"
            position="center"
            size={183.1875}
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
            size={474.1875}
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
            size={153.625}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="50a6c"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="sum"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={137}
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
      id="preAndRemPreviouscontainer"
      disabled="{{CheckUserRole.data }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle60"
          value="#### Previous Roles"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle60"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ preAndRemPreviouscontainer.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="preAndRemPreviouscontainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <Table
          id="preAndRemPreviousRolesTableRows"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ PreviousRolePreMasteringList.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage={
            '{{ \n  (GetFunctionBulkProcess.data?.metadata?.status === 400 || GetFunctionBulkProcess.data?.metadata?.status === 500) \n    ? "Bulk Status Check API failure. Please retry or contact the development team." \n    : (RolesApiTimeoutErrorFlagOrbisPreMastering.value || RolesApiTimeoutErrorFlagPreMastering.value \n        ? "API request timed out" \n        : (PreviousPreRoleTotalElements.value > 120 || PreviousRolePreMasteringList.value.length > 120 \n            ? "This UCI has more than 120 roles. Please use the Orbis ID Search to retrieve more refined results." \n            : "No Roles Available"\n          )\n      ) \n}}\n'
          }
          enableSaveActions={true}
          groupByColumns={{}}
          heightType="auto"
          limitOffsetRowCount="{{ PreviousRoleTotalElements.value }}"
          overflowType="pagination"
          primaryKeyColumnId="51167"
          rowHeight="small"
          selectSingleRowsOnActionClick="no"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          templatePageSize="{{ RolesPageSize.value }}"
          toolbarPosition="bottom"
        >
          <Include src="./preAndRemPreviousRolesTableRowsExpandedRow.rsx" />
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
            size={105}
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
            size={469.390625}
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
            referenceId="state"
            size={168.421875}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="dc2ff"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="sum"
            key="function"
            label="Historization Status"
            placeholder="Enter value"
            position="center"
            referenceId="historizationStatus"
            size={140}
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
