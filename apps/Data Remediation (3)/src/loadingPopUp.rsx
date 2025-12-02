<ModalFrame
  id="loadingPopUp"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showOverlay={true}
  size="fullScreen"
  style={{
    ordered: [
      { borderRadius: "0px" },
      { border: "rgba(255, 255, 255, 0)" },
      { background: "rgba(255, 255, 255, 0)" },
    ],
  }}
  styleContext={{
    ordered: [
      { borderRadius: "0px" },
      { surfacePrimary: "rgba(255, 255, 255, 0)" },
      { surfaceSecondary: "rgba(255, 255, 255, 0)" },
    ],
  }}
>
  <Header>
    <Button
      id="modalCloseButton6"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <HTML
      id="html1"
      css={include("../lib/html1.css", "string")}
      html={include("../lib/html1.html", "string")}
    />
  </Body>
</ModalFrame>
