<DrawerFrame
  id="drawerProviderIntegrationUsage"
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
      id="drawerCloseButton5"
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
        pluginId="drawerProviderIntegrationUsage"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="drawerTitle2"
      heightType="fixed"
      value="#### {{
  (tableIntegrationUsage.selectedRow.first_name + ' ' + tableIntegrationUsage.selectedRow.last_name)
    .split(' ')
    .map(word => {
      const upper = word.toUpperCase();
      const credentials = ['DO', 'MD', 'RN', 'NP', 'PA', 'APRN', 'LPN', 'CNA', 'DDS', 'DMD', 'DPM', 'OD', 'PharmD', 'DC', 'PT', 'OT', 'SLP', 'CRNA', 'CNM', 'FNP', 'ANP', 'PNP', 'GNP', 'CNS', 'III', 'II', 'IV', 'JR', 'SR'];
      if (credentials.includes(upper)) return upper;
      return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
    })
    .join(' ')
}}"
      verticalAlign="center"
    />
    <Text
      id="text58"
      value="{{
  (tableIntegrationUsage.selectedRow == null)
    ? ''
    : '**' + (tableIntegrationUsage.selectedRow?.total_appointments?.toLocaleString() ?? '0') + '** appointments · **' + (tableIntegrationUsage.selectedRow?.total_scribes?.toLocaleString() ?? '0') + '** scribed · **' + (tableIntegrationUsage.selectedRow?.total_appointments_synced?.toLocaleString() ?? '0') + '** synced' + ((get_collaborator_breakdown.data?.scribed_by_name?.length ?? 0) > 1 ? ' by self or collaborator' : '')
}}"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Container
      id="container12"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle15"
          value="{{ (get_provider_scribes_synced_1_day.data?.week_start?.length ?? 0) < 2 ? 'Not enough data yet to show a trend. Check back next week!' : '**Appointments synced under 1 day**' }}"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Chart
          id="chatSyncedUnderOneDay2"
          barMode="group"
          barOrientation=""
          chartType="line"
          hidden="{{ get_provider_scribes_synced_1_day.data.week_start?.length < 2 }}"
          legendPosition="bottom"
          selectedPoints="[]"
          stackedBarTotalsDataLabelPosition="none"
          title={null}
          xAxisLineWidth={1}
          xAxisRangeMax=""
          xAxisRangeMin=""
          xAxisShowLine={true}
          xAxisShowTickLabels={true}
          xAxisTickFormatMode="gui"
          xAxisTitle="Time"
          xAxisTitleStandoff={20}
          yAxis2LineWidth={1}
          yAxis2RangeMax=""
          yAxis2RangeMin=""
          yAxis2ShowTickLabels={true}
          yAxis2TickFormatMode="gui"
          yAxis2TitleStandoff={20}
          yAxisGrid={true}
          yAxisLineWidth={1}
          yAxisRangeMax=""
          yAxisRangeMin=""
          yAxisShowTickLabels={true}
          yAxisTickFormatMode="gui"
          yAxisTitle="Scribes Synced"
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
            datasource="{{ get_provider_scribes_synced_1_day.data }}"
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
            hoverTemplate="<b>%{x}</b><br>%{fullData.name}: %{y}<extra></extra>"
            hoverTemplateMode="source"
            increasingBorderColor="{{ theme.success }}"
            increasingColor="{{ theme.success }}"
            lineColor="rgba(255, 0, 113, 1)"
            lineDash="solid"
            lineShape="spline"
            lineUnderFillMode="gradient"
            lineWidth={2}
            markerBorderColor={null}
            markerBorderWidth={0}
            markerColor="{{ theme.primary }}"
            markerSize={6}
            markerSymbol="circle"
            name="Scribes synced under 1 day"
            showMarkers={false}
            textTemplate={null}
            textTemplateMode="manual"
            type="line"
            waterfallBase={0}
            waterfallMeasures={null}
            waterfallMeasuresMode="source"
            xData="{{ get_provider_scribes_synced_1_day.data.week_start }}"
            xDataMode="source"
            yAxis="y"
            yData="{{ get_provider_scribes_synced_1_day.data.synced_under_1_day }}"
            yDataMode="source"
            zData={null}
            zDataMode="manual"
          />
          <Series
            id="1"
            aggregationType="sum"
            colorArray={{ array: [null] }}
            colorArrayDropDown={{ array: [null] }}
            colorInputMode="colorArrayDropDown"
            connectorLineColor="#000000"
            dataLabelPosition="none"
            datasource="{{ get_provider_scribes_synced_1_day.data }}"
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
            hidden={false}
            hiddenMode="manual"
            hoverTemplate="<b>%{x}</b><br>%{fullData.name}: %{y}<extra></extra>"
            hoverTemplateMode="source"
            increasingBorderColor="{{ theme.success }}"
            increasingColor="{{ theme.success }}"
            lineColor="rgba(84, 78, 253, 1)"
            lineDash="solid"
            lineShape="spline"
            lineUnderFillMode="gradient"
            lineWidth={2}
            markerBorderColor={null}
            markerBorderWidth={0}
            markerColor="{{ theme.primary }}"
            markerSize={6}
            markerSymbol="circle"
            name="Total scribes"
            showMarkers={false}
            textTemplateMode="manual"
            type="line"
            waterfallBase={0}
            waterfallMeasures={null}
            waterfallMeasuresMode="source"
            xData="{{ get_provider_scribes_synced_1_day.data.week_start }}"
            xDataMode="source"
            yAxis="y"
            yData="{{ get_provider_scribes_synced_1_day.data.total_scribes }}"
            yDataMode="source"
            zData={null}
            zDataMode="manual"
          />
        </Chart>
      </View>
    </Container>
    <Container
      id="container13"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="txtCollaboratorBreakdownText5"
          hidden=""
          value="**Appointment Coverage**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Include src="./tabbedContainer5.rsx" />
      </View>
    </Container>
    <Container
      id="container14"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="txtCollaboratorBreakdownText6"
          hidden=""
          value="**{{'Who synced ' + tableIntegrationUsage.selectedRow.first_name + ' ' + tableIntegrationUsage.selectedRow.last_name + '\'s appointments?'}}**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="tableCollaboratorBreakdown2"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ get_collaborator_breakdown.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          heightType="auto"
          hidden=""
          showFooter={true}
          showHeader={true}
          showSummaryRow={true}
          toolbarPosition="bottom"
        >
          <Column
            id="3a5d5"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="scribed_by_name"
            label="Scribed by name"
            placeholder="Enter value"
            position="center"
            size={141}
            summaryAggregationMode="none"
          />
          <Column
            id="41c81"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="relationship"
            label="Relationship"
            placeholder="Select option"
            position="center"
            size={114}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="54c82"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="total_synced"
            label="Appts Synced"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="sum"
          />
          <Column
            id="16aa1"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="percent"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="average"
            key="pct_of_appts_synced"
            label="% Appts Synced"
            placeholder="Enter value"
            position="center"
            referenceId="apptsSynced"
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
              pluginId="tableCollaboratorBreakdown2"
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
              pluginId="tableCollaboratorBreakdown2"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Body>
  <Footer>
    <Button
      id="button25"
      style={{}}
      styleVariant="outline"
      text="See Scribe Usage"
    >
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "Scribe Usage" } }}
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
                "{{ get_adoption.data.account_id\n  .map((id, i) => ({\n    account_id: Number(id),\n    first_name: get_adoption.data.first_name[i],\n    last_name: get_adoption.data.last_name[i],\n    status: get_adoption.data.status[i]\n  }))\n  .filter(row =>\n    (!healthStatusFilter.value || healthStatusFilter.value.includes(row.status)) &&\n    (!providerSearch.value ||\n      row.first_name?.toLowerCase().includes(providerSearch.value.toLowerCase()) ||\n      row.last_name?.toLowerCase().includes(providerSearch.value.toLowerCase())\n    )\n  )\n  .findIndex(row => row.account_id === Number(tableIntegrationUsage.selectedRow.scribe_account_id))\n}}",
              key: null,
            },
          },
        }}
        pluginId="adoptionTable"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="drawerProviderIntegrationUsage"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{}}
        pluginId="adminProviderDeepDive"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</DrawerFrame>
