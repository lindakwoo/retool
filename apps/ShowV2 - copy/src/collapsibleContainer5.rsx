<Container
  id="collapsibleContainer5"
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
      id="collapsibleTitle5"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Recipient (Buyer's) Address"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle5"
      _disclosedFields={{ array: [] }}
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      marginType="normal"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ collapsibleContainer5.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="collapsibleContainer5"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="fbfcf" viewKey="View 1">
    <TextInput
      id="street_one_crtsl"
      _disclosedFields={{ array: [] }}
      disabled=""
      label="Street 1"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.street1 }}"
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
      id="street_two_crtsl"
      _disclosedFields={{ array: [] }}
      disabled=""
      label="Street 2"
      marginType="normal"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_to.street2 }}"
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
      id="city_crtsl"
      _disclosedFields={{ array: [] }}
      label="City"
      marginType="normal"
      placeholder="Enter value"
      readOnly=""
      required={true}
      value="{{getShippingLabelInfo.data.address_to.city }}"
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
      id="state_crtsl"
      _disclosedFields={{ array: [] }}
      customValidation={
        '{{((country.value != "US" && country.value != "CA") || state_crtsl.value != "") ? null : "State Required" }}'
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
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="country_crtsl"
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
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="zip_crtsl"
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
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="company_crtsl"
      _disclosedFields={{ array: [] }}
      label="Company"
      marginType="normal"
      readOnly=""
      value="{{getShippingLabelInfo.data.address_to.company }}"
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
      id="full_name_crtsl"
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
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="email_crtsl"
      _disclosedFields={{ array: [] }}
      label="Email"
      marginType="normal"
      placeholder="Enter value"
      value="{{getShippingLabelInfo.data.address_to.email}}"
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
      id="phone_crtsl"
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
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="run"
        params={{
          ordered: [{ src: "phone_crtsl.setValue(phoneFormat(self.value))" }],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
</Container>
