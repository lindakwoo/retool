<Container
  id="collapsibleContainer2"
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
      id="collapsibleTitle2"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Seller Address"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle2"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      marginType="normal"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ collapsibleContainer2.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="collapsibleContainer2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="fbfcf" viewKey="View 1">
    <TextInput
      id="full_name_seller"
      _disclosedFields={{ array: [] }}
      label="Full Name"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      value="{{getShippingLabelInfo.data.address_from.name}}"
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
      id="street_one_seller"
      _disclosedFields={{ array: [] }}
      label="Street 1"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      value="{{orderSeller.value.home_address.line1}}"
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
      id="street_two_seller"
      _disclosedFields={{ array: [] }}
      label="Street 2"
      marginType="normal"
      value="{{orderSeller.value.home_address.line2}}"
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
      id="city_seller"
      _disclosedFields={{ array: [] }}
      label="City"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      value="{{orderSeller.value.home_address.city}}"
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
      id="state_seller"
      _disclosedFields={{ array: [] }}
      customValidation={
        '{{((country.value != "US" && country.value != "CA") || state_seller.value != "") ? null : "State Required" }}'
      }
      label="State"
      marginType="normal"
      placeholder="Enter value"
      value="{{orderSeller.value.home_address.state}}"
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
      id="country_seller"
      _disclosedFields={{ array: [] }}
      label="Country"
      marginType="normal"
      maxLength="2"
      pattern="^[A-Z]+$"
      patternType="regex"
      placeholder="Enter value"
      required={true}
      value="{{orderSeller.value.home_address.country_code}}"
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
      id="zip_seller"
      _disclosedFields={{ array: [] }}
      label="Zip"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      value="{{orderSeller.value.home_address.postal_code}}"
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
      id="company_seller"
      _disclosedFields={{ array: [] }}
      label="Company"
      marginType="normal"
      value="{{getShippingLabelInfo.data.address_from.company}}"
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
      id="email_seller"
      _disclosedFields={{ array: [] }}
      label="Email"
      marginType="normal"
      placeholder="Enter value"
      value="{{getShippingLabelInfo.data.address_from.email}}"
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
      id="phone_seller"
      _disclosedFields={{ array: [] }}
      label="Phone"
      marginType="normal"
      placeholder="Enter value"
      required={true}
      value="{{getShippingLabelInfo.data.address_from.phone}}"
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
  </View>
</Container>
