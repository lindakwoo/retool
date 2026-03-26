<DrawerFrame
  id="ticketsegmentationdrawer"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="false"
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Text
      id="drawerTitle1"
      value="### Content Generation Segmentation"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton1"
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
        pluginId="ticketsegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="notiontext"
      horizontalAlign="center"
      style={{
        ordered: [
          { fontSize: "h5Font" },
          { fontWeight: "h5Font" },
          { fontFamily: "h5Font" },
          { background: "rgba(59, 245, 105, 0.64)" },
        ],
      }}
      value="**[View the guide in Notion](https://www.notion.so/forethought/How-to-enable-discover-multi-segmentation-for-content-articles-policies-1ceb31e65a0b80008d2dfae39804ba47?pvs=4#1cfb31e65a0b80429b89e0bbc8847438)**"
      verticalAlign="center"
    />
    <Tabs id="tabs3" itemMode="static" value="{{ self.values[0] }}">
      <Option
        id="00030"
        tooltip="Create segmentations for tickets"
        value="Ticket Segmentations"
      />
      <Option
        id="00031"
        tooltip="Map article segmentations to ticket segmentations"
        value="Article Segmentations"
      />
      <Event
        enabled="{{ self.value == self.values[1] }}"
        event="change"
        method="hide"
        params={{}}
        pluginId="ticketsegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ self.value == self.values[1] }}"
        event="change"
        method="show"
        params={{}}
        pluginId="articlesegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ self.value == self.values[1] }}"
        event="change"
        method="setValue"
        params={{ map: { value: "{{ tabs4.values[1] }}" } }}
        pluginId="tabs4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ self.value == self.values[1] }}"
        event="change"
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
        pluginId="get_article_sources"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Tabs>
  </Header>
  <Body>
    <Text
      id="text19"
      value="**1. Select the fields you wish to segment on.** If a field isn't available here but is present in api_data_json or custom_indexing_field_json then you can add it in manually."
      verticalAlign="center"
    />
    <MultiselectListbox
      id="key_selector_input"
      data="{{ get_ticket_api_keys.data }}"
      emptyMessage="No options"
      fallbackTextByIndex=""
      label=""
      labelPosition="top"
      labels="{{ i }}: {{ _.startCase(item) }}"
      showSelectionIndicator={true}
      value="{{ [] }}"
      values="{{ item }}"
    />
    <Button id="confirm_keys_button" text="Confirm Selected Fields">
      <Event
        event="click"
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
        pluginId="iterative_bucketer"
        type="datasource"
        waitMs="1500"
        waitType="throttle"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="renaming_table_data"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "" }] }}
        pluginId="segmentations_editor"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="step2"
      value="**2. Rename any fields to what you want the user to see**"
      verticalAlign="center"
    />
    <Table
      id="renaming_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ renamed_table_data.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="fe0af"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="fe0af"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="old"
        label="Internal Name
"
        placeholder="Enter value"
        position="center"
        size={95.1875}
        summaryAggregationMode="none"
      />
      <Column
        id="c2b8f"
        alignment="left"
        editable="true"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="new"
        label="User-facing Name"
        placeholder="Enter value"
        position="center"
        size={119.0625}
        summaryAggregationMode="none"
      >
        <Event
          event="changeCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="save_renaming_table"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
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
          pluginId="renaming_table"
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
          pluginId="renaming_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="save"
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
        pluginId="save_renaming_table"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="changeCell"
        method="run"
        params={{
          map: {
            src: "const updatedData = renamed_table_data.value.map(row => { if (row.old === renamed_table_data.selectedRow.old) { return { ...row, ...renaming_table.recordUpdates[0] }; } return row; }); renamed_table_data.setValue(updatedData);",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Text
      id="step3"
      value="**3. Rename any values to what you want the user to see and select values you want to include**"
      verticalAlign="center"
    />
    <Table
      id="value_selector"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ value_buckets.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="ee6e5"
      rowHeight="small"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="3bd87"
        alignment="left"
        editable={true}
        format="boolean"
        groupAggregationMode="none"
        key="shouldConfig"
        label="Include?"
        placeholder="Enter value"
        position="center"
        referenceId="shouldConfig"
        size={68}
        summaryAggregationMode="none"
      />
      <Column
        id="6ba79"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="fieldName"
        label="Field"
        placeholder="Select option"
        position="center"
        size={96.15625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="ee6e5"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="fieldValue"
        label="Internal Value"
        placeholder="Enter value"
        position="center"
        size={197.3125}
        summaryAggregationMode="none"
      />
      <Column
        id="bb9cc"
        alignment="left"
        editable="true"
        format="string"
        groupAggregationMode="none"
        key="renamedValue"
        label="User-facing Value"
        placeholder="Enter value"
        position="center"
        size={149}
        summaryAggregationMode="none"
      />
      <Column
        id="5cb8d"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="count"
        label="Ticket 
Count"
        placeholder="Enter value"
        position="center"
        size={88.484375}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <Event
        event="save"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="save_values_table"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Button
      id="generate_segment_button"
      text="Generate Segmentation Configuration"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="generate_segmentation_configuration"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="step4"
      value="**4. Make any manual additions/removals/edits before saving it. The configuration format is delicate, so please be careful.**"
      verticalAlign="center"
    />
    <JSONEditor
      id="segmentations_editor"
      events={[
        {
          event: "change",
          type: "state",
          method: "setValue",
          pluginId: "has_incomplete_segmentations",
          targetId: null,
          params: { map: { value: "false" } },
          waitType: "debounce",
          waitMs: "0.5",
        },
      ]}
      value="{{ generate_segmentation_configuration.data }}"
    />
    <Text
      id="custom_indexing_field_alert_text"
      hidden="{{ !has_custom_indexing_field.value }}"
      style={{
        color: "danger",
        fontSize: "labelEmphasizedFont",
        fontWeight: "labelEmphasizedFont",
        fontFamily: "labelEmphasizedFont",
      }}
      value="Segmentation has a field that requires custom_indexing_field_json, make sure the desired field is added to custom_indexing_fields via es_indexing_settings before saving."
      verticalAlign="center"
    />
    <Text
      id="incomplete_segmentation_alert_text"
      hidden="{{ !has_incomplete_segmentations.value }}"
      style={{
        color: "danger",
        fontSize: "labelEmphasizedFont",
        fontWeight: "labelEmphasizedFont",
        fontFamily: "labelEmphasizedFont",
      }}
      value="Segmentation may have incomplete examples, complete any examples before saving."
      verticalAlign="center"
    />
    <Text
      id="step5"
      value="**5. Pressing save will overwrite any existing config. This is saved in `discover_config.content_generation.ticket_segmentations`.**"
      verticalAlign="center"
    />
    <Button
      id="save_segmentations_button"
      disabled=""
      text="Save Ticket Segmentations to Discover Config"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="update_discover_config_enabled_status"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</DrawerFrame>
