<ModalFrame
  id="modalFrameRejectRefunds"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text
      id="modalTitle2"
      value="### Reject Refund Requests"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton2"
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
        pluginId="modalFrameRejectRefunds"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="formRejectRefunds"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle3" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Text
          id="text6"
          value="You are about to reject the following refund requests:
{{
  variableRejectRefundMessages.value
}}"
          verticalAlign="center"
        />
        <Select
          id="selectRejectRefundSelectReason"
          emptyMessage="No options"
          formDataKey="{{ self.reason }}"
          itemMode="static"
          label="Reason"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        >
          <Option
            id="636f3"
            label="Not Covered By Policy"
            value="NOT_COVERED_BY_POLICY"
          />
          <Option
            id="a649b"
            disabled={false}
            hidden={false}
            label="Other"
            value="OTHER"
          />
        </Select>
        <TextInput
          id="textRejectRefundMessage"
          formDataKey="{{ self.rejectionMessage }}"
          label="Rejection Message"
          marginType="normal"
          placeholder="Enter value"
          required={true}
        />
        <Text
          id="textRefundRejectErrorMessage"
          style={{ map: { color: "warning" } }}
          value="{{ variableRejectRefundResultMessage.value }}"
          verticalAlign="center"
        />
        <Button
          id="buttonReject"
          submit={true}
          submitTargetId="formRejectRefunds"
          text="Reject"
        />
      </Body>
      <Footer>
        <Button
          id="formButton3"
          submit={true}
          submitTargetId="formRejectRefunds"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{
          map: {
            options: {
              object: {
                onSuccess: null,
                onFailure: null,
                additionalScope: null,
              },
            },
          },
        }}
        pluginId="queryRejectSelectedRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Event
    event="hide"
    method="clear"
    params={{}}
    pluginId="formRejectRefunds"
    type="widget"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ map: { value: '""' } }}
    pluginId="variableRejectRefundResultMessage"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
