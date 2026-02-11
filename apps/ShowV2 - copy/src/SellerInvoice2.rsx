<Container
  id="SellerInvoice2"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="SelleFee"
      marginType="normal"
      value="#### Seller Fees"
      verticalAlign="center"
    />
    <Button
      id="revealSellerInvoicePIIButton"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !querySellerInvoice.data || !querySellerInvoice.data.billing_address || querySellerInvoice.data.billing_address[0].indexOf("*") == -1}}'
      }
      marginType="normal"
      text="Reveal PII"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "await querySellerInvoice.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="3a548" viewKey="View 1">
    <Text
      id="InvoiceIDSeller2"
      marginType="normal"
      value="**Invoice ID**: {{ querySellerInvoice.data.id }}"
      verticalAlign="center"
    />
    <Text
      id="text117"
      marginType="normal"
      value="**External ID**: {{ querySellerInvoice.data.external_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="DescSeller2"
      marginType="normal"
      value="**Invoice type**: {{ querySellerInvoice.data.invoice_type || '' }}"
      verticalAlign="center"
    />
    <Text
      id="BillingAddressSeller2"
      marginType="normal"
      value="**Billing address**
{{ querySellerInvoice.data.billing_address.join('\n') || '' }}"
      verticalAlign="center"
    />
    <Text
      id="DescSeller3"
      marginType="normal"
      value="**Description**: {{ querySellerInvoice.data.description || '' }}"
      verticalAlign="center"
    />
    <Text
      id="InvoiceStatusSeller2"
      marginType="normal"
      value="**Status**: {{ querySellerInvoice.data.status 
 || '' }}"
      verticalAlign="center"
    />
    <Text
      id="InvoiceIssuedAtSeller2"
      marginType="normal"
      value="**Issued at**: {{ querySellerInvoice.data.issued_at || '' }}"
      verticalAlign="center"
    />
    <Text
      id="OrderIDSeller8"
      marginType="normal"
      value={
        "**Total amount**: {{\nquerySellerInvoice.data.total_amount_sub_units ? \n  (querySellerInvoice.data.total_amount_sub_units / 100).toLocaleString('en-US', {\n    style: 'currency',\n    currency: querySellerInvoice.data.currency\n  }) \n  : \"-\"\n}}"
      }
      verticalAlign="center"
    />
    <Text
      id="OrderIDSeller10"
      marginType="normal"
      value="**Currency**: {{
querySellerInvoice.data.currency }}"
      verticalAlign="center"
    />
    <Text
      id="text112"
      marginType="normal"
      value="NOTE1: Total amount indicates how much Whatnot charged the seller"
      verticalAlign="center"
    />
    <Text
      id="text116"
      marginType="normal"
      value={
        'NOTE2: Total amount should be available if the invoice\'s status is "ISSUED"'
      }
      verticalAlign="center"
    />
    <Text
      id="OrderIDSeller5"
      marginType="normal"
      value="**Order ID**: {{ querySellerInvoice.data.external_entity_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="OrderIDSeller6"
      marginType="normal"
      value="**Ledger transaction ID**: {{ querySellerInvoice.data.transaction_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="OrderIDSeller7"
      marginType="normal"
      value="**Ledger transaction created at**: {{ querySellerInvoice.data.transaction_occurred_at || '' }}"
      verticalAlign="center"
    />
    <Text id="text115" marginType="normal" verticalAlign="center" />
    <Text
      id="InvoiceDetailsSeller2"
      marginType="normal"
      value="##### Line item details"
      verticalAlign="center"
    />
    <Divider id="DetailDivider2" marginType="normal" textSize="default" />
    <Table
      id="AboveTheLineSeller2"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ querySellerInvoice.data.line_items }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      enableSaveActions={true}
      heightType="auto"
      primaryKeyColumnId="76365"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Include src="./AboveTheLineSeller2ExpandedRow.rsx" />
      <Column
        id="76365"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        label="ID"
        placeholder="Enter value"
        position="center"
        referenceId="id"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.id }}"
      />
      <Column
        id="4671e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="Line item type"
        placeholder="Enter value"
        position="center"
        referenceId="lineItemType"
        size={407}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.line_item_type }}"
      />
      <Column
        id="7c6af"
        alignment="left"
        backgroundColor="rgba(0, 0, 0, 0)"
        format="string"
        groupAggregationMode="none"
        label="Description"
        placeholder="Enter value"
        position="center"
        referenceId="description"
        size={270}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.description }}"
      />
      <Column
        id="8df25"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        label="Qty"
        placeholder="Enter value"
        position="center"
        referenceId="qty"
        size={46}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.item_quantity }}"
      />
      <Column
        id="b2a5f"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{
          currency: "{{currentSourceRow.currency}}",
          currencySign: "standard",
          notation: "compact",
          showSeparators: true,
        }}
        groupAggregationMode="sum"
        label="Unit price"
        placeholder="Enter value"
        position="center"
        referenceId="unitPriceQueryBuyerInvoiceDataTaxIncludedIncluTax"
        size={138}
        summaryAggregationMode="none"
        valueOverride="{{ (currentSourceRow.unit_price_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) }}"
      />
      <Column
        id="7843e"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Amount"
        placeholder="Enter value"
        position="center"
        referenceId="amount"
        size={125}
        summaryAggregationMode="none"
        valueOverride="{{ (currentSourceRow.signed_amount_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) }}"
      />
      <Column
        id="781a9"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Included"
        placeholder="Enter value"
        position="center"
        referenceId="column9"
        size={100}
        summaryAggregationMode="none"
        tooltip="Whether the amount is already included in the parent line item"
        valueOverride="{{ currentSourceRow.price_inclusive_of_amount }}"
      />
      <Column
        id="aa0a1"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Parent ID"
        placeholder="Enter value"
        position="center"
        referenceId="parentId"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.parent_line_item_id }}"
      />
      <Column
        id="db92c"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
        }}
        groupAggregationMode="sum"
        label="Flat fee"
        placeholder="Enter value"
        position="center"
        referenceId="flatFee"
        size={92}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.calculation_flat_fee_sub_units !== null ? (currentSourceRow.calculation_flat_fee_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) : '-'  }}"
      />
      <Column
        id="1c084"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        label="Rate (%)"
        placeholder="Enter value"
        position="center"
        referenceId="rate"
        size={95}
        summaryAggregationMode="none"
        valueOverride="{{ Number(currentSourceRow.calculation_percentage_rate) || '- ' }}%"
      />
      <Column
        id="ecc5d"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Reference amount"
        placeholder="Enter value"
        position="center"
        referenceId="referenceAmount"
        size={153}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.calculation_reference_amount_sub_units !== null ? (currentSourceRow.calculation_reference_amount_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) : '-'  }}"
      />
      <Column
        id="8536f"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Above the line"
        placeholder="Enter value"
        position="center"
        referenceId="aboveTheLine"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.above_the_line }}"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="AboveTheLineSeller2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="AboveTheLineSeller2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="selectRow"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryBuyerInvoice"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Text
      id="text118"
      marginType="normal"
      value={
        'NOTE1: In the table provided above, the "Included" column specifies whether the amount is already included in the amount of the parent line item referenced by "Parent ID".\nE.g. Commission fee line items marked as "Included" being true represent detailed breakdowns of the commission fees.'
      }
      verticalAlign="center"
    />
    <Text
      id="text113"
      marginType="normal"
      value={
        'NOTE2: Subtotal is the sum of "above the line" line items\' amounts'
      }
      verticalAlign="center"
    />
    <Text
      id="text114"
      marginType="normal"
      value={
        'NOTE3: Invoice total is the sum of "below the line" line items\' amounts'
      }
      verticalAlign="center"
    />
  </View>
</Container>
