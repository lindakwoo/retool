<SidebarFrame
  id="sidebarFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showFooterBorder={false}
  style={{ ordered: [] }}
  width="240px"
>
  <Body>
    <Container
      id="adminMenuCollapsibleWrap"
      disabled="{{  CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'all' }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{  CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      style={{ ordered: [] }}
    >
      <Header>
        <ToggleButton
          id="collapsibleToggle1"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ adminMenuCollapsibleWrap.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="adminMenuCollapsibleWrap"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
        <IconText
          id="iconText3"
          icon="bold/interface-setting-cog"
          margin="0"
          text="Admin"
          textSize="default"
        />
      </Header>
      <View id="879e3" viewKey="View 1">
        <Navigation
          id="navigation1"
          itemMode="static"
          orientation="vertical"
          retoolFileObject={{ ordered: [] }}
          style={{ ordered: [] }}
        >
          <Option
            id="980ff"
            icon="bold/interface-user-multiple"
            iconPosition="left"
            itemType="custom"
            key="0925f"
            label="User Management"
            tooltip="Manage All Users"
          >
            <Event
              event="click"
              method="show"
              params={{ ordered: [] }}
              pluginId="userManagementModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="setValue"
              params={{ ordered: [{ value: "false" }] }}
              pluginId="PageLoadCall"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="openPage"
              params={{
                ordered: [
                  { options: { ordered: [{ passDataWith: "urlParams" }] } },
                  { pageName: "userManagement" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Option>
          <Option
            id="0a79b"
            disabled="{{ CurrentUserObj.value.product === 'firmographics'}}"
            hidden={false}
            icon="bold/interface-content-book-page"
            iconPosition="left"
            itemType="custom"
            label="Directors Source Id Management"
            tooltip="Manage All Director Ids"
          >
            <Event
              event="click"
              method="run"
              params={{
                ordered: [{ src: " loadingPopUp.setHidden(false);\n" }],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="openPage"
              params={{
                ordered: [
                  { options: { ordered: [{ passDataWith: "urlParams" }] } },
                  { pageName: "directorIdManager" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="directorsIdsManagerApi"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="GetDirectorsIdsManagerAllData"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Option>
        </Navigation>
      </View>
    </Container>
    <Container
      id="ReportsMenuCollapsibleWrap"
      disabled="{{  CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{  CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      style={{ ordered: [] }}
    >
      <Header>
        <ToggleButton
          id="collapsibleToggle5"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ ReportsMenuCollapsibleWrap.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="ReportsMenuCollapsibleWrap"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
        <IconText
          id="iconText4"
          icon="bold/mail-inbox-envelope-open"
          margin="0"
          text="Reports"
          textSize="default"
        />
      </Header>
      <View id="879e3" viewKey="View 1">
        <Navigation
          id="navigation5"
          disabled="{{  CurrentUserObj.value.product !== 'uci'  && CurrentUserObj.value.product !== 'all' }}"
          itemMode="static"
          orientation="vertical"
          retoolFileObject={{ ordered: [] }}
        >
          <Option
            id="980ff"
            icon="bold/interface-file-check-alternate"
            iconPosition="left"
            itemType="page"
            label="Audit-Trail"
            screenTargetId="auditTrail"
          >
            <Event
              event="click"
              method="show"
              params={{ ordered: [] }}
              pluginId="modelAuditTrailHistory"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Option>
        </Navigation>
      </View>
    </Container>
    <Navigation
      id="navigation9"
      hidden="true"
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
      style={{ ordered: [] }}
    >
      <Option
        id="845ef"
        appTarget="8a0eb17a-fc2b-11ee-a8a8-538f1458d17b"
        icon="bold/interface-dashboard-layout-square"
        iconPosition="left"
        itemType="custom"
        label="Dashboard"
      />
    </Navigation>
  </Body>
  <Footer>
    <Navigation
      id="ReloadApp"
      disabled=""
      hidden=""
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
      style={{ ordered: [] }}
      tooltipText="{{ 'Clear cache & reload the application' }}"
    >
      <Option
        id="845ef"
        appTarget="8a0eb17a-fc2b-11ee-a8a8-538f1458d17b"
        icon="bold/natrue-ecology-recycle-1"
        iconPosition="left"
        itemType="custom"
        key="cc3c4"
        label="Reload App"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "localStorage.clear();\nutils.openUrl(urlparams.href, { newTab: false})",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </Navigation>
    <Divider id="divider6" />
    <Avatar
      id="avatar1"
      fallback="{{ current_user.fullName }}"
      imageSize={32}
      label="{{ current_user.fullName }}"
      labelCaption="{{ current_user.email }}"
      src="{{ current_user.profilePhotoUrl }}"
      style={{ ordered: [{ background: "automatic" }] }}
    />
  </Footer>
</SidebarFrame>
