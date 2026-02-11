<Container
  id="container8"
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
      id="containerTitle20"
      marginType="normal"
      value="### Tracking Updates from Shippo"
      verticalAlign="center"
    />
    <Button
      id="button11"
      loading="{{ queryShipmentTrackingUpdatesSnowflake.isFetching }}"
      marginType="normal"
      text="Get Tracking Updates"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryShipmentTrackingUpdatesSnowflake"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonShippoTrackingUpdates"
      loading="false"
      marginType="normal"
      text="Open Shippo Tracking Updates"
    >
      <Event
        event="click"
        method="openApp"
        params={{
          ordered: [
            { uuid: "8da284ac-b8e0-11ef-ab75-effee8a8382e" },
            {
              options: {
                ordered: [
                  { queryParams: [] },
                  {
                    hashParams: [
                      {
                        ordered: [{ key: "id" }, { value: "{{urlparams.id}}" }],
                      },
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
    </Button>
  </Header>
  <View id="6001a" viewKey="View 1">
    <Text
      id="text72"
      marginType="normal"
      value="#### Updates"
      verticalAlign="center"
    />
    <Table
      id="table5"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ queryShipmentTrackingUpdatesSnowflake.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      enableSaveActions={true}
      heightType="auto"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="b0a58"
        alignment="left"
        format="datetime"
        formatOptions={{
          manageTimeZone: false,
          valueTimeZone: "00:00",
          displayTimeZone: "local",
        }}
        groupAggregationMode="none"
        key="SCAN_TIMESTAMP"
        label="Scan timestamp (UTC)"
        placeholder="Enter value"
        position="center"
        referenceId="scan_timestamp"
        size={174}
        summaryAggregationMode="none"
      />
      <Column
        id="faa26"
        alignment="left"
        caption="Timestamp event "
        format="datetime"
        groupAggregationMode="none"
        key="TS"
        label="Event ingested (UTC)"
        placeholder="Enter value"
        position="center"
        size={152.921875}
        summaryAggregationMode="none"
      />
      <Column
        id="864f4"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="LOADED_AT"
        label="Loaded at"
        placeholder="Enter value"
        position="center"
        size={152.921875}
        summaryAggregationMode="none"
      />
      <Column
        id="3a003"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="SHIPMENT_ID"
        label="Shipment id"
        placeholder="Enter value"
        position="center"
        size={85.203125}
        summaryAggregationMode="none"
      />
      <Column
        id="c1a21"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="STATUS"
        label="Status"
        placeholder="Select option"
        position="center"
        size={109.5}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="a1eb8"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="STATUS_DETAILS"
        label="Status details"
        placeholder="Enter value"
        position="center"
        size={420.109375}
        summaryAggregationMode="none"
      />
      <Column
        id="7aaa9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="SUBSTATUS_TEXT"
        label="Substatus text"
        placeholder="Enter value"
        position="center"
        size={465.46875}
        summaryAggregationMode="none"
      />
      <Column
        id="897ea"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="ORIGINAL_ETA"
        label="Original eta"
        placeholder="Enter value"
        position="center"
        size={82.703125}
        summaryAggregationMode="none"
      />
      <Column
        id="067bb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="UPDATED_ETA"
        label="Updated eta"
        placeholder="Enter value"
        position="center"
        size={87.484375}
        summaryAggregationMode="none"
      />
      <Column
        id="ea1bf"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="SELLER_ADDRESS_ID"
        label="Seller address id"
        placeholder="Enter value"
        position="center"
        size={112.46875}
        summaryAggregationMode="none"
      />
      <Column
        id="4681b"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="BUYER_ADDRESS_ID"
        label="Buyer address id"
        placeholder="Enter value"
        position="center"
        size={113.1875}
        summaryAggregationMode="none"
      />
      <Column
        id="b6d5e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="NON_PII_LOCATION_CITY"
        label="Non pii location city"
        placeholder="Enter value"
        position="center"
        size={199.921875}
        summaryAggregationMode="none"
      />
      <Column
        id="236fd"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="NON_PII_LOCATION_STATE"
        label="Non pii location state"
        placeholder="Select option"
        position="center"
        size={138.390625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="bb2c3"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="NON_PII_LOCATION_COUNTRY"
        label="Non pii location country"
        placeholder="Select option"
        position="center"
        size={154.015625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="fa32d"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="NON_PII_LOCATION_POSTAL_CODE"
        label="Non pii location postal code"
        placeholder="Enter value"
        position="center"
        size={176.578125}
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
          pluginId="table5"
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
          pluginId="table5"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
