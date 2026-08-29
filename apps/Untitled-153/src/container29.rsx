<Container
  id="container29"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle32"
      value="#### Devices Usage"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Statistic
      id="statistic17"
      currency="USD"
      decimalPlaces="1"
      hidden=""
      label="Web Browser "
      labelCaption="Scribes"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{_.sum(get_weekly_devices.data.web_browser.map(val => Number(val))) }}"
    />
    <Statistic
      id="statistic15"
      currency="USD"
      hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
      label="Chrome Extension"
      labelCaption="Scribes"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{_.sum(get_weekly_devices.data.chrome_extension.map(val => Number(val))) }}"
    />
    <Chart
      id="device_breakdown2"
      chartType="pie"
      colorArray=""
      colorArrayDropDown={[
        "#11B5AE",
        "#fc5378",
        '{{ theme._tokensById["ed707141"] }}',
        "#335af1",
        "#7E84FA",
        "#72E06A",
      ]}
      colorInputMode="colorArrayDropDown"
      datasource="{{ get_weekly_devices.data }}"
      datasourceMode="source"
      gradientColorArray={[
        ["0.0", "{{ theme.canvas }}"],
        ["1.0", "{{ theme.primary }}"],
      ]}
      hoverTemplate="%{label}<br>%{value}<extra></extra>"
      hoverTemplateMode="source"
      labelData="{{ device_stats.value.labels || [] }}"
      legendPosition="none"
      lineColor="{{ theme.surfacePrimary }}"
      lineWidth={2}
      margin="0"
      pieDataHole="0.6"
      selectedPoints="[]"
      textTemplate="%{label}<br>%{percent}"
      textTemplateMode="source"
      textTemplatePosition="outside"
      title={null}
      valueData="{{ device_stats.value.values || [] }}"
    />
    <Statistic
      id="statistic16"
      currency="USD"
      label="iOS"
      labelCaption="Scribes"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{_.sum(get_weekly_devices.data.ios.map(val => Number(val))) }}"
    />
    <Statistic
      id="statistic14"
      currency="USD"
      label="Android"
      labelCaption="Scribes"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{_.sum(get_weekly_devices.data.android.map(val => Number(val))) }}"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="get_pct_providers_syncing"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
  </View>
</Container>
