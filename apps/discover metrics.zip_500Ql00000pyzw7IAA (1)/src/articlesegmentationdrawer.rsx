<DrawerFrame
  id="articlesegmentationdrawer"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Text
      id="drawerTitle2"
      value="### Content Generation Segmentation"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton2"
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
        pluginId="articlesegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="notiontext2"
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
    <Tabs id="tabs4" itemMode="static" value="{{ self.values[1] }}">
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
        enabled="{{ self.value == self.values[0] }}"
        event="change"
        method="hide"
        params={{}}
        pluginId="articlesegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ self.value == self.values[0] }}"
        event="change"
        method="show"
        params={{}}
        pluginId="ticketsegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ self.value == self.values[0] }}"
        event="change"
        method="setValue"
        params={{ map: { value: "{{ tabs3.values[0] }}" } }}
        pluginId="tabs3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Tabs>
  </Header>
  <Body>
    <Text
      id="text18"
      value="**1. Select the fields you to map to ticket segments**
Only api_data_json keys are shown, custom_indexing_field_json keys are also possible but need to be added manually"
      verticalAlign="center"
    />
    <Table
      id="table3"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ article_segment_map_table_data.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No ticket segmentations found, save your ticket work first"
      enableSaveActions={true}
      primaryKeyColumnId="c982c"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="fc54c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="integration"
        label="Integration"
        placeholder="Select option"
        position="center"
        size={89.75}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="7ae32"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ticket segment"
        label="Ticket segment"
        placeholder="Select option"
        position="center"
        size={229.625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="f2b60"
        alignment="left"
        editable="true"
        format="string"
        groupAggregationMode="none"
        key="api_data_json field name"
        label="Article api_data_json field name"
        placeholder="Enter value"
        position="center"
        size={201.09375}
        summaryAggregationMode="none"
      />
      <Column
        id="c982c"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="idx"
        label="Idx"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Event
        event="save"
        method="run"
        params={{
          map: {
            src: "const originalData = table3.data; \nconst changes = table3.changesetArray;\nconst mergedData = originalData.map(row => {\n  const change = changes.find(c => c.idx === row.idx);\n  return change ? { ...row, ...change } : row;\n});\narticle_segment_map_table_data.setValue(mergedData);",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Button
      id="generate_segment_button2"
      text="Generate Article Segmentation Configuration"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="generate_article_segmentation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="step8"
      value="**2. Make any manual additions/removals/edits before saving it. The configuration format is delicate, so please be careful.**"
      verticalAlign="center"
    />
    <JSONEditor
      id="segmentations_editor2"
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
      value="{{ generate_article_segmentation.data }}"
    />
    <Text
      id="step9"
      value="**5. Pressing save will overwrite any existing config. This is saved in `discover_config.content_generation.article_segmentations`.**"
      verticalAlign="center"
    />
    <Button
      id="save_segmentations_button2"
      disabled=""
      text="Save Article Segmentations to Discover Config"
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
