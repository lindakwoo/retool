<DrawerFrame
  id="adminProviderDeepDive"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Button
      id="drawerCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="adminProviderDeepDive"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="providerScribeHistoryTitle"
      value="#### {{
  (adoptionTable.selectedRow.first_name + ' ' + adoptionTable.selectedRow.last_name)
    .split(' ')
    .map(word => {
      const upper = word.toUpperCase();
      const credentials = ['DO', 'MD', 'RN', 'NP', 'PA', 'APRN', 'LPN', 'CNA', 'DDS', 'DMD', 'DPM', 'OD', 'PHARMD', 'DC', 'PT', 'OT', 'SLP', 'CRNA', 'CNM', 'FNP', 'ANP', 'PNP', 'GNP', 'CNS', 'III', 'II', 'IV', 'JR', 'SR'];
      if (credentials.includes(upper)) return upper;
      return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
    })
    .join(' ')
}}"
      verticalAlign="center"
    />
    <Text
      id="ProviderMetaData"
      style={{ color: "#858585", links: "#858585" }}
      value="{{ adoptionTable.selectedRow.status }} •  {{adoptionTable.selectedRow.email?.toLowerCase()}} • Last active on {{new Date(adoptionTable.selectedRow.last_scribe_date).toLocaleDateString('en-US', {timeZone: 'America/Los_Angeles', weekday: 'long', month: 'long', day: 'numeric', year: 'numeric'})}}"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Container
      id="container27"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle30"
          value="**Provider Scribe Usage Overview**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Text
          id="text91"
          value="**Avg Scribes/Week:** {{ get_provider_usage_metrics.data.avg_scribes_per_active_week?.[0] ?? '—' }}

**Most Used Template:** {{ get_provider_usage_metrics.data.most_used_template?.[0] ?? '—' }}

**Avg Length of Visit:** {{ get_provider_usage_metrics.data.median_minutes_per_visit?.[0] ?? '—' }} min

**Weeks Active:** {{ get_provider_usage_metrics.data.weeks_active?.[0] ?? '—' }}

**Average Scribe Generation Time:** {{ (() => {
    const vals = get_provider_scribe_history.data.latency_seconds?.filter(v => v !== null) || [];
    if (vals.length === 0) return 'No data';
    const avgSecs = vals.reduce((a, b) => a + Number(b), 0) / vals.length;
    const avgMins = avgSecs / 60;
    return `${avgMins.toFixed(1)} min`;
  })() }}"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Container
      id="container25"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle28"
          value="**Provider Weekly Scribe Count**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Chart
          id="sparkline1"
          barGap={null}
          barGroupGap={null}
          barMode="group"
          barOrientation=""
          chartType="line"
          legendPosition="none"
          selectedPoints="[]"
          stackedBarTotalsDataLabelPosition="none"
          title={null}
          xAxisGrid={true}
          xAxisLineWidth={1}
          xAxisRangeMax=""
          xAxisRangeMin=""
          xAxisScale="date"
          xAxisShowLine={true}
          xAxisShowTickLabels={true}
          xAxisTickFormatMode="gui"
          xAxisTitle="Weeks"
          xAxisTitleStandoff={20}
          yAxis2LineWidth={1}
          yAxis2RangeMax=""
          yAxis2RangeMin=""
          yAxis2ShowTickLabels={true}
          yAxis2TickFormatMode="gui"
          yAxis2TitleStandoff={20}
          yAxisLineWidth={1}
          yAxisRangeMax=""
          yAxisRangeMin=""
          yAxisScale="linear"
          yAxisShowLine={true}
          yAxisShowTickLabels={true}
          yAxisTickFormatMode="gui"
          yAxisTitle="Total Scribes"
          yAxisTitleStandoff={20}
        >
          <Series
            id="0"
            aggregationType="sum"
            colorArray={{ array: [null] }}
            colorArrayDropDown={{ array: [null] }}
            colorInputMode="colorArrayDropDown"
            connectorLineColor="#000000"
            dataLabelPosition="none"
            datasource="{{ get_provider_scribe_usage.data }}"
            datasourceMode="source"
            decreasingBorderColor="{{ theme.danger }}"
            decreasingColor="{{ theme.danger }}"
            filteredGroups={null}
            filteredGroupsMode="source"
            gradientColorArray={{
              array: [
                { array: ["0.0", "{{ theme.success }}"] },
                { array: ["1.0", "{{ theme.primary }}"] },
              ],
            }}
            groupBy={{ array: [] }}
            groupByDropdownType="source"
            groupByStyles={{}}
            hoverTemplate={null}
            hoverTemplateMode="source"
            increasingBorderColor="{{ theme.success }}"
            increasingColor="{{ theme.success }}"
            lineColor="{{ theme.primary }}"
            lineDash="solid"
            lineShape="spline"
            lineUnderFillMode="gradient"
            lineWidth="2"
            markerBorderColor={null}
            markerBorderWidth={0}
            markerColor="{{ theme.primary }}"
            markerSize={6}
            markerSymbol="circle"
            name="Get_provider_scribe_usage - total_scribes"
            showMarkers={false}
            textTemplate={null}
            textTemplateMode="manual"
            type="line"
            waterfallBase={0}
            waterfallMeasures={null}
            waterfallMeasuresMode="source"
            xData="{{ get_provider_scribe_usage.data.week_start }}"
            xDataMode="source"
            yAxis="y"
            yData="{{ get_provider_scribe_usage.data.total_scribes }}"
            yDataMode="source"
            zData={null}
            zDataMode="manual"
          />
        </Chart>
      </View>
    </Container>
    <Container
      id="container26"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle29"
          value="**Provider Scribe History**"
          verticalAlign="center"
        />
        <Text
          id="text8"
          horizontalAlign="right"
          style={{ map: { color: "rgba(133, 133, 133, 1)" } }}
          value="_{{dateRangeAllTime.value ? 'All Time' : new Date(dateRange.value.start).toLocaleDateString('en-US', {month: 'long', day: 'numeric', year: 'numeric'}) + ' – ' + new Date(dateRange.value.end).toLocaleDateString('en-US', {month: 'long', day: 'numeric', year: 'numeric'})}}_"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <TextInput
          id="drawerSearch"
          hidden="true"
          hideLabel={true}
          labelPosition="top"
          placeholder="Enter patient name (e.g. Jane Doe)"
        />
        <Table
          id="providerScribeHistory"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{get_provider_scribe_history.data.scribe_id
  .map((_, i) => ({
    scribe_id: get_provider_scribe_history.data.scribe_id[i],
    created_at: get_provider_scribe_history.data.created_at[i],
    patient_name: get_provider_scribe_history.data.patient_name[i],
    template_name: get_provider_scribe_history.data.template_name[i]
  }))
  .filter(row => 
    !drawerSearch.value ||
    row.patient_name?.toLowerCase().includes(drawerSearch.value.toLowerCase()) ||
    row.scribe_id?.toString().includes(drawerSearch.value) ||
    row.template_name?.toLowerCase().includes(drawerSearch.value.toLowerCase())
  )
}}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          groupByColumns={{}}
          overflowType="pagination"
          primaryKeyColumnId="9ae1d"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="4d5f1"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="template_name"
            label="Template name"
            placeholder="Select option"
            position="center"
            size={214.546875}
            valueOverride="{{ item }}"
          />
          <Column
            id="5c0df"
            alignment="left"
            editable="false"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="patient_name"
            label="Patient name"
            position="center"
            size={140.6875}
            summaryAggregationMode="none"
          />
          <Column
            id="43d0b"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={190.375}
          />
          <Column
            id="9ae1d"
            alignment="right"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="scribe_id"
            label="Scribe ID"
            placeholder="Enter value"
            position="center"
            size={78.734375}
            summaryAggregationMode="none"
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
              pluginId="providerScribeHistory"
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
              pluginId="providerScribeHistory"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="selectRow"
            method="setValue"
            params={{ map: { value: "{{currentRow.scribe_id}}" } }}
            pluginId="selectedScribeId"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
    <Container
      id="container11"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{get_provider_template_usage.data.template_name.length <= 1}}"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle14"
          value="**Template Usage**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Chart
          id="templateUsageBarChart"
          barGap={0.4}
          barMode="group"
          hidden="{{get_provider_template_usage.data.template_name.length <= 1}}"
          legendPosition="none"
          selectedPoints="[]"
          stackedBarTotalsDataLabelPosition="none"
          title={null}
          xAxisRangeMax=""
          xAxisRangeMin=""
          xAxisShowTickLabels={true}
          xAxisTickFormatMode="gui"
          xAxisTitleStandoff={20}
          yAxis2LineWidth={1}
          yAxis2RangeMax=""
          yAxis2RangeMin=""
          yAxis2ShowTickLabels={true}
          yAxis2TickFormatMode="gui"
          yAxis2TitleStandoff={20}
          yAxisRangeMax=""
          yAxisRangeMin=""
          yAxisShowTickLabels={true}
          yAxisTickFormatMode="gui"
          yAxisTitleStandoff={20}
        >
          <Series
            id="0"
            aggregationType="none"
            colorArray={{ array: [] }}
            colorArrayDropDown={{ array: [] }}
            colorInputMode="gradientColorArray"
            connectorLineColor="#000000"
            dataLabelPosition="none"
            datasource="{{ get_provider_template_usage.data }}"
            datasourceMode="manual"
            decreasingBorderColor="#000000"
            decreasingColor="#000000"
            filteredGroups={null}
            filteredGroupsMode="source"
            gradientColorArray={{ array: [] }}
            groupBy={{ array: [] }}
            groupByDropdownType="manual"
            groupByStyles={{}}
            hiddenMode="manual"
            hoverTemplateArray={{ array: [] }}
            hoverTemplateMode="manual"
            increasingBorderColor="#000000"
            increasingColor="#000000"
            lineColor="#000000"
            lineDash="solid"
            lineShape="linear"
            lineUnderFillMode="none"
            lineWidth={2}
            markerBorderColor="#ffffff"
            markerBorderWidth={1}
            markerColor="rgba(103, 156, 255, 1)"
            markerSize={6}
            markerSymbol="circle"
            name="Templae Usage"
            showMarkers={false}
            textTemplateMode="manual"
            type="bar"
            waterfallBase={0}
            waterfallMeasures={{ array: [] }}
            waterfallMeasuresMode="source"
            xData="{{ get_provider_template_usage.data.template_name }}"
            xDataMode="source"
            yAxis="y"
            yData="{{ get_provider_template_usage.data.total_scribes }}"
            yDataMode="source"
            zData="[1, 2, 3, 4, 5]"
            zDataMode="manual"
          />
        </Chart>
      </View>
    </Container>
  </Body>
  <Footer>
    <Button
      id="buttonSeeIntegrationUsage"
      hidden="{{(get_integration_adoption.data.total_appointments || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
      style={{}}
      styleVariant="outline"
      text="See Integration Usage"
    >
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="adminProviderDeepDive"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "Integration Usage" } }}
        pluginId="tabs1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="selectRow"
        params={{
          map: {
            options: {
              mode: "index",
              indexType: "data",
              index:
                "{{ tableIntegrationUsage.data.findIndex(row => row.scribe_account_id === Number(adoptionTable.selectedRow.account_id)) }}",
              key: null,
            },
          },
        }}
        pluginId="tableIntegrationUsage"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="get_collaborator_breakdown"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="get_appointment_reason_no_coverage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="get_appointment_reason_with_coverage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{}}
        pluginId="drawerProviderIntegrationUsage"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="get_provider_scribes_synced_1_day"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</DrawerFrame>
