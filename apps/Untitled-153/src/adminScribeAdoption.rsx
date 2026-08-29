<Container
  id="adminScribeAdoption"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle2"
      value="#### Scribe Adoption and Usage
"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Statistic
      id="statistic3"
      currency="USD"
      formattingStyle="percent"
      label="Needs Follow-Up"
      labelCaption="{{get_adoption.data.status.filter(s => s === 'At Risk').length}} / {{Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length}} {{Number(get_activation.data.licensed_seats?.[0]) ? 'licenses' : 'accounts'}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{(get_adoption.data.status.filter(s => s === 'At Risk').length / (Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length)).toFixed(3)}}"
    >
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "'At Risk'" } }}
        pluginId="healthStatusFilter"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
    <Statistic
      id="statistic4"
      currency="USD"
      formattingStyle="percent"
      label="Needs Reengagement"
      labelCaption="{{get_adoption.data.status.filter(s => s === 'Inactive').length}} / {{Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length}} {{Number(get_activation.data.licensed_seats?.[0]) ? 'licenses' : 'accounts'}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{(get_adoption.data.status.filter(s => s === 'Inactive').length / (Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length)).toFixed(3)}}"
    >
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "'Inactive'" } }}
        pluginId="healthStatusFilter"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
    <Statistic
      id="activeLicenses"
      currency="USD"
      formattingStyle="percent"
      label="Active Scribe Usage"
      labelCaption="{{get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial').length}} / {{Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length}} {{Number(get_activation.data.licensed_seats?.[0]) ? 'licenses' : 'accounts'}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue="{{(get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial').length - get_adoption_previous_week.data.status.filter(s => s === 'Healthy' || s === 'Partial').length)/ 100}}"
      showSeparators={true}
      style={{}}
      value="{{(get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial').length / (Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length)).toFixed(3)}}"
    >
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "['Healthy', 'Partial']" } }}
        pluginId="healthStatusFilter"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
    <Statistic
      id="statistic2"
      currency="USD"
      formattingStyle="percent"
      label="Not Started"
      labelCaption="{{Math.max((Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length) - get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial' || s === 'At Risk' || s === 'Inactive').length, 0)}} / {{Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length}} {{Number(get_activation.data.licensed_seats?.[0]) ? 'licenses' : 'accounts'}}"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{Math.max((( Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length) - get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial' || s === 'At Risk' || s === 'Inactive').length) / (Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length), 0).toFixed(3)}}"
    >
      <Event
        event="click"
        method="setValue"
        params={{ map: { value: "'Not Started'" } }}
        pluginId="healthStatusFilter"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
  </View>
</Container>
