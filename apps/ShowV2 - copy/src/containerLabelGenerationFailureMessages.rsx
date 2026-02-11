<Container
  id="containerLabelGenerationFailureMessages"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden="{{!labelGenerationErrors.value && !generateLabelLogsURL.value }}"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  style={{
    ordered: [
      { border: "danger" },
      { headerBackground: "rgb(234, 182, 178)" },
      { background: "rgb(251, 245, 244)" },
    ],
  }}
>
  <Header>
    <Text
      id="containerTitle3"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      style={{ ordered: [{ color: "primary" }] }}
      value="#### Failed to Generate Label"
      verticalAlign="center"
    />
  </Header>
  <View id="29207" viewKey="View 1">
    <Text
      id="containerLabelGenerationFailureMessagesTitle"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Failed to generate label"
      verticalAlign="center"
    />
    <Text
      id="text120"
      disableMarkdown={true}
      value="{{JSON.stringify(labelGenerationErrors.value)}}"
      verticalAlign="center"
    />
    <Button
      id="generateLabelLogsHyperlinkOpen"
      iconBefore="bold/interface-link-square-alternate"
      text="Open logs"
    >
      <Event
        event="click"
        method="openUrl"
        params={{ ordered: [{ url: "{{generateLabelLogsURL.value}}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="generateLabelLogsHyperlinkCopy"
      iconBefore="bold/interface-edit-copy"
      text="Copy link to logs"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ ordered: [{ value: "{{generateLabelLogsURL.value}}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="labelGenerationFailureMessage"
      _disclosedFields={{ array: [] }}
      hidden="{{!labelGenerationErrors.value}}"
      marginType="normal"
      value="{{labelGenerationErrors.value}}"
      verticalAlign="center"
    />
  </View>
</Container>
