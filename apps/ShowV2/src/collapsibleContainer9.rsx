<Container
  id="collapsibleContainer9"
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
      id="collapsibleTitle9"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Recipient (Seller) Address"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle9"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      marginType="normal"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ collapsibleContainer9.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="collapsibleContainer9"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="fbfcf" viewKey="View 1">
    <TextInput
      id="street_one_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Street 1"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.street1 }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="street_two_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      disabled=""
      label="Street 2"
      marginType="normal"
      readOnly="false"
      value="{{getShippingLabelInfo.data.address_from.street2 }}"
    >
      <Event
        event="submit"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="city_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="City"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.city }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="state_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      customValidation={
        '{{((country.value != "US" && country.value != "CA") || state_seller_crtsl2.value != "") ? null : "State Required" }}'
      }
      label="State"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_from.state }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="country_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Country"
      marginType="normal"
      maxLength="2"
      pattern="^[A-Z]+$"
      patternType="regex"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.country }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="zip_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Zip"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.zip }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="company_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Company"
      marginType="normal"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_from.company }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="full_name_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Full Name"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.name }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="email_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Email"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_from.email }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="phone_seller_crtsl2"
      _disclosedFields={{ array: [] }}
      label="Phone"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_from.phone }}"
    >
      <Event
        event="focus"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
</Container>
