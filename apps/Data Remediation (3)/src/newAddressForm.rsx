<Container
  id="newAddressForm"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ GlobalAddAddress.value.length==0 }}
"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle332"
      marginType="normal"
      value="#### New Address"
      verticalAlign="center"
    />
    <Icon
      id="removeAddress"
      hidden=""
      horizontalAlign="center"
      icon="bold/interface-delete-circle-alternate"
      marginType="normal"
      tooltipText="Remove New Address"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="newAddressForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: false }] }}
        pluginId="addNewAddress"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "newAddressForm.clear();\nnewAddressType.clearValue();\nlanguage2.clearValue();\ncountry2.clearValue();\nGlobalNewAddress.setValue(null);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="GlobalAddAddress"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
  </Header>
  <View id="76445" viewKey="View 1">
    <Select
      id="newAddressType"
      data="{{ AddressTypesList.value }}"
      disabledByIndex="{{ item.code === '13' || item.code === '14' }}"
      emptyMessage="No options"
      label="Address Type"
      labelPosition="top"
      labels="{{  item.code  }} - {{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].types[0] : null }}
"
      values="{{  item.code  }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          ],
        }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="language2"
      allowCustomValue={true}
      data="{{ LanguagesList.value }}"
      emptyMessage="No options"
      label="Address Language"
      labelPosition="top"
      labels="{{item.code + ' - ' + item.labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.language : null }}
"
      values="{{ item.Language_code_ISO_639_1 }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Text
      id="text547"
      hidden="{{newAddressType.value}}"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Address Type field cannot be empty. Please select a Type."
      verticalAlign="center"
    />
    <Text
      id="text548"
      hidden="{{language2.value}}"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Address Language field cannot be empty. Please select a Language."
      verticalAlign="center"
    />
    <TextInput
      id="addressLine2"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      required="{{ countryISO2.value === 'US' }}"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.addressLines[0] : [] }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="city2"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.city : null }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text
      id="newAddressLineValidation"
      hidden="{{ self.value === '' }}"
      style={{ ordered: [{ color: "danger" }] }}
      value="{{countryISO2.value === 'US' && addressLine2.value.trim() === '' ? 'Address Line cannot be empty' :''}} "
      verticalAlign="center"
    />
    <TextInput
      id="state2"
      disabled="true"
      label="State"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="county3"
      disabled=""
      label="County"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county ?  AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county !== self.value ? '#99A7C8' : '#fff' : (self.value ? '#99A7C8' : '#fff')}}",
          },
        ],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.county : null }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="postCode2"
      disabled=""
      label="PostCode"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      required="{{ countryISO2.value === 'US' ||  countryISO2.value === 'BR'}}"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.postCode : null }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="poBox2"
      disabled=""
      label="Po_Box"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.poBox : null }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text
      id="newPostCodeValidation2"
      hidden="{{ self.value === '' }}"
      style={{ ordered: [{ color: "danger" }] }}
      value="{{countryISO2.value === 'US' && postCode2.value.trim() === '' ? 'PostCode cannot be empty' : countryISO2.value === 'BR' && !/^\d{5}-\d{3}$/.test(postCode2.value.trim()) ? 'Invalid Brazilian postcode format. Please enter in XXXXX-XXX format.' : ''}} "
      verticalAlign="center"
    />
    <TextInput
      id="countryISO2"
      disabled="true"
      label="Country Isocode"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country2.value
})[0].a2 }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="regionGeoCode2"
      label="Region Geocode"
      labelPosition="top"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].geoClassifications?.[0]?.code : null }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Select
      id="country2"
      customValidation="{{!country2.value ? 'The Country field cannot be empty. Please select a country.': ''}}"
      data="{{ _.uniq(CountriesList.value) }}"
      emptyMessage="No options"
      label="Country"
      labelPosition="top"
      labels="{{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ 
  GlobalAddAddress?.value?.length > 0 
    ? CountriesList.value.find(c => c.a2 === GlobalAddAddress.value[0].countryISO2)?.labels?.en 
    : null 
}}
"
      values="{{ item.labels.en }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Text
      id="text549"
      hidden="{{country2.value}}"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Country field cannot be empty. Please select a country."
      verticalAlign="center"
    />
    <TextInput
      id="countryRegion2"
      disabled="true"
      label="Country Region"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country2.value
})[0].a2 }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="worldRegion2"
      disabled="true"
      label="World Region"
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <IconText
      id="phoneNumLabel21"
      icon="bold/interface-alert-information-circle"
      iconPosition="right"
      style={{ ordered: [{ fontSize: "12" }, { fontWeight: "700" }] }}
      text="Phone Numbers"
      textSize="h6"
      tooltipText="Add multiple Phone Numbers using comma (,) separated"
    />
    <IconText
      id="faxNumberLabel8"
      icon="bold/interface-alert-information-circle"
      iconPosition="right"
      style={{ ordered: [{ fontSize: "12" }, { fontWeight: "700" }] }}
      text="Fax Numbers"
      textSize="h6"
      tooltipText="Add multiple Fax Numbers using comma (,) separated"
    />
    <TextInput
      id="phoneNumber2"
      hidden=""
      iconBefore="bold/phone-telephone-circle"
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.phoneNumbers[0] : [] }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="faxNumber2"
      hidden=""
      iconBefore="bold/mail-inbox-envelope-open"
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value="{{ GlobalAddAddress?.value?.length > 0 ? GlobalAddAddress.value[0].localizedAddresses?.[0]?.reportedAddress?.faxNumbers[0] : [] }}
"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addNewAddressData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
</Container>
