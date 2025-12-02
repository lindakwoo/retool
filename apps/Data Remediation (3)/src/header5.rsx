<Frame
  id="$header5"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text id="text558" value="### Entity Assigment" verticalAlign="center" />
  <Button id="button28" text="home">
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
      method="setValue"
      params={{ ordered: [{ value: "''" }] }}
      pluginId="txtboxSearchEntityAssign"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Frame>
