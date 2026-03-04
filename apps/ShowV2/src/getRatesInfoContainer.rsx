<Container
  id="getRatesInfoContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{!getRatesResult.value}}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="getRatesInfoContainerTitle"
      value="#### Rates Response"
      verticalAlign="center"
    />
  </Header>
  <View id="7cfa4" viewKey="View 1">
    <Button
      id="getRatesLogsHyperlink"
      iconBefore="bold/interface-link-square-alternate"
      text="Open logs"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            { url: "{{getShippingRatesLogsURL_ShipmentDataPage.value}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="getRatesLogsHyperlinkCopy"
      iconBefore="bold/interface-edit-copy"
      text="Copy link to logs"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            { value: "{{getShippingRatesLogsURL_ShipmentDataPage.value}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="containerGetRatesFailureMessages"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{!getRatesErrorMsg.value}}"
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
          id="containerTitle22"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          style={{ ordered: [{ color: "primary" }] }}
          value="#### Failed to Generate Label"
          verticalAlign="center"
        />
      </Header>
      <View id="29207" viewKey="View 1">
        <Text
          id="containerGetRatesFailureMessagesTitle"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="#### Failed to get shipping rates"
          verticalAlign="center"
        />
        <Text
          id="text121"
          disableMarkdown={true}
          value="{{JSON.stringify(getRatesErrorMsg.value?.data?.data)}}"
          verticalAlign="center"
        />
        <Text
          id="text119"
          value="We failed to get rates for this shipment. Please copy the link to logs above and escalate to the Logistics team"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Form
      id="generate_new_label_form"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{!ratesFromQuery.value}}"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Body>
        <Select
          id="rates"
          captionByIndex={
            '{{ `${item.provider.toLowerCase()} ${item.account_type && item.account_type !== "unknown" ? item.account_type : ""} account` }}\n'
          }
          data="{{ ratesFromQuery.value }}"
          disabled=""
          hidden=""
          hideLabel={false}
          label="New Rates:"
          labels="{{item.courier}} -  {{item.rate_card_name || item.product || item.shipping_service_id}} - {{item.price}} - {{item.eta_in_days}} days"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          values="{{ i }}"
        />
        <Alert
          id="warningMediaMail"
          buttonText="USPS Address Lookup"
          description="Since only USPS Media Mail is getting returned, it's likely the buyer or seller address is invalid. Double check both addresses with USPS's address validator."
          events={[
            {
              ordered: [
                { event: "click" },
                { type: "util" },
                { method: "openUrl" },
                { pluginId: "" },
                { targetId: null },
                {
                  params: {
                    ordered: [
                      {
                        url: "https://tools.usps.com/zip-code-lookup.htm?byaddress",
                      },
                    ],
                  },
                },
                { waitType: "debounce" },
                { waitMs: "0" },
              ],
            },
          ]}
          hidden={
            '{{!(ratesFromQuery.value.length == 1 && ratesFromQuery.value[0].product == "Media Mail")}}'
          }
          title="Potential Invalid Address"
          type="warning"
        />
      </Body>
      <Footer>
        <Button
          id="generate_new_label_submit"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          submit={true}
          submitTargetId="generate_new_label_form"
          text="Generate New Label"
        />
      </Footer>
      <Event
        enabled="{{ ratesFromQuery.value[rates.value].id.includes('Direct Courier Integration') }}"
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="voidAndCreateWithDirectCourierRate"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !ratesFromQuery.value[rates.value].id 
 .includes('Direct Courier Integration') }}"
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="voidAndCreateWithShippoRate"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
</Container>
