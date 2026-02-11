<Container
  id="container10"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle24"
      value="#### Quality Listing Actions"
      verticalAlign="center"
    />
  </Header>
  <View id="ef2c2" viewKey="View 1">
    <Text
      id="text125"
      value={
        '###### Has Quality Listing: {{ orderTransformer_ListingPage.value.has_quality_listing ? "Yes" : "No" }}'
      }
      verticalAlign="center"
    />
    <Container
      id="container11"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle28"
          value="###### override section"
          verticalAlign="center"
        />
      </Header>
      <View id="e9af3" viewKey="View 1">
        <Modal
          id="qualityListingOverride"
          buttonText="Override Quality Listing Check"
          closeOnOutsideClick={true}
          disabled={
            ' {{\n   (!current_user.groups.some(i =>\n     i.name === "admin" || \n     i.name === "CX Managers" ||\n     i.name === "Trust and Safety" ||\n     i.name ==="Formats"))\n     && urlparams.href.startsWith("https://admin2.whatnot.com") || queryListingSnapshot.data.listing_snapshot[0].listing.listing_properties.is_quality_overridden \n }}'
          }
          events={[]}
          hidden=""
          modalHeight="500px"
          modalOverflowType="hidden"
          modalWidth="35%"
          style={{ ordered: [{ "accent-background": "danger" }] }}
          tooltipText={'{{"Override the quality listing check. "}}'}
        >
          <Text
            id="text127"
            _disclosedFields={{ array: [] }}
            marginType="normal"
            value="### Override Quality Listing Indicator"
            verticalAlign="center"
          />
          <Form
            id="form1"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="12px"
            requireValidation={true}
            resetAfterSubmit={true}
            showBody={true}
            showFooter={true}
            showHeader={true}
          >
            <Header>
              <Text
                id="formTitle11"
                value="#### Low Quality Reasons"
                verticalAlign="center"
              />
            </Header>
            <Body>
              <MultiselectListbox
                id="multiselectListbox1"
                disabled="{{!orderTransformer_ListingPage.value.has_quality_listing}}"
                emptyMessage="No options"
                itemMode="static"
                label="Only fill out if overriding to False"
                labelPosition="top"
                showSelectionIndicator={true}
                value=""
              >
                <Option
                  id="95519"
                  label="Insufficient Title"
                  value="insufficient_title"
                />
                <Option
                  id="b283a"
                  label="Missing Image"
                  value="missing_image"
                />
                <Option
                  id="fd40a"
                  label="Missing Condition"
                  value="missing_attribute"
                />
              </MultiselectListbox>
            </Body>
            <Footer>
              <ButtonGroup2
                id="buttonGroup1"
                alignment="left"
                overflowPosition={2}
              >
                <ButtonGroup2-Button
                  id="6b07f"
                  styleVariant="outline"
                  text="Cancel"
                >
                  <Event
                    event="click"
                    method="close"
                    params={{ ordered: [] }}
                    pluginId="qualityListingOverride"
                    type="widget"
                    waitMs="0"
                    waitType="debounce"
                  />
                </ButtonGroup2-Button>
                <ButtonGroup2-Button
                  id="05d42"
                  disabled="{{orderTransformer_ListingPage.value.has_quality_listing && multiselectListbox1.selectedItems.length == 0}}"
                  styleVariant="danger"
                  text={
                    'Override to {{ !orderTransformer_ListingPage.value.has_quality_listing ? "True" : "False" }}'
                  }
                >
                  <Event
                    event="click"
                    method="trigger"
                    params={{ ordered: [] }}
                    pluginId="updateQualityListing"
                    type="datasource"
                    waitMs="0"
                    waitType="debounce"
                  />
                  <Event
                    event="click"
                    method="trigger"
                    params={{
                      ordered: [
                        {
                          options: {
                            map: {
                              additionalScope: { map: { shouldShowPii: "" } },
                            },
                          },
                        },
                      ],
                    }}
                    pluginId="queryRecord"
                    type="datasource"
                    waitMs="0"
                    waitType="debounce"
                  />
                  <Event
                    event="click"
                    method="close"
                    params={{ ordered: [] }}
                    pluginId="qualityListingOverride"
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
            </Footer>
          </Form>
        </Modal>
        <Include src="./qualityListingOverride2.rsx" />
      </View>
    </Container>
    <KeyValue
      id="keyValue5"
      data="{{queryListingSnapshot.data.listing_snapshot[0].listing.listing_properties}}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      itemLabelPosition="top"
      labelWrap={true}
    >
      <Property
        id="inventory"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="true"
        label="Inventory"
      />
      <Property
        id="is_high_quality"
        editable="false"
        editableOptions={{}}
        format="boolean"
        formatOptions={{}}
        hidden="true"
        label="Is high quality"
      />
      <Property
        id="comments_enabled"
        editable="false"
        editableOptions={{}}
        format="boolean"
        formatOptions={{}}
        hidden="true"
        label="Comments enabled"
      />
    </KeyValue>
    <Include src="./evaluateQualityListingButton.rsx" />
  </View>
</Container>
