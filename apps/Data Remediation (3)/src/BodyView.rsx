<Container
  id="BodyView"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  marginType="normal"
  overflowType="hidden"
  padding="0"
  paddingType="normal"
  showBody={true}
  showBorder={false}
  showHeaderBorder={false}
  style={{ ordered: [{ background: "surfacePrimary" }] }}
  transition="slide"
>
  <Header>
    <Text
      id="containerTitle4"
      marginType="normal"
      value="#### Records Information"
      verticalAlign="center"
    />
  </Header>
  <View
    id="1612d"
    icon="bold/interface-file-clipboard"
    iconPosition="left"
    viewKey="Company Informations"
  >
    <Container
      id="container59"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle115"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="d7634" viewKey="View 1">
        <Image
          id="image1"
          dbBlobId="92bd4fc6-5edc-43b0-91c1-04d5fea31217"
          horizontalAlign="right"
          margin="0"
          src="https://picsum.photos/id/1025/800/600"
          srcType="dbBlobId"
        />
        <Text
          id="containerTitle5"
          margin="0"
          marginType="normal"
          overflowType="hidden"
          value="### Mastering: Data Remediation"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Icon
      id="showSideBarIcon"
      disabled="{{ ReferenceDataAPIFailure.value }}"
      hidden="false"
      icon="bold/interface-setting-menu-1"
      maintainSpaceWhenHidden={true}
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "sidebarFrame1.setHidden(!sidebarFrame1.hidden);\nadminMenuCollapsibleWrap.setShowBody(false);\nReportsMenuCollapsibleWrap.setShowBody(false);\nmanageUrlsCollapsibleWrap.setShowBody(false);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <RadioGroup
      id="MainSearchBy"
      disabled="{{
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all') || ReferenceDataAPIFailure.value
}}

"
      groupLayout="wrap"
      heightType="fixed"
      hidden="true"
      itemMode="static"
      label="Search By"
      labelWidth="22"
      value="uci"
    >
      <Option
        id="90cbb"
        disabled={'{{CurrentUserObj.value.product === "firmographics"}}'}
        label="UCI"
        value="uci"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="search_box"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ self.value}}" }] }}
        pluginId="SearchedBy"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="search_box"
      disabled="{{ ReferenceDataAPIFailure.value }}"
      hidden="{{
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'uci'  && CurrentUserObj.value.product !== 'all') 
}}"
      label=""
      margin="0"
      marginType="normal"
      placeholder="Search UCI"
      value="{{SearchedEntity.value}}"
    >
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="SegregatedGet"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="blur"
        method="run"
        params={{
          ordered: [
            {
              src: "if (MainSearchBy.value === 'uci' ) {\n  search_box.setValue(self.value.toUpperCase());\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ self.value.toUpperCase()}}" }] }}
        pluginId="SearchedEntity"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="mainSearchButton"
      disabled="{{
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'uci'  && CurrentUserObj.value.product !== 'all') || ReferenceDataAPIFailure.value
}}"
      heightType="auto"
      hidden="{{
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all') 
}}"
      horizontalAlign="left"
      iconBefore="bold/interface-search"
      margin="0"
      marginType="normal"
      style={{ ordered: [] }}
      submitTargetId=""
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="SegregatedGet"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Switch
      id="showIPRecords"
      hidden="{{(MainSearchBy.value === 'uci' &&  ContactMasterTable.selectedDataIndex === 0) || 
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all') 
}}"
      hideLabel={false}
      label="{{showIPRecords.value ? 'Hide IP Information': 'Show IP Information'}}"
      labelWrap={true}
      marginType="normal"
      style={{ ordered: [] }}
    />
    <Container
      id="container1"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{(MainSearchBy.value === 'orbis-bvdid' && TableRecordsMastering.value.length === 0) || (MainSearchBy.value === 'uci' &&  ContactsList.value.length === 0)}}"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="text12"
          marginType="normal"
          style={{ ordered: [] }}
          tooltipText="BvdId"
          value="#### Golden Record"
          verticalAlign="center"
        />
      </Header>
      <View id="8d80b" viewKey="View 1">
        <Table
          id="masterRecordTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{TableRecordsMastering.value}}"
          defaultFilterOperator="or"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage="No Records Available"
          groupByColumns={{}}
          heightType="auto"
          hidden="true"
          primaryKeyColumnId="c9a15"
          rowHeight="large"
          searchMode="caseInsensitive"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="c9a15"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="false"
            key="EntityId"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={107.078125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.recordID}}"
          />
          <Column
            id="a4743"
            alignment="left"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="Orbis ID"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={109.953125}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.header.entityID }}"
          />
          <Column
            id="dd94f"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="BVD ID"
            placeholder="Enter value"
            position="center"
            referenceId="bvdId"
            size={172.984375}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.header.bvdID }}"
          />
          <Column
            id="53e9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Company Name"
            placeholder="Enter value"
            position="center"
            referenceId="companyName"
            size={236.78125}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return (eachName.item.type === "1" && eachName.item.localizedNames[0].language.toLocaleLowerCase() === "ii")\n})[0].item.localizedNames[0].name}}'
            }
          />
          <Column
            id="cbb25"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={151.296875}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses && currentSourceRow.addresses.some(addr => addr.item.types[0] === '1')
  ? currentSourceRow.addresses.find(addr => addr.item.types[0] === '1').item.localizedAddresses[0].reportedAddress.addressLines.join(', ')
  : currentSourceRow.addresses[0]?.item.localizedAddresses[0]?.reportedAddress.addressLines.join(', ')
}}

"
          />
          <Column
            id="50f33"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={121.09375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses && currentSourceRow.addresses.some(addr => addr.item.types[0] === '1')
  ? currentSourceRow.addresses.find(addr => addr.item.types[0] === '1').item.localizedAddresses[0].reportedAddress.city
  : currentSourceRow.addresses[0]?.item.localizedAddresses[0]?.reportedAddress.city
}}
"
          />
          <Column
            id="5fdb9"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={144.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses && currentSourceRow.addresses.find(addr => addr.item.types[0] === '1')
  ? currentSourceRow.addresses.find(addr => addr.item.types[0] === '1').item.localizedAddresses[0].reportedAddress.postCode
  : currentSourceRow.addresses[0]?.item.localizedAddresses[0]?.reportedAddress.postCode
}}
"
          />
          <Column
            id="feee3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={169.765625}
            summaryAggregationMode="none"
            valueOverride={
              "{{currentSourceRow.addresses && currentSourceRow.addresses.find(addr => addr.item.types[0] === '1')\n  ? currentSourceRow.addresses.find(addr => addr.item.types[0] === '1').item.localizedAddresses[0].reportedAddress.phoneNumbers.join(\", \")\n  : currentSourceRow.addresses[0]?.item.localizedAddresses[0]?.reportedAddress.phoneNumbers.join(\", \")\n}}"
            }
          />
          <Column
            id="112e4"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Fax Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="faxNumbers"
            size={155.734375}
            summaryAggregationMode="none"
            valueOverride={
              "{{currentSourceRow.addresses && currentSourceRow.addresses.find(addr => addr.item.types[0] === '1')\n  ? currentSourceRow.addresses.find(addr => addr.item.types[0] === '1').item.localizedAddresses[0].reportedAddress.faxNumbers.join(\", \")\n  : currentSourceRow.addresses[0]?.item.localizedAddresses[0]?.reportedAddress.faxNumbers.join(\", \")\n}}"
            }
          />
          <Column
            id="20002"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Website"
            placeholder="Enter value"
            position="center"
            referenceId="website"
            size={143}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.digitalPresences.filter(function (item) {
  return item.item.type === '1'
})[0].item.value}}"
          />
          <Column
            id="36a25"
            alignment="center"
            format="icon"
            formatOptions={{ icon: "bold/interface-edit-view" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="right"
            size={33}
            summaryAggregationMode="none"
            valueOverride="view"
          >
            <Event
              event="clickCell"
              method="openPage"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { passDataWith: "urlParams" },
                        {
                          queryParams: [
                            {
                              ordered: [
                                { key: "orbisId" },
                                {
                                  value:
                                    "{{ TableRecordsMastering.value[0].header.entityID }}",
                                },
                              ],
                            },
                            {
                              ordered: [
                                { key: "bvdId" },
                                {
                                  value:
                                    "{{ TableRecordsMastering.value[0].header.bvdID }}",
                                },
                              ],
                            },
                            {
                              ordered: [
                                { key: "ticket" },
                                {
                                  value:
                                    "{{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
                                },
                              ],
                            },
                          ],
                        },
                        { newTab: false },
                      ],
                    },
                  },
                  { pageName: "entityDetails" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="show"
              params={{ ordered: [] }}
              pluginId="loadingPopUp"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <ToolbarButton
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { fileType: "csv" },
                        {
                          fileName:
                            "{{ 'Golden-Record-' + moment().valueOf()}}",
                        },
                        { includeHiddenColumns: false },
                      ],
                    },
                  },
                ],
              }}
              pluginId="masterRecordTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
        <Table
          id="ContactMasterTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ContactsList.value}}"
          defaultFilterOperator="or"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage="No Records Available"
          groupByColumns={{}}
          heightType="auto"
          hidden="{{MainSearchBy.value !== 'uci'}}"
          primaryKeyColumnId="c9a15"
          rowHeight="large"
          searchMode="caseInsensitive"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="c9a15"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="false"
            key="EntityId"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={104.078125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header?.recordId}}"
          />
          <Column
            id="a4743"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="Contact ID"
            placeholder="Enter value"
            position="center"
            referenceId="entityID"
            size={130.953125}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.header.entityID }}"
          />
          <Column
            id="53e9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Name"
            placeholder="Enter value"
            position="center"
            referenceId="FullName"
            size={229.78125}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}'
            }
          />
          <Column
            id="cbb25"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={167.296875}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.addressLines.join(', ')}}"
          />
          <Column
            id="50f33"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={121.09375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.city}}"
          />
          <Column
            id="5fdb9"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={144.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.postCode}}"
          />
          <Column
            id="feee3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={169.765625}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.phone}}"
          />
          <Column
            id="112e4"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Email"
            placeholder="Enter value"
            position="center"
            referenceId="email"
            size={155.734375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.email}}"
          />
          <Column
            id="9dce0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="false"
            label="State"
            placeholder="Enter value"
            position="center"
            referenceId="state"
            size={84.90625}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.header.state === "suppressed" ? "Suppressed": "Not Suppressed" }}\n'
            }
          />
          <Column
            id="a15b3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Source"
            placeholder="Enter value"
            position="center"
            referenceId="source"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ (() => {

  const source = currentSourceRow.header.source;
  const hasDigits = /\d/.test(source);
  if (!hasDigits) {
    // Source is non-digits, return it directly without changes
    return source.toUpperCase();
  }
  // Source contains digits, check with code
  const label = sourceCodes.value.find(item => item.code === source)?.label;
  // If label exists, convert it to uppercase, otherwise return source as is
  return label ? label.toUpperCase() : source.toUpperCase();
})() }}
"
          />
          <Action
            id="5188d"
            icon="bold/interface-user-profile-focus"
            label="View Contact"
          >
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="CurrentSelectedContact"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="UserDetailsModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="run"
              params={{
                ordered: [
                  {
                    src: " await GetFunctionBulkProcess.trigger();\n\n //  if(!BulkProcessButtonEnabled.value) {\n //      console.log('UCI Refresh');\n //     GetAllRoles.trigger();\n //  }",
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
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="ContactMasterTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="ipRecordsWrapper"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{!showIPRecords.value}}"
      marginType="normal"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle9"
          marginType="normal"
          value="#### Pre-Mastering Records"
          verticalAlign="center"
        />
      </Header>
      <View id="439ab" viewKey="View 1">
        <Table
          id="ContactMasterTable4"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ContactIPRecordsList.value}}"
          defaultFilterOperator="or"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage="No Records Available"
          groupByColumns={{}}
          heightType="auto"
          hidden="{{MainSearchBy.value !== 'uci'}}"
          primaryKeyColumnId="c9a15"
          rowHeight="large"
          searchMode="caseInsensitive"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="c9a15"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="false"
            key="EntityId"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={101.078125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.recordId}}"
          />
          <Column
            id="a4743"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="Contact ID"
            placeholder="Enter value"
            position="center"
            referenceId="entityID"
            size={119.953125}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.header.entityId }}"
          />
          <Column
            id="53e9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Name"
            placeholder="Enter value"
            position="center"
            referenceId="FullName"
            size={241.78125}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}'
            }
          />
          <Column
            id="cbb25"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={176.296875}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.addressLines.join(', ')}}"
          />
          <Column
            id="50f33"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={121.09375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.city}}"
          />
          <Column
            id="5fdb9"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={144.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.postCode}}"
          />
          <Column
            id="feee3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={169.765625}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.phone}}"
          />
          <Column
            id="112e4"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Email"
            placeholder="Enter value"
            position="center"
            referenceId="email"
            size={155.734375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.email}}"
          />
          <Column
            id="9dce0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="false"
            label="State"
            placeholder="Enter value"
            position="center"
            referenceId="state"
            size={84.90625}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.header.state === "suppressed" ? "Suppressed": "Not Suppressed" }}'
            }
          />
          <Column
            id="5adb4"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Source"
            placeholder="Enter value"
            position="center"
            referenceId="source"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ (() => {
  const source = currentSourceRow.header.source;
  const hasDigits = /\d/.test(source);
  if (!hasDigits) {
    // Source is non-digits, return it directly without changes
    return source.toUpperCase();
  }
  // Source contains digits, check with code
  const label = sourceCodes.value.find(item => item.code === source)?.label;
  // If label exists, convert it to uppercase, otherwise return source as is
  return label ? label.toUpperCase() : source.toUpperCase();
})() }}
"
          />
          <Action
            id="5188d"
            icon="bold/interface-user-profile-focus"
            label="View Contact"
          >
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="CurrentSelectedContact"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="UserDeatilsIpAndRemedation"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="ValidateUserRole"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="GetDirectorsIdsManagerAllData"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="run"
              params={{
                ordered: [
                  {
                    src: '\n//CurrentPreRoles\nconsole.log("Before filtering CurrentPreRoles:", CurrentPreRoles?.value);\n\n\nconst filteredArrayCurrent = CurrentPreRoles?.value?.filter(item => \n  item.function?.source !== "REMEDIATED"\n) || [];\n\nconsole.log("filteredArrayCurrent array:", filteredArrayCurrent);\nconsole.log("filteredArrayCurrent array length:", filteredArrayCurrent.length);\n\nCurrentRolePreMasteringList.setValue(filteredArrayCurrent);\nconsole.log("Final value of CurrentRolePreMasteringList:", CurrentRolePreMasteringList.value);\n\n\n\n\n//PreviousPreRoles\n\nconsole.log("Before filtering PreviousPreRoles:", PreviousPreRoles?.value);\n\n\nconst filteredArrayPrevious = PreviousPreRoles.value?.filter(item => \n  item.function?.source !== "REMEDIATED"\n) || [];\n\nconsole.log("filteredArrayPrevious array:", filteredArrayPrevious);\nconsole.log("filteredArrayPrevious array length:", filteredArrayPrevious.length);\n\nPreviousRolePreMasteringList.setValue(filteredArrayPrevious);\nconsole.log("Final value of PreviousRolePreMasteringList:", PreviousRolePreMasteringList.value);\n\n',
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
              method="run"
              params={{
                ordered: [
                  {
                    src: "PreAndRemFlagDelete.setValue(true);\nPreAndRemFlagRefresh.setValue(true);",
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
              method="setValue"
              params={{ ordered: [{ value: "true" }] }}
              pluginId="searchRoleFlagForPreAndRem"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <ToolbarButton
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="ContactMasterTable4"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
        <Table
          id="dlv_ctrl_table4"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ TableRecordPremastering.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          groupByColumns={{}}
          hidden="true"
          primaryKeyColumnId="c9a15"
          rowHeight="large"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="c9a15"
            alignment="left"
            editable="false"
            format="string"
            groupAggregationMode="none"
            hidden="false"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={86.828125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.recordID}}"
          />
          <Column
            id="a4743"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: false, notation: "standard" }}
            groupAggregationMode="sum"
            key="EntityId"
            label="Orbis ID"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={85.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.entityID}}"
          />
          <Column
            id="dd94f"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="BVD ID"
            placeholder="Enter value"
            position="center"
            referenceId="bvdId"
            size={152.984375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.bvdID}}"
          />
          <Column
            id="53e9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Company Name"
            placeholder="Enter value"
            position="center"
            referenceId="companyName"
            size={270.78125}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.type === "1" && eachName.item.localizedNames.some(function(localizedName) {\n    return localizedName.language === "II";\n  });\n})[0].item.localizedNames.filter(function(localizedName) {\n  return localizedName.language === "II";\n})[0].name }}'
            }
          />
          <Column
            id="1c4a5"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={276.0625}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.addressLines.join(', ') }}"
          />
          <Column
            id="1f6cf"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={62.90625}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.city
}}"
          />
          <Column
            id="f0700"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={75.953125}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.postCode }}"
          />
          <Column
            id="b8094"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={108.765625}
            summaryAggregationMode="none"
            valueOverride={
              '{{ _.compact(currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.phoneNumbers).join(", ") }}'
            }
          />
          <Column
            id="10d73"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Fax Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="faxNumbers"
            size={92.578125}
            summaryAggregationMode="none"
            valueOverride={
              '\n{{ _.compact(currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.faxNumbers).join(", ") }}'
            }
          />
          <Column
            id="94c2f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Website"
            placeholder="Enter value"
            position="center"
            referenceId="website"
            size={190.671875}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.digitalPresences.filter(function (item) {
  return item.item.type === '1'
})[0].item.value}}"
          />
          <Column
            id="9dce0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Source"
            placeholder="Enter value"
            position="center"
            referenceId="source"
            size={193.90625}
            summaryAggregationMode="none"
            valueOverride={
              '{{ \n(() => {\n  const source = currentSourceRow.header.source;  // This should be "39"\n  // console.log("Source:", source);\n\n  const hasDigits = /\\d/.test(source);\n  // console.log("Has digits?", hasDigits);\n\n  if (!hasDigits) {\n    // If the source does not contain digits, return it directly\n    return source;\n  }\n\n  // Find the matching item in the sourceCodes array\n  const matchedItem = sourceCodes.value.find(item => item.code === source);\n  // console.log("Matched item:", matchedItem);\n\n  // If matchedItem exists and has a label, return the label in uppercase, otherwise return source\n  return matchedItem && matchedItem.labels && matchedItem.labels.en\n    ? matchedItem.labels.en.toUpperCase()  // Convert label to uppercase\n    : source;  // If no match, return the source itself\n})()\n\n\n}}\n'
            }
          />
          <Action
            id="be84c"
            icon="bold/interface-edit-view"
            label="Reference Data"
          >
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="firmoIpRecord"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="selectedCompany"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "false" }] }}
              pluginId="firmoIpandRemFlag"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="openPage"
              params={{
                ordered: [
                  { options: { ordered: [{ passDataWith: "urlParams" }] } },
                  { pageName: "ipRecords" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <ToolbarButton
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { fileType: "csv" },
                        {
                          fileName:
                            "{{ 'PreMastering-Records-' + moment().valueOf()}}",
                        },
                      ],
                    },
                  },
                ],
              }}
              pluginId="dlv_ctrl_table4"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="container3"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{(MainSearchBy.value === 'orbis-bvdid' && TableRecordRemediated.value.length === 0) || (MainSearchBy.value === 'uci' &&  (ContactRemediatedRecordsList.value.length === 0 && RemCurrentRolePreMasteringList.value.length === 0 && RemPreviousRolePreMasteringList.value.length === 0 && PreFunctionRolesGreaterThan120.value.length ===0))}}"
      marginType="normal"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle10"
          marginType="normal"
          value="#### Remediated Records"
          verticalAlign="center"
        />
      </Header>
      <View id="439ab" viewKey="View 1">
        <Table
          id="dlv_ctrl_table3"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ TableRecordRemediated.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          groupByColumns={{}}
          heightType="auto"
          hidden="true"
          primaryKeyColumnId="b08f8"
          rowHeight="large"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="b08f8"
            alignment="left"
            editable="false"
            format="string"
            groupAggregationMode="none"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={109}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.recordID}}"
          />
          <Column
            id="c56c6"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: false, notation: "standard" }}
            groupAggregationMode="sum"
            key="EntityId"
            label="Orbis ID"
            placeholder="Enter value"
            position="center"
            referenceId="orbisId"
            size={119}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.entityID}}"
          />
          <Column
            id="902e2"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="BVD ID"
            placeholder="Enter value"
            position="center"
            referenceId="bvdId"
            size={175}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.header.bvdID }}"
          />
          <Column
            id="b0c4b"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Company Name"
            placeholder="Enter value"
            position="center"
            referenceId="companyName"
            size={224}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.type === "1" && eachName.item.localizedNames.some(function(localizedName) {\n    return localizedName.language.toLocaleLowerCase() === "ii";\n  });\n})[0].item.localizedNames.filter(function(localizedName) {\n  return localizedName.language.toLocaleLowerCase() === "ii";\n})[0].name }}'
            }
          />
          <Column
            id="46dff"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={152}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.addressLines.join(', ') }}"
          />
          <Column
            id="20440"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={127}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.city
}}"
          />
          <Column
            id="dde2e"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={151}
            summaryAggregationMode="none"
            valueOverride="{{ currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.postCode }}"
          />
          <Column
            id="e17ce"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={151}
            summaryAggregationMode="none"
            valueOverride={
              '{{ _.compact(currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.phoneNumbers).join(", ") }}'
            }
          />
          <Column
            id="7c073"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Fax Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="faxNumbers"
            size={147}
            summaryAggregationMode="none"
            valueOverride={
              '{{ _.compact(currentSourceRow.addresses[0].item.localizedAddresses[0].reportedAddress.faxNumbers).join(", ") }}'
            }
          />
          <Column
            id="bebe2"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Website"
            placeholder="Enter value"
            position="center"
            referenceId="website"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.digitalPresences.filter(function (item) {
  return item.item.type === '1'
})[0].item.value}}"
          />
          <Column
            id="06c6d"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Source"
            placeholder="Enter value"
            position="center"
            referenceId="source"
            size={125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.header.source}}"
          />
          <Column
            id="aea44"
            alignment="center"
            format="icon"
            formatOptions={{ icon: "bold/interface-edit-view" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="right"
            referenceId="viewRecord"
            size={36}
            summaryAggregationMode="none"
            valueOverride="view"
          >
            <Event
              event="clickCell"
              method="openPage"
              params={{
                ordered: [
                  { options: { ordered: [{ passDataWith: "urlParams" }] } },
                  { pageName: "ipRecords" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="selectedCompany"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="setValue"
              params={{
                ordered: [{ value: "{{ CreateAddressArray.data.length}}" }],
              }}
              pluginId="contactListLength"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="setValue"
              params={{ ordered: [{ value: "true" }] }}
              pluginId="firmoIpandRemFlag"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="95b24"
            alignment="center"
            format="icon"
            formatOptions={{ icon: "bold/interface-delete-bin-2" }}
            groupAggregationMode="none"
            hidden="{{  (CurrentUserObj.value.user_role?.includes('admin') || CurrentUserObj.value.user_role?.includes('super_admin')) ? false : true }}"
            placeholder="Enter value"
            position="right"
            referenceId="deleteRecord"
            size={30}
            summaryAggregationMode="none"
            valueOverride="delete"
          >
            <Event
              event="clickCell"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="selectedCompany"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="DeleteRemediatedRecord"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="show"
              params={{ ordered: [] }}
              pluginId="loadingPopUp"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="setValue"
              params={{ ordered: [{ value: "true" }] }}
              pluginId="loaderHideFlag"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <ToolbarButton
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        { fileType: "csv" },
                        {
                          fileName:
                            "{{ 'Remediated-Record-' + moment().valueOf()}}",
                        },
                        { includeHiddenColumns: false },
                      ],
                    },
                  },
                ],
              }}
              pluginId="dlv_ctrl_table3"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
        <Table
          id="ContactMasterTable5"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ ContactRemediatedRecordsList?.value.length > 0 ? ContactRemediatedRecordsList.value : RemCurrentRolePreMasteringList?.value.length > 0 ? [RemCurrentRolePreMasteringList.value[0]] : RemPreviousRolePreMasteringList?.value.length > 0 ? [RemPreviousRolePreMasteringList.value[0]] : 
  PreFunctionRolesGreaterThan120?.value.length > 0 ? [PreFunctionRolesGreaterThan120.value[0]] :[] }}"
          defaultFilterOperator="or"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage="No Records Available"
          groupByColumns={{}}
          heightType="auto"
          hidden="{{MainSearchBy.value !== 'uci'}}"
          primaryKeyColumnId="c9a15"
          rowHeight="large"
          searchMode="caseInsensitive"
          showFooter={true}
          showHeader={true}
          style={{ headerBackground: "rgb(117, 120, 123)" }}
          templatePageSize="10"
        >
          <Column
            id="c9a15"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="false"
            key="EntityId"
            label="Record ID"
            placeholder="Enter value"
            position="center"
            referenceId="recordId"
            size={105.078125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow?.header?.recordId || currentSourceRow?.entityId?.split('_')[0]}}"
          />
          <Column
            id="a4743"
            alignment="left"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            label="Contact ID"
            placeholder="Enter value"
            position="center"
            referenceId="entityID"
            size={156.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow?.header?.recordId || currentSourceRow?.entityId?.split('_')[0]}}"
          />
          <Column
            id="53e9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Name"
            placeholder="Enter value"
            position="center"
            referenceId="FullName"
            size={198.78125}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{ currentSourceRow.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}'
            }
          />
          <Column
            id="cbb25"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Address Lines"
            placeholder="Enter value"
            position="center"
            referenceId="addressLines"
            size={151.296875}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.addressLines.join(', ')}}"
          />
          <Column
            id="50f33"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="City"
            placeholder="Enter value"
            position="center"
            referenceId="city"
            size={121.09375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.city}}"
          />
          <Column
            id="5fdb9"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Post Code"
            placeholder="Enter value"
            position="center"
            referenceId="postCode"
            size={144.953125}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.postCode}}"
          />
          <Column
            id="feee3"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Phone Numbers"
            placeholder="Enter value"
            position="center"
            referenceId="phoneNumbers"
            size={169.765625}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.phone}}"
          />
          <Column
            id="112e4"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Email"
            placeholder="Enter value"
            position="center"
            referenceId="email"
            size={137.734375}
            summaryAggregationMode="none"
            valueOverride="{{currentSourceRow.addresses[0].item.reported.email}}"
          />
          <Column
            id="9dce0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="false"
            label="State"
            placeholder="Enter value"
            position="center"
            referenceId="state"
            size={93.90625}
            summaryAggregationMode="none"
            valueOverride={
              '{{ currentSourceRow.header.state === "suppressed" ? "Suppressed": "Not Suppressed" }}'
            }
          />
          <Column
            id="d07f0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            label="Source"
            placeholder="Enter value"
            position="center"
            referenceId="source"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ (() => {
  
  const source = currentSourceRow.header.source;
  const hasDigits = /\d/.test(source);
  if (!hasDigits) {
    // Source is non-digits, return it directly without changes
    return source.toUpperCase();
  }
  // Source contains digits, check with code
  const label = sourceCodes.value.find(item => item.code === source)?.label;
  // If label exists, convert it to uppercase, otherwise return source as is
  return label ? label.toUpperCase() : source.toUpperCase();
})() }}
"
          />
          <Action
            id="5188d"
            icon="bold/interface-user-profile-focus"
            label="View Contact"
          >
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{currentSourceRow}}" }] }}
              pluginId="CurrentSelectedContact"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="ValidateUserRole"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="show"
              params={{ ordered: [] }}
              pluginId="RemContactModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="GetDirectorsIdsManagerAllData"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="filteredRemRoles"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="run"
              params={{
                ordered: [
                  {
                    src: 'if(ContactRemediatedRecordsList?.value.length ===0){\n   PreAndRemFlagDelete.setValue(true);\n  console.log("PreAndRemFlagDelete is true", PreAndRemFlagDelete);\n}else{\nconsole.log("PreAndRemFlagDelete is true", PreAndRemFlagDelete);\n  \nPreAndRemFlagDelete.setValue(false);\n}\n\n',
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
            id="63e10"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="ContactMasterTable5"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </View>
</Container>
