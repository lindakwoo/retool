<Container
  id="newAddressForm13"
  disabled="{{!CurrentSelectedContact.value.function.addresses}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle196"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="roleAddressLine2"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.addressLines ?  (CurrentSelectedRole.value.function.item.misc.workAddress.addressLines.join('; ') !== roleAddressLine2.value ? '#99A7C8': '#FFF' ): roleAddressLine2.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.addressLines.join('; ')}}"
    />
    <TextInput
      id="roleCity2"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.city ?  (CurrentSelectedRole.value.function.item.misc.workAddress.city !== roleCity2.value ? '#99A7C8': '#FFF' ): roleCity2.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.city}}"
    />
    <TextInput
      id="rolePostCode2"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.postCode ?  (CurrentSelectedRole.value.function.item.misc.workAddress.postCode !== rolePostCode2.value ? '#99A7C8': '#FFF' ): rolePostCode2.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.postCode}}"
    />
    <TextInput
      id="roleState2"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.provinceOrState}}"
    />
    <Select
      id="roleCountry2"
      allowDeselect={true}
      clearInputValueOnChange={true}
      data="{{ _.uniq(CountriesList.value) }}"
      emptyMessage="No options"
      label="Country"
      labelPosition="top"
      labels="{{ item.a2 }} - {{ item.labels.en }}"
      marginType="normal"
      overlayMaxHeight={375}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2 ?  (CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2.toLowerCase() !== roleCountry2.value.toLowerCase() ? '#99A7C8': '#FFF' ): roleCountry2.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2.toLowerCase()}}"
      values="{{ item.a2.toLowerCase()}}"
    />
    <TextInput
      id="rolePhone2"
      disabled=""
      hidden=""
      iconBefore="bold/phone-telephone-circle"
      label="Phone"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.phone ?  (CurrentSelectedRole.value.function.item.misc.workAddress.phone !== rolePhone2.value ? '#99A7C8': '#FFF' ): rolePhone2.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.phone }}"
    />
    <Text
      id="text494"
      hidden="true"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Country field cannot be empty. Please select a country."
      verticalAlign="center"
    />
    <TextInput
      id="roleFax2"
      disabled=""
      hidden=""
      iconBefore="bold/mail-inbox-envelope-open"
      label="Fax"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.fax ?  (CurrentSelectedRole.value.function.item.misc.workAddress.fax !== roleFax2.value ? '#99A7C8': '#FFF' ): roleFax2.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.fax }}"
    />
    <TextInput
      id="roleEmail2"
      disabled=""
      iconBefore="bold/mail-send-envelope"
      label="Email"
      labelPosition="top"
      patternType="email"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.email ?  (CurrentSelectedRole.value.function.item.misc.workAddress.email !== roleEmail2.value ? '#99A7C8': '#FFF' ): roleEmail2.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.email }}"
    />
  </View>
</Container>
