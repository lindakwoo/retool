<ModalFrame
  id="modalFrameConfirmRefund"
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
      id="modalTitleConfirm"
      value="### Confirm Refund"
      verticalAlign="center"
    />
    <Button
      id="modalCloseConfirmRefund"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="modalFrameConfirmRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="textConfirmMessage"
      value="{{ initConfirmMessage.data }}"
      verticalAlign="center"
    />
    <Table
      id="tableConfirmRefund"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ ordersInShipment.value ? ordersInShipment.value.filter(o => o.orderRefundRequest || o.legacyRefundRequest) : [] }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="6115b"
      rowHeight="medium"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="6115b"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: false, notation: "standard" }}
        groupAggregationMode="sum"
        key="order_id"
        label="Order ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="da47d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={206}
        summaryAggregationMode="none"
      />
      <Column
        id="ff783"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "{{ currentSourceRow.total_currency }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="total_cents"
        label="Order Total"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item/100 }}"
      />
      <Column
        id="b01ed"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "{{ currentSourceRow.quotation.buyer_refund.currency }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="quotation"
        label="Est. Buyer Refund"
        placeholder="Enter value"
        position="center"
        referenceId="est_buyer_amount"
        size={145}
        summaryAggregationMode="none"
        valueOverride="{{ item.buyer_refund.amount }}"
      />
      <Column
        id="ed163"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "{{ currentSourceRow.quotation.buyer_refund.currency }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="quotation"
        label="Est. Seller Cost"
        placeholder="Enter value"
        position="center"
        referenceId="est_seller_cost"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.legacyRefundRequest ? null : (item.seller_charge ? Number(item.seller_charge.amount) : 0) + (item.seller_earning_reversal ? Number(item.seller_earning_reversal.amount) : 0) }}"
      />
    </Table>
  </Body>
  <Footer>
    <Button
      id="buttonConfirmRefund"
      disabled="{{ ordersInShipment.value == null || ordersInShipment.value.filter(o => o.orderRefundRequest || o.legacyRefundRequest) == 0 }}"
      loading="{{ executeOrderRefundRequests.isFetching }}"
      text="Confirm"
    >
      <Event
        event="click"
        method="trigger"
        params={{ map: { options: { map: { additionalScope: {} } } } }}
        pluginId="executeOrderRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    event="hide"
    method="trigger"
    params={{}}
    pluginId="resetRefundForms"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
