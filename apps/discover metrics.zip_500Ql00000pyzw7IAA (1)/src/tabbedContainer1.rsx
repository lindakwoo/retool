<Container
  id="tabbedContainer1"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ !org_id_as_int.value }}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs1"
      disabled="false"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="f3ac5" value="Tab 1" />
      <Option id="10293" value="Tab 2" />
      <Option id="c5236" value="Tab 3" />
    </Tabs>
  </Header>
  <View
    id="ed23e"
    icon="bold/entertainment-camera-video"
    iconPosition="left"
    viewKey="Start A Training Job"
  >
    <Form
      id="trainingform"
      disableSubmit="{{dagster_run_training.isFetching}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading="{{dagster_run_training.isFetching}}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle1"
          _disclosedFields={{ array: [] }}
          value="#### Training Job Options"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="orginput"
          _disclosedFields={{ array: [] }}
          disabled="{{urlparams.hash.org_id}}"
          label="Org ID"
          pattern="\d{1-5}"
          patternType="regex"
          placeholder="Enter value"
          required={true}
          style={{ ordered: [{ adornmentBackground: "rgb(255, 255, 255)" }] }}
          value="{{urlparams.hash.org_id}}"
        />
        <Checkbox
          id="trainonly"
          _disclosedFields={{ array: [] }}
          label="Train only?"
          labelCaption="Check this if you only want to see the coverage rate and the quality of topics without activating the new taxonomy for the customer. Checking this WILL NOT override the active taxonomy ID."
          labelPosition="left"
          labelWidth={100}
          labelWrap={true}
          style={{
            ordered: [
              { checkedBackground: "warning" },
              { staticText: "rgba(0, 0, 0, 1)" },
            ],
          }}
        />
        <TextInput
          id="enddateinput"
          _disclosedFields={{ array: [] }}
          label="End date"
          pattern="\d{4}-\d{2}-\d{2}"
          patternType="regex"
          placeholder="A date in the form of YYYY-MM-DD"
          required={true}
          value="{{
dateQueries.data.endDate
}}"
        />
        <TextInput
          id="startdateinput"
          _disclosedFields={{ array: [] }}
          label="Start date"
          pattern="\d{4}-\d{2}-\d{2}"
          patternType="regex"
          placeholder="A date in the form of YYYY-MM-DD"
          required={true}
          value="{{
dateQueries.data.startDate
}}"
        />
        <NumberInput
          id="samplesizeinput"
          _disclosedFields={{ array: [] }}
          currency="USD"
          inputValue={0}
          label="Sample Size"
          max="160000"
          min="2500"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          tooltipText="Be careful, V2 is expensive and you may want to make this much lower."
          value="80000"
        />
        <SegmentedControl
          id="versioninput"
          itemMode="static"
          label="Discover Version"
          tooltipText={
            'Internally, this will pass the `taxonomy_version` to the job as either:\n"2509_trpl_openai_v3" for V3\n"23_trpl_ftopenai_v2" for V2'
          }
          value="{{ self.values[1] }}"
        >
          <Option id="c2286" disabled="false" value="V3" />
          <Option id="31011" value="V2" />
        </SegmentedControl>
        <Multiselect
          id="data_source"
          emptyMessage="No options"
          itemMode="static"
          label="Data sources"
          labelCaption="These are what we will train on"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          tooltipText="Only select Solve Conversations if they actually have Solve, and only select voice if they have voice transcript data"
          value="['tickets']"
          wrapTags={true}
        >
          <Option id="d5556" label="Tickets (Default)" value="tickets" />
          <Option id="64796" label="Solve Conversations" value="chats" />
          <Option id="ada53" label="Voice" value="voice" />
        </Multiselect>
      </Body>
      <Footer>
        <Button
          id="submittraining"
          _disclosedFields={{ array: [] }}
          iconBefore="bold/shopping-business-startup"
          style={{ ordered: [] }}
          submit={true}
          submitTargetId="trainingform"
          text="Submit Run"
        />
        <Text
          id="text14"
          hidden="{{getTicketCount.data?.has_data !== true}}"
          style={{ ordered: [{ background: "rgba(240, 26, 26, 0.73)" }] }}
          value="**There is no data for the selected dates. Training is unlikely to succeed with these conditions. Please see below for more details**"
          verticalAlign="center"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="dagster_run_training"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Container
      id="container5"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{!dagster_run_training.queryRunTime || dagster_run_training.isFetching}}"
      padding="12px"
      showBody={true}
      showFooter={true}
      showHeader={true}
      showInEditor={true}
      styleContext={{ ordered: [{ primary: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle6"
          _disclosedFields={{ array: [] }}
          value="#### Training Job Run Request Results"
          verticalAlign="center"
        />
      </Header>
      <View id="0aea9" viewKey="View 1">
        <JSONExplorer
          id="jsonExplorer3"
          value="{{dagster_run_training?.data?.launchRun || {}}}"
        />
      </View>
      <Footer>
        <Button
          id="trainingrunlinkbutton"
          _disclosedFields={{ array: [] }}
          disabled=""
          hidden="{{!dagster_run_training?.data?.launchRun?.run?.runId}}"
          showInEditor={true}
          style={{ ordered: [{ background: "primary" }] }}
          text="View Run"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                {
                  url: "{{`https://dagster-${retoolContext.environment === 'staging' ?'stage':'prod'}.forethought.tech/runs/${dagster_run_training?.data?.launchRun?.run?.runId}`}}",
                },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Footer>
    </Container>
    <Container
      id="collapsibleContainer1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle6"
          _disclosedFields={{ array: [] }}
          value="#### Tickets that Discover will have access to and how many will be filtered out"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle6"
          _disclosedFields={{ array: [] }}
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ collapsibleContainer1.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="collapsibleContainer1"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="e1d55" viewKey="View 1">
        <Text
          id="text16"
          _disclosedFields={{ array: [] }}
          value={
            "**Total tickets in this period:** {{ getTicketCount.data?.total_ticket_count.toLocaleString() || 0 }}\n**# of tickets + Solve conversations:** {{ getTicketCount.data?.solve_convs_tickets.toLocaleString() || 0 }}\n**# of tickets filtered out from JSON Schema:** {{ getTicketCount.data?.tickets_filtered_out.toLocaleString() || 0 }}\n**# of \"No content\" tickets:** {{ getTicketCount.data?.no_content_tickets.toLocaleString() || 0 }}\n**Has enough data to train Discover with:** {{ getTicketCount.data?.has_data ? 'Yes' : 'No' }}"
          }
          verticalAlign="center"
        />
        <Container
          id="collapsibleContainer4"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="collapsibleTitle5"
              _disclosedFields={{ array: [] }}
              value="#### View document count query"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle5"
              _disclosedFields={{ array: [] }}
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ collapsibleContainer4.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="collapsibleContainer4"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="65aa1" viewKey="View 1">
            <Text
              id="text15"
              _disclosedFields={{ array: [] }}
              value="{{ getTicketCount.data?.sql_query }}"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
  </View>
  <View
    id="5645b"
    disabled={false}
    hidden={false}
    icon="bold/interface-time-midnight"
    iconPosition="left"
    viewKey="Generate KA/Policies"
  >
    <Form
      id="genform"
      disableSubmit="{{dagster_run_training.isFetching}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading="{{dagster_run_training.isFetching}}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle3"
          _disclosedFields={{ array: [] }}
          value="#### Content Gen Job Options"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="orginput_gen"
          _disclosedFields={{ array: [] }}
          disabled="{{urlparams.hash.org_id}}"
          label="Org ID"
          pattern="\d{1-5}"
          patternType="regex"
          required={true}
          style={{ ordered: [{ adornmentBackground: "rgb(255, 255, 255)" }] }}
          value="{{urlparams.hash.org_id}}"
        />
        <TextInput
          id="taxonomyinput_gen"
          _disclosedFields={{ array: [] }}
          disabled="{{transform_active_taxonomy_id.value}}"
          label="Active Taxonomy ID"
          pattern="\d{1-5}"
          patternType="regex"
          required={true}
          style={{ ordered: [{ adornmentBackground: "rgb(255, 255, 255)" }] }}
          value="{{transform_active_taxonomy_id.value}}"
        />
      </Body>
      <Footer>
        <Button
          id="submitgen"
          _disclosedFields={{ array: [] }}
          iconBefore="bold/shopping-business-startup"
          submit={true}
          submitTargetId="genform"
          text="Submit Run"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="dagster_run_gen"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Container
      id="container7"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{!dagster_run_gen.queryRunTime || dagster_run_gen.isFetching}}"
      padding="12px"
      showBody={true}
      showFooter={true}
      showHeader={true}
      showInEditor={true}
      styleContext={{ ordered: [{ primary: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle8"
          _disclosedFields={{ array: [] }}
          value="#### Content Gen Run Request Results"
          verticalAlign="center"
        />
      </Header>
      <View id="0aea9" viewKey="View 1">
        <JSONExplorer
          id="jsonExplorer4"
          value="{{dagster_run_gen?.data?.launchRun || {}}}"
        />
      </View>
      <Footer>
        <Button
          id="genrunlinkbutton"
          _disclosedFields={{ array: [] }}
          disabled=""
          hidden="{{!dagster_run_gen?.data?.launchRun?.run?.runId}}"
          showInEditor={true}
          style={{ ordered: [{ background: "primary" }] }}
          text="View Run"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                {
                  url: "{{`https://dagster-prod.forethought.tech/runs/${dagster_run_gen?.data?.launchRun?.run?.runId}`}}",
                },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Footer>
    </Container>
    <Button
      id="openSegmentationWindowButton"
      style={{ ordered: [] }}
      text="Change Content Generation Segmentation"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="ticketsegmentationdrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_ticket_api_keys"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
  <View
    id="0be6e"
    disabled={false}
    hidden={false}
    icon="bold/interface-align-front"
    iconPosition="left"
    viewKey="Start An Inference Job"
  >
    <Form
      id="inferenceform"
      disableSubmit="{{dagster_run_inference.isFetching || !transform_active_taxonomy_id.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading="{{dagster_run_inference.isFetching}}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle4"
          _disclosedFields={{ array: [] }}
          value="#### Inference Job Options"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Text
          id="text11"
          _disclosedFields={{ array: [] }}
          hidden="{{transform_active_taxonomy_id.value}}"
          style={{ ordered: [{ background: "warning" }] }}
          value="⚠️ **There needs to be an active taxonomy id to run inference!**"
          verticalAlign="center"
        />
        <TextInput
          id="orginput_inference"
          _disclosedFields={{ array: [] }}
          disabled="{{urlparams.hash.org_id}}"
          label="Org ID"
          pattern="\d{1-5}"
          patternType="regex"
          placeholder="Enter value"
          required={true}
          style={{ ordered: [{ adornmentBackground: "rgb(255, 255, 255)" }] }}
          value="{{urlparams.hash.org_id}}"
        />
        <TextInput
          id="enddateinput_inference"
          _disclosedFields={{ array: [] }}
          label="End date"
          pattern="\d{4}-\d{2}-\d{2}"
          patternType="regex"
          placeholder="A date in the form of YYYY-MM-DD"
          required={true}
          value="{{
dateQueries.data.endDate
}}"
        />
        <TextInput
          id="startdateinputinference"
          _disclosedFields={{ array: [] }}
          label="Start date"
          pattern="\d{4}-\d{2}-\d{2}"
          patternType="regex"
          placeholder="A date in the form of YYYY-MM-DD"
          required={true}
          value="{{
dateQueries.data.startDate
}}"
        />
        <NumberInput
          id="docsizeinput_inference"
          _disclosedFields={{ array: [] }}
          currency="USD"
          inputValue={0}
          label="Doc Count"
          max="160000"
          min="2500"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          tooltipText="Be careful, V2 is expensive and you may want to make this much lower."
          value="80000"
        />
      </Body>
      <Footer>
        <Button
          id="submitinference"
          _disclosedFields={{ array: [] }}
          iconBefore="bold/shopping-business-startup"
          submit={true}
          submitTargetId="inferenceform"
          text="Submit Run"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="dagster_run_inference"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Container
      id="container8"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{!dagster_run_inference.queryRunTime || dagster_run_inference.isFetching}}"
      padding="12px"
      showBody={true}
      showFooter={true}
      showHeader={true}
      showInEditor={true}
      styleContext={{ ordered: [{ primary: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle9"
          _disclosedFields={{ array: [] }}
          value="#### Inference Job Run Request Results"
          verticalAlign="center"
        />
      </Header>
      <View id="0aea9" viewKey="View 1">
        <JSONExplorer
          id="jsonExplorer5"
          value="{{dagster_run_inference?.data?.launchRun || {}}}"
        />
      </View>
      <Footer>
        <Button
          id="inferencerunlinkbutton"
          _disclosedFields={{ array: [] }}
          disabled=""
          hidden="{{!dagster_run_inference.data?.launchRun?.run?.runId}}"
          showInEditor={true}
          style={{ ordered: [{ background: "primary" }] }}
          text="View Run"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                {
                  url: "{{`https://dagster-prod.forethought.tech/runs/${dagster_run_inference?.data?.launchRun?.run?.runId}`}}",
                },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Footer>
    </Container>
  </View>
  <View
    id="4e2f2"
    disabled={false}
    hidden={false}
    icon="bold/interface-alert-information-circle"
    iconPosition="left"
    viewKey="Start A Sentiment Job
"
  >
    <Form
      id="sentimentform"
      disableSubmit="{{dagster_run_sentiment.isFetching || !transform_active_taxonomy_id.value}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading="{{dagster_run_sentiment.isFetching}}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="sentimentJobFormTitle"
          _disclosedFields={{ array: [] }}
          value="#### Sentiment Job Options"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Text
          id="text17"
          _disclosedFields={{ array: [] }}
          hidden="{{transform_active_taxonomy_id.value}}"
          style={{ ordered: [{ background: "warning" }] }}
          value="⚠️ **There needs to be an active taxonomy id to run inference!**"
          verticalAlign="center"
        />
        <TextInput
          id="orginput_sentiment"
          _disclosedFields={{ array: [] }}
          disabled="{{urlparams.hash.org_id}}"
          label="Org ID"
          pattern="\d{1-5}"
          patternType="regex"
          placeholder="Enter value"
          required={true}
          style={{ ordered: [{ adornmentBackground: "rgb(255, 255, 255)" }] }}
          value="{{urlparams.hash.org_id}}"
        />
        <TextInput
          id="startdateinputsentiment"
          _disclosedFields={{ array: [] }}
          label="Backfill start date"
          pattern="\d{4}-\d{2}-\d{2}"
          patternType="regex"
          placeholder="A date in the form of YYYY-MM-DD"
          required={true}
          value="{{
dateQueries.data.threeMonthsBackFormattedDate
}}"
        />
      </Body>
      <Footer>
        <Button
          id="submitsentiment"
          _disclosedFields={{ array: [] }}
          iconBefore="bold/shopping-business-startup"
          submit={true}
          submitTargetId="sentimentform"
          text="Submit Run"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="dagster_run_sentiment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Text
      id="sentimentJobRunRequestResultsTitle"
      _disclosedFields={{ array: [] }}
      value="#### Sentiment Job Run Request Results"
      verticalAlign="center"
    />
    <JSONExplorer
      id="sentimentRunResultsOutput"
      value="{{dagster_run_sentiment?.data?.launchRun || {}}}"
    />
    <Button
      id="sentimentrunlinkbutton"
      _disclosedFields={{ array: [] }}
      disabled=""
      hidden="{{!dagster_run_sentiment.data?.launchRun?.run?.runId}}"
      showInEditor={true}
      style={{ ordered: [{ background: "highlight" }] }}
      text="View Run"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "{{`https://dagster-prod.forethought.tech/runs/${dagster_run_sentiment?.data?.launchRun?.run?.runId}`}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
