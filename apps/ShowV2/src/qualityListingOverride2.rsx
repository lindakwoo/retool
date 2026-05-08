<Modal
  id="qualityListingOverride2"
  buttonText="Remove Override"
  closeOnOutsideClick={true}
  disabled={
    ' {{\n   (!current_user.groups.some(i =>\n     i.name === "admin" || \n     i.name === "CX Managers" ||\n     i.name === "Trust and Safety" ||\n     i.name ==="Formats"))\n     && urlparams.href.startsWith("https://admin2.whatnot.com") || !queryListingSnapshot.data.listing_snapshot[0].listing.listing_properties.is_quality_overridden \n }}'
  }
  events={[]}
  hidden=""
  modalHeight="200px"
  modalOverflowType="hidden"
  modalWidth="35%"
  style={{ ordered: [{ "accent-background": "primary" }] }}
  tooltipText={
    '{{"Remove the override and re-evaluate the quality listing check. "}}'
  }
>
  <Text
    id="text128"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="### Remove Override"
    verticalAlign="center"
  />
  <Text
    id="text129"
    value="###### Note: this will re-evaluate the quality according to our algorithm"
    verticalAlign="center"
  />
  <ButtonGroup2 id="buttonGroup2" alignment="left" overflowPosition={2}>
    <ButtonGroup2-Button id="6b07f" styleVariant="outline" text="Cancel">
      <Event
        event="click"
        method="close"
        params={{ ordered: [] }}
        pluginId="qualityListingOverride2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ButtonGroup2-Button>
    <ButtonGroup2-Button
      id="05d42"
      styleVariant="danger"
      text="Remove Override"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="evaluateQualityListing"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="close"
        params={{ ordered: [] }}
        pluginId="qualityListingOverride2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryListingSnapshot"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </ButtonGroup2-Button>
  </ButtonGroup2>
</Modal>
