<Container
  id="containerBuyerShipping"
  disabled=""
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden="{{!!!queryShipment.data.shippo_data}}"
  hoistFetching={true}
  maintainSpaceWhenHidden={null}
  marginType="normal"
  overflowType="hidden"
  padding="12px"
  paddingType="normal"
  selectedView="View 1"
  showBody={true}
  showHeader={true}
  showInEditor={true}
  style={{ ordered: [{ headerBackground: "#ededed" }] }}
  styleContext={{ ordered: [] }}
>
  <Header>
    <Text
      id="buyerAddress"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value={
        '{{queryRecord.data.gifting_preferences?.custom_address_id || queryRecord.data.gifting_preferences?.recipient_user_id ? "GIFT RECIPIENT ADD.." : "BUYER ADDRESS"}}'
      }
      verticalAlign="center"
    />
    <Button
      id="openShowUserAppForBuyerButton"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="User "
    >
      <Event
        event="click"
        method="openApp"
        params={{
          ordered: [
            { uuid: "745ca30c-cae5-11f0-9e21-2b0d951bd721" },
            {
              options: {
                ordered: [
                  {
                    queryParams: [
                      {
                        ordered: [
                          { key: "id" },
                          { value: "{{queryRecord.data.user.id}}" },
                        ],
                      },
                    ],
                  },
                  { newTab: true },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="revealBuyerAddressButton"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !queryShipment.data || queryShipment.data.shippo_data.to_address.email.indexOf("@") !== -1}}'
      }
      marginType="normal"
      text="Reveal PII"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "await queryShipment.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="copyBuyerAddress"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                '{{JSON.stringify(queryShipment.data.shippo_data.to_address, null, "\\t")}}',
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="" viewKey="View 1" />
  <Body>
    <KeyValueMap
      id="keyvaluemapBuyerShipping"
      data="{{ queryShipment.data.shippo_data.to_address }}"
      prevRowFormats={{}}
      prevRowMappers={{}}
      rowHeaderNames={{
        postal_code: "Postal Code",
        zip: "Postal Code",
        city: "City",
        name: "Name",
        street1: "Street 1",
        phone: "Phone",
        street2: "Street 2",
        state: "State",
        street_1: "Street 1",
        country_code: "Country",
        street_2: "Street 2",
        country: "Country",
        full_name: "Full Name",
        email: "Email",
        company: "Company",
        line1: "Line 1",
        line2: "Line 2",
      }}
      rows={[
        "a",
        "b",
        "c",
        "id",
        "full_name",
        "line1",
        "line2",
        "name",
        "company",
        "street_1",
        "street_2",
        "street1",
        "street2",
        "city",
        "state",
        "postal_code",
        "country_code",
        "from_address",
        "rate_id",
        "shipment_id",
        "to_address",
        "zip",
        "country",
        "email",
        "phone",
      ]}
      rowVisibility={{
        shipment_id: true,
        a: true,
        postal_code: true,
        zip: true,
        b: true,
        c: true,
        city: true,
        name: true,
        street1: true,
        phone: true,
        street2: true,
        to_address: true,
        state: true,
        street_1: true,
        country_code: true,
        street_2: true,
        country: true,
        rate_id: true,
        id: false,
        full_name: true,
        email: true,
        company: true,
        line1: true,
        line2: true,
        from_address: true,
      }}
    />
  </Body>
</Container>
