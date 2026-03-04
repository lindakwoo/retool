<ModalFrame
  id="cancellationFeeModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="true"
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text
      id="modalTitle3"
      value="### Confirm Cancellation Fee Reversal"
      verticalAlign="center"
    />
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
        pluginId="cancellationFeeModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text135"
      value="**This will immediately reverse the cancellation fee incurred by the seller.**"
      verticalAlign="center"
    />
    <Button
      id="confirmCancellationFeeReversalButton"
      submitTargetId=""
      text="Confirm"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="reverseCancellationFee"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</ModalFrame>
