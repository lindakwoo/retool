<Frame
  id="$header10"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text
    id="text652"
    hidden="{{firmoIpandRemFlag.value === true}}"
    value="#### IP Records"
    verticalAlign="center"
  />
  <Button id="button32" text="Home">
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
  </Button>
  <Text
    id="firmoIpAndRemTitle3"
    hidden="{{firmoIpandRemFlag.value === false}}"
    style={{ ordered: [] }}
    value="#### View Remediate Record"
    verticalAlign="center"
  />
</Frame>
