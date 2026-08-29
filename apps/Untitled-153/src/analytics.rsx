<Screen
  id="analytics"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[
    { key: "site_id", value: "{{ selectSite.value || 'watchlist' }}" },
  ]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="94ada792-20de-4c82-8245-bf8523141619"
>
  <Folder id="watchlist_site_overview_panel">
    <State id="watchlistSelectedSite" value="2476" />
    <SqlQueryUnified
      id="get_scribe_sites"
      notificationDuration={4.5}
      query={include("../lib/get_scribe_sites.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="customer_provider_integration_usage">
    <SqlQueryUnified
      id="get_integration_adoption"
      isMultiplayerEdited={false}
      query={include("../lib/get_integration_adoption.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_collaborator_breakdown"
      isMultiplayerEdited={false}
      query={include("../lib/get_collaborator_breakdown.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_appointment_reason_with_coverage"
      isMultiplayerEdited={false}
      query={include(
        "../lib/get_appointment_reason_with_coverage.sql",
        "string"
      )}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_appointment_reason_no_coverage"
      isMultiplayerEdited={false}
      query={include("../lib/get_appointment_reason_no_coverage.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <RetoolAIQuery
      id="generate_no_coverage_reasons"
      customSystemMessage="You are a clinical data analyst. Respond only with the requested output, no preamble or questions."
      defaultModelInitialized={true}
      enableTransformer={true}
      imageModel="dall-e-3"
      instruction="Group these appointment reasons with no scribe coverage into 5-7 clinical categories. Return a markdown list of category names only with a 3-5 word description in parentheses. No counts, no examples, no commentary.

{{ JSON.stringify(get_appointment_reason_no_coverage.data.reason.map((r, i) => ({ reason: r, count: get_appointment_reason_no_coverage.data.total_appointments[i] }))) }}"
      isMultiplayerEdited={false}
      model="gpt-5-mini"
      resourceDisplayName="retool_ai"
      resourceName="retool_ai"
    />
    <SqlQueryUnified
      id="get_provider_scribes_synced_1_day"
      isMultiplayerEdited={false}
      query={include("../lib/get_provider_scribes_synced_1_day.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_weekly_appointments"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_weekly_appointments.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_weekly_syncs"
      notificationDuration={4.5}
      query={include("../lib/get_weekly_syncs.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="customer_all_scribes">
    <State id="selectedScribeId" />
    <SqlQueryUnified
      id="get_scribe_details"
      isMultiplayerEdited={false}
      query={include("../lib/get_scribe_details.sql", "string")}
      queryDisabled="{{ selectSite.value == 'watchlist' }}"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_all_scribes"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_all_scribes.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="customer_overview">
    <SqlQueryUnified
      id="get_weekly_active_provider_count"
      isMultiplayerEdited={false}
      query={include("../lib/get_weekly_active_provider_count.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_total_scribes"
      isMultiplayerEdited={false}
      query={include("../lib/get_total_scribes.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_median_time_to_sync"
      isMultiplayerEdited={false}
      query={include("../lib/get_median_time_to_sync.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_total_scribe_minutes"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_total_scribe_minutes.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_pct_providers_syncing"
      isMultiplayerEdited={false}
      query={include("../lib/get_pct_providers_syncing.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_avg_generation_time"
      query={include("../lib/get_avg_generation_time.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="load_customer_dashboard"
      notificationDuration={4.5}
      query={include("../lib/load_customer_dashboard.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="customer_provider_scribe_usage">
    <SqlQueryUnified
      id="get_adoption_previous_week"
      enableTransformer={true}
      isMultiplayerEdited={false}
      query={include("../lib/get_adoption_previous_week.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_activation"
      isMultiplayerEdited={false}
      query={include("../lib/get_activation.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_adoption"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_adoption.sql", "string")}
      queryDisabled="{{ String(selectSite.value) === 'watchlist' && watchlistSelectedSite.value === null }}"
      queryTimeout="50000"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="get_site_invoices_flow"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <SqlQueryUnified
      id="get_provider_scribe_history"
      isMultiplayerEdited={false}
      query={include("../lib/get_provider_scribe_history.sql", "string")}
      queryDisabled="{{ selectSite.value === 'watchlist' && watchlistSelectedSite.value === null }}"
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_provider_template_usage"
      isMultiplayerEdited={false}
      query={include("../lib/get_provider_template_usage.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_provider_scribe_usage"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_provider_scribe_usage.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_provider_usage_metrics"
      notificationDuration={4.5}
      query={include("../lib/get_provider_usage_metrics.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <State id="healthStatusFilter" value="" />
    <State id="providerEmailList" />
    <State id="scribeAccountID" value="null" />
    <SqlQueryUnified
      id="get_weekly_scribe_count"
      query={include("../lib/get_weekly_scribe_count.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      warningCodes={[]}
    />
  </Folder>
  <Folder id="device_info">
    <SqlQueryUnified
      id="get_weekly_devices"
      isMultiplayerEdited={false}
      query={include("../lib/get_weekly_devices.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      warningCodes={[]}
    />
    <Function
      id="device_unified_series"
      funcBody={include("../lib/device_unified_series.js", "string")}
    />
    <SqlQueryUnified
      id="get_device_scribe"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_device_scribe.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <Function
      id="device_stats"
      funcBody={include("../lib/device_stats.js", "string")}
    />
  </Folder>
  <Folder id="note_quality">
    <SqlQueryUnified
      id="get_providers_lookup"
      notificationDuration={4.5}
      query={include("../lib/get_providers_lookup.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_bert_scores_avg_monthly"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/get_bert_scores_avg_monthly.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_redlines"
      query={include("../lib/get_redlines.sql", "string")}
      resourceDisplayName="Admin Space Retool DB "
      resourceName="1deaa2ef-dcec-45e7-a9d4-20ba3a81c7c9"
      resourceTypeOverride=""
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_percent_retained_avg_monthly"
      notificationDuration={4.5}
      query={include("../lib/get_percent_retained_avg_monthly.sql", "string")}
      resourceDisplayName="Admin Space Retool DB "
      resourceName="1deaa2ef-dcec-45e7-a9d4-20ba3a81c7c9"
      resourceTypeOverride=""
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_retained_provider_meta"
      notificationDuration={4.5}
      query={include("../lib/get_retained_provider_meta.sql", "string")}
      resourceDisplayName="normandy"
      resourceName="baca8af3-c375-40ac-95bb-5e83fdd9ad1f"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="mergeRetainedWithMeta"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="mergeRetainedWithMeta"
      notificationDuration={4.5}
      query={include("../lib/mergeRetainedWithMeta.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="monthlyMetricsCombined"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="monthlyMetricsCombined"
      notificationDuration={4.5}
      query={include("../lib/monthlyMetricsCombined.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <SqlQueryUnified
    id="get_positive_feedback_for_site"
    query={include("../lib/get_positive_feedback_for_site.sql", "string")}
    resourceDisplayName="Admin Space Retool DB "
    resourceName="1deaa2ef-dcec-45e7-a9d4-20ba3a81c7c9"
    resourceTypeOverride=""
    warningCodes={[]}
  />
  <Include src="./adminProviderDeepDive.rsx" />
  <Include src="./drawerProviderIntegrationUsage.rsx" />
  <Include src="./userGuide.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    style={{ map: { canvas: "canvas" } }}
    type="main"
  >
    <SegmentedControl
      id="light_switch"
      itemMode="static"
      label=""
      labelPosition="top"
      paddingType="spacious"
      style={{ map: { indicatorBackground: "primary" } }}
      value="Light"
    >
      <Option
        id="00030"
        icon="bold/interface-weather-sun-alternate"
        iconPosition="left"
        label=" "
        value="Light"
      />
      <Option
        id="00031"
        icon="bold/interface-weather-moon"
        iconPosition="right"
        label=" "
        value="Dark"
      />
      <Event
        event="change"
        method="setMode"
        params={{
          options: { map: { persist: true } },
          modeName: "{{ light_switch.value }}",
        }}
        pluginId=""
        type="theme"
        waitMs="0"
        waitType="debounce"
      />
    </SegmentedControl>
    <Image
      id="logo_dark"
      dbBlobId="a39297ef-d18b-4d3e-8362-b6774daa632e"
      hidden={'{{light_switch.value === "Light"}}'}
      horizontalAlign="center"
      srcType="dbBlobId"
    />
    <Container
      id="group1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="dateRangeAllTime"
          hidden=""
          label="All Time Usage"
          labelPosition="left"
          value="true"
        >
          <Event
            event="false"
            method="setHidden"
            params={{ map: { hidden: false } }}
            pluginId="dateRange"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="true"
            method="setHidden"
            params={{}}
            pluginId="dateRange"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Switch>
        <DateRange
          id="dateRange"
          dateFormat="MMM d, yyyy"
          endPlaceholder="End date"
          hidden="true"
          hideLabel={false}
          iconBefore="bold/interface-calendar-remove"
          label="Date Range"
          labelPosition="top"
          startPlaceholder="Start date"
          textBetween="-"
          value={{
            start: "{{ moment().subtract(1, 'month').toDate() }}",
            end: "{{ moment().toDate() }}",
          }}
        />
        <Button
          id="buttonRefreshData"
          iconBefore="bold/interface-arrows-synchronize"
          style={{ map: { background: "primary" } }}
          tooltipText="Refresh all data"
        >
          <Event
            event="click"
            method="trigger"
            params={{}}
            pluginId="get_watchlist"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="trigger"
            params={{}}
            pluginId="load_customer_dashboard"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="refresh"
            params={{}}
            pluginId="table5"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Image
      id="logo_light"
      dbBlobId="b9c6ec4d-ea61-4dcb-a514-513c2b2468dc"
      hidden={'{{light_switch.value === "Dark"}}'}
      horizontalAlign="center"
      srcType="dbBlobId"
    />
    <Include src="./adminLicenseUsage.rsx" />
    <Include src="./tabbedContainer1.rsx" />
  </Frame>
</Screen>
