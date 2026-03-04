<Modal
  id="evaluateQualityListingButton"
  buttonText="Evaluate the listing quality"
  closeOnOutsideClick={true}
  disabled={
    ' {{\n   (!current_user.groups.some(i =>\n     i.name === "admin" || \n     i.name === "CX Managers" ||\n     i.name === "Trust and Safety" ||\n     i.name ==="Formats"))\n     && urlparams.href.startsWith("https://admin2.whatnot.com") || queryListingSnapshot.data.listing_snapshot[0].listing.listing_properties.is_quality_overridden \n }}'
  }
  events={[
    {
      event: "open",
      type: "datasource",
      method: "trigger",
      pluginId: "queryDefaultBuyerAddress_ListingPage",
      targetId: null,
      params: {},
      waitType: "debounce",
      waitMs: "0",
    },
  ]}
  hidden=""
  modalHeight="200px"
  modalOverflowType="hidden"
  modalWidth="35%"
  style={{ ordered: [{ "accent-background": "primary" }] }}
  tooltipText={'{{"reruns the quality listing check automatically"}}'}
>
  <Text
    id="text130"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="### Re-evaluate the quality listing check"
    verticalAlign="center"
  />
  <Text
    id="text131"
    value="###### Note: this will re-evaluate the quality listing check according to our algorithm and remove any overrides"
    verticalAlign="center"
  />
  <ButtonGroup2 id="buttonGroup3" alignment="left" overflowPosition={2}>
    <ButtonGroup2-Button id="6b07f" styleVariant="outline" text="Cancel">
      <Event
        event="click"
        method="close"
        params={{ ordered: [] }}
        pluginId="evaluateQualityListingButton"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ButtonGroup2-Button>
    <ButtonGroup2-Button id="05d42" styleVariant="solid" text="Evaluate">
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
        pluginId="evaluateQualityListingButton"
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
