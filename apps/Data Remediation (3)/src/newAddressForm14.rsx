<Container
  id="newAddressForm14"
  disabled=""
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
      id="containerTitle212"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="addressLine11"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.addressLines.join(', ')}}"
    />
    <TextInput
      id="city11"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.city}}"
    />
    <TextInput
      id="postCode11"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.postCode}}"
    />
    <TextInput
      id="state11"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.provinceOrState}}"
    />
    <Select
      id="country11"
      data="{{ _.uniq(CountriesList.value) }}"
      emptyMessage="No options"
      label="Country"
      labelPosition="top"
      labels="{{ item.a2 }} - {{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.countryISO2.toLowerCase()}}"
      values="{{ item.a2.toLowerCase()}}"
    />
    <Checkbox
      id="mailMarker4"
      disabled="true"
      label="Mail Marker"
      labelWidth="100"
      value="{{CurrentSelectedContact.value.addresses[0].item.reported.mailMarker}}"
    />
    <Text id="text521" value=" ###### Contact Info" verticalAlign="center" />
    <IconText
      id="phoneNumLabel18"
      icon="bold/interface-alert-information-circle"
      iconPosition="right"
      text="Phone Numbers"
      textSize="default"
      tooltipText="Add multiple Phone Numbers using comma (,) separated"
    />
    <IconText
      id="phoneNumLabel19"
      icon="bold/interface-alert-information-circle"
      iconPosition="right"
      text="Fax Numbers"
      textSize="default"
      tooltipText="Add multiple Fax Numbers using comma (,) separated"
    />
    <TextInput
      id="email7"
      iconBefore="bold/mail-send-envelope"
      label="Email"
      labelPosition="top"
      patternType="email"
      readOnly="true"
      value="{{ CurrentSelectedContact.value.contactInformations.filter(item => item.item.type === '2').map(item => item.item.value).join(', ') }}
"
    />
    <TextInput
      id="phoneNumber12"
      hidden=""
      iconBefore="bold/phone-telephone-circle"
      label=""
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{ CurrentSelectedContact.value.contactInformations.filter(item => item.item.type === '1').map(item => item.item.value).join(', ') }}
"
    />
    <TextInput
      id="faxNumber12"
      hidden=""
      iconBefore="bold/mail-inbox-envelope-open"
      label=""
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      value="{{ CurrentSelectedContact.value.contactInformations.filter(item => item.item.type === '3').map(item => item.item.value).join(', ') }}
"
    />
  </View>
</Container>
