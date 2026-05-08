<Screen
  id="seller_cancellation_fee"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="b752edad-4ea2-4be8-ae37-d13194b67dfc"
>
  <SqlQueryUnified
    id="querySellerCancellationFee"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/querySellerCancellationFee.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <OpenAPIQuery
    id="reverseCancellationFee"
    isMultiplayerEdited={false}
    method="post"
    notificationDuration={4.5}
    operationId="reverse_seller_cancellation_fee_admin_api_ledger__order_id__reverse_cancellation_fee_post"
    parameterDynamicStates={'{"order_id":false,"x-admin2-email":false}'}
    parameterMetadata=""
    parameters={
      '{"order_id":"{{ url.searchParams.id }}","x-admin2-email":"{{ current_user.email }}"}'
    }
    path="/admin/api/ledger/{order_id}/reverse_cancellation_fee"
    requestBodyMetadata=""
    resourceName="a1e74f74-65e1-4be7-a029-c8416432bf5a"
    showFailureToaster={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{}}
      pluginId="querySellerCancellationFee"
      type="datasource"
      waitMs=""
      waitType="debounce"
    />
    <Event
      event="success"
      method="showNotification"
      params={{
        map: {
          options: {
            notificationType: "success",
            title: "Reverse Seller Cancellation",
            description: "{{ reverseCancellationFee.data.message }}",
            duration: "",
          },
        },
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{}}
      pluginId="cancellationFeeModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="trigger"
      params={{}}
      pluginId="querySellerCancellationFee"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="showNotification"
      params={{
        map: {
          options: {
            notificationType: "error",
            title: "Reverse Seller Cancellation",
            description: "{{ reverseCancellationFee.data.data.detail }}",
          },
        },
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </OpenAPIQuery>
  <Include src="./cancellationFeeModal.rsx" />
  <Include src="./modalFrame1.rsx" />
  <Frame
    id="$main12"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="cancelFeeContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle30"
          value="#### Seller Cancellation Fee"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Button
          id="reverseCancellationFeeButton"
          style={{ map: { background: "danger" } }}
          submitTargetId=""
          text="Reverse Cancellation Fee"
        >
          <Event
            event="click"
            method="show"
            params={{}}
            pluginId="cancellationFeeModal"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Table
          id="cancelFeeTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ querySellerCancellationFee.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="7540a"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="b12e8"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={146}
            summaryAggregationMode="none"
          />
          <Column
            id="5134c"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: false, notation: "standard" }}
            groupAggregationMode="sum"
            key="user_id"
            label="User ID"
            placeholder="Enter value"
            position="center"
            size={76}
            summaryAggregationMode="none"
          />
          <Column
            id="ffb36"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="listing_id"
            label="Listing ID"
            placeholder="Enter value"
            position="center"
            size={81}
            summaryAggregationMode="none"
          />
          <Column
            id="c7e1d"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: false, notation: "standard" }}
            groupAggregationMode="sum"
            key="external_entity_id"
            label="Order ID"
            placeholder="Enter value"
            position="center"
            size={70}
            summaryAggregationMode="none"
          />
          <Column
            id="4c174"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="order_item_id"
            label="Order item ID"
            placeholder="Enter value"
            position="center"
            size={98}
            summaryAggregationMode="none"
          />
          <Column
            id="e8627"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="transaction_type"
            label="Transaction type"
            placeholder="Select option"
            position="center"
            size={118}
            summaryAggregationMode="none"
          />
          <Column
            id="3bc13"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="sub_transaction_type"
            label="Sub transaction type"
            placeholder="Select option"
            position="center"
            size={308}
            summaryAggregationMode="none"
          />
          <Column
            id="d062b"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="amount_cents"
            label="Amount cents"
            placeholder="Enter value"
            position="center"
            size={118}
            summaryAggregationMode="none"
          />
          <Column
            id="a8911"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="amount_currency"
            label="Amount currency"
            placeholder="Select option"
            position="center"
            size={62}
            summaryAggregationMode="none"
          />
          <Column
            id="65f69"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="message"
            label="Message"
            placeholder="Enter value"
            position="center"
            size={181}
            summaryAggregationMode="none"
          />
          <Column
            id="efde9"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="status"
            label="Status"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="5314a"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="external_entity_type"
            label="External entity type"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="7540a"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: false, notation: "standard" }}
            groupAggregationMode="sum"
            key="id"
            label="Transaction ID"
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
              pluginId="cancelFeeTable"
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
              pluginId="cancelFeeTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>
