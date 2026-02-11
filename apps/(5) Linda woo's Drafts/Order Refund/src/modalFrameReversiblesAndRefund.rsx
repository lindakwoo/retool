<ModalFrame
  id="modalFrameReversiblesAndRefund"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="{{ !orderShipmentId.value }}"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  margin="4px 8px"
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
  style={{}}
>
  <Header>
    <Text id="modalTitle1" value="## Order Refund" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
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
        pluginId="modalFrameReversiblesAndRefund"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text5"
      value="👋 **Hello {{ current_user.firstName || 'friend' }}!**
Choose the order(s) you want to refund from the in-shipment list; specify whether to issue a full refund or a partial refund covering the item price and any buyer-paid shipping."
      verticalAlign="center"
    />
    <Container
      id="container6"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle6"
          value="#### Orders In Shipment"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="tableOrders"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ ordersInShipment.value }}"
          defaultSelectedRow={{
            mode: "index",
            indexType: "display",
            index:
              "{{ordersInShipment.value && ordersInShipment.value.length > 0 ? tableOrders.data.findIndex(el => el.order_id === queryOrder.data.id) : null }}",
          }}
          emptyMessage="No rows found"
          rowBackgroundColor=""
          rowHeight="medium"
          rowSelection="multiple"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{}}
          toolbarPosition="bottom"
        >
          <Column
            id="d42d2"
            alignment="left"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_id"
            label="Order ID"
            placeholder="Enter value"
            position="center"
            size={109.546875}
            summaryAggregationMode="none"
          />
          <Column
            id="444fe"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="name"
            label="Name"
            placeholder="Enter value"
            position="center"
            size={403.21875}
            summaryAggregationMode="none"
          />
          <Column
            id="afa79"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="{{ Array.from(new Set(
  ordersInShipment.value
  .map((order) => order.refundMethod)
)).length <=1 }}"
            key="refundMethod"
            label="Refund method"
            optionList={{
              manualData: [
                { value: "legacy", color: "rgba(255, 0, 0, 1)" },
                { value: "normal", color: "rgba(197, 201, 250, 0.41)" },
                { value: "giveaway", color: "rgba(255, 0, 0, 1)" },
              ],
            }}
            placeholder="Select option"
            position="center"
            referenceId="column10"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="88b2b"
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
            size={109.5625}
            summaryAggregationMode="none"
            valueOverride="{{ item/100 }}"
          />
          <Column
            id="2be1f"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="status"
            label="Order Status"
            placeholder="Select option"
            position="center"
            size={114.578125}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="d0f9d"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="total_currency"
            label="Total currency"
            placeholder="Select option"
            position="center"
            size={97.046875}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="7d156"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="link"
            formatOptions={{ showUnderline: "always", underlineStyle: "solid" }}
            groupAggregationMode="sum"
            key="refund_request_id"
            label="Refund req ID"
            placeholder="Enter value"
            position="center"
            referenceId="refund_request_id"
            size={100}
            summaryAggregationMode="none"
            textColor="rgba(4, 0, 178, 1)"
          >
            <Event
              enabled="{{ currentSourceRow != null  && currentSourceRow.refund_request_id != null }}"
              event="clickCell"
              method="openApp"
              params={{
                uuid: "e2fe694c-431c-11ee-8001-4781f6116876",
                options: {
                  queryParams: [
                    {
                      key: "id",
                      value: "{{ currentSourceRow.refund_request_id  }}",
                    },
                  ],
                  newTab: true,
                },
              }}
              pluginId=""
              type="util"
              waitMs={0}
              waitType="debounce"
            />
          </Column>
          <Column
            id="d0eab"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="refund_request_status"
            label="Refund req status"
            placeholder="Select option"
            position="center"
            referenceId="refund_req_status"
            size={133}
            summaryAggregationMode="none"
          />
          <Column
            id="0df58"
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
            key="refund_requested_amount"
            label="Refund requested amount"
            placeholder="Enter value"
            position="center"
            referenceId="refund_req_amount"
            size={183}
            summaryAggregationMode="none"
            valueOverride="{{ item ? item/100 : null }}"
          />
          <Column
            id="72f43"
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
            key="reversibles"
            label="Refundable Order Price"
            placeholder="Enter value"
            position="center"
            referenceId="reversible_item_price"
            size={160}
            summaryAggregationMode="none"
            valueOverride="{{ item.ITEM_PRICE ? item.ITEM_PRICE.amount : 0 }}"
          />
          <Column
            id="3a669"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency: "{{ currentSourceRow.total_currency}}",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
            }}
            groupAggregationMode="sum"
            key="reversibles"
            label="Refundable Buyer Paid Shipping"
            placeholder="Enter value"
            position="center"
            referenceId="reversible_buyer_shipping"
            size={210}
            summaryAggregationMode="none"
            valueOverride="{{ item.BUYER_SHIPPING ? item.BUYER_SHIPPING.amount : 0 }}"
          />
          <Column
            id="788e6"
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
            key="reversibles"
            label="Refundable Total Tax"
            placeholder="Enter value"
            position="center"
            referenceId="total_tax"
            size={150}
            summaryAggregationMode="none"
            valueOverride="{{
  (item.TAXES_ON_ITEM ? Number(item.TAXES_ON_ITEM.amount) : 0)
  + (item.TAXES_ON_BUYER_SHIPPING ? Number(item.TAXES_ON_BUYER_SHIPPING.amount) : 0)
  + (item.RETAIL_DELIVERY_FEE ? Number(item.RETAIL_DELIVERY_FEE.amount) : 0)
}}"
          />
          <Column
            id="f8059"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={149.578125}
            summaryAggregationMode="none"
          />
          <Event
            enabled=""
            event="selectRow"
            method="trigger"
            params={{}}
            pluginId="calculateTotalReversibles"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="calculateTotalReversibles"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled=""
            event="selectRow"
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
            pluginId="resetRefundForms"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="resetRefundForms"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled="{{ validateSelectedOrderRefundMethods.data }}"
            event="selectRow"
            method="trigger"
            params={{}}
            pluginId="queryRejectRefundsState"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="queryRejectRefundsState"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled="{{ validateSelectedOrderRefundMethods.data }}"
            event="selectRow"
            method="trigger"
            params={{}}
            pluginId="querySetRefundWarningMessage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="querySetRefundWarningMessage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            enabled="{{ validateSelectedOrderRefundMethods.data }}"
            event="selectRow"
            method="trigger"
            params={{}}
            pluginId="queryEnabledRefundForms"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="queryEnabledRefundForms"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="selectRow"
            method="trigger"
            params={{}}
            pluginId="validateSelectedOrderRefundMethods"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="deselectRow"
            method="trigger"
            params={{}}
            pluginId="validateSelectedOrderRefundMethods"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
    <Include src="./container7.rsx" />
    <Container
      id="container8"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle8"
          value="#### Previous Refunds in Shipment"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="tableOrderRefunds"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ orderRefunds.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          heightType="auto"
          margin="0"
          primaryKeyColumnId="fdfac"
          rowSelection="none"
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="fdfac"
            alignment="left"
            editable={false}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={262.140625}
            summaryAggregationMode="none"
          />
          <Column
            id="c3365"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_id"
            label="Order ID"
            placeholder="Enter value"
            position="center"
            size={93}
            summaryAggregationMode="none"
          />
          <Column
            id="ee4f1"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="status"
            label="Status"
            placeholder="Select option"
            position="center"
            size={141.1875}
            summaryAggregationMode="none"
          />
          <Column
            id="187bf"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency:
                "{{ currentSourceRow.refund_outcome && currentSourceRow.refund_outcome.buyer_refund ? currentSourceRow.refund_outcome.buyer_refund.currency : null }}",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
            }}
            groupAggregationMode="sum"
            key="refund_outcome"
            label="Refunded to Buyer"
            placeholder="Enter value"
            position="center"
            referenceId="buyer_refund"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ item && item.buyer_refund ? item.buyer_refund.amount : null }}"
          />
          <Column
            id="4aedb"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="currency"
            formatOptions={{
              currency:
                "{{ currentSourceRow.refund_outcome && currentSourceRow.refund_outcome.total_seller_charge ? currentSourceRow.refund_outcome.total_seller_charge.currency : null }}",
              currencySign: "standard",
              notation: "standard",
              showSeparators: true,
              currencyDisplay: "symbol",
            }}
            groupAggregationMode="sum"
            key="refund_outcome"
            label="Billed to Seller"
            placeholder="Enter value"
            position="center"
            referenceId="seller_charge"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{item.total_seller_charge && item.total_seller_charge.amount != 0 ? item.total_seller_charge.amount : null }}"
          />
          <Column
            id="26070"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="source_type"
            label="Source"
            placeholder="Select option"
            position="center"
            size={84.453125}
            summaryAggregationMode="none"
          />
          <Column
            id="b386c"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="coverer_type"
            label="Covered by"
            placeholder="Select option"
            position="center"
            size={123.515625}
            summaryAggregationMode="none"
          />
          <Column
            id="5aae5"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="refund_type"
            label="Returned to"
            placeholder="Select option"
            position="center"
            size={106}
            summaryAggregationMode="none"
          />
          <Column
            id="27725"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="refund_reason_pretty"
            label="Refund reason"
            placeholder="Enter value"
            position="center"
            size={135.265625}
            summaryAggregationMode="none"
          />
          <Column
            id="e655c"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="with_commission"
            label="Commission rebate"
            placeholder="Select option"
            position="center"
            size={112.34375}
            summaryAggregationMode="none"
            valueOverride={'{{ item ? "Yes" : "No" }}'}
          />
          <Column
            id="60a2a"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="adjusted_tax_code"
            label="Adjusted tax code"
            placeholder="Enter value"
            position="center"
            size={131.046875}
            summaryAggregationMode="none"
          />
          <Column
            id="fd297"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={224.59375}
            summaryAggregationMode="none"
          />
          <Column
            id="35a18"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="failure_reason"
            label="Failure reason"
            placeholder="Enter value"
            position="center"
            size={508}
            summaryAggregationMode="none"
          />
          <Action
            id="fbe34"
            icon="bold/mail-send-email-attachment-document"
            label="Invoices"
          >
            <Event
              event="clickAction"
              method="openApp"
              params={{
                uuid: "a031b5e2-b44e-11f0-8f62-d763ab890108",
                options: {
                  queryParams: [
                    {
                      key: "orderId",
                      value: "{{ currentSourceRow.order_id }}",
                    },
                  ],
                  newTab: true,
                  hashParams: [
                    {
                      key: "orderRefundId",
                      value: "{{ currentSourceRow.id }}",
                    },
                  ],
                },
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              event="clickToolbar"
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
              pluginId="queryAllOrdeRefunds"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Body>
  <Event
    event="hide"
    method="trigger"
    params={{}}
    pluginId="resetRefundForms"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="run"
    params={{ map: { src: "tableOrders.clearSelection()" } }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ map: { value: "null" } }}
    pluginId="ordersInShipment"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ map: { value: "null" } }}
    pluginId="orderRefunds"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ map: { value: "null" } }}
    pluginId="orderShipmentId"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="trigger"
    params={{}}
    pluginId="calculateTotalReversibles"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
