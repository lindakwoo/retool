<Container
  id="NewJiraFirmo"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle408"
      value="### Update JIRA Status"
      verticalAlign="center"
    />
    <ButtonGroup2 id="buttonGroup15" overflowPosition={2}>
      <ButtonGroup2-Button
        id="575dd"
        icon="bold/interface-arrows-left-alternate"
        iconPosition="left"
        styleVariant="solid"
        text="Back"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "\nJiraFlow.setValue(false);\njiraClick.setValue(false);",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="openPage"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { passDataWith: "urlParams" },
                    {
                      queryParams: [
                        {
                          ordered: [
                            { key: "orbisId" },
                            {
                              value:
                                "{{ TableRecordsMastering.value[0]?.header?.entityID }}",
                            },
                          ],
                        },
                        {
                          ordered: [
                            { key: "bvdId" },
                            {
                              value:
                                "{{ TableRecordsMastering.value[0]?.header?.bvdID }}\n",
                            },
                          ],
                        },
                        {
                          ordered: [
                            { key: "ticket" },
                            {
                              value:
                                "{{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
                            },
                          ],
                        },
                      ],
                    },
                  ],
                },
              },
              { pageName: "entityDetails" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="f19c6"
        hidden="true"
        styleVariant="danger"
        text="Home"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "JiraFlow.setValue(false);\njiraClick.setValue(false);\nutils.openPage('home', {newTab: false});",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </Header>
  <View id="63390" viewKey="View 1">
    <TextInput
      id="textInputJiraTicketFirmo2"
      disabled="true"
      hideLabel={false}
      label="Ticket"
      labelPosition="top"
      labelWidth="12"
      required={true}
      showClear={true}
      style={{
        ordered: [
          {
            border:
              "{{JiraTicketNumber.value.length === 0 ? 'red': '#E0E0E0'}}",
          },
        ],
      }}
      value="{{ JiraTicketNumber.value ? JiraTicketNumber.value : '' }}"
    />
    <TextInput
      id="textInputJiraUserFirmo2"
      disabled="true"
      label="User"
      labelPosition="top"
      labelWidth="12"
      value="{{ current_user.email }}"
    />
    <TextInput
      id="textInputJiraBVDID2"
      disabled="true"
      label="BVD ID"
      labelPosition="top"
      labelWidth="12"
      value="{{ url?.searchParams?.bvdId ? url?.searchParams?.bvdId : '' }}"
    />
    <TextInput
      id="textInputJiraOrbisId2"
      disabled="True"
      label="Orbis ID"
      labelPosition="top"
      labelWidth="12"
      value="{{ url?.searchParams?.orbisId ? url?.searchParams?.orbisId : '' }}"
    />
    <Text
      id="txtAuditInfo2"
      heightType="fixed"
      style={{ ordered: [{ color: "#898db4" }] }}
      value="**{{'Data Remediation Actions'}}**"
      verticalAlign="center"
    />
    <Table
      id="tblJira5"
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
      style={{ cellText: "#898db4", headerText: "#898db4" }}
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
        size={100}
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
        size={139}
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
        size={100}
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
        size={100}
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
        size={100}
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
        size={100}
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
        label="Create timestamp(UTC)"
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
          pluginId="tblJira5"
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
          pluginId="tblJira5"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Select
      id="DDJiraStatusFirmo2"
      emptyMessage="No options"
      itemMode="static"
      label="Status
"
      labelPosition="top"
      labelWidth="12"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      style={{ ordered: [] }}
      value={'"Remediation - Completed"'}
    >
      <Option
        id="6f9b4"
        label="Remediation - Completed"
        value="Remediation - Completed"
      />
      <Option
        id="4a3c4"
        label="Remediation - Technical Failure"
        value="Remediation - Technical Failure"
      />
      <Option
        id="fa4a9"
        label="Remediation - Valid information not available"
        value="Remediation - Valid information not available"
      />
      <Option
        id="5eabc"
        disabled={false}
        hidden={false}
        value="Remediation - Request Not Valid"
      />
      <Event
        event="change"
        method="setValue"
        params={{
          ordered: [{ value: "{{ DDJiraStatusFirmo2.selectedItem.value }}" }],
        }}
        pluginId="GDDJiraStausFirmo2"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <TextArea
      id="txtboxCommentFirmo2"
      autoResize={true}
      label="Comment"
      labelPosition="top"
      labelWidth="12"
      maxLines="4"
      minLines="4"
      placeholder="Enter value"
      style={{ ordered: [{ border: "#e0e0e0" }] }}
    >
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ txtboxCommentFirmo2.value }}" }] }}
        pluginId="GtxtboxCommentFirmo2"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextArea>
  </View>
  <Footer>
    <Button
      id="buttonJiraCancelFirmo2"
      style={{ ordered: [{ background: "rgba(233, 233, 233, 1)" }] }}
      text="Cancel"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "JiraFlow.setValue(false);\njiraClick.setValue(false);\njiraComingFrom.setValue('');\n",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{ jiraComingFrom.value === "entityDetails"}}'}
        event="click"
        method="openPage"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { passDataWith: "urlParams" },
                  {
                    queryParams: [
                      {
                        ordered: [
                          { key: "orbisId" },
                          {
                            value:
                              "{{ TableRecordsMastering.value[0]?.header?.entityID }}",
                          },
                        ],
                      },
                      {
                        ordered: [
                          { key: "bvdId" },
                          {
                            value:
                              "{{ TableRecordsMastering.value[0]?.header?.bvdID }}\n",
                          },
                        ],
                      },
                      {
                        ordered: [
                          { key: "ticket" },
                          {
                            value:
                              "{{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
                          },
                        ],
                      },
                    ],
                  },
                ],
              },
            },
            { pageName: "entityDetails" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonJiraSubmitFirmo2"
      disabled="{{ (url.searchParams.ticket) && url?.searchParams?.ticket !== 0 ? false : true}}"
      text="Submit"
    >
      <Event
        enabled="{{DDJiraStatusFirmo2.value.length !== 0}}"
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
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
