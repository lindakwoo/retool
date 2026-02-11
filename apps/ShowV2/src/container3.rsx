<Container
  id="container3"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle13"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="### Payment Details"
      verticalAlign="center"
    />
  </Header>
  <View id="40de5" viewKey="View 1">
    <Include src="./containerBuyerPayment.rsx" />
    <Container
      id="container4"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
      style={{ ordered: [{ headerBackground: "rgb(237, 237, 237)" }] }}
    >
      <Header>
        <Text
          id="containerTitle14"
          _disclosedFields={{ array: [] }}
          heightType="fixed"
          marginType="normal"
          value="**SELLER EARNINGS (PAYOUT)**"
          verticalAlign="center"
        />
        <Button
          id="button1"
          _disclosedFields={{ array: [] }}
          disabled="{{queryRecord.data.items[0].listing.ledger_transaction}}"
          marginType="normal"
          text="Payout"
        >
          <Event
            enabled={
              '{{  new Date(queryRecord.data.processed_at) <= new Date(twoDaysAgo.data) || urlparams.href.includes("stage") }}'
            }
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="queryPayout_PaymentDetailsPage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled={
              '{{  new Date(queryRecord.data.processed_at) > new Date(twoDaysAgo.data) && !urlparams.href.includes("stage") }}'
            }
            event="click"
            method="showNotification"
            params={{
              map: {
                options: {
                  notificationType: "info",
                  duration: "10",
                  title: "Order earnings cannot be paid",
                  description:
                    "Orders must be at least 2 days old before they can be paid to a seller",
                },
              },
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Header>
      <View id="40de5" viewKey="View 1">
        <KeyValueMap
          id="keyValue1"
          data={
            '\n{{ \n  \n  {\n    "earned at": querySellerEarnings.data.earned_at,\n    "amount earned": parseFloat(querySellerEarnings.data.earnings.amount).toLocaleString("en-US", { style: "currency", currency: querySellerEarnings.data.earnings.currency || "USD"}), \n    ...queryNewRefund2_0.data,\n    "amount_billed_back_formatted": queryOrderRefunds.data.order_seller_charge_amount != 0 ? queryOrderRefunds.data.order_seller_charge_formatted : queryNewRefund2_0.data.amount_billed_back_formatted,\n    net_payout: ((parseFloat(querySellerEarnings.data.earnings.amount)+(queryOrderRefunds.data.order_seller_charge_amount != 0 ? queryOrderRefunds.data.order_seller_charge_amount : queryNewRefund2_0.data.amount_billed_back/100))).toLocaleString("en-US", { style: "currency", currency: querySellerEarnings.data.earnings.currency  || "USD" })\n  }\n}}'
          }
          hidden="{{!!!querySellerEarnings.data.earnings}}"
          maintainSpaceWhenHidden={true}
          prevRowFormats={{}}
          prevRowMappers={{}}
          rowHeaderNames={{
            amount_cents: "payout amount",
            amount_billed_back_formatted: "amount billed back",
            net_payout: "net payout",
            "Earned at": "earned at",
          }}
          rows={[
            "a",
            "b",
            "c",
            "d",
            "d2",
            "d3",
            "actions",
            "id",
            "listing",
            "name",
            "price_cents",
            "product_id",
            "shipment",
            "status",
            "amount_cents",
            "earned_at",
            "amount_earned",
            "Earned at:",
            "amount earned",
            "amount_billed_back_formatted",
            "net_payout",
            "updated_at",
            "count",
            "refund_requests",
            "amount_billed_back",
            "has_rejected_refund",
            "amount_refunded",
            "amount_refunded_formated",
            "earnings",
            "amount",
            "currency",
            "earnedat",
            "earned at",
            "Date",
            "Dateti",
            "Dat",
            "",
            "E",
            "Earned ",
            "amountearned",
            "Earned at",
            "statusCode",
            "error",
            "message",
            "data",
            "metadata",
            "amount_",
          ]}
          rowVisibility={{
            "": true,
            a: true,
            b: true,
            c: true,
            Dateti: true,
            d: true,
            amount_cents: true,
            listing: true,
            E: true,
            message: true,
            amount_: true,
            error: true,
            net_payout: true,
            "Earned ": true,
            earnings: true,
            earnedat: true,
            data: true,
            refund_requests: false,
            product_id: true,
            name: true,
            d2: true,
            Date: true,
            d3: true,
            amountearned: true,
            count: false,
            metadata: true,
            currency: true,
            status: true,
            has_rejected_refund: true,
            price_cents: true,
            amount_billed_back_formatted: true,
            updated_at: true,
            Dat: true,
            amount_refunded_formated: true,
            amount: true,
            amount_billed_back: false,
            shipment: true,
            id: true,
            earned_at: true,
            "Earned at": true,
            "earned at": true,
            actions: true,
            amount_earned: true,
            "Earned at:": true,
            amount_refunded: true,
            statusCode: true,
            "amount earned": true,
          }}
        />
      </View>
    </Container>
    <ContainerWidget
      id="containerRefundAuditLog"
      backgroundColor="white"
      hidden="{{queryRefundAuditLog.data.length == 0}}"
      overflowType="hidden"
      style={{ ordered: [] }}
      title="Refund audit log"
    >
      <Select
        id="item_auth_in_refund_audit_log"
        data="{{ queryItemAuthenticityDropdown.data }}"
        hidden={'{{queryRefundAuditLog.data[0]?.refund_reason != "Fake Item"}}'}
        hiddenByIndex=""
        label="Item Authenticity:"
        labels="{{ item.label }}"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        showSelectionIndicator={true}
        value="{{queryRefundAuditLog.data[0]?.item_authenticity}}"
        values="{{ item.value }}"
      >
        <Event
          event="change"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="queryUpdateItemAuthenticity"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <TableLegacy
        id="refundAuditLogTable"
        _columns={[
          "created_at",
          "amount_refunded_cents",
          "refund_reason",
          "author",
          "returned",
          "notes",
          "item_authenticity",
        ]}
        _columnVisibility={{
          ordered: [
            { notes: true },
            { created_at: true },
            { amount_refunded_cents: true },
            { refund_reason: true },
            { author: true },
            { name: true },
            { sales: true },
            { returned: true },
            { id: true },
            { email: true },
          ],
        }}
        _unfilteredSelectedIndex=""
        applyDynamicSettingsToColumnOrder={false}
        columnAlignment={{ ordered: [{ amount_refunded_cents: "right" }] }}
        columnColors={{
          ordered: [
            { return_status: "" },
            { notes: "" },
            { currency_symbol: "" },
            { created_at: "" },
            { amount_refunded_cents: "" },
            { refund_reason: "" },
            { author: "" },
            { name: "" },
            { sales: "" },
            { returned: "" },
            { currency: "" },
            { tax_refunded_minor_units: "" },
            { id: "" },
            { email: "" },
            { item_authenticity: "" },
          ],
        }}
        columnFormats={{ ordered: [{ amount_refunded_cents: "usd_cents" }] }}
        columnHeaderNames={{
          ordered: [
            { amount_refunded_cents: "Amound refunded" },
            { author: "Author" },
            { refund_reason: "Refund reason" },
            { created_at: "Refunded at" },
            { notes: "Notes" },
            { returned: "Returned?" },
          ],
        }}
        columnMappers={{
          ordered: [
            { amount_refunded_cents: "{{currentRow.amount_refunded_cents}}" },
          ],
        }}
        columns={[
          "created_at",
          "amount_refunded_cents",
          "refund_reason",
          "author",
          "returned",
          "notes",
        ]}
        columnVisibility={{
          ordered: [
            { notes: true },
            { created_at: true },
            { amount_refunded_cents: true },
            { refund_reason: true },
            { author: true },
            { name: true },
            { sales: true },
            { returned: true },
            { id: true },
            { email: true },
          ],
        }}
        columnWidths={[
          { object: { id: "refund_reason", value: 200.765625 } },
          { object: { id: "author", value: 185.890625 } },
          { object: { id: "amount_refunded_cents", value: 154.78125 } },
          { object: { id: "returned", value: 136 } },
          { object: { id: "created_at", value: 250.5625 } },
        ]}
        customButtonName=""
        data="{{queryRefundAuditLog.data}}"
        pageSize={4}
        showColumnBorders={true}
      />
    </ContainerWidget>
    <Container
      id="container7"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{queryNewRefund2_0.data.refund_requests.length == 0}}"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle18"
          marginType="normal"
          value="#### Refund Requests"
          verticalAlign="center"
        />
      </Header>
      <View id="016e8" viewKey="View 1">
        <Table
          id="table4"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ 
  {...queryNewRefund2_0.data.refund_requests,
   ...queryNewRefund2_0.data.refund_requests.context }
  }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          enableSaveActions={true}
          rowHeight="small"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="a4fac"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            label="Action"
            placeholder="Enter value"
            position="center"
            referenceId="action"
            size={53.9375}
            summaryAggregationMode="none"
            valueOverride={'"Open"'}
          >
            <Event
              event="clickCell"
              method="openApp"
              params={{
                ordered: [
                  { uuid: "e2fe694c-431c-11ee-8001-4781f6116876" },
                  {
                    options: {
                      ordered: [
                        {
                          queryParams: [
                            {
                              ordered: [
                                { key: "id" },
                                { value: "{{table4.selectedRow.id}}" },
                              ],
                            },
                            { ordered: [{ key: "" }, { value: "" }] },
                          ],
                        },
                        { newTab: true },
                      ],
                    },
                  },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="eec27"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={68.921875}
            summaryAggregationMode="none"
          />
          <Column
            id="e8517"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="amount_requested_sub_units"
            label="Amount requested sub units"
            placeholder="Enter value"
            position="center"
            size={182.8125}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="041e9"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="status"
            label="Status"
            placeholder="Enter value"
            position="center"
            size={76.375}
            summaryAggregationMode="none"
          />
          <Column
            id="729a0"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            key="monitoring_shipment"
            label="Monitoring shipment"
            placeholder="Enter value"
            position="center"
            size={216}
            summaryAggregationMode="none"
          />
          <Column
            id="8ac53"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="currency"
            label="Currency"
            placeholder="Enter value"
            position="center"
            size={70.40625}
            summaryAggregationMode="none"
          />
          <Column
            id="452ad"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="refund_payment_payer"
            label="Refund payment payer"
            placeholder="Enter value"
            position="center"
            size={149.09375}
            summaryAggregationMode="none"
          />
          <Column
            id="bed1e"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="rejection_message"
            label="Rejection message"
            placeholder="Enter value"
            position="center"
            size={238.15625}
            summaryAggregationMode="none"
          />
          <Column
            id="7a761"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="rejection_reason"
            label="Rejection reason"
            placeholder="Enter value"
            position="center"
            size={114.515625}
            summaryAggregationMode="none"
          />
          <Column
            id="09b90"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="report_reason"
            label="Report reason"
            placeholder="Enter value"
            position="center"
            size={142.171875}
            summaryAggregationMode="none"
          />
          <Column
            id="c0f3e"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_id"
            label="Return shipment ID"
            placeholder="Enter value"
            position="center"
            size={129.5625}
            summaryAggregationMode="none"
          />
          <Column
            id="91f6d"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_payer"
            label="Return shipment payer"
            placeholder="Enter value"
            position="center"
            size={150.1875}
            summaryAggregationMode="none"
          />
          <Column
            id="9b30d"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="buyer_id"
            label="Buyer ID"
            placeholder="Enter value"
            position="center"
            size={68.921875}
            summaryAggregationMode="none"
          />
          <Column
            id="5f030"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="seller_id"
            label="Seller ID"
            placeholder="Enter value"
            position="center"
            size={68.921875}
            summaryAggregationMode="none"
          />
          <Column
            id="3f0d0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="reason_message"
            label="Reason message"
            placeholder="Enter value"
            position="center"
            size={115.25}
            summaryAggregationMode="none"
          />
          <Column
            id="b7fa8"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="source_payment"
            label="Source payment"
            placeholder="Enter value"
            position="center"
            size={112.125}
            summaryAggregationMode="none"
          />
          <Column
            id="c66c5"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="amount"
            label="Amount"
            placeholder="Enter value"
            position="center"
            size={62.28125}
            summaryAggregationMode="none"
          />
          <Column
            id="3270f"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="seller_amount"
            label="Seller amount"
            placeholder="Enter value"
            position="center"
            size={97.71875}
            summaryAggregationMode="none"
          />
          <Column
            id="ab4dc"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_id"
            label="Order ID"
            placeholder="Enter value"
            position="center"
            size={84.03125}
            summaryAggregationMode="none"
          />
          <Column
            id="b0e34"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="order_date"
            label="Order date"
            placeholder="Enter value"
            position="center"
            size={79.5625}
            summaryAggregationMode="none"
          />
          <Column
            id="2a3d8"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_status"
            label="Return shipment status"
            placeholder="Enter value"
            position="center"
            size={154.046875}
            summaryAggregationMode="none"
          />
          <Column
            id="3e830"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_tracking_code"
            label="Return shipment tracking code"
            placeholder="Enter value"
            position="center"
            size={198.015625}
            summaryAggregationMode="none"
          />
          <Column
            id="09f1a"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_tracking_url"
            label="Return shipment tracking URL"
            placeholder="Enter value"
            position="center"
            size={193.234375}
            summaryAggregationMode="none"
          />
          <Column
            id="e6882"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_label_url"
            label="Return shipment label URL"
            placeholder="Enter value"
            position="center"
            size={172.90625}
            summaryAggregationMode="none"
          />
          <Column
            id="30a99"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="ledger_transaction"
            label="Ledger transaction"
            placeholder="Enter value"
            position="center"
            size={127.609375}
            summaryAggregationMode="none"
          />
          <Column
            id="4088b"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="replacement_details"
            label="Replacement details"
            placeholder="Enter value"
            position="center"
            size={136.046875}
            summaryAggregationMode="none"
          />
          <Column
            id="98bd8"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="admin_actions"
            label="Admin actions"
            placeholder="Enter value"
            position="center"
            size={99.921875}
            summaryAggregationMode="none"
          />
          <Column
            id="f8cb8"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="version"
            label="Version"
            placeholder="Enter value"
            position="center"
            size={225.953125}
            summaryAggregationMode="none"
          />
          <Column
            id="0bba5"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={208.1875}
            summaryAggregationMode="none"
          />
          <Column
            id="c9c07"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="status_updated_at"
            label="Status updated at"
            placeholder="Enter value"
            position="center"
            size={205.984375}
            summaryAggregationMode="none"
          />
          <Column
            id="6d179"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="images"
            label="Images"
            placeholder="Select options"
            position="center"
            size={58.796875}
            summaryAggregationMode="none"
          />
          <Column
            id="abd97"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="decision_made_by"
            label="Decision made by"
            placeholder="Enter value"
            position="center"
            size={120.140625}
            summaryAggregationMode="none"
          />
          <Column
            id="ca6d6"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            key="visible_to_seller"
            label="Visible to seller"
            placeholder="Enter value"
            position="center"
            size={106.75}
            summaryAggregationMode="none"
          />
          <Column
            id="fb86d"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="status_history"
            label="Status history"
            placeholder="Enter value"
            position="center"
            size={807.015625}
            summaryAggregationMode="none"
          />
          <Column
            id="c2afa"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="buyer_refund_error"
            label="Buyer refund error"
            placeholder="Enter value"
            position="center"
            size={125.0625}
            summaryAggregationMode="none"
          />
          <Column
            id="0c410"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="seller_charge_error"
            label="Seller charge error"
            placeholder="Enter value"
            position="center"
            size={126.421875}
            summaryAggregationMode="none"
          />
          <Column
            id="44292"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="seller_commission_sub_units"
            label="Seller commission sub units"
            placeholder="Enter value"
            position="center"
            size={180.890625}
            summaryAggregationMode="none"
          />
          <Column
            id="4034d"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_whatnot_commission_fee_sub_units"
            label="Order whatnot commission fee sub units"
            placeholder="Enter value"
            position="center"
            size={254.421875}
            summaryAggregationMode="none"
          />
          <Column
            id="5bec7"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="commission_rebate_note"
            label="Commission rebate note"
            placeholder="Enter value"
            position="center"
            size={412.703125}
            summaryAggregationMode="none"
          />
          <Column
            id="31593"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            key="submit_shipping_claim"
            label="Submit shipping claim"
            placeholder="Enter value"
            position="center"
            size={146.578125}
            summaryAggregationMode="none"
          />
          <Column
            id="1acd8"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="context"
            label="Context"
            placeholder="Enter value"
            position="center"
            size={1133}
            summaryAggregationMode="none"
          />
          <Column
            id="cbf15"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="group_id"
            label="Group ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="63336"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="return_shipment_history"
            label="Return shipment history"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="66a4b"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            key="approved_via_monitoring_shipment_cli"
            label="Approved via monitoring shipment cli"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
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
              pluginId="table4"
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
              pluginId="table4"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Container
      id="containerAppealLog"
      disabled=""
      heightType="fixed"
      hidden="{{queryAppeals.data?.appeals?.length == 0}}"
      hoistFetching={true}
      maintainSpaceWhenHidden={null}
      overflowType="hidden"
      padding="12px"
      selectedView="View 1"
      showBody={true}
      showHeader={true}
      showInEditor={null}
      style={{ map: { headerBackground: "#ededed" } }}
      styleContext={{}}
    >
      <Header>
        <Text
          id="containerTitle31"
          value={
            '<div style="text-transform: uppercase; font-weight: 500;">Billback Appeal Audit Log</div>'
          }
          verticalAlign="center"
        />
      </Header>
      <View id="" viewKey="View 1" />
      <Body>
        <Table
          id="appealTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ queryAppeals.data.appeals }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="c7d82"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="c7d82"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="id"
            label="Appeal ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="8a0d6"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="external_entity_id"
            label="External entity ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="2e8b5"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="external_entity_type"
            label="External entity type"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="71bc0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="status"
            label="Appeal Status
"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="8308a"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="pretty_total_amount_approved"
            label="Amount Approved"
            placeholder="Enter value"
            position="center"
            size={135}
            summaryAggregationMode="none"
          >
            <Event
              event="clickCell"
              method="trigger"
              params={{}}
              pluginId="queryAppeals"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="38f33"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="appeal_source"
            label="Appeal source"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="6fc12"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={229}
            summaryAggregationMode="none"
          />
          <Column
            id="d034c"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="decision_made_at"
            label="Decision made at"
            placeholder="Enter value"
            position="center"
            size={234}
            summaryAggregationMode="none"
          />
          <Column
            id="14db1"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="appeal_reason"
            label="Appeal reason"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="2496b"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="decision_reason"
            label="Decision reason"
            placeholder="Enter value"
            position="center"
            size={249}
            summaryAggregationMode="none"
          />
          <Column
            id="1a87e"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="decision_notes"
            label="Decision notes"
            placeholder="Enter value"
            position="center"
            size={132}
            summaryAggregationMode="none"
          />
          <Column
            id="2337b"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            key="decision_made_by"
            label="Decision made by"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="39c59"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="ticket_id"
            label="Ticket ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
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
              pluginId="appealTable"
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
              pluginId="appealTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </Body>
    </Container>
  </View>
</Container>
