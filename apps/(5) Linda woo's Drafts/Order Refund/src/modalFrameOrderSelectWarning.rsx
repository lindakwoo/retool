<ModalFrame
  id="modalFrameOrderSelectWarning"
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
  size="medium"
>
  <Header>
    <Text id="modalTitle3" verticalAlign="center" />
    <Button
      id="modalCloseButton3"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="modalFrameOrderSelectWarning"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text8"
      value="You’ve selected orders that cannot be refunded together. Bulk refunds require all orders to use the same refund method. Currently selected [{{ validateSelectedOrderRefundMethods.data }}]"
      verticalAlign="center"
    />
  </Body>
  <Footer>
    <Button id="button1" text="OK">
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="modalFrameOrderSelectWarning"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
