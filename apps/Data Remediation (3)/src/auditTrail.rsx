<Screen
  id="auditTrail"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="ea5b1e35-7aac-4e0c-afa6-badfc67ac080"
>
  <JavascriptQuery
    id="auditBVDOrUCI"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/auditBVDOrUCI.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Include src="./header6.rsx" />
  <Frame
    id="$main16"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Table
      id="TableAuditInfo2"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ VarAuditTrailData.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      defaultSort={[{ object: { columnId: "7ad33", direction: "desc" } }]}
      dynamicColumnProperties={{ formatByIndex: "auto" }}
      dynamicRowHeights={true}
      emptyMessage="No rows found"
      enableSaveActions={true}
      overflowActionsOverlayMaxHeight=""
      overflowActionsOverlayMinWidth=""
      primaryKeyColumnId="a2968"
      rowHeight="small"
      rowSelection="none"
      showBorder={true}
      showHeader={true}
    >
      <Column
        id="a2968"
        alignment="left"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="id"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={91.40625}
        summaryAggregationMode="none"
      />
      <Column
        id="18b8b"
        alignment="left"
        cellTooltip="{{ item }}"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="false"
        key="entity_id"
        label="Entity ID"
        placeholder="Enter value"
        position="center"
        size={120.96875}
        summaryAggregationMode="none"
      />
      <Column
        id="8d154"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="UCI ID"
        placeholder="Enter value"
        position="center"
        referenceId="uciId"
        size={123}
        summaryAggregationMode="none"
        valueOverride="{{ VarAuditTrailData.value[i].uciIdData }}"
      />
      <Column
        id="cdd3e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="BVD ID"
        placeholder="Enter value"
        position="center"
        referenceId="bvd_id"
        size={155.515625}
        summaryAggregationMode="none"
      />
      <Column
        id="e2fe7"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="orbis_id"
        label="Orbis ID"
        placeholder="Enter value"
        position="center"
        referenceId="orbis_id"
        size={85.96875}
        summaryAggregationMode="none"
      />
      <Column
        id="d5dfe"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ticket_id"
        label="Ticket ID"
        placeholder="Enter value"
        position="center"
        size={107.03125}
        summaryAggregationMode="none"
      />
      <Column
        id="37b3f"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="Request Type"
        placeholder="Enter value"
        position="center"
        referenceId="request_type"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ VarAuditTrailData.value[i].request_type }}"
      />
      <Column
        id="38b40"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="doc_id"
        label="Doc ID"
        placeholder="Enter value"
        position="center"
        referenceId="Doc ID"
        size={142.34375}
        summaryAggregationMode="none"
      />
      <Column
        id="40f4c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="remediated_action"
        label="Remediated action"
        placeholder="Select option"
        position="center"
        size={153.046875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="c43b2"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="Category"
        placeholder="Enter value"
        position="center"
        referenceId="category_id"
        size={134.4375}
        summaryAggregationMode="none"
        valueOverride="{{ VarAuditTrailData.value[i].category }}"
      />
      <Column
        id="2c803"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        label="Field name"
        placeholder="Enter value"
        position="center"
        referenceId="field_name"
        size={175.671875}
        summaryAggregationMode="none"
        valueOverride="{{ VarAuditTrailData.value[i].field_value }}"
      />
      <Column
        id="186c9"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="new_value"
        label="New value"
        placeholder="Enter value"
        position="center"
        size={197.71875}
        summaryAggregationMode="none"
      />
      <Column
        id="97b46"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="prev_value"
        label="Prev value"
        placeholder="Enter value"
        position="center"
        referenceId="prev_value"
        size={219.125}
        summaryAggregationMode="none"
      />
      <Column
        id="428fa"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="user_id"
        label="User ID"
        placeholder="Enter value"
        position="center"
        size={335.65625}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="dd8f1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="object_type"
        label="Domain"
        placeholder="Enter value"
        position="center"
        size={94}
        summaryAggregationMode="none"
      />
      <Column
        id="18696"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="source"
        label="Source"
        placeholder="Enter value"
        position="center"
        size={80.46875}
        summaryAggregationMode="none"
      />
      <Column
        id="7ad33"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        formatOptions={{ dateFormat: "{{ mm/dd/yyyy }}" }}
        groupAggregationMode="none"
        key="create_timestamp"
        label="Create timestamp"
        placeholder="Enter value"
        position="center"
        size={145.859375}
        summaryAggregationMode="none"
      />
      <Column
        id="afcea"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="field_path"
        label="Field path"
        placeholder="Enter value"
        position="center"
        referenceId="fieldPath"
        size={315}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-arrows-turn-backward-alternate"
        label="Remove filter"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="clearFilterStack"
          params={{ ordered: [] }}
          pluginId="TableAuditInfo2"
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
          enabled="{{ VarAuditTrailData.value.length !== 0}}"
          event="clickToolbar"
          method="trigger"
          params={{
            ordered: [
              {
                options: {
                  object: {
                    onSuccess: null,
                    onFailure: null,
                    additionalScope: null,
                  },
                },
              },
            ],
          }}
          pluginId="readAuditTrail"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          enabled="{{ txtboxSearchAuditInfo2.value.length !== 0}}"
          event="clickToolbar"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="25acf"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          params={{
            ordered: [
              { fileType: "csv" },
              {
                data: "{{VarAuditTrailData.value.length !== 0  && VarAuditTrailData.value}}",
              },
              {
                fileName:
                  "{{'Audit trail ' + moment().format(\"DD-MM-YYYY_hh:mm:ss A\")}}",
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Frame>
</Screen>
