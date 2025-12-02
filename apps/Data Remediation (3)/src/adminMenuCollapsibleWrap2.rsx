<Container
  id="adminMenuCollapsibleWrap2"
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
      id="collapsibleToggle84"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ adminMenuCollapsibleWrap2.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="adminMenuCollapsibleWrap2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
    <IconText
      id="iconText13"
      icon="bold/interface-setting-cog"
      margin="0"
      text="Admin"
      textSize="default"
    />
  </Header>
  <View id="879e3" viewKey="View 1">
    <Navigation
      id="navigation32"
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
        screenTargetId="userManagement"
        tooltip="Manage All Users"
      >
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
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetUserRolesFirmoHome"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetListOfUsersData"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Event
        event="click"
        method="run"
        params={{ ordered: [{ src: " loadingPopUp.setHidden(false);\n" }] }}
        pluginId=""
        targetId="0a79b"
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="directoIdsManager"
        targetId="0a79b"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="directorsIdsManagerApi"
        targetId="0a79b"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetDirectorsIdsManagerAllData"
        targetId="0a79b"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
    <Container
      id="manageUrlsCollapsibleWrapFirmo"
      disabled={'{{ CurrentUserObj.value.product === "uci" }}'}
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      style={{ ordered: [] }}
    >
      <Header>
        <Navigation
          id="navigation30"
          itemMode="static"
          margin="0"
          retoolFileObject={{ ordered: [] }}
        >
          <Option
            id="ea26a"
            icon="bold/interface-link"
            iconPosition="left"
            itemType="app"
            label="Manage URLs"
          />
        </Navigation>
        <ToggleButton
          id="collapsibleToggle85"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          style={{ ordered: [] }}
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ manageUrlsCollapsibleWrapFirmo.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="manageUrlsCollapsibleWrapFirmo"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="879e3" viewKey="View 1">
        <Navigation
          id="navigation31"
          captionByIndex=""
          data=""
          disabled={'{{CurrentUserObj.value.product === "uci" }}'}
          disabledByIndex=""
          hiddenByIndex=""
          highlightByIndex=""
          iconByIndex=""
          iconPositionByIndex=""
          itemMode="static"
          keyByIndex=""
          labels=""
          orientation="vertical"
          parentKeyByIndex=""
          retoolFileObject={{ ordered: [] }}
          screenTargetIdByIndex=""
          style={{ ordered: [] }}
          tooltipByIndex=""
        >
          <Option
            id="5ee2e"
            disabled={false}
            hidden={false}
            icon="bold/interface-link"
            iconPosition="left"
            itemType="custom"
            label="Registery URLs"
            screenTargetId="manageRegistryUrls"
          >
            <Event
              event="click"
              method="setValue"
              params={{ ordered: [{ value: "true" }] }}
              pluginId=""
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
                  { pageName: "manageRegistryUrls" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Option>
        </Navigation>
      </View>
    </Container>
    <Navigation
      id="kompanyFirmo"
      disabled={'{{  CurrentUserObj.value.product === "uci" }}'}
      hidden=""
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
    >
      <Option
        id="0cfd4"
        disabled={false}
        icon="bold/nature-ecology-green-house"
        iconPosition="left"
        itemType="custom"
        label="Kompany Search"
        screenTargetId="kompanySearch"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: ' const kompanyInput = {\n    country_iso: "",\n    state_code: "",\n    kompany_api: "",\n    last_modified_by: ""  // Update as needed\n  };\nkompanyInputState.setValue(kompanyInput);\nkompanyApiRecord.trigger();',
              },
            ],
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
              { pageName: "kompanySearch" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="980ff"
        icon="bold/shopping-store-factory-setting"
        iconPosition="left"
        itemType="custom"
        key="a5619"
        label="Kompany Search Config"
        screenTarget={null}
        screenTargetId="kompanySearchConfig"
      >
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="kompanySearchModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="kompanyEnableCheck"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="openPage"
          params={{
            ordered: [
              { options: { ordered: [{ passDataWith: "urlParams" }] } },
              { pageName: "kompanySearchConfig" },
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
      id="entity2"
      disabled={'{{  CurrentUserObj.value.product === "uci" }}'}
      hidden=""
      itemMode="static"
      orientation="vertical"
      retoolFileObject={{ ordered: [] }}
    >
      <Option
        id="0cfd4"
        disabled={false}
        icon="bold/interface-lock"
        iconPosition="left"
        itemType="custom"
        label="Entity Assignment"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              { src: "entityAssignTabs.setValue('current assignment');" },
            ],
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
              { pageName: "entityAssignment" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="kompanySearchModal"
        targetId="980ff"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="kompanyEnableCheck"
        targetId="980ff"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
  </View>
</Container>
