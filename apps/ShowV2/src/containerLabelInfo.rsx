<Container
  id="containerLabelInfo"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden=""
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle4"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="5ffc9" viewKey="View 1">
    <Container
      id="container5"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      style={{ ordered: [{ border: "canvas" }] }}
    >
      <Header>
        <Text
          id="containerTitle15"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="d94d3" viewKey="View 1">
        <Image
          id="courierImage"
          _disclosedFields={{ array: [] }}
          horizontalAlign="center"
          marginType="normal"
          src="{{queryShipment.data.courier_logo_url}}"
        />
        <Text
          id="textTrackingCode2"
          _defaultValue=""
          _disclosedFields={{ array: [] }}
          heightType="fixed"
          marginType="normal"
          value={
            '**Shipping Service**: {{queryShipment.data.shipping_service_id}}\n**Shipping Courier**: {{queryShipment.data.courier}}\n**Is reliably tracked?**: {{ queryShipmentScanTraits.data.IS_RELIABLY_TRACKED ? "Yes" : "No" }}'
          }
          verticalAlign="center"
        />
      </View>
    </Container>
    <Text
      id="text31"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="Zone: {{queryShipment.data.zone_str}}"
      verticalAlign="center"
    />
    <Text
      id="text42"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!queryShipment.data.courier_parcel_template_id}}"
      marginType="normal"
      value="Flat-Rate Box Template: {{queryShipment.data.courier_parcel_template_id}}"
      verticalAlign="center"
    />
    <Text
      id="textTrackingCode3"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      hidden="{{ !!!queryShipment.data.tracking_code }}"
      marginType="normal"
      value="**Tracking Code:** <br /> {{ queryShipment.data.tracking_code}}"
      verticalAlign="center"
    />
    <Button
      id="copyTrackingCode"
      _disclosedFields={{ array: [] }}
      heightType="auto"
      hidden="{{!!!queryShipment.data.tracking_code}}"
      marginType="normal"
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{queryShipment.data.tracking_code}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonOpenTrackingCode"
      _disclosedFields={{ array: [] }}
      disabled="{{!!!queryShipment.data.tracking_code}}"
      hidden="{{!!!queryShipment.data.tracking_code}}"
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      text="Open Tracking Link"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            { options: { ordered: [{ newTab: true }] } },
            { url: "{{queryShipment.data.tracking_url}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonOrderItemPrintLabel"
      _disclosedFields={{ array: [] }}
      disabled="{{queryShipment.data.bundled_file_url === null && queryShipment.data.file_url === null}}"
      hidden={null}
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      submitTargetId=""
      text="Print Label"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [{ url: "{{queryShipment.data.bundled_file_url}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="commercial_invoice_url_button"
      _disclosedFields={{ array: [] }}
      disabled="{{!queryShipment.data.commercial_invoice_url}}"
      marginType="normal"
      text="Open Shippo Commercial Invoice"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [{ url: "{{queryShipment.data.commercial_invoice_url}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button10"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Generate Commercial Invoice"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryCommercialInvoice"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
