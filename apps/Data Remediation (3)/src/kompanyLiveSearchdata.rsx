<DrawerFrame
  id="kompanyLiveSearchdata"
  enableFullBleed={true}
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="0"
  width="medium"
>
  <Header>
    <Button
      id="drawerCloseButton2"
      ariaLabel="Close"
      horizontalAlign="right"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="kompanyLiveSearchdata"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Include src="./KompanyDataContainerOnSide.rsx" />
  </Body>
  <Event
    event="hide"
    method="setValue"
    params={{ ordered: [{ value: "{}" }] }}
    pluginId="kompanyDataSetSearchResponse"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</DrawerFrame>
