<Container
  id="newAddressForm3"
  disabled="{{ addressDeleteFlag1.value || !CurrentSelectedContact.value.addresses}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  margin="0"
  marginType="normal"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle133"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="addressLine1"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.addressLines ? (CurrentSelectedContact.value.addresses[0].item.reported.addressLines.filter(str => str.trim() !== \"\").join(\"; \") !== addressLine1.value ? '#99A7C8' : '#FFFFFF') : (addressLine1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.addressLines?.filter(str => str.trim() !== "").join("; ")}}'
      }
    />
    <TextInput
      id="city1"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.city? (CurrentSelectedContact.value.addresses[0].item.reported.city !== city1.value ? '#99A7C8' : '#FFFFFF'): (city1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.city}}"
    />
    <TextInput
      id="postCode1"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.postCode ? (CurrentSelectedContact.value.addresses[0].item.reported.postCode !== postCode1.value ? '#99A7C8' :'#FFFFFF'): (postCode1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.postCode}}"
    />
    <TextInput
      id="state1"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.provinceOrState? (CurrentSelectedContact.value.addresses[0].item.reported.provinceOrState !== state1.value ? '#99A7C8' : '#FFFFFF'): (state1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.provinceOrState}}"
    />
    <Select
      id="country1"
      data="{{ _.uniq(CountriesList.value) }}"
      emptyMessage="No options"
      label="Country"
      labelPosition="top"
      labels="{{ item.a2 }} - {{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.addresses && CurrentSelectedContact.value.addresses[0].item.reported.countryISO2 ? (CurrentSelectedContact.value.addresses[0].item.reported.countryISO2 !== country1.value ? '#99A7C8' : '#FFFFFF'): (country1.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.countryISO2}}"
      values="{{ item.a2}}"
    />
    <Text
      id="text374"
      hidden="true"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Country field cannot be empty. Please select a country."
      verticalAlign="center"
    />
    <Checkbox
      id="mailMarker"
      label="Mail Marker"
      labelWidth="100"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.mailMarker}}"
    />
  </View>
</Container>
