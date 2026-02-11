<Container
  id="getRatesCRLInfoContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{!getRatesCRLResult.value}}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="getRatesCRLInfoContainerTitle"
      value="#### Rates Response"
      verticalAlign="center"
    />
  </Header>
  <View id="7cfa4" viewKey="View 1">
    <Button
      id="getRatesCRLLogsOpenHyperlink"
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
      id="getRatesCRLLogsCopyHyperlink"
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
      id="containerGetRatesCRLFailureMessages"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{!getRatesCRLErrorMsg.value}}"
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
          id="containerTitle23"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          style={{ ordered: [{ color: "primary" }] }}
          value="#### Failed to Generate Label"
          verticalAlign="center"
        />
      </Header>
      <View id="29207" viewKey="View 1">
        <Text
          id="containerGetRatesCRLFailureMessage"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="{{getRatesCRLErrorMsg.value}}"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Form
      id="create_return_label_form"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{!ratesFromQueryCRL.value}}"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      requireValidation={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle2"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="#### Select Return Shipment Rate"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="rates_crl"
          captionByIndex={
            '{{ `${item.provider.toLowerCase()} ${item.account_type && item.account_type !== "unknown" ? item.account_type : ""} account` }}\n'
          }
          data="{{ ratesFromQueryCRL.value }}"
          label="Shipment Rates:
Shipment Rates:"
          labels="{{item.courier}} -  {{item.rate_card_name || item.product || item.shipping_service_id}} - {{item.price}} - {{item.eta_in_days}} days"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        />
        <Select
          id="return_label_covers_cost_select"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabledByIndex=""
          fallbackTextByIndex=""
          hidden="{{!urlparams.refund_updates}}"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Covers Buyer Return"
          labels=""
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          tooltipByIndex=""
          values=""
        >
          <Option
            id="01828"
            disabled={false}
            hidden={false}
            label="Seller"
            value="seller"
          />
          <Option
            id="07b14"
            disabled={false}
            hidden={false}
            label="Whatnot"
            value="whatnot"
          />
        </Select>
        <Checkbox
          id="c_override_existing_shipment"
          hidden="true"
          label="Override existing shipments
"
          labelPosition="left"
          marginType="normal"
        />
      </Body>
      <Footer>
        <Button
          id="createReturnShippingLabelSubmit"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          submit={true}
          submitTargetId="create_return_label_form"
          text="Create Return Shipping Label"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createWithShippoRate"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
</Container>
