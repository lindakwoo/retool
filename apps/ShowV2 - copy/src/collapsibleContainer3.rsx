<Container
  id="collapsibleContainer3"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle3"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Recipient Address"
      verticalAlign="center"
    />
    <Select
      id="return_label_receipient_select"
      emptyMessage="No options"
      hidden="{{!urlparams.refund_updates}}"
      hideLabel={true}
      itemMode="static"
      label=""
      labelPosition="top"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Return recipient address"
      showSelectionIndicator={true}
      value="{{ self.hidden ?  self.data[1].label :  self.data[0].label}}"
    >
      <Option id="ce42f" label="Seller" value="seller" />
      <Option id="fdcb4" label="Whatnot" value="whatnot" />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="return_label_recipient_select_change_js"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="inputValueChange"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="return_label_recipient_select_change_js"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="setValue"
        params={{
          ordered: [{ value: '{{ self.value == \'whatnot\' ? "Yes": "No"}}' }],
        }}
        pluginId="warehouse_crl"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <ToggleButton
      id="collapsibleToggle3"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      marginType="normal"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ collapsibleContainer3.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="collapsibleContainer3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="fbfcf" viewKey="View 1">
    <RadioGroup
      id="radioGroupReturnAddress"
      groupLayout="singleColumn"
      hidden=""
      itemMode="static"
      label=""
      labelPosition="top"
      value="{{ self.values[0] }}"
    >
      <Option
        id="8a756"
        caption="UK orders >£200"
        label="US Warehouse"
        value="us_warehouse"
      />
      <Option
        id="31a32"
        caption="EU orders >€500"
        hidden={
          '{{ !["DE","AT","NL","FR"].includes((address_from_country_crl.value || "").toUpperCase()) }}'
        }
        label="EZI Warehouse"
        value={
          '{{ (queryShipment.data.shippo_data?.to_address.country ?? queryRecord.data.shipping_address?.country_code) === "FR" ? "fr_ezi_warehouse" : "de_ezi_warehouse" }}'
        }
      />
      <Option
        id="df45f"
        caption="FR orders <€500"
        disabled="{{ orderTransformer_ShipmentDataPage.value.total_cents > 50000 }}"
        hidden={
          '{{ !["DE","AT","NL","FR"].includes((address_from_country_crl.value || "").toUpperCase()) }}'
        }
        label="FR EZI Returns"
        value="fr_ezi"
      />
      <Option
        id="2c249"
        caption="DE orders <€500"
        disabled="{{ orderTransformer_ShipmentDataPage.value.total_cents > 50000 }}"
        hidden={
          '{{ !["DE","AT","NL","FR"].includes((address_from_country_crl.value || "").toUpperCase()) }}'
        }
        label="DE EZI Returns"
        value="de_ezi"
      />
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'let addressToUse = {\n  street1: "",\n  street2: "",\n  city: "",\n  state: "",\n  country: "",\n  zip: "",\n  company: "",\n  fullName: "",\n  email: "",\n  phone: "",\n}\n\nif (radioGroupReturnAddress.value === \'fr_ezi\') {\n  addressToUse = {\n    street1: "70 Avenue Jean Jaurès",\n    street2: "",\n    city: "Bagnères de Luchon",\n    state: "",\n    country: "FR",\n    zip: "31110",\n    company: "EZI RETURNS - Whatnot",\n    fullName: "EZI RETURNS - Whatnot",\n    email: "",\n    phone: "+33960083346",\n  }\n} else if (radioGroupReturnAddress.value === \'fr_ezi_warehouse\') {\n  addressToUse = {\n    street1: "70 Avenue Jean Jaurès",\n    street2: "",\n    city: "Bagnères de Luchon",\n    state: "",\n    country: "FR",\n    zip: "31110",\n    company: "EZI RETURNS - WN RETURNS EUROPE",\n    fullName: "EZI RETURNS - WN RETURNS EUROPE",\n    email: "",\n    phone: "+33960083346",\n  }  \n} else if (radioGroupReturnAddress.value === \'de_ezi\') {\n  addressToUse = {\n    street1: "Industriestraße 30",\n    street2: "",\n    city: "Kirchgellersen",\n    state: "",\n    country: "DE",\n    zip: "21394",\n    company: "Whatnot - C/o Ezi Returns",\n    fullName: "Whatnot - C/o Ezi Returns",\n    email: "sellersupport@whatnot.com",\n    phone: "+4941319271057",\n  }\n} else if (radioGroupReturnAddress.value === \'de_ezi_warehouse\') {\n  addressToUse = {\n    street1: "Industriestraße 30",\n    street2: "",\n    city: "Kirchgellersen",\n    state: "",\n    country: "DE",\n    zip: "21394",\n    company: "WN RETURNS EUROPE - C/o Ezi Returns",\n    fullName: "WN RETURNS EUROPE - C/o Ezi Returns",\n    email: "sellersupport@whatnot.com",\n    phone: "+4941319271057",\n  }\n} else {\n  // \'us_warehouse\' will always fall here\n  addressToUse = {\n    street1: "8175 E Evans Rd, Unit 13330",\n    street2: "",\n    city: "Scottsdale",\n    state: "AZ",\n    country: "US",\n    zip: "85267",\n    company: "Whatnot Inc",\n    fullName: "Whatnot Inc",\n    email: "tony@whatnot.com",\n    phone: "5629910364",\n  }\n}\n\naddress_to_street_one_crl.setValue(addressToUse.street1);\naddress_to_street_two_crl.setValue(addressToUse.street2);\naddress_to_city_crl.setValue(addressToUse.city);\naddress_to_state_crl.setValue(addressToUse.state);\naddress_to_country_crl.setValue(addressToUse.country);\naddress_to_zip_crl.setValue(addressToUse.zip);\naddress_to_company_crl.setValue(addressToUse.company);\naddress_to_full_name_crl.setValue(addressToUse.fullName);\naddress_to_email_crl.setValue(addressToUse.email);\naddress_to_phone_crl.setValue(addressToUse.phone);',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="address_to_street_one_crl"
      _disclosedFields={{ array: [] }}
      disabled="false"
      label="Street 1"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      required={true}
      value="7820 E Gelding Dr, Suite 200"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_street_two_crl"
      _disclosedFields={{ array: [] }}
      disabled="false"
      label="Street 2"
      marginType="normal"
      readOnly="true"
    >
      <Event
        event="submit"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_city_crl"
      _disclosedFields={{ array: [] }}
      label="City"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      required={true}
      value="Scottsdale"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_state_crl"
      _disclosedFields={{ array: [] }}
      customValidation={
        '{{((country.value != "US" && country.value != "CA") || address_to_state_crl.value != "") ? null : "State Required" }}'
      }
      label="State"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      value="AZ"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_country_crl"
      _disclosedFields={{ array: [] }}
      label="Country"
      marginType="normal"
      maxLength="2"
      pattern="^[A-Z]+$"
      patternType="regex"
      placeholder="Enter value"
      readOnly="true"
      required={true}
      value="US"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_zip_crl"
      _disclosedFields={{ array: [] }}
      label="Zip"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      required={true}
      value="85260"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_company_crl"
      _disclosedFields={{ array: [] }}
      label="Company"
      marginType="normal"
      readOnly="true"
      value="Whatnot Inc"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_full_name_crl"
      _disclosedFields={{ array: [] }}
      label="Full Name"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      required={true}
      value="Whatnot Inc"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_email_crl"
      _disclosedFields={{ array: [] }}
      label="Email"
      marginType="normal"
      value="tony@whatnot.com"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="address_to_phone_crl"
      _disclosedFields={{ array: [] }}
      label="Phone"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="5629910364"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="run"
        params={{
          ordered: [
            { src: "address_to_phone_crl.setValue(phoneFormat(self.value))" },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
</Container>
