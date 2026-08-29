<Container
  id="tabbedContainer1"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs1"
      heightType="fixed"
      hidden=""
      itemMode="static"
      navigateContainer={true}
      style={{}}
      targetContainerId="tabbedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="00030" value="Tab 1" />
      <Option id="00031" value="Tab 2" />
      <Option id="00032" value="Tab 3" />
    </Tabs>
  </Header>
  <View
    id="6c4c8"
    disabled={false}
    hidden={false}
    icon="bold/money-graph-bar"
    iconPosition="left"
    viewKey="Overview"
  >
    <Include src="./container4.rsx" />
    <Chart
      id="weeklyActiveProviders"
      barMode="group"
      barOrientation=""
      chartType="line"
      legendPosition="none"
      rangeSlider={true}
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title={null}
      xAxisLineWidth={1}
      xAxisRangeMax=""
      xAxisRangeMin=""
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
      yAxisGrid={true}
      yAxisLineWidth={1}
      yAxisRangeMax=""
      yAxisRangeMin=""
      yAxisShowTickLabels={true}
      yAxisTickFormatMode="gui"
      yAxisTitle="Active Providers"
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
        datasource="{{ get_weekly_active_provider_count.data }}"
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
        lineColor="{{ theme.primary }}"
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor={null}
        markerBorderWidth={0}
        markerColor="{{ theme.primary }}"
        markerSize={6}
        markerSymbol="circle"
        name="Get_adoption - account_id"
        showMarkers={false}
        textTemplate={null}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={null}
        waterfallMeasuresMode="source"
        xData="{{ get_weekly_active_provider_count.data.week_of }}"
        xDataMode="source"
        yAxis="y"
        yData="{{ get_weekly_active_provider_count.data.healthy_partial_providers }}"
        yDataMode="source"
        zData={null}
        zDataMode="manual"
      />
    </Chart>
    <Container
      id="collapsibleContainer1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle1"
          value="#### Feedback Highlights"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle2"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ collapsibleContainer1.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ map: { showBody: "{{ self.value }}" } }}
            pluginId="collapsibleContainer1"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="00030" viewKey="View 1">
        <ListViewBeta
          id="positivefeedbacklist"
          _primaryKeys="{{ item.id }}"
          data="{{ get_positive_feedback_for_site.data }}"
          enableInstanceValues={true}
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="containerSiteFeedback"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="12px"
            showBody={true}
            showHeader={true}
            style={{ map: { border: "rgba(80, 80, 80, 1)" } }}
          >
            <Header>
              <Text
                id="containerTitle33"
                heightType="fixed"
                value="**{{new Date(item.created_at).toLocaleDateString('en-US', {month: 'short', day: 'numeric', year: 'numeric'}) + ' · ' + (function() { const abbrevs = ['MD', 'DO', 'NP', 'PA', 'APRN', 'RN', 'LPN', 'DDS', 'DMD', 'DPM', 'OD', 'PharmD', 'PhD', 'PsyD', 'LCSW', 'MFT', 'DC', 'DPT', 'OT', 'PT']; return item.provider_name.split(' ').map(w => abbrevs.includes(w.toUpperCase()) ? w.toUpperCase() : w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()).join(' '); })()}}**"
                verticalAlign="center"
              />
              <Button
                id="buttonArchiveFeedback2"
                iconBefore="bold/interface-edit-copy"
                style={{ map: { hoverBackground: "rgba(183, 183, 183, 1)" } }}
                styleVariant="outline"
                tooltipText="Copy feedback"
              >
                <Event
                  event="click"
                  method="copyToClipboard"
                  params={{
                    map: {
                      value:
                        "{{item.provider_name.split(' ').map(w => ['MD','DO','NP','PA','APRN','RN','LPN','DDS','DMD','DPM','OD','PharmD','PhD','PsyD','LCSW','MFT','DC','DPT','OT','PT'].includes(w.toUpperCase()) ? w.toUpperCase() : w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()).join(' ') + ' · ' + new Date(item.created_at).toLocaleDateString('en-US', {month: 'short', day: 'numeric', year: 'numeric'}) + '\\n' + item.feedback}}",
                    },
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
              </Button>
            </Header>
            <View id="00030" viewKey="View 1">
              <Text
                id="text92"
                value="{{
  (() => {
    let text = item.feedback.trim();
    text = text.charAt(0).toUpperCase() + text.slice(1);
    if (!/[.!?]$/.test(text)) text = text + '.';
    return text.split('\n').map(line => line.trim() ? `_${line}_` : line).join('\n');
  })()
}}"
                verticalAlign="center"
              />
              <Text
                id="txtFeedbackAddedBy"
                style={{
                  links: "rgba(144, 144, 144, 1)",
                  color: "rgba(149, 149, 149, 1)",
                }}
                value="_{{item.source === 'scribe_feedback' ? 'Added via Scribe Feedback' : 'Added by ' + item.submitted_by.split('@')[0].split('.').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}}_"
                verticalAlign="center"
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
  </View>
  <View id="00030" viewKey="Scribe Usage">
    <Include src="./adminScribeAdoption.rsx" />
    <Divider id="divider1" style={{ map: { color: "rgba(0, 0, 0, 1)" } }} />
    <Button
      id="button1"
      hidden="{{ Object.values(get_adoption.data || {}).every(arr => arr.length === 0) }}"
      iconBefore="bold/interface-download-button-2"
      style={{
        background: "rgba(255, 255, 255, 1)",
        border: "rgba(217, 215, 215, 1)",
        icon: "rgba(140, 140, 140, 1)",
      }}
      text="Download CSV"
    >
      <Event
        event="click"
        method="exportData"
        params={{
          fileType: "csv",
          data: "{{ get_adoption.data }}",
          fileName:
            "{{\n  (() => {\n    const ids = get_sites.data.site_id;\n    const names = get_sites.data.name;\n    const idx = ids?.findIndex(id => Number(id) === Number(selectSite.value));\n    return idx >= 0 ? names[idx]?.replace(/\\s*[\\|\\-]\\s*(Scribe|Ambient|Commure|Pro|Premiere|Meditech).*$/i, '').trim() : '—';\n  })()\n}} Provider Usage - {{new Date().toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}}",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <TextInput
      id="providerSearch"
      hidden="{{ Object.values(get_adoption.data || {}).every(arr => arr.length === 0) }}"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search a specific provider by name or email"
    />
    <Button
      id="button19"
      iconBefore="bold/interface-edit-copy"
      style={{}}
      styleVariant="outline"
      text="All provider emails"
    >
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "const values = get_adoption.data.account_id\n  .map((id, i) => ({\n    email: get_adoption.data.email[i]?.toLowerCase(),\n    first_name: get_adoption.data.first_name[i],\n    last_name: get_adoption.data.last_name[i],\n    status: get_adoption.data.status[i]\n  }))\n  .map(row => row.email)\n  .filter(email => email); // keep this to drop any null/undefined emails\n\nproviderEmailList.setValue(values.join(', '));",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="copyToClipboard"
        params={{ map: { value: "{{  providerEmailList.value }}" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="adoptionTable"
      actionsOverflowPosition={2}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{get_adoption.data.account_id
  .map((id, i) => ({
    account_id: id,
    email: get_adoption.data.email[i],
    first_name: get_adoption.data.first_name[i],
    last_name: get_adoption.data.last_name[i],
    total_scribes: get_adoption.data.total_scribes[i],
    total_session_minutes: get_adoption.data.total_session_minutes[i],
    avg_minutes_per_visit: get_adoption.data.avg_minutes_per_visit[i],
    last_scribe_date: get_adoption.data.last_scribe_date[i],
    weeks_active: get_adoption.data.weeks_active[i],
    avg_days_per_week: get_adoption.data.avg_days_per_week[i],
    scribes_per_week: get_adoption.data.scribes_per_week[i],
    device_types: get_adoption.data.device_types[i],
    status: get_adoption.data.status[i]
  }))
  .filter(row =>
    (!healthStatusFilter.value || healthStatusFilter.value.includes(row.status)) &&
    (!providerSearch.value ||
      row.first_name?.toLowerCase().includes(providerSearch.value.toLowerCase()) ||
      row.last_name?.toLowerCase().includes(providerSearch.value.toLowerCase()) ||
      (row.first_name + ' ' + row.last_name)?.toLowerCase().includes(providerSearch.value.toLowerCase()) ||
      row.email?.toLowerCase().includes(providerSearch.value.toLowerCase())
    )
  )
}}"
      defaultSelectedRow={{
        mode: "index",
        indexType: "display",
        index:
          "{{ adoptionTable.data.findIndex(row => row.account_id === Number(scribeAccountID.value)) }}",
      }}
      groupByColumns={{}}
      hidden="{{ Object.values(get_adoption.data || {}).every(arr => arr.length === 0) }}"
      primaryKeyColumnId="bf088"
      rowBackgroundColor=""
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Column
        id="d5504"
        alignment="left"
        editable="true"
        editableOptions={{ allowCustomValue: true }}
        format="tag"
        formatOptions={{ automaticColors: false, color: "", icon: "" }}
        groupAggregationMode="none"
        key="status"
        label="Adoption Status"
        optionList={{
          manualData: [
            { value: "Healthy", color: "rgba(206, 239, 189, 1)" },
            { value: "Partial", color: "rgba(211, 238, 248, 1)" },
            { value: "At Risk", color: "rgba(252, 249, 211, 1)" },
            { value: "Inactive", color: "rgba(249, 218, 218, 1)" },
            { value: "Not Started", color: "rgba(234, 234, 234, 1)" },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={107.1875}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="a4f81"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="first_name"
        label="First name"
        placeholder="Enter value"
        position="center"
        size={125.734375}
      />
      <Column
        id="29460"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="last_name"
        label="Last name"
        placeholder="Enter value"
        position="center"
        size={107.109375}
      />
      <Column
        id="d5e58"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="total_scribes"
        label="Total scribes"
        placeholder="Enter value"
        position="center"
        size={97.25}
      />
      <Column
        id="3d21a"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="avg_minutes_per_visit"
        label="Avg minutes per visit"
        placeholder="Enter value"
        position="center"
        size={105.765625}
      />
      <Column
        id="f3d7d"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="scribes_per_week"
        label="Notes per week"
        placeholder="Enter value"
        position="center"
        size={84.296875}
      />
      <Column
        id="37d13"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="weeks_active"
        label="Weeks active"
        placeholder="Enter value"
        position="center"
        size={94.015625}
      />
      <Column
        id="bf088"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="account_id"
        label="Account ID"
        placeholder="Enter value"
        position="center"
        size={78.1875}
      />
      <Column
        id="181cf"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="device_types"
        label="Device types"
        placeholder="Enter value"
        position="center"
        size={123.421875}
        valueOverride="{{ item }}"
      />
      <Column
        id="5a9a1"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="last_scribe_date"
        label="Last scribe date"
        placeholder="Enter value"
        position="center"
        size={143.078125}
      />
      <Column
        id="3b80b"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        hidden="true"
        key="email"
        label="Email"
        position="center"
        size={100}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ map: { url: "mailto:{{ item }}" } }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="49a2c"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="true"
        key="total_session_minutes"
        label="Total session minutes"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="e7123"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="true"
        key="avg_days_per_week"
        label="Avg days per week"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Action
        id="f5704"
        icon="bold/interface-edit-copy"
        label="Copy provider email"
      >
        <Event
          event="clickAction"
          method="copyToClipboard"
          params={{ map: { value: "{{ currentSourceRow.email }}" } }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <Action
        id="0efea"
        icon="bold/interface-arrows-right-alternate"
        label="View provider scribe history"
      >
        <Event
          event="clickAction"
          method="show"
          params={{}}
          pluginId="adminProviderDeepDive"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_provider_scribe_history"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_provider_template_usage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_provider_scribe_usage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_provider_usage_metrics"
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
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      />
      <Event
        event="selectRow"
        method="setValue"
        params={{ map: { value: "{{ currentRow.account_id }}" } }}
        pluginId="scribeAccountID"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View
    id="00032"
    hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
    viewKey="Integration Usage"
  >
    <Text id="text55" value="#### Integration Usage" verticalAlign="center" />
    <Chart
      id="weeklyScribes"
      barMode="group"
      barOrientation=""
      chartType="line"
      legendPosition="bottom"
      rangeSlider={true}
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title={null}
      xAxisLineWidth={1}
      xAxisRangeMax=""
      xAxisRangeMin=""
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
      yAxisGrid={true}
      yAxisLineWidth={1}
      yAxisRangeMax=""
      yAxisRangeMin=""
      yAxisShowTickLabels={true}
      yAxisTickFormatMode="gui"
      yAxisTitle="Total Number"
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
        datasource="{{ get_weekly_scribe_count.data }}"
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
        lineColor={'{{ theme._tokensById["ed707141"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor={null}
        markerBorderWidth={0}
        markerColor="{{ theme.primary }}"
        markerSize={6}
        markerSymbol="circle"
        name="Scribes Generated"
        showMarkers={false}
        textTemplate={null}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={null}
        waterfallMeasuresMode="source"
        xData="{{ get_weekly_scribe_count.data.week_of }}"
        xDataMode="source"
        yAxis="y"
        yData="{{ get_weekly_scribe_count.data.total_scribes }}"
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
        datasource="{{ get_weekly_appointments.data }}"
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
        lineColor={'{{ theme._tokensById["28d9aad4"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor={null}
        markerBorderWidth={0}
        markerColor="{{ theme.primary }}"
        markerSize={6}
        markerSymbol="circle"
        name="Scheduled Appointments"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={null}
        waterfallMeasuresMode="source"
        xData="{{ get_weekly_appointments.data.week_of }}"
        xDataMode="source"
        yAxis="y"
        yData="{{ get_weekly_appointments.data.total_appointments }}"
        yDataMode="source"
        zData={null}
        zDataMode="manual"
      />
      <Series
        id="2"
        aggregationType="sum"
        colorArray={{ array: [null] }}
        colorArrayDropDown={{ array: [null] }}
        colorInputMode="colorArrayDropDown"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasource="{{ get_weekly_syncs.data }}"
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
        lineColor={'{{ theme._tokensById["51d18f8b"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor={null}
        markerBorderWidth={0}
        markerColor="{{ theme.primary }}"
        markerSize={6}
        markerSymbol="circle"
        name="EHR Syncs"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={null}
        waterfallMeasuresMode="source"
        xData="{{ get_weekly_syncs.data.week_of }}"
        xDataMode="source"
        yAxis="y"
        yData="{{ get_weekly_syncs.data.total_synced_scribes }}"
        yDataMode="source"
        zData={null}
        zDataMode="manual"
      />
    </Chart>
    <Text
      id="text74"
      style={{ map: { color: "rgba(131, 131, 131, 1)" } }}
      value="_Viewing scribe data from the last 30 days_"
      verticalAlign="center"
    />
    <TextInput
      id="providerSearch2"
      hidden="{{ Object.values(get_adoption.data || {}).every(arr => arr.length === 0) }}"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search a specific provider by name or email"
    />
    <Button
      id="button23"
      hidden=""
      iconBefore="bold/interface-download-button-2"
      style={{
        background: "rgba(255, 255, 255, 1)",
        border: "rgba(217, 215, 215, 1)",
        icon: "rgba(140, 140, 140, 1)",
      }}
      text="Download CSV"
    >
      <Event
        event="click"
        method="exportData"
        params={{
          fileType: "csv",
          data: "{{ get_integration_adoption.data }}",
          fileName:
            "{{\n  (() => {\n    const ids = get_sites.data.site_id;\n    const names = get_sites.data.name;\n    const idx = ids?.findIndex(id => Number(id) === Number(selectSite.value));\n    return idx >= 0 ? names[idx]?.replace(/\\s*[\\|\\-]\\s*(Scribe|Ambient|Commure|Pro|Premiere|Meditech).*$/i, '').trim() : '—';\n  })()\n}} Ambient Integration Usage - {{new Date().toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}}",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="tableIntegrationUsage"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{
  (get_integration_adoption.data?.first_name || [])
    .map((first, i) => ({
      provider_id: get_integration_adoption.data.provider_id?.[i],
      scribe_account_id: get_integration_adoption.data.scribe_account_id?.[i],
      first_name: first,
      last_name: get_integration_adoption.data.last_name?.[i],
      total_scribes: get_integration_adoption.data.total_scribes?.[i],
      total_ehr_syncs: get_integration_adoption.data.total_ehr_syncs?.[i],
      pct_scribes_synced: get_integration_adoption.data.pct_scribes_synced?.[i],
      total_appointments: get_integration_adoption.data.total_appointments?.[i],
      total_appointments_synced: get_integration_adoption.data.total_appointments_synced?.[i],
      pct_appointments_synced: get_integration_adoption.data.pct_appointments_synced?.[i],
      median_days_to_sync: get_integration_adoption.data.median_days_to_sync?.[i],
      last_sync_date: get_integration_adoption.data.last_sync_date?.[i]
    }))
    .filter(row =>
      !providerSearch2.value ||
      row.first_name?.toLowerCase().includes(providerSearch2.value.toLowerCase()) ||
      row.last_name?.toLowerCase().includes(providerSearch2.value.toLowerCase()) ||
      (row.first_name + ' ' + row.last_name)?.toLowerCase().includes(providerSearch2.value.toLowerCase())
    )
    .sort((a, b) => (b.total_ehr_syncs || 0) - (a.total_ehr_syncs || 0))
}}"
      defaultSelectedRow={{
        mode: "index",
        indexType: "display",
        index:
          "{{ adoptionTable.selectedRow?.account_id\n  ? tableIntegrationUsage.data.findIndex(row =>\n      row.scribe_account_id === Number(adoptionTable.selectedRow.account_id)\n    ) : -1 }}",
      }}
      enableSaveActions={true}
      hidden=""
      primaryKeyColumnId="eb467"
      rowBackgroundColor=""
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Column
        id="a5f3b"
        alignment="center"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="median_days_to_sync"
        label="Days to Sync"
        placeholder="Enter value"
        position="center"
        size={90.359375}
        summaryAggregationMode="none"
        tooltip="Median number of days between when a scribe note was created and when it first synced to the EHR. Only includes notes that were synced."
      />
      <Column
        id="10b94"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="first_name"
        label="First Name"
        placeholder="Enter value"
        position="center"
        size={113.578125}
        summaryAggregationMode="none"
      />
      <Column
        id="32016"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="last_name"
        label="Last Name"
        placeholder="Enter value"
        position="center"
        size={96.734375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="b1360"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="total_scribes"
        label="Scribes"
        placeholder="Enter value"
        position="center"
        size={58.359375}
        summaryAggregationMode="none"
        tooltip="Number of scribe notes created in the selected date range. Excludes test accounts and site admins with <10 scribes."
      />
      <Column
        id="e06fb"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
        key="total_ehr_syncs"
        label="EHR Syncs"
        placeholder="Enter value"
        position="center"
        size={77.421875}
        summaryAggregationMode="none"
        tooltip="Number of scribe notes that were successfully synced to the EHR in the selected date range."
      />
      <Column
        id="ddb99"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
        key="pct_scribes_synced"
        label="% Scribes Synced"
        placeholder="Enter value"
        position="center"
        size={109.359375}
        summaryAggregationMode="none"
        tooltip="Percentage of scribe notes that were synced to the EHR."
      />
      <Column
        id="d48a3"
        alignment="right"
        cellTooltip="{{ item }}"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="{{(get_integration_adoption.data.total_appointments || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
        key="total_appointments"
        label="Appointments"
        placeholder="Enter value"
        position="center"
        size={95.078125}
        summaryAggregationMode="none"
        tooltip="Total non-cancelled appointments up until today, including appointments scribed for via collaborator mode."
      />
      <Column
        id="7e35a"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="{{(get_integration_adoption.data.total_appointments || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
        key="pct_appointments_synced"
        label="% Appointments Synced"
        placeholder="Enter value"
        position="center"
        size={96.078125}
        summaryAggregationMode="none"
        tooltip="Percentage of appointments that had a corresponding EHR sync."
      />
      <Column
        id="d579a"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="scribe_account_id"
        label="Scribe account ID"
        placeholder="Enter value"
        position="center"
        size={116.328125}
        summaryAggregationMode="none"
      />
      <Column
        id="eb467"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="provider_id"
        label="Provider ID"
        placeholder="Enter value"
        position="center"
        size={78.390625}
        summaryAggregationMode="none"
      />
      <Column
        id="3d855"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="total_appointments_synced"
        label="Total appointments synced"
        placeholder="Enter value"
        position="center"
        size={169.484375}
        summaryAggregationMode="none"
      />
      <Column
        id="ebc8e"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="last_sync_date"
        label="Last sync date"
        placeholder="Enter value"
        position="center"
        size={99.0625}
        summaryAggregationMode="none"
      />
      <Action
        id="51cbd"
        hidden="{{(get_integration_adoption.data.total_appointments || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
        icon="bold/interface-arrows-right-alternate"
        label="Deep Dive"
      >
        <Event
          event="clickAction"
          method="setValue"
          params={{ map: { value: "{{ currentRow.scribe_account_id }}" } }}
          pluginId="scribeAccountID"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="show"
          params={{}}
          pluginId="drawerProviderIntegrationUsage"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_collaborator_breakdown"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_appointment_reason_no_coverage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_appointment_reason_with_coverage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="reset"
          params={{}}
          pluginId="generate_no_coverage_reasons"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{}}
          pluginId="get_provider_scribes_synced_1_day"
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
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      />
      <Event
        event="selectRow"
        method="setValue"
        params={{ map: { value: "{{ currentRow.scribe_account_id }}" } }}
        pluginId="scribeAccountID"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View
    id="896fb"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Note Quality"
  >
    <Table
      id="table5"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ monthlyMetricsCombined.data?.rows || [] }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="93755"
      searchMode="disabled"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="93755"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="month"
        label="Month"
        position="center"
        referenceId="month"
        size={95}
        summaryAggregationMode="none"
      />
      <Column
        id="773b4"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="month_dt"
        label="Month dt"
        position="center"
        referenceId="month_dt"
        size={180}
        summaryAggregationMode="none"
      />
      <Column
        id="27f87"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="false"
        key="provider_email"
        label="Provider email"
        position="center"
        referenceId="provider_email"
        size={220}
        summaryAggregationMode="none"
      />
      <Column
        id="e0ccc"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="provider_name"
        label="Provider name"
        position="center"
        referenceId="provider_name"
        size={119}
        summaryAggregationMode="none"
      />
      <Column
        id="f2ca1"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="avg_bert_score"
        label="Avg bert score"
        placeholder="Enter value"
        position="center"
        referenceId="avg_bert_score"
        size={105}
        summaryAggregationMode="none"
        valueOverride="{{ (() => { const raw = currentSourceRow.avg_bert_score; const v = (raw === '' || raw == null) ? null : Number(raw); return Number.isFinite(v) ? v : null; })() }}"
      />
      <Column
        id="6b7ee"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="none"
        key="evaluations_bert"
        label="Evaluations (BERT)"
        position="center"
        referenceId="evaluations_bert"
        size={140}
        summaryAggregationMode="none"
        valueOverride="{{ (() => { const raw = currentSourceRow.evaluations_bert; const v = (raw === '' || raw == null) ? null : Number(raw); return Number.isFinite(v) ? v : null; })() }}"
      />
      <Column
        id="27a33"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true }}
        groupAggregationMode="none"
        key="avg_percent_retained"
        label="Avg percent retained"
        position="center"
        referenceId="avg_percent_retained"
        size={156}
        summaryAggregationMode="none"
        valueOverride="{{ (() => { const raw = currentSourceRow.avg_percent_retained; const v = (raw === '' || raw == null) ? null : Number(raw); return Number.isFinite(v) ? v : null; })() }}"
      />
      <Column
        id="775ca"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="none"
        key="evaluations_retained"
        label="Evaluations (Retained)"
        position="center"
        referenceId="evaluations_retained"
        size={160}
        summaryAggregationMode="none"
        valueOverride="{{ (() => { const raw = currentSourceRow.evaluations_retained; const v = (raw === '' || raw == null) ? null : Number(raw); return Number.isFinite(v) ? v : null; })() }}"
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
          pluginId="table5"
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
          pluginId="table5"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Select
      id="selectProviderBert"
      allowDeselect={true}
      data="{{ (() => {
  const bert = formatDataAsArray(get_bert_scores_avg_monthly.data) || [];
  const ret  = mergeRetainedWithMeta.data?.rows || [];
  const bIds = new Set(bert.filter(r => Number(r.evaluations || 0) > 0).map(r => Number(r.provider_id)).filter(id => Number.isFinite(id)));
  const rIds = new Set(ret.filter(r => Number(r.evaluations || r.evaluations_retained || 0) > 0).map(r => Number(r.provider_id)).filter(id => Number.isFinite(id)));
  const ids = Array.from(new Set([...bIds, ...rIds]));

  const combined = monthlyMetricsCombined.data?.rows || [];
  const byId = {};
  for (const r of combined) {
    if (Number.isFinite(Number(r.provider_id))) {
      byId[Number(r.provider_id)] = { email: r.provider_email, name: r.provider_name };
    }
  }
  const fallbackArr = formatDataAsArray(get_providers_lookup.data) || [];
  const fallback = {};
  for (const r of fallbackArr) {
    if (Number.isFinite(Number(r.provider_id))) {
      fallback[Number(r.provider_id)] = { email: r.provider_email, name: r.provider_name };
    }
  }

  const options = ids.map(id => {
    const meta = byId[id] || fallback[id] || {};
    const label = meta.name || meta.email || String(id);
    return { label, value: String(id) };
  });

  return [{ label: 'SITE AVERAGE', value: 'SITE AVERAGE' }, ..._.sortBy(options, 'label')];
})() }}"
      emptyMessage="No options"
      label="Display Provider (optional)"
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Select a provider or SITE AVERAGE"
      showClear={true}
      showSelectionIndicator={true}
      value="SITE AVERAGE"
      values="{{ item.value }}"
    >
      <Option id="00030" value="Option 1" />
      <Option id="00031" value="Option 2" />
      <Option id="00032" value="Option 3" />
    </Select>
    <Chart
      id="chartBertMonthly"
      barMode="group"
      barOrientation=""
      chartType="line"
      clearOnEmptyData={true}
      legendPosition="bottom"
      rangeSlider={true}
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title={null}
      xAxisLineWidth={1}
      xAxisRangeMax=""
      xAxisRangeMin=""
      xAxisShowLine={true}
      xAxisShowTickLabels={true}
      xAxisTickFormatMode="gui"
      xAxisTitle="Month"
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
      yAxisTitle="Avg BERT Score"
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
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["28d9aad4"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="solid"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#1f77b4"
        markerSize={6}
        markerSymbol="circle"
        name="SITE AVERAGE"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ get_bert_scores_avg_monthly.data.month || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ (get_bert_scores_avg_monthly.data.avg_bert_score || []).map((v,i) => (get_bert_scores_avg_monthly.data.provider_email || [])[i] === 'SITE AVERAGE' ? Number(v) : null) || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="1"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["ed707141"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="solid"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#ff7f0e"
        markerSize={6}
        markerSymbol="circle"
        name="Selected provider"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ get_bert_scores_avg_monthly.data.month || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ (get_bert_scores_avg_monthly.data.avg_bert_score || []).map((v,i) => ((get_bert_scores_avg_monthly.data.provider_id || [])[i] === Number(selectProviderBert.value)) ? Number(v) : null) || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
    </Chart>
    <Chart
      id="chartPercentRetainedMonthly"
      barMode="group"
      barOrientation=""
      chartType="line"
      clearOnEmptyData={true}
      legendPosition="bottom"
      rangeSlider={true}
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title="Monthly % Retained"
      xAxisLineWidth={1}
      xAxisRangeMax=""
      xAxisRangeMin=""
      xAxisShowLine={true}
      xAxisShowTickLabels={true}
      xAxisTickFormatMode="gui"
      xAxisTitle="Month"
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
      yAxisTitle="Avg % Retained (%)"
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
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["28d9aad4"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="solid"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#6b7280"
        markerSize={6}
        markerSymbol="circle"
        name="SITE AVERAGE"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ get_percent_retained_avg_monthly.data.month || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ (get_percent_retained_avg_monthly.data.avg_percent_retained || []).map((v,i) => (get_percent_retained_avg_monthly.data.provider_id || [])[i] == null ? Number(v) : null) || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="1"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["ed707141"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="solid"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#2563eb"
        markerSize={6}
        markerSymbol="circle"
        name="Selected provider"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ get_percent_retained_avg_monthly.data.month || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ (get_percent_retained_avg_monthly.data.avg_percent_retained || []).map((v,i) => ((get_percent_retained_avg_monthly.data.provider_id || [])[i] === Number(selectProviderBert.value)) ? Number(v) : null) || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
    </Chart>
  </View>
  <View
    id="16472"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="All Scribes"
  >
    <Text
      id="scribeactivitytitle"
      value="#### Recent Scribe Activity"
      verticalAlign="center"
    />
    <Text
      id="text81"
      value="**Average Generation Time (last week)**: {{ (() => {
    const secs = get_avg_generation_time.data.avg_latency_seconds?.[0];
    if (secs === undefined || secs === null) return 'Loading...';
    const n = Number(secs);
    const mins = Math.floor(n / 60);
    const rem = Math.round(n % 60);
    return mins > 0 ? `${mins}m ${rem}s` : `${rem}s`;
  })() }}"
      verticalAlign="center"
    />
    <Button
      id="button26"
      disabled="{{ !templateSelect.value || templateSelect.value.length === 0 }}"
      hidden=""
      iconBefore="bold/interface-edit-copy"
      style={{}}
      styleVariant="outline"
      text="Emails of template users"
      tooltipText="Copy the emails for providers who are using templates listed in the table"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ map: { value: "{{ providerEmailList.value }}" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Select
      id="templateSelect"
      data="{{[
  {label: 'All Templates', value: null},
  ..._.uniq(
    get_all_scribes.data.template_name.filter((t, i) => {
      const email = get_all_scribes.data.email[i];
      return t != null
        && email
        && !email.match(/@getathelas\.com|@commure\.com|@augmedix\.com|test/i);
    })
  ).map(t => ({label: t, value: t}))
]}}"
      emptyMessage="No options"
      hideLabel={true}
      iconBefore="bold/interface-align-layers-1-alternate"
      iconByIndex=""
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Filter by template"
      showSelectionIndicator={true}
      value=""
      values="{{ item.value }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          map: {
            src: "const selectedTemplate = templateSelect.value;\n\nconst rows = selectedTemplate\n  ? tableAllScribes.data.filter(r => r.template_name === selectedTemplate)\n  : tableAllScribes.data;\n\nconst emails = [...new Set(\n  rows.map(r => r.email).filter(Boolean)\n)].join(', ');\n\nproviderEmailList.setValue(emails);\n\nreturn emails;",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Text
      id="text15"
      style={{ map: { color: "rgba(72, 72, 72, 1)" } }}
      value="_You are viewing scribes from:_ {{dateRangeAllTime.value ? 'All Time' : new Date(dateRange.value.start).toLocaleDateString('en-US', {month: 'long', day: 'numeric', year: 'numeric'}) + ' – ' + new Date(dateRange.value.end).toLocaleDateString('en-US', {month: 'long', day: 'numeric', year: 'numeric'})}}"
      verticalAlign="center"
    />
    <Table
      id="tableAllScribes"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{get_all_scribes.data.scribe_id
  .map((_, i) => ({
    scribe_id: get_all_scribes.data.scribe_id[i],
    created_at: get_all_scribes.data.created_at[i],
    patient_name: get_all_scribes.data.patient_name[i],
    template_name: get_all_scribes.data.template_name[i],
    provider_name: get_all_scribes.data.provider_name[i],
    email: get_all_scribes.data.email[i],
    status: get_all_scribes.data.status[i],
    device_type: get_all_scribes.data.device_type[i]
  }))
  .filter(row =>
    (!templateSelect.value || templateSelect.value.length === 0 || templateSelect.value.includes(row.template_name))
  )
}}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="56f5f"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="scribe_id"
        label="Scribe ID"
        placeholder="Enter value"
        position="center"
        size={78.953125}
        summaryAggregationMode="none"
      />
      <Column
        id="a94a6"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="created_at"
        label="Date Created (PT)"
        placeholder="Enter value"
        position="center"
        size={149.015625}
        summaryAggregationMode="none"
      />
      <Column
        id="74f0c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: false, icon: "", color: "" }}
        groupAggregationMode="none"
        hidden="false"
        key="provider_name"
        label="Provider name"
        placeholder="Select option"
        position="center"
        size={136.390625}
        summaryAggregationMode="none"
        valueOverride="{{ item.toLowerCase().replace(/\b\w/g, c => c.toUpperCase()) }}"
      />
      <Column
        id="1e398"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="patient_name"
        label="Patient name"
        placeholder="Enter value"
        position="center"
        size={183.40625}
        summaryAggregationMode="none"
      />
      <Column
        id="e22a7"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="template_name"
        label="Template name"
        placeholder="Enter value"
        position="center"
        size={213.796875}
        summaryAggregationMode="none"
      />
      <Column
        id="4722c"
        alignment="left"
        format="tag"
        formatOptions={{
          automaticColors: false,
          color:
            "{{\n  item === 'Generated' ? '#dcfce7' :\n  item === 'Synced' ? '#dcfce7' :\n  item === 'In Progress' ? '#dbeafe' :\n  item === 'Syncing' ? '#dbeafe' :\n  item === 'Regenerating' ? '#dbeafe' :\n  item === 'Error' ? '#fee2e2' :\n  item === 'Sync Error' ? '#fee2e2' :\n  item === 'Send to MDS Failed' ? '#fee2e2' :\n  '#f9fafb'\n}}",
        }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        placeholder="Select option"
        position="center"
        size={99.28125}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="4baa5"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        hidden="true"
        key="email"
        label="Email"
        position="center"
        size={275.265625}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ map: { url: "mailto:{{ item }}" } }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="334c7"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="device_type"
        label="Device type"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
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
          pluginId="tableAllScribes"
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
          pluginId="tableAllScribes"
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
    <Include src="./container29.rsx" />
    <Chart
      id="weeklydevices"
      barMode="group"
      barOrientation=""
      chartType="line"
      legendPosition="bottom"
      rangeSlider={true}
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title={null}
      xAxisLineWidth={1}
      xAxisRangeMax=""
      xAxisRangeMin=""
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
      yAxisGrid={true}
      yAxisLineWidth={1}
      yAxisRangeMax=""
      yAxisRangeMin=""
      yAxisShowTickLabels={true}
      yAxisTickFormatMode="gui"
      yAxisTitle="Scribes"
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
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["28d9aad4"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#1f77b4"
        markerSize={6}
        markerSymbol="circle"
        name="iOS"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ device_unified_series.value.weeks || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ device_unified_series.value.ios || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="1"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["ed707141"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#ff7f0e"
        markerSize={6}
        markerSymbol="circle"
        name="Web Browser"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ device_unified_series.value.weeks || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ device_unified_series.value.web || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="2"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor={'{{ theme._tokensById["51d18f8b"] }}'}
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#2ca02c"
        markerSize={6}
        markerSymbol="circle"
        name="Chrome Extension"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ device_unified_series.value.weeks || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ device_unified_series.value.chrome || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="3"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateArray={{ array: [] }}
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor="#11b5ae"
        lineDash="solid"
        lineShape="spline"
        lineUnderFillMode="gradient"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#9467bd"
        markerSize={6}
        markerSymbol="circle"
        name="Android"
        showMarkers={false}
        textTemplateMode="manual"
        type="line"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{ device_unified_series.value.weeks || [] }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{ device_unified_series.value.android || [] }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
    </Chart>
    <Chart
      id="chartStatusVsDevice"
      barGap={0.4}
      clearOnEmptyData={true}
      legendPosition="bottom"
      selectedPoints="[]"
      stackedBarTotalsDataLabelPosition="none"
      title="Issues by Device Type"
      xAxisRangeMax=""
      xAxisRangeMin=""
      xAxisShowTickLabels={true}
      xAxisTickFormatMode="gui"
      xAxisTitle="Issue Status"
      xAxisTitleStandoff={20}
      yAxis2LineWidth={1}
      yAxis2RangeMax=""
      yAxis2RangeMin=""
      yAxis2ShowTickLabels={true}
      yAxis2TickFormatMode="gui"
      yAxis2TitleStandoff={20}
      yAxisGrid={true}
      yAxisRangeMax=""
      yAxisRangeMin=""
      yAxisShowTickLabels={true}
      yAxisTickFormatMode="gui"
      yAxisTitle="Scribes"
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
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor="#4e79a7"
        lineDash="solid"
        lineShape="linear"
        lineUnderFillMode="none"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor="#11b5ae"
        markerSize={6}
        markerSymbol="circle"
        name="Android"
        showMarkers={false}
        textTemplateMode="manual"
        type="bar"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{
    _.sortBy(
      _.uniq(
        (tableAllScribes.data || [])
          .map(r => r && r.status)
          .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
          .map(s => s === 'User Error' ? 'Error' : s)
      )
    )
  }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{
    (
      (() => {
        const data = tableAllScribes.data || [];
        const cats = _.sortBy(
          _.uniq(
            data
              .map(r => r && r.status)
              .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
              .map(s => s === 'User Error' ? 'Error' : s)
          )
        );
        return cats.map(s =>
          data.filter(r => r && r.device_type==='Android' && ((r.status === s) || (s === 'Error' && r.status === 'User Error'))).length
        );
      })()
    )
  }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="3"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="source"
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor="#76b7b2"
        lineDash="solid"
        lineShape="linear"
        lineUnderFillMode="none"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor={'{{ theme._tokensById["51d18f8b"] }}'}
        markerSize={6}
        markerSymbol="circle"
        name="Chrome Extension"
        showMarkers={false}
        textTemplateMode="manual"
        type="bar"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{
    _.sortBy(
      _.uniq(
        (tableAllScribes.data || [])
          .map(r => r && r.status)
          .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
          .map(s => s === 'User Error' ? 'Error' : s)
      )
    )
  }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{
    (
      (() => {
        const data = tableAllScribes.data || [];
        const cats = _.sortBy(
          _.uniq(
            data
              .map(r => r && r.status)
              .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
              .map(s => s === 'User Error' ? 'Error' : s)
          )
        );
        return cats.map(s =>
          data.filter(r => r && r.device_type==='Chrome Extension' && ((r.status === s) || (s === 'Error' && r.status === 'User Error'))).length
        );
      })()
    )
  }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="4"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="manual"
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor="#76b7b2"
        lineDash="solid"
        lineShape="linear"
        lineUnderFillMode="none"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor={'{{ theme._tokensById["ed707141"] }}'}
        markerSize={6}
        markerSymbol="circle"
        name="Web Browser"
        showMarkers={false}
        textTemplateMode="manual"
        type="bar"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{
    _.sortBy(
      _.uniq(
        (tableAllScribes.data || [])
          .map(r => r && r.status)
          .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
          .map(s => s === 'User Error' ? 'Error' : s)
      )
    )
  }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{
    (
      (() => {
        const data = tableAllScribes.data || [];
        const cats = _.sortBy(
          _.uniq(
            data
              .map(r => r && r.status)
              .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
              .map(s => s === 'User Error' ? 'Error' : s)
          )
        );
        return cats.map(s =>
          data.filter(r => r && r.device_type==='Web Browser' && ((r.status === s) || (s === 'Error' && r.status === 'User Error'))).length
        );
      })()
    )
  }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
      <Series
        id="5"
        aggregationType="none"
        colorArray={{ array: [] }}
        colorArrayDropDown={{ array: [] }}
        colorInputMode="gradientColorArray"
        connectorLineColor="#000000"
        dataLabelPosition="none"
        datasourceMode="manual"
        decreasingBorderColor="#000000"
        decreasingColor="#000000"
        filteredGroupsMode="source"
        gradientColorArray={{ array: [{ array: [] }] }}
        groupBy={{ array: [] }}
        groupByDropdownType="manual"
        groupByStyles={{}}
        hidden={false}
        hiddenMode="manual"
        hoverTemplateMode="manual"
        increasingBorderColor="#000000"
        increasingColor="#000000"
        lineColor="#76b7b2"
        lineDash="solid"
        lineShape="linear"
        lineUnderFillMode="none"
        lineWidth={2}
        markerBorderColor="#ffffff"
        markerBorderWidth={1}
        markerColor={'{{ theme._tokensById["28d9aad4"] }}'}
        markerSize={6}
        markerSymbol="circle"
        name="iOS"
        showMarkers={false}
        textTemplateMode="manual"
        type="bar"
        waterfallBase={0}
        waterfallMeasures={{ array: [] }}
        waterfallMeasuresMode="source"
        xData="{{
    _.sortBy(
      _.uniq(
        (tableAllScribes.data || [])
          .map(r => r && r.status)
          .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
          .map(s => s === 'User Error' ? 'Error' : s)
      )
    )
  }}"
        xDataMode="manual"
        yAxis="y"
        yData="{{
    (
      (() => {
        const data = tableAllScribes.data || [];
        const cats = _.sortBy(
          _.uniq(
            data
              .map(r => r && r.status)
              .filter(s => s && !['Generated','Synced','Syncing','Regenerating'].includes(s))
              .map(s => s === 'User Error' ? 'Error' : s)
          )
        );
        return cats.map(s =>
          data.filter(r => r && r.device_type==='iOS' && ((r.status === s) || (s === 'Error' && r.status === 'User Error'))).length
        );
      })()
    )
  }}"
        yDataMode="manual"
        zData="[1, 2, 3, 4, 5]"
        zDataMode="manual"
      />
    </Chart>
  </View>
</Container>
