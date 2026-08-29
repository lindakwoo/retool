<Container
  id="tabbedContainer5"
  currentViewKey=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  loading=""
  padding="12px"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs5"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer5"
      value="{{ self.values[0] }}"
    >
      <Option id="00030" value="Tab 1" />
      <Option id="00031" value="Tab 2" />
      <Option id="00032" value="Tab 3" />
    </Tabs>
  </Header>
  <View
    id="1ac3c"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Coverage Summary"
  >
    <Text
      id="text56"
      value="{{
  (tableIntegrationUsage.selectedRow == null)
    ? ''
    : Number(tableIntegrationUsage.selectedRow?.pct_appointments_synced ?? 0) === 0
      ? 'No appointments have been synced.'
      : '**' + ((tableIntegrationUsage.selectedRow?.pct_appointments_synced ?? 0) * 100).toFixed(1) + '%** of appointments were synced. **' + (get_appointment_reason_no_coverage.data?.reason?.length ?? 0) + '** visit reason types have no scribe coverage.'
}}"
      verticalAlign="center"
    />
    <Button
      id="button24"
      hidden="{{ generate_no_coverage_reasons.data != null || generate_no_coverage_reasons.isFetching }}"
      iconBefore="bold/computer-keyboard-asterisk-1"
      style={{}}
      styleVariant="outline"
      text="Analyze appointments with no coverage"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="generate_no_coverage_reasons"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text57"
      heightType="fixed"
      hidden="{{ generate_no_coverage_reasons.data != null || generate_no_coverage_reasons.isFetching }}"
      style={{ map: { color: "rgba(137, 137, 137, 1)" } }}
      value="_This takes ~30s_"
      verticalAlign="center"
    />
    <Text
      id="txtNoCoverageSummary2"
      hidden="{{ generate_no_coverage_reasons.data == null && !generate_no_coverage_reasons.isFetching }}"
      value="{{ generate_no_coverage_reasons.isFetching ? '⏳ Analyzing visit types...' : '**Summary of visit types with no coverage**\n' + generate_no_coverage_reasons.data }}"
      verticalAlign="center"
    />
  </View>
  <View
    id="00030"
    viewKey="Has Coverage
"
  >
    <Table
      id="table4"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ get_appointment_reason_with_coverage.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      showFooter={true}
      showHeader={true}
      showSummaryRow={true}
      toolbarPosition="bottom"
    >
      <Column
        id="b4778"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        key="pct_scribed"
        label="% Scribed"
        placeholder="Enter value"
        position="center"
        referenceId="scribed"
        size={98}
      />
      <Column
        id="99239"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="reason"
        label="Reason"
        placeholder="Enter value"
        position="center"
        size={210}
        summaryAggregationMode="none"
      />
      <Column
        id="370ba"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="total_appointments"
        label="Total appointments"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="2ad89"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="scribed_appointments"
        label="Scribed appointments"
        placeholder="Enter value"
        position="center"
        size={79}
        summaryAggregationMode="none"
      />
      <Column
        id="11ee8"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        key="pct_of_total_appointments"
        label="% of Appts w/ Reason"
        placeholder="Enter value"
        position="center"
        referenceId="ofApptsWReason"
        size={100}
        summaryAggregationMode="sum"
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
          event="clickToolbar"
          method="exportData"
          pluginId="table4"
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
          event="clickToolbar"
          method="refresh"
          pluginId="table4"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
  <View
    id="00031"
    viewKey="No Coverage
"
  >
    <Table
      id="tableNoScribeCoverage2"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ get_appointment_reason_no_coverage.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      showFooter={true}
      showHeader={true}
      showSummaryRow={true}
      toolbarPosition="bottom"
    >
      <Column
        id="48163"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="reason"
        label="Reason"
        placeholder="Enter value"
        position="center"
        size={220}
        summaryAggregationMode="none"
      />
      <Column
        id="4a849"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="total_appointments"
        label="# Appts"
        placeholder="Enter value"
        position="center"
        referenceId="appts"
        size={129}
        summaryAggregationMode="sum"
      />
      <Column
        id="97994"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        key="pct_of_total_appointments"
        label="% of Appts"
        placeholder="Enter value"
        position="center"
        referenceId="ofAppts"
        size={100}
        summaryAggregationMode="sum"
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
          event="clickToolbar"
          method="exportData"
          pluginId="tableNoScribeCoverage2"
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
          event="clickToolbar"
          method="refresh"
          pluginId="tableNoScribeCoverage2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
