<Screen
  id="entityAssignment"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="15d94096-587b-4353-80b9-fb24e0d99dae"
>
  <RESTQuery
    id="ReadEntityAssignment"
    body="{{ entityAssignedParams.value }}"
    bodyType="raw"
    isHidden={false}
    isMultiplayerEdited={false}
    query="/entity-assignment"
    queryTimeout="30000"
    resourceName="0387da37-064c-410f-b369-1e8eaea25331"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "  let responseEntity = ReadEntityAssignment?.data;\n\nif(responseEntity.statusCode === 200){\n  entityAssignmentRecordResponse.setValue(responseEntity?.body.assignment_records);\n  entityAssignmentArchiveResponse.setValue(responseEntity?.body.assignment_archive_records);\n  \n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="entityAssignmentRecordResponse" value="[]" />
  <State id="entityAssignedParams" value="{}" />
  <JavascriptQuery
    id="EntityAssignedSearch"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/EntityAssignedSearch.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="failure"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "info" },
                { duration: "1" },
                { title: "Entity search is failed" },
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
  </JavascriptQuery>
  <State id="entityAssignmentArchiveResponse" value="[]" />
  <Include src="./header5.rsx" />
  <Include src="./assignedEntity.rsx" />
  <Frame
    id="$main15"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <Tabs
      id="entityAssignTabs"
      heightType="fixed"
      itemMode="static"
      style={{ ordered: [] }}
      value="{{ self.values[0] }}"
    >
      <Option
        id="565b8"
        icon="bold/interface-home-5"
        iconPosition="left"
        label="Current Assignment"
        value="current assignment"
      />
      <Option
        id="6228c"
        disabled={false}
        icon="bold/computer-database"
        iconPosition="left"
        label="Assignment History"
        value="assignment history"
      />
    </Tabs>
    <Tabs
      id="entityAssignSearchTab"
      heightType="fixed"
      itemMode="static"
      style={{ ordered: [] }}
      value="{{ self.values[0] }}"
    >
      <Option
        id="565b8"
        icon="bold/interface-id-face-scan-1"
        iconPosition="left"
        label="Orbis ID/BVD ID"
        value="Orbis or BVDID"
      />
      <Option
        id="b24a8"
        disabled={false}
        hidden={false}
        icon="bold/entertainment-ticket"
        iconPosition="left"
        label="Ticket Number"
        value="Ticket Number"
      />
      <Option
        id="c5655"
        disabled={false}
        hidden={false}
        icon="bold/mail-send-envelope"
        iconPosition="left"
        label="User Email"
        value="User Email"
      />
    </Tabs>
    <TextInput
      id="txtboxSearchEntityAssign"
      disabled=""
      label=""
      labelPosition="top"
      placeholder="{{ entityAssignSearchTab.value === 'Entity History' 
    ? 'Search by Orbis ID / BVD ID / Ticket Number / User Email' 
    : `Search by ${entityAssignSearchTab.value}` 
}}
"
      showClear={true}
    />
    <Button
      id="buttonEntitySearch"
      disabled={'{{  txtboxSearchEntityAssign.value === ""}}'}
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="EntityAssignedSearch"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="EntityAssignedDataTable"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ entityAssignmentRecordResponse.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      hidden="{{ entityAssignTabs.value === 'assignment history' }}"
      primaryKeyColumnId="2a156"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ cellText: "primary", headerBackground: "#060d61" }}
      toolbarPosition="bottom"
    >
      <Column
        id="2a156"
        alignment="right"
        format="decimal"
        formatOptions={{ notation: "standard" }}
        groupAggregationMode="countDistinct"
        hidden="true"
        key="id"
        label="ID"
        position="center"
        size={32}
        summaryAggregationMode="none"
      />
      <Column
        id="59811"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="user_id"
        label="User ID"
        placeholder="Select option"
        position="center"
        referenceId="user_id"
        size={250}
        summaryAggregationMode="none"
      />
      <Column
        id="8fb85"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="orbis_id"
        label="Orbis ID"
        placeholder="Enter value"
        position="center"
        size={128}
        summaryAggregationMode="none"
      />
      <Column
        id="fca7c"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="Bvd ID"
        placeholder="Enter value"
        position="center"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="6edb4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="product"
        label="Product"
        placeholder="Enter value"
        position="center"
        referenceId="product"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="2766e"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="email"
        label="Email"
        placeholder="Enter value"
        position="center"
        size={234}
        summaryAggregationMode="none"
      />
      <Column
        id="002b2"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ticket_id"
        label="Ticket ID"
        placeholder="Enter value"
        position="center"
        size={155}
        summaryAggregationMode="none"
      />
      <Column
        id="9d765"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="assignment"
        label="Assignment"
        placeholder="Select option"
        position="center"
        size={109}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="f7fd0"
        alignment="left"
        cellTooltipMode="overflow"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="manual_override_lock"
        label="Manual Override Lock"
        placeholder="Select option"
        position="center"
        size={228}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="d90d9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="create_timestamp"
        label="Create Timestamp"
        placeholder="Enter value"
        position="center"
        size={157}
        summaryAggregationMode="none"
      />
      <Action
        id="7e32e"
        hidden="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
        icon="bold/interface-unlock"
        label="Click to unlock the entity"
      >
        <Event
          event="clickAction"
          method="run"
          params={{
            ordered: [
              {
                src: 'loadingPopUp.setHidden(false);\n\nlet lockParams = {\n  bvd_id: entityAssignmentRecordResponse.value[0].bvd_id,\n  ticket_id: entityAssignmentRecordResponse.value[0].ticket_id,\n  user_id: entityAssignmentRecordResponse.value[0].user_id,\n  email: entityAssignmentRecordResponse.value[0].email,\n  request_type: "manual_override_unlock"\n};\n\nentityAssignedParams.setValue(lockParams);\n\nReadEntityAssignment.trigger({\n  onSuccess: function(response) {\n    loadingPopUp.setHidden(true);\n\n    if (response && response.statusCode === 200) {\n      utils.showNotification({\n        title: "Success",\n        description: "Entity unlocked successfully.",\n        notificationType: "success"\n      });\n    } else {\n      utils.showNotification({\n        title: "Failure",\n        description: "Entity unlock failed.",\n        notificationType: "error"\n      });\n    }\n  },\n  onFailure: function(error) {\n    loadingPopUp.setHidden(true);\n    utils.showNotification({\n      title: "Error",\n      description: "An error occurred while unlocking the entity.",\n      notificationType: "error"\n    });\n    console.error(error);\n  }\n});\n',
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
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
          pluginId="EntityAssignedDataTable"
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
          pluginId="EntityAssignedDataTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Table
      id="EntityAssignedHistoryTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ entityAssignmentArchiveResponse.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      hidden="{{ entityAssignTabs.value !== 'assignment history' }}"
      primaryKeyColumnId="2a156"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ cellText: "primary", headerBackground: "#060d61" }}
      toolbarPosition="bottom"
    >
      <Column
        id="2a156"
        alignment="right"
        editable={false}
        format="decimal"
        formatOptions={{ notation: "standard" }}
        groupAggregationMode="countDistinct"
        hidden="true"
        key="id"
        label="ID"
        position="center"
        size={27.796875}
        summaryAggregationMode="none"
      />
      <Column
        id="59811"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="user_id"
        label="User ID"
        placeholder="Select option"
        position="center"
        referenceId="user_id"
        size={254.65625}
        summaryAggregationMode="none"
      />
      <Column
        id="6edb4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="product"
        label="Product"
        placeholder="Enter value"
        position="center"
        referenceId="product"
        size={102}
        summaryAggregationMode="none"
      />
      <Column
        id="002b2"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ticket_id"
        label="Ticket ID"
        placeholder="Enter value"
        position="center"
        size={85.34375}
        summaryAggregationMode="none"
      />
      <Column
        id="8fb85"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="orbis_id"
        label="Orbis ID"
        placeholder="Enter value"
        position="center"
        size={78.71875}
        summaryAggregationMode="none"
      />
      <Column
        id="fca7c"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="Bvd ID"
        placeholder="Enter value"
        position="center"
        size={106.53125}
        summaryAggregationMode="none"
      />
      <Column
        id="2766e"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="email"
        label="Email"
        placeholder="Enter value"
        position="center"
        size={209.9375}
        summaryAggregationMode="none"
      />
      <Column
        id="9d765"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="assignment"
        label="Assignment"
        placeholder="Select option"
        position="center"
        size={89.640625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="644c2"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="manual_override_lock"
        label="Manual Override Lock"
        placeholder="Select option"
        position="center"
        referenceId="manual_override_lock"
        size={159}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="ab0d4"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="manual_override_unlock"
        label="Manual Override Unlock"
        placeholder="Select option"
        position="center"
        size={173}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="622f2"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="multi_id"
        label="Multi ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d90d9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="create_timestamp"
        label="Create TimeStamp"
        placeholder="Enter value"
        position="center"
        size={139.25}
        summaryAggregationMode="none"
      />
      <Column
        id="433b3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="end_timestamp"
        label="End TimeStamp"
        placeholder="Enter value"
        position="center"
        size={138}
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
          pluginId="EntityAssignedHistoryTable"
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
          pluginId="EntityAssignedHistoryTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Frame>
</Screen>
