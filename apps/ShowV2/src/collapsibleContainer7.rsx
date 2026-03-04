<Container
  id="collapsibleContainer7"
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
      id="collapsibleTitle7"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Sender Address"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle7"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      marginType="normal"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ collapsibleContainer7.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="collapsibleContainer7"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="65f85" viewKey="View 1">
    <TextInput
      id="address_from_full_name_crl"
      _disclosedFields={{ array: [] }}
      label="Full Name"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.name}}"
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
      id="address_from_company_crl"
      _disclosedFields={{ array: [] }}
      label="Company"
      marginType="normal"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_to.company}}"
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
      id="address_from_street_one_crl"
      _disclosedFields={{ array: [] }}
      disabled=""
      label="Street 1"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.street1}}"
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
      id="address_from_street_two_crl"
      _disclosedFields={{ array: [] }}
      disabled=""
      label="Street 2"
      marginType="normal"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_to.street2}}"
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
      id="address_from_city_crl"
      _disclosedFields={{ array: [] }}
      label="City"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.city}}"
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
      id="address_from_state_crl"
      _disclosedFields={{ array: [] }}
      customValidation={
        '{{((country.value != "US" && country.value != "CA") || address_from_state_crl.value != "") ? null : "State Required" }}'
      }
      label="State"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_to.state}}"
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
      id="address_from_country_crl"
      _disclosedFields={{ array: [] }}
      label="Country"
      marginType="normal"
      maxLength="2"
      pattern="^[A-Z]+$"
      patternType="regex"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.country}}"
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
      id="address_from_zip_crl"
      _disclosedFields={{ array: [] }}
      label="Zip"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.zip}}"
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
      id="address_from_email_crl"
      _disclosedFields={{ array: [] }}
      label="Email"
      marginType="normal"
      value="{{getShippingLabelInfo.data.address_to.email}}"
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
      id="address_from_phone_crl"
      _disclosedFields={{ array: [] }}
      label="Phone"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.phone}}"
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
            { src: "address_from_phone_crl.setValue(phoneFormat(self.value))" },
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
