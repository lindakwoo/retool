<Container
  id="container7"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="containerTitle7" value="#### Refund" verticalAlign="center" />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="tableReversibles"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ Object.keys(calculateTotalReversibles.data).map(key => calculateTotalReversibles.data[key])}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      primaryKeyColumnId="c6b84"
      rowHeight="medium"
      rowSelection="none"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="c6b84"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Total eligible for refund"
        placeholder="Enter value"
        position="center"
        size={224}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.name}}"
      />
      <Column
        id="e9c3c"
        alignment="right"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "{{ currentSourceRow.currency }}",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="amount"
        label="Amount"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.amount }}"
      />
    </Table>
    <Include src="./tabbedContainerRefundForm.rsx" />
    <Text
      id="textRefundWarningMessage"
      hidden={'{{ variableRefundWarningMessage.value == "" }}'}
      style={{
        fontSize: "labelEmphasizedFont",
        fontWeight: "labelEmphasizedFont",
        fontFamily: "labelEmphasizedFont",
        color: "warning",
      }}
      value="{{ variableRefundWarningMessage.value }}"
      verticalAlign="center"
    />
    <Button
      id="buttonRejectRefunds"
      disabled="{{ !variableRejectButtonEnabled.value }}"
      text="Reject Refund"
    >
      <Event
        event="click"
        method="show"
        params={{}}
        pluginId="modalFrameRejectRefunds"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonSubmitOrderRefund"
      disabled={'{{ tabbedContainerRefundForm.currentViewKey === "na" }}'}
      submitTargetId=""
      text="Refund"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="submitOrderRefundForm"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
