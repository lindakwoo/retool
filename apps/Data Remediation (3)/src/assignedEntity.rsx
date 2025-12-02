<ModalFrame
  id="assignedEntity"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text
      id="modalTitle15"
      value="### Entity Assigment"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton18"
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
        pluginId="assignedEntity"
        type="widget"
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
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId=""
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId=""
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
</ModalFrame>
