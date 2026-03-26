<Container
  id="InferenceTable2"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden={
    '{{!urlparams.hash.org_id ||  retoolContext.environment == "staging" }}'
  }
  padding="12px"
  showBody={true}
  showHeader={true}
  showInEditor={true}
>
  <Header>
    <Text
      id="collapsibleTitle2"
      _disclosedFields={{ array: [] }}
      value="#### Training runs"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle2"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ InferenceTable2.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="InferenceTable2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="dc1f9" viewKey="View 1">
    <TableLegacy
      id="training_table"
      _columns={[
        "pipelineName",
        "link",
        "org_id",
        "status",
        "startTime",
        "endTime",
        "run_by",
        "runId",
        "runConfig",
      ]}
      _columnSummaryTypes={{
        ordered: [
          { startTime: "" },
          { endTime: "" },
          { runConfig: "" },
          { runTime: "" },
        ],
      }}
      _columnSummaryValues={{
        ordered: [
          { startTime: "" },
          { endTime: "" },
          { runConfig: "" },
          { runTime: "" },
        ],
      }}
      _columnVisibility={{
        ordered: [
          { pipelineName: false },
          { runId: false },
          { runConfig: false },
          { endTime: false },
          { updateTime: false },
          { run_by: false },
        ],
      }}
      _compatibilityMode={false}
      columnAlignment={{
        ordered: [
          { startTime: "left" },
          { endTime: "left" },
          { link: "left" },
          { runConfig: "left" },
          { runTime: "left" },
        ],
      }}
      columnColors={{
        mode: "",
        runId: "",
        endTime: "",
        run_by: "",
        pipelineName: "",
        runConfig: "",
        startTime: "",
        status: "",
        org_id: "",
        updateTime: "",
        startTimee: "",
        runTime: "",
        tags: "",
        link: "",
      }}
      columnEditable={{ ordered: [{ link: false }, { endTime: false }] }}
      columnFormats={{
        ordered: [
          { startTime: "DateTimeDataCell" },
          { endTime: "DateTimeDataCell" },
          { link: "button" },
          { runConfig: "JsonDataCell" },
          { runTime: "TextDataCell" },
        ],
      }}
      columnHeaderNames={{
        ordered: [
          { runTime: "Run Duration" },
          { link: "Run Link" },
          { org_id: "Org ID" },
          { status: "Run Status" },
          { startTime: "Start Time" },
          { run_by: "Ran By" },
        ],
      }}
      columnMappers={{ ordered: [{ link: "View Run" }] }}
      columnTypeProperties={{
        ordered: [
          {
            startTime: {
              ordered: [
                { manageTimeZone: true },
                { dateFormat: "MMM dd, yy" },
                { valueTimeZone: "00:00" },
                { displayTimeZone: "local" },
                { timeFormat: "HH:mm:ss" },
              ],
            },
          },
          {
            endTime: {
              ordered: [
                { manageTimeZone: true },
                { dateFormat: "MMM dd, yy" },
                { valueTimeZone: "00:00" },
                { displayTimeZone: "local" },
                { timeFormat: "HH:mm:ss" },
              ],
            },
          },
          { runConfig: { ordered: [] } },
          { runTime: { ordered: [] } },
        ],
      }}
      columnTypeSpecificExtras={{
        ordered: [
          {
            link: {
              ordered: [
                { buttonType: "url" },
                { url: "{{currentRow.link}}" },
                { newWindow: true },
              ],
            },
          },
        ],
      }}
      columnWidths={[
        { object: { id: "runConfig", value: 693.3359375 } },
        { object: { id: "runId", value: 293.5234375 } },
        { object: { id: "endTime", value: 167.9609375 } },
        { object: { id: "org_id", value: 73.7265625 } },
        { object: { id: "link", value: 133.96875 } },
        { object: { id: "run_by", value: 181.9609375 } },
        { object: { id: "startTime", value: 161 } },
        { object: { id: "status", value: 97.5234375 } },
      ]}
      data="{{ dagster_get_training_jobs.data }}"
      defaultSortByColumn="startTime"
      defaultSortDescending={true}
      doubleClickToEdit={true}
      showBoxShadow={false}
    />
    <Text
      id="text4"
      _disclosedFields={{ array: [] }}
      value="**Selected Run:** [{{training_table.selectedRow.data.runId}}]({{training_table.selectedRow.data.link}})"
      verticalAlign="center"
    />
    <JSONEditor
      id="jsonEditor1"
      events={[]}
      maintainSpaceWhenHidden={false}
      showInEditor={false}
      value="{{training_table?.selectedRow?.data?.runConfig}}"
    />
    <Container
      id="container4"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle4"
          _disclosedFields={{ array: [] }}
          value="#### Run logs"
          verticalAlign="center"
        />
      </Header>
      <View id="d46c1" viewKey="View 1">
        <Text
          id="text9"
          _disclosedFields={{ array: [] }}
          heightType="fixed"
          value="{{training_logs.data}}"
          verticalAlign="center"
        />
      </View>
    </Container>
  </View>
</Container>
