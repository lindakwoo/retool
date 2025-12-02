<SidebarFrame
  id="sidebarFrame2"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  style={{ ordered: [] }}
  width="large"
>
  <Body>
    <Include src="./adminMenuCollapsibleWrap2.rsx" />
    <Container
      id="ReportsMenuCollapsibleWrap2"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{  CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      style={{ ordered: [] }}
    >
      <Header>
        <ToggleButton
          id="collapsibleToggle86"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ ReportsMenuCollapsibleWrap2.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="ReportsMenuCollapsibleWrap2"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
        <IconText
          id="iconText14"
          icon="bold/mail-inbox-envelope-open"
          margin="0"
          text="Reports"
          textSize="default"
        />
      </Header>
      <View id="879e3" viewKey="View 1">
        <Navigation
          id="navigation33"
          disabled="{{ //CurrentUserObj.value.product !== 'uci' && CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all'
false}}"
          itemMode="static"
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
      id="DataViewerFirmo"
      disabled=""
      hidden="{{  CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
      style={{ ordered: [] }}
    >
      <Option
        id="845ef"
        appTarget="8a0eb17a-fc2b-11ee-a8a8-538f1458d17b"
        icon="bold/interface-edit-binocular"
        iconPosition="left"
        itemType="custom"
        key="cc3c4"
        label="CDS Viewer"
      >
        <Event
          event="click"
          method="openUrl"
          params={{
            ordered: [
              { url: "{{ retoolContext.configVars.data_viewer_url }}" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </Navigation>
    <Navigation
      id="batchProcessingData2"
      disabled=""
      hidden="{{  CurrentUserObj.value.product !== 'firmographics' && CurrentUserObj.value.product !== 'all' }}"
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
      style={{ ordered: [] }}
    >
      <Option
        id="845ef"
        appTarget="8a0eb17a-fc2b-11ee-a8a8-538f1458d17b"
        icon="bold/interface-align-layers-1-alternate"
        iconPosition="left"
        itemType="page"
        key="cc3c4"
        label="Batch Processing"
        screenTargetId="batchProcesses"
      >
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "true" }] }}
          pluginId="batchProcess"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </Navigation>
    <Navigation
      id="ReloadAppFirmo"
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
  </Body>
  <Footer>
    <Avatar
      id="avatar2"
      fallback="{{ current_user.fullName }}"
      imageSize={32}
      label="{{ current_user.fullName }}"
      labelCaption="{{ current_user.email }}"
      margin="4px 4px"
      src="{{ current_user.profilePhotoUrl }}"
      style={{ ordered: [{ background: "automatic" }] }}
    />
  </Footer>
</SidebarFrame>
