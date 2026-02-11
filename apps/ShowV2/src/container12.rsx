<Container
  id="container12"
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
      id="containerTitle21"
      marginType="normal"
      value="#### Buyer"
      verticalAlign="center"
    />
    <Button
      id="revealBuyerInvoicePIIButton"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !queryBuyerInvoice.data || !queryBuyerInvoice.data.billing_address || queryBuyerInvoice.data.billing_address[0].indexOf("*") == -1}}'
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
              src: "await queryBuyerInvoice.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
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
  <View id="8cc33" viewKey="View 1">
    <Text
      id="text59"
      marginType="normal"
      value="**Invoice ID**: {{ queryBuyerInvoice.data.id }}"
      verticalAlign="center"
    />
    <Text
      id="text88"
      marginType="normal"
      value="**External ID**: {{ queryBuyerInvoice.data.external_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text53"
      marginType="normal"
      value="**Invoice type**: {{ queryBuyerInvoice.data.invoice_type || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text51"
      marginType="normal"
      value="**Billing address**
{{ queryBuyerInvoice.data.billing_address.join('\n') || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text123"
      marginType="normal"
      value="**Description**: {{ queryBuyerInvoice.data.description || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text52"
      marginType="normal"
      value="**Status**: {{ queryBuyerInvoice.data.status 
 || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text54"
      marginType="normal"
      value="**Issued at**: {{ queryBuyerInvoice.data.issued_at || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text81"
      marginType="normal"
      value={
        "**Invoice total:** {{\nqueryBuyerInvoice.data.total_amount_sub_units ? \n  (queryBuyerInvoice.data.total_amount_sub_units / 100).toLocaleString('en-US', {\n    style: 'currency',\n    currency: queryBuyerInvoice.data.currency\n  }) \n  : \"-\"\n}}"
      }
      verticalAlign="center"
    />
    <Text
      id="text124"
      marginType="normal"
      value="**Currency:** {{
queryBuyerInvoice.data.currency}}"
      verticalAlign="center"
    />
    <Text
      id="text90"
      marginType="normal"
      value={
        'NOTE: Total amount should be available if the invoice\'s status is "ISSUED"'
      }
      verticalAlign="center"
    />
    <Text
      id="text55"
      marginType="normal"
      value="**Order ID**: {{ queryBuyerInvoice.data.external_entity_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text87"
      marginType="normal"
      value="**Payment ID**: {{ queryBuyerInvoice.data.transaction_id || '' }}"
      verticalAlign="center"
    />
    <Text
      id="text89"
      marginType="normal"
      value="**Payment occured at**: {{ queryBuyerInvoice.data.transaction_occurred_at || '' }}"
      verticalAlign="center"
    />
    <Text id="text91" marginType="normal" verticalAlign="center" />
    <Text
      id="text56"
      marginType="normal"
      value="##### Line item details"
      verticalAlign="center"
    />
    <Divider id="divider4" marginType="normal" textSize="default" />
    <Table
      id="aboveTheLine"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ 
  queryBuyerInvoice.data.line_items
}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      enableSaveActions={true}
      heightType="auto"
      primaryKeyColumnId="79e0d"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Column
        id="87bc6"
        alignment="left"
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
        id="71354"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="Line item type"
        placeholder="Enter value"
        position="center"
        referenceId="lineItemType"
        size={137}
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
        size={241}
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
        size={61}
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
        referenceId="amountQutax"
        size={102}
        summaryAggregationMode="none"
        valueOverride="{{ (currentSourceRow.signed_amount_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) }}"
      />
      <Column
        id="2566a"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Included"
        placeholder="Enter value"
        position="center"
        referenceId="included"
        size={110}
        summaryAggregationMode="none"
        tooltip="Whether the amount is already included in the parent line item"
        valueOverride="{{ currentSourceRow.price_inclusive_of_amount }}"
      />
      <Column
        id="1e178"
        alignment="right"
        format="string"
        groupAggregationMode="none"
        label="Parent ID"
        placeholder="Enter value"
        position="center"
        referenceId="parentId"
        size={94}
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
        size={102}
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
        size={92.859375}
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
        size={135.140625}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.calculation_reference_amount_sub_units !== null ? (currentSourceRow.calculation_reference_amount_sub_units / 100).toLocaleString('en-US', { style: 'currency', currency: currentSourceRow.currency }) : '-'  }}"
      />
      <Column
        id="9e201"
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
      <Action id="37590" icon="bold/interface-edit-pencil" label="Action 1" />
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
          pluginId="aboveTheLine"
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
          pluginId="aboveTheLine"
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
      id="text92"
      marginType="normal"
      value={
        'NOTE1: In the table provided above, the "Included" column specifies whether the amount is already included in the amount of the parent line item referenced by "Parent ID".'
      }
      verticalAlign="center"
    />
    <Text
      id="text101"
      marginType="normal"
      value={
        'NOTE2: Subtotal is the sum of "above the line" line items\' amounts'
      }
      verticalAlign="center"
    />
    <Text
      id="text102"
      marginType="normal"
      value={
        'NOTE3: Invoice total is the sum of "below the line" line items\' amounts'
      }
      verticalAlign="center"
    />
  </View>
</Container>
