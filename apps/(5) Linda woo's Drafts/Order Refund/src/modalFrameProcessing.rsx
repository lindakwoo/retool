<ModalFrame
  id="modalFrameProcessing"
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
      id="modalHeaderProcessing"
      value="### Processing Refunds"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Table
      id="tableLegacyResults"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ executionResult.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      hidden="{{ executionResult.value.length === 0 || executionResult.value.filter(result => result.refundMethod == 'legacy' || result.refundMethod == 'giveaway' || result.refundMethod == 'postage_due').length === 0 }}"
      primaryKeyColumnId="f9143"
      rowHeight="small"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="f9143"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: false, notation: "standard" }}
        groupAggregationMode="sum"
        key="orderId"
        label="Order ID"
        placeholder="Enter value"
        position="center"
        size={122}
        summaryAggregationMode="none"
      />
      <Column
        id="9f593"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "{{ currentSourceRow.refundAmount.currency }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="refundAmount"
        label="Requested Amount"
        placeholder="Enter value"
        position="center"
        size={179}
        summaryAggregationMode="none"
        valueOverride="{{ item != null? item.amount/100 : null }}"
      />
      <Column
        id="1c28d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="status"
        label="Status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
    </Table>
    <Table
      id="tableOrderRefundResults"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ executionResult.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      hidden="{{ executionResult.value.length === 0 || executionResult.value.filter(result => result.refundMethod == 'normal').length === 0 }}"
      primaryKeyColumnId="ff558"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="ff558"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: false, notation: "standard" }}
        groupAggregationMode="sum"
        key="orderId"
        label="Order ID"
        placeholder="Enter value"
        position="center"
        size={68.46875}
        summaryAggregationMode="none"
      />
      <Column
        id="dc1ba"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        placeholder="Select option"
        position="center"
        size={152}
        summaryAggregationMode="none"
      />
      <Column
        id="9b331"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency:
            "{{ currentSourceRow.buyer_refund ? currentSourceRow.buyer_refund.currency : null }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="buyer_refund"
        label="Buyer Refund"
        placeholder="Enter value"
        position="center"
        referenceId="buyer_refund"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item ? item.amount : null }}"
      />
      <Column
        id="67cf5"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency:
            "{{ currentSourceRow.total_seller_charge ? currentSourceRow.total_seller_charge.currency : null }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="total_seller_charge"
        label="Seller Charge"
        placeholder="Enter value"
        position="center"
        referenceId="total_seller_charge"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item ? item.amount : null }}"
      />
    </Table>
  </Body>
  <Footer>
    <Button id="button2" text="OK">
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="modalFrameProcessing"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="moduleCallback"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
