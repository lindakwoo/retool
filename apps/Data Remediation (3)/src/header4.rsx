<Frame
  id="$header4"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text id="headerText" value="### Registry URLs" verticalAlign="center" />
  <Button id="registryHome" text="Home">
    <Event
      event="click"
      method="openPage"
      params={{
        ordered: [
          { options: { ordered: [{ passDataWith: "urlParams" }] } },
          { pageName: "firmohome" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="run"
      params={{
        ordered: [
          {
            src: "createRegistryUrlForm.clear();\ncreateRegistryUrlForm.setHidden(true);\neditRegistryUrlForm.clear();\neditRegistryUrlForm.setHidden(true)",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Frame>
