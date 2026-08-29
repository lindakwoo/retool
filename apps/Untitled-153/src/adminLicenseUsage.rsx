<Container
  id="adminLicenseUsage"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <ToggleButton
      id="collapsibleToggle1"
      horizontalAlign="right"
      iconForFalse="bold/interface-alert-information-circle"
      iconForTrue="bold/interface-alert-information-circle"
      iconPosition="right"
      style={{}}
      tooltipText="User Guide"
      value=""
    >
      <Event
        event="change"
        method="toggleHidden"
        params={{}}
        pluginId="userGuide"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
    <Text
      id="containerTitle1"
      heightType="fixed"
      value="#### License Usage"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Text
      id="text1"
      tooltipText="Our adoption goal is 80% active accounts during implementation. "
      value="{{
(() => {
  const site = selectSite?.value;
  if (!site || String(site) === 'watchlist') {
    return '###### 0 / 0 Scribe Adopters\nSelect a site to view adoption data';
  }

  const statuses = get_adoption.data?.status || [];
  const accounts = get_adoption.data?.account_id?.length ?? 0;
  const healthyOrPartial = statuses.filter(s => s === 'Healthy' || s === 'Partial').length;
  const licensed = Number(get_activation.data?.licensed_seats?.[0] ?? 0);

  const headline = `###### ${healthyOrPartial} / ${licensed || accounts} Scribe Adopters`;

  if (!licensed) {
    const need = Math.max(Math.ceil(accounts * 0.8) - healthyOrPartial, 0);
    return `${headline}\n${need} accounts needed to reach 80% adoption`;
  }

  const eighty = Math.ceil(licensed * 0.8);
  if (healthyOrPartial > licensed) {
    return `${headline}\n🚀 Site is ready for expansion! Active users exceed licensed seats.`;
  }
  if (healthyOrPartial >= eighty) {
    return `${headline}\n🎉 Adoption goal reached!`;
  }
  const need = Math.max(eighty - healthyOrPartial, 0);
  return `${headline}\n${need} accounts needed to reach 80% total license usage`;
})()
}}"
      verticalAlign="center"
    />
    <Text
      id="text2"
      value="###### Remaining Licenses
{{
(() => {
  const accounts = get_adoption.data?.account_id?.length ?? 0;
  const licensed = Number(get_activation.data?.licensed_seats?.[0] ?? 0);

  if (!selectSite.value) return 'Select a site to view license data';
  if (!licensed) return `You have **${accounts}** scribe accounts
_No license count found for this site._`;

  const remaining = Math.max(licensed - accounts, 0);
  return `You have **${accounts}** scribe accounts
You have **${remaining}** / **${licensed}** licenses remaining.`;
})()
}}"
      verticalAlign="center"
    />
    <ProgressCircle
      id="progressCircle1"
      horizontalAlign="center"
      value="{{get_adoption.data.account_id.length === 0 ? 0 : get_adoption.data.status.filter(s => s === 'Healthy' || s === 'Partial').length / (Number(get_activation.data.licensed_seats?.[0]) || get_adoption.data.account_id.length) * 100}}"
    />
  </View>
</Container>
