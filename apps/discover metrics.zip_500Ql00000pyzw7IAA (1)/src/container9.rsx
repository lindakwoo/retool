<Container
  id="container9"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ !org_id_as_int.value }}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="org_control_container"
      _disclosedFields={{ array: [] }}
      value={
        '#### Org Configuration Controls for {{orgNavbar1.org_unique_name || "___"}}'
      }
      verticalAlign="center"
    />
  </Header>
  <View id="db4de" viewKey="View 1">
    <RadioGroup
      id="discover_status_picker"
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      itemMode="static"
      label="Discover product status"
      labelPosition="top"
      value="{{ discover_config.value.status}}"
    >
      <Option
        id="88ece"
        label="Disabled"
        tooltip="Discover will not run every day."
        value="disabled"
      />
      <Option
        id="01dec"
        label="Enabled"
        tooltip="Discover will run every day on new tickets."
        value="enabled"
      />
      <Option
        id="fcf22"
        label="Trial"
        tooltip="Discover will run until the specified trial end date."
        value="trial"
      />
    </RadioGroup>
    <RadioGroup
      id="discover_viewable_tier"
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      itemMode="static"
      label="Discover viewable tier"
      labelPosition="top"
      value="{{ discover_config.value.discover_viewable_tier}}"
    >
      <Option id="88ece" label="Basic" tooltip="Basic tier" value="basic" />
      <Option id="01dec" label="Pro" tooltip="Pro tier" value="pro" />
      <Option
        id="fcf22"
        label="Enterprise"
        tooltip="Enterprise tier"
        value="enterprise"
      />
    </RadioGroup>
    <Date
      id="trial_end_date"
      _disclosedFields={{ array: [] }}
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{discover_status_picker.value !== 'trial'}}"
      iconBefore="bold/interface-calendar"
      label="Trial end date"
      tooltipText="We set this to two months out by default."
      value="{{ transform_trial_end_date_timestamp.value }}"
    />
    <Checkbox
      id="enabled_for_admins"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_admin_access.isFetching || get_dashboard_apps_by_role.isFetching}}"
      label="Show Discover to Admins?"
      labelCaption="Super admins are enabled by default."
      labelWidth={100}
      tooltipText="Checking this will give Admins of this org access to Discover on the Dashboard. Will be set automatically."
      value="{{admin_discover_role.value}}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="update_discover_admin_access"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <Multiselect
      id="channel_select"
      data="{{ combined_channels_default_and_retrieved.value }}"
      emptyMessage="No options"
      label="Ticket channels"
      labels="{{ item }}"
      labelWidth="25"
      overlayMaxHeight={375}
      placeholder="Leaving blank will use default"
      showSelectionIndicator={true}
      value="{{discover_config.value.filter_by_channels}}"
      values="{{ item }}"
      wrapTags={true}
    />
    <Text
      id="text12"
      _disclosedFields={{ array: [] }}
      tooltipText="Legacy customers will have these features, but new customers will typically be upsold these features."
      value="#### Premium Features"
      verticalAlign="center"
    />
    <Checkbox
      id="enable_multilingual"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      label="Enable multilingual"
      labelWidth={100}
      tooltipText="Checking this will let Discover translate and categorize non-English tickets."
      value="{{transform_multilingual_status.value}}"
    />
    <Checkbox
      id="enable_content_generation_segmentation"
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      label="Enable content generation segmentation"
      labelWidth="100"
      tooltipText="Checking this will get Discover to enable multi segmentations."
      value="{{transform_content_generation_segmentation.value}}"
    />
    <Checkbox
      id="enable_content_generation"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      label="Enable content generation"
      labelWidth={100}
      tooltipText="Checking this will get Discover to generate articles for this org. Articles will be generated ~2 hours after this is checked."
      value="{{transform_content_generation_status.value}}"
    />
    <Checkbox
      id="enable_discover_for_chat"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      label="Enable Discover for Chat"
      labelWidth={100}
      tooltipText="Checking this will make Discover evaluate Solve conversations daily. You would need to do a new training if you want Discover to make topics based on chats after checking this."
      value="{{transform_discover_for_chat_status.value}}"
    />
    <Checkbox
      id="enable_discover_for_voice"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      label="Enable Discover for Voice"
      labelWidth={100}
      tooltipText="Checking this will make Discover evaluate voice calls. You would need to do a new training if you want Discover to make topics based on voice data after checking this."
      value="{{transform_discover_for_voice_status.value}}"
    />
    <Button
      id="config_button"
      _disclosedFields={{ array: [] }}
      disabled="{{!org_id_as_int.value || update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      iconBefore="bold/interface-content-save"
      loading="{{update_discover_config_enabled_status.isFetching || get_discover_org_config.isFetching}}"
      text="Save Changes"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="update_discover_config_enabled_status"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="reset_button"
      _disclosedFields={{ array: [] }}
      style={{ ordered: [{ background: "canvas" }] }}
      submitTargetId=""
      text="Reset"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="reset_state"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
