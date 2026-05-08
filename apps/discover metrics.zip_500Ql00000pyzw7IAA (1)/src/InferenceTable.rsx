<Container
  id="InferenceTable"
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
      id="collapsibleTitle1"
      _disclosedFields={{ array: [] }}
      value="#### Inference runs"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle1"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ InferenceTable.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="InferenceTable"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="dc1f9" viewKey="View 1">
    <TableLegacy
      id="inference_table"
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
          { runConfig: false },
          { runId: false },
          { updateTime: false },
          { endTime: false },
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
        ordered: [
          { mode: "" },
          { runId: "" },
          { endTime: "" },
          { run_by: "" },
          { pipelineName: "" },
          { runConfig: "" },
          { startTime: "" },
          { status: "" },
          { org_id: "" },
          { updateTime: "" },
          { startTimee: "" },
          { runTime: "" },
          { tags: "" },
          { link: "" },
        ],
      }}
      columnEditable={{ ordered: [{ link: false }] }}
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
          { status: "Run Status" },
          { runTime: "Run Duration" },
          { link: "Run Link" },
          { org_id: "Org ID" },
          { startTime: "Start Time" },
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
        { object: { id: "endTime", value: 242.9609375 } },
        { object: { id: "run_by", value: 169.9609375 } },
        { object: { id: "link", value: 133.96875 } },
        { object: { id: "org_id", value: 78.7265625 } },
        { object: { id: "startTime", value: 151 } },
        { object: { id: "status", value: 96.5234375 } },
      ]}
      data="{{ dagster_get_inference_jobs.data }}"
      defaultSortByColumn="startTime"
      defaultSortDescending={true}
      doubleClickToEdit={true}
      showBoxShadow={false}
    />
    <Text
      id="text5"
      _disclosedFields={{ array: [] }}
      value="**Selected Run:** [{{inference_table.selectedRow.data.runId}}]({{inference_table.selectedRow.data.link}})"
      verticalAlign="center"
    />
    <JSONEditor
      id="inferenceRunInsight"
      value="{{inference_table?.selectedRow?.data?.runConfig}}"
    />
    <Container
      id="container3"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle3"
          _disclosedFields={{ array: [] }}
          value="#### Run logs"
          verticalAlign="center"
        />
      </Header>
      <View id="d46c1" viewKey="View 1">
        <Text
          id="text8"
          _disclosedFields={{ array: [] }}
          heightType="fixed"
          value="{{inference_logs.data}}"
          verticalAlign="center"
        />
      </View>
    </Container>
  </View>
</Container>
