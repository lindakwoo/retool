<Container
  id="container4"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle4"
      value="#### Your Team Overview"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Statistic
      id="statistic5"
      currency="USD"
      label="Total Scribes"
      labelCaption="All Time"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{get_total_scribes.data.total_scribes?.[0]}}"
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
    <Statistic
      id="statistic7"
      currency="USD"
      label="Total Scribe Minutes"
      labelCaption="{{`${Math.round(Number(get_total_scribe_minutes.data.total_minutes?.[0]) / 60 / 24)} continuous days`}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{get_total_scribe_minutes.data.total_minutes?.[0]}}"
    />
    <Statistic
      id="statistic6"
      currency="USD"
      hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
      label="Median Hours to Sync"
      labelCaption="{{Number(get_median_time_to_sync.data.median_hours_to_sync?.[0]) / 24 < 1 ? 'Typically < 1 day' : ('Typically ' + Number(get_median_time_to_sync.data.median_hours_to_sync?.[0]) / 24).toFixed(1) + ' to transfer the note'}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{get_median_time_to_sync.data.median_hours_to_sync?.[0]}}"
    />
    <Statistic
      id="statistic9"
      currency="USD"
      formattingStyle="percent"
      hidden="{{(get_integration_adoption.data.total_ehr_syncs || []).reduce((a, b) => Number(a) + Number(b), 0) === 0}}"
      label="Syncing Adoption"
      labelCaption="Providers syncing ≥30% of scribes"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      tooltipText="Includes:  Providers with scribes AND admins with more than 10 scribes. "
      value="{{get_pct_providers_syncing.data.pct_providers_syncing?.[0]}}"
    />
  </View>
</Container>
