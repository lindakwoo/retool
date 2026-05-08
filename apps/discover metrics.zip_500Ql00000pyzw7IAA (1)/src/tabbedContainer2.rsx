<Container
  id="tabbedContainer2"
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
      id="tabs2"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer2"
      value="{{ self.values[0] }}"
    >
      <Option id="fb4d0" value="Tab 1" />
      <Option id="3744e" value="Tab 2" />
      <Option id="78f90" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="6ca83" viewKey="Training Runs">
    <Include src="./InferenceTable2.rsx" />
  </View>
  <View
    id="cb787"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Content Generation Runs"
  >
    <Include src="./ContentGenerationTable.rsx" />
  </View>
  <View id="1f57e" viewKey="Inference Runs">
    <Include src="./InferenceTable.rsx" />
  </View>
  <View
    id="8281b"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Sentiment Runs"
  >
    <Include src="./SentimentTable.rsx" />
  </View>
</Container>
