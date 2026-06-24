<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="f988ea1b-ab47-4fdc-8fbb-ca980c3de335"
>
  <GoogleSheetsQuery
    id="cindy"
    resourceDisplayName="linda test google sheet"
    resourceName="ceec915a-85ed-4f58-98b7-631484c88c0e"
    sheetName="Cindy"
    spreadsheetId="1i2nwLUod9sAjyeUKnF4Ds0Hgzl_dnqVgejQyBDiC5jI"
  />
  <GoogleSheetsQuery
    id="addCindy"
    actionType="append"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    resourceDisplayName="linda test google sheet"
    resourceName="ceec915a-85ed-4f58-98b7-631484c88c0e"
    runWhenModelUpdates={false}
    sheetName="Cindy"
    sheetUpdate="{{ form2.data }}"
    showSuccessToaster={false}
    spreadsheetId="1i2nwLUod9sAjyeUKnF4Ds0Hgzl_dnqVgejQyBDiC5jI"
  >
    <Event
      id="e87f5cb6"
      event="success"
      method="trigger"
      params={{}}
      pluginId="cindy"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </GoogleSheetsQuery>
  <GoogleSheetsQuery
    id="debbie"
    resourceDisplayName="linda test google sheet"
    resourceName="ceec915a-85ed-4f58-98b7-631484c88c0e"
    sheetName="Debbie"
    spreadsheetId="1i2nwLUod9sAjyeUKnF4Ds0Hgzl_dnqVgejQyBDiC5jI"
  />
  <GoogleSheetsQuery
    id="addDebbie"
    actionType="append"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    resourceDisplayName="linda test google sheet"
    resourceName="ceec915a-85ed-4f58-98b7-631484c88c0e"
    runWhenModelUpdates={false}
    sheetName="Debbie"
    sheetUpdate="{{ form2.data }}"
    showSuccessToaster={false}
    spreadsheetId="1i2nwLUod9sAjyeUKnF4Ds0Hgzl_dnqVgejQyBDiC5jI"
  >
    <Event
      id="a86523f3"
      event="success"
      method="trigger"
      params={{}}
      pluginId="debbie"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </GoogleSheetsQuery>
  <JavascriptQuery
    id="query1"
    notificationDuration={4.5}
    query={include("../lib/query1.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <GoogleSheetsQuery
    id="query2"
    resourceDisplayName="linda test google sheet"
    resourceName="ceec915a-85ed-4f58-98b7-631484c88c0e"
    spreadsheetId="1pE6QxJgaLTN5kdot0tfHMBMPBOPw_tUC7uABoVfYjBg/"
    useRawSpreadsheetId={true}
  />
  <JavascriptQuery
    id="query3"
    notificationDuration={4.5}
    query={include("../lib/query3.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="text1"
      value="👋 **Hello {{ current_user.firstName || 'friend' }}**"
      verticalAlign="center"
    />
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ cindy.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Column
        id="6947c"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="Date"
        label="Date"
        placeholder="Enter value"
        position="center"
        size={82.40625}
        summaryAggregationMode="none"
      />
      <Column
        id="68bc5"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="Paid"
        label="Paid"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7ed08"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="To"
        label="To"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="cb4c0"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="From"
        label="From"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <ToolbarButton
        id="1a"
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
          id="f7bbda4a"
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="68dc5785"
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        id="79b1dc70"
        event="selectRow"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="query3"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Table
      id="table2"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ debbie.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="35411"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="Paid"
        label="Paid"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e6f81"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="Date"
        label="Date"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="80266"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="To"
        label="To"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="4a007"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="From"
        label="From"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <ToolbarButton
        id="1a"
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
          id="4850f3c7"
          event="clickToolbar"
          method="exportData"
          pluginId="table2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="e54bc85c"
          event="clickToolbar"
          method="refresh"
          pluginId="table2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Form
      id="form2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle2" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="date"
          dateFormat="MMM d, yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          formDataKey="Date"
          iconBefore="bold/interface-calendar"
          label="Date"
          labelPosition="top"
          value="{{ new Date() }}"
        />
        <NumberInput
          id="paid"
          currency="USD"
          formDataKey="Paid"
          inputValue={0}
          label="Paid"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value="300"
        />
        <Select
          id="select2"
          emptyMessage="No options"
          formDataKey="To"
          itemMode="static"
          label="To"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          value="Cindy"
        >
          <Option id="ff2f7" value="Cindy" />
          <Option id="e5c2b" value="Debbie" />
        </Select>
        <Select
          id="select1"
          emptyMessage="No options"
          formDataKey="From"
          itemMode="static"
          label="From"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          value="Linda"
        >
          <Option id="9bbb7" value="Linda" />
        </Select>
      </Body>
      <Footer>
        <Button
          id="formButton2"
          submit={true}
          submitTargetId="form2"
          text="Submit"
        />
      </Footer>
      <Event
        id="ae85ef9f"
        event="submit"
        method="trigger"
        params={{}}
        pluginId="query1"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Frame>
</Screen>
