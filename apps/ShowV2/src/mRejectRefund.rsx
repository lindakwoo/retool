<ModalFrame
  id="mRejectRefund"
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
    <Text
      id="modalTitle1"
      value="### Reject Refund Requests"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton1"
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
        pluginId="mRejectRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="mRejectRefundText"
      marginType="normal"
      value="You are about to reject the following refund requests:"
      verticalAlign="center"
    />
    <Select
      id="mRejectRefundSelectReason"
      emptyMessage="No options"
      itemMode="static"
      label="Reason"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
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
      id="mRejectRefundTMessage"
      label="Rejection Message"
      marginType="normal"
      placeholder="Enter value"
    />
    <Text
      id="mRejectRefundTRefundError"
      marginType="normal"
      verticalAlign="center"
    />
    <Button id="button18" marginType="normal" text="Reject">
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryBulkReject"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
  <Event
    event="show"
    method="run"
    params={{
      ordered: [
        {
          src: 'const rows = tableShipmentsRefund.selectedRow.data.reverse();\nconst messages = [];\nvar total_minor = 0\nfor (const row of rows) {\n  messages.push(`order id: ${row.order_id}, refund request id: ${row.refund_request_id}, refund request status: ${row.refund_request_status}`)\n  total_minor += row.total_cents\n}\nconst total_msg= `\\n totaling: ${total_minor / 100}`\nmRejectRefundText.setValue("You are about to reject the following refund requests:\\n" + messages.join("\\n") + total_msg)',
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
