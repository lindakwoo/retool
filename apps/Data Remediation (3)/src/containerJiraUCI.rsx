<Container
  id="containerJiraUCI"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ jiraUCIClick.value === false }}"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle259"
      value="### Update JIRA Status"
      verticalAlign="center"
    />
    <Button
      id="jiraUCIClose2"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="jiraModelUCI"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            { src: "jiraUCIClick.setValue(false)\nJiraFlow.setValue(false);" },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="a36c3" viewKey="View 1">
    <TextInput
      id="TicketTxtUCI2"
      disabled="true"
      label="Ticket"
      labelPosition="top"
      labelWidth="16"
      required={true}
      style={{
        ordered: [
          {
            border:
              "{{ (urlparams.ticket && (urlparams.ticket !== 'undefined' || urlparams.ticket.length !== 0)) ? '#E0E0E0': 'red' }}",
          },
        ],
      }}
      value="{{urlparams.ticket}}"
    />
    <TextInput
      id="userJiraUCI2"
      disabled="true"
      label="User"
      labelPosition="top"
      labelWidth="16"
      value="{{ current_user.email }}"
    />
    <TextInput
      id="jiraUCINumber2"
      disabled="true"
      label="UCI"
      labelPosition="top"
      labelWidth="16"
      value="{{urlparams.uci}}"
    />
    <Text
      id="text534"
      style={{ ordered: [{ color: "#898db4" }] }}
      value="**{{'Data Remediation Actions'}}**"
      verticalAlign="center"
    />
    <Table
      id="tblJira4"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ auditJsonForJiraValue.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="fa2aa"
      rowHeight="small"
      rowSelection="none"
      showBorder={true}
      showHeader={true}
      style={{ headerText: "#898db4", cellText: "#898db4" }}
      toolbarPosition="bottom"
    >
      <Column
        id="a4686"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="entity_id"
        label="Entity ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d31d1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="Bvd ID"
        placeholder="Enter value"
        position="center"
        size={108}
        summaryAggregationMode="none"
      />
      <Column
        id="14657"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="orbis_id"
        label="Orbis ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="77d68"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="remediated_action"
        label="Remediated action"
        placeholder="Enter value"
        position="center"
        size={141}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="bb91b"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="field_value"
        label="Field name"
        placeholder="Enter value"
        position="center"
        size={142}
        summaryAggregationMode="none"
      />
      <Column
        id="9bfad"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="prev_value"
        label="Prev value"
        placeholder="Enter value"
        position="center"
        size={204}
        summaryAggregationMode="none"
      />
      <Column
        id="40777"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="new_value"
        label="New value"
        placeholder="Enter value"
        position="center"
        size={196}
        summaryAggregationMode="none"
      />
      <Column
        id="3e307"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        key="user_id"
        label="User ID"
        placeholder="Enter value"
        position="center"
        size={98}
        summaryAggregationMode="none"
        valueOverride="{{ item.replace(/-/g, '.').replace('.moodys.com', '@moodys.com') }}"
      />
      <Column
        id="e5569"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="object_type"
        label="Domain"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="0477d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="create_timestamp"
        label="Create timestamp"
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
          pluginId="tblJira4"
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
          pluginId="tblJira4"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Select
      id="DDUCIJiraStatus2"
      emptyMessage="No options"
      itemMode="static"
      label="Status"
      labelPosition="top"
      labelWidth="16"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value={'"Remediation - Completed"'}
    >
      <Option
        id="f023e"
        label="Remediation - Completed"
        value="Remediation - Completed"
      />
      <Option
        id="de1de"
        label="Remediation - Technical Failure"
        value="Remediation - Technical Failure"
      />
      <Option
        id="38ae7"
        label="Remediation - Valid information not available"
        value="Remediation - Valid information not available"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ DDUCIJiraStatus2.value }}" }] }}
        pluginId="jiraUCISelectValue"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <TextArea
      id="txtboxCommentUCI2"
      autoResize={true}
      label="Comment"
      labelPosition="top"
      labelWidth="16"
      maxLength="500"
      maxLines="4"
      minLines="4"
      placeholder="Enter Comment"
    />
  </View>
  <Footer>
    <Button
      id="jirUCIBtnCancel2"
      style={{ ordered: [{ background: "rgb(233, 233, 233)" }] }}
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="jiraModelUCI"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            { src: "jiraUCIClick.setValue(false);\nJiraFlow.setValue(false);" },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="jiraUCIBtnSubmit2"
      disabled="{{ ('ticket' in urlparams) && urlparams.ticket.length !== 0 ? false : true}}"
      text="Submit"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled=""
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="jiraModelParams"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            { src: "txtboxCommUCI.setValue(txtboxCommentUCI2.value);" },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
