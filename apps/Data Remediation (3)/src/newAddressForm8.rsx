<Container
  id="newAddressForm8"
  disabled="{{ addressDeleteFlag4.value || !CurrentSelectedContact.value.addresses}}"
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
      id="containerTitle172"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="addressLine7"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.addressLines.join(', ')}}"
    />
    <TextInput
      id="city7"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.city}}"
    />
    <TextInput
      id="postCode7"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.postCode}}"
    />
    <TextInput
      id="state7"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.provinceOrState}}"
    />
    <Select
      id="country7"
      data="{{ _.uniq(CountriesList.value) }}"
      emptyMessage="No options"
      label="Country"
      labelPosition="top"
      labels="{{ item.a2 }} - {{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.countryISO2}}"
      values="{{ item.a2}}"
    />
    <Text id="text475" value="###### Contact Info" verticalAlign="center" />
    <Checkbox
      id="mailMarker2"
      disabled="true"
      label="Mail Marker"
      labelWidth="100"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.mailMarker}}"
    />
  </View>
</Container>
