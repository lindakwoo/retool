<Container
  id="BodyView2"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden="{{  CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
  margin="0"
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
      id="containerTitle413"
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
      id="container240"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle411"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="d7634" viewKey="View 1">
        <Image
          id="image2"
          dbBlobId="92bd4fc6-5edc-43b0-91c1-04d5fea31217"
          horizontalAlign="right"
          margin="0"
          src="https://picsum.photos/id/1025/800/600"
          srcType="dbBlobId"
        />
        <Text
          id="containerTitle412"
          margin="0"
          marginType="normal"
          overflowType="hidden"
          value="### Mastering: Data Remediation"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Icon
      id="showSideBarIcon2"
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
              src: "sidebarFrame2.setHidden(!sidebarFrame2.hidden);\nadminMenuCollapsibleWrap2.setShowBody(false);\nReportsMenuCollapsibleWrap2.setShowBody(false);\nmanageUrlsCollapsibleWrapFirmo.setShowBody(false);",
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
      id="MainSearchBy2"
      disabled=""
      groupLayout="wrap"
      heightType="fixed"
      hidden="true"
      itemMode="static"
      label="Search By"
      labelWidth="22"
      value="orbis-bvdid"
    >
      <Option
        id="e492a"
        disabled={'{{CurrentUserObj.value.product === "uci"}}'}
        label="Orbis ID / BVDID"
        value="orbis-bvdid"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="search_box_firmo"
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
      id="search_box_firmo"
      disabled="{{ ReferenceDataAPIFailure.value }}"
      hidden=""
      label=""
      margin="0"
      marginType="normal"
      placeholder="Search Orbis ID or BVDID"
      value="{{SearchedEntity.value}}"
    >
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="SegregatedGetFirmo"
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
              src: "if (MainSearchBy.value === 'uci' ) {\n  search_box_firmo.setValue(self.value.toUpperCase());\n}",
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
      <Event
        event="submit"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="JiraTicketNumber"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="mainSearchButton2"
      disabled="{{
 !CurrentUserObj?.value?.product || (CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all') || ReferenceDataAPIFailure.value
}}"
      heightType="auto"
      hidden=""
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
        pluginId="SegregatedGetFirmo"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "''" }] }}
        pluginId="JiraTicketNumber"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Switch
      id="showIPRecords2"
      hidden="{{(MainSearchBy2.value == 'orbis-bvdid' && (TableRecordsMastering.value.length === 0 || TableRecordPremastering.value.length === 0))}}"
      hideLabel={false}
      label="{{showIPRecords2.value ? 'Hide IP Information': 'Show IP Information'}}"
      labelWrap={true}
      marginType="normal"
      style={{ ordered: [] }}
    />
    <Container
      id="container238"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{( TableRecordsMastering.value.length === 0) }}"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="text554"
          marginType="normal"
          style={{ ordered: [] }}
          tooltipText="BvdId"
          value="#### Golden Record"
          verticalAlign="center"
        />
      </Header>
      <View id="8d80b" viewKey="View 1">
        <Table
          id="masterRecordTable2"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{TableRecordsMastering.value}}"
          defaultFilterOperator="or"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          dynamicColumnProperties={{ formatByIndex: "auto" }}
          emptyMessage="No Records Available"
          groupByColumns={{}}
          heightType="auto"
          hidden=""
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
              pluginId="masterRecordTable2"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="ipRecordsWrapper2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{!showIPRecords2.value}}"
      marginType="normal"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle414"
          marginType="normal"
          value="#### Pre-Mastering Records"
          verticalAlign="center"
        />
      </Header>
      <View id="439ab" viewKey="View 1">
        <Table
          id="dlv_ctrl_table6"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ TableRecordPremastering.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          groupByColumns={{}}
          hidden=""
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
            <Event
              event="clickAction"
              method="run"
              params={{
                ordered: [
                  {
                    src: "const addresses = selectedCompany.value.addresses || [];\nconst expandedAddresses = [];\n\naddresses.forEach(addr => {\n  if (addr.item?.localizedAddresses?.length > 1) {\n    addr.item.localizedAddresses.forEach(localized => {\n      const newAddr = JSON.parse(JSON.stringify(addr)); // Deep copy\n      newAddr.item.localizedAddresses = [localized];\n      expandedAddresses.push(newAddr);\n    });\n  } else {\n    expandedAddresses.push(addr);\n  }\n});\n\n// Now update the temp state (or global variable)\nipAndRemAddressRecord.setValue(expandedAddresses);\n",
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
              pluginId="dlv_ctrl_table6"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="container239"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{( TableRecordRemediated.value.length === 0) }}"
      marginType="normal"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle410"
          marginType="normal"
          value="#### Remediated Records"
          verticalAlign="center"
        />
      </Header>
      <View id="439ab" viewKey="View 1">
        <Table
          id="dlv_ctrl_table5"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ TableRecordRemediated.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          groupByColumns={{}}
          heightType="auto"
          hidden=""
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
            formatOptions={{ showSeparators: true, notation: "standard" }}
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
              method="show"
              params={{ ordered: [] }}
              pluginId="firmoIpRecord"
              type="widget"
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
              pluginId="GDDJiraStausFirmo2"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
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
              method="run"
              params={{
                ordered: [
                  {
                    src: "const addresses = selectedCompany.value.addresses || [];\nconst expandedAddresses = [];\n\naddresses.forEach(addr => {\n  if (addr.item?.localizedAddresses?.length > 1) {\n    addr.item.localizedAddresses.forEach(localized => {\n      const newAddr = JSON.parse(JSON.stringify(addr)); // Deep copy\n      newAddr.item.localizedAddresses = [localized];\n      expandedAddresses.push(newAddr);\n    });\n  } else {\n    expandedAddresses.push(addr);\n  }\n});\n\n// Now update the temp state (or global variable)\nipAndRemAddressRecord.setValue(expandedAddresses);\n",
                  },
                ],
              }}
              pluginId=""
              type="script"
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
              enabled="{{ DeleteRemediatedRecord.isFetching }}"
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
              pluginId="dlv_ctrl_table5"
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
