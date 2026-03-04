<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css="" />
  <GlobalWidgetProp id="moduleOrderId" />
  <GlobalWidgetStringProp id="moduleRefundReason" />
  <Include src="./src/modalFrameConfirmRefund.rsx" />
  <Include src="./src/modalFrameOrderSelectWarning.rsx" />
  <Include src="./src/modalFrameProcessing.rsx" />
  <Include src="./src/modalFrameRejectRefunds.rsx" />
  <Include src="./src/modalFrameReversiblesAndRefund.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Text
        id="text9"
        value="**Reversibles and Refunds Modal**
Set moduleOrderId value of the module or orderId in url params to display refund modal."
        verticalAlign="center"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
