<Container
  id="newAddressForm12"
  disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
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
      id="containerTitle194"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="roleAddressLine"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.addressLines ?  (CurrentSelectedRole.value.function.item.misc.workAddress.addressLines.join('; ') !== roleAddressLine.value ? '#99A7C8': '#FFF' ): roleAddressLine.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.addressLines.join('; ')}}"
    />
    <TextInput
      id="roleCity"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.city ?  (CurrentSelectedRole.value.function.item.misc.workAddress.city !== roleCity.value ? '#99A7C8': '#FFF' ): roleCity.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.city}}"
    />
    <TextInput
      id="rolePostCode"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.postCode ?  (CurrentSelectedRole.value.function.item.misc.workAddress.postCode !== rolePostCode.value ? '#99A7C8': '#FFF' ): rolePostCode.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.postCode}}"
    />
    <TextInput
      id="roleState"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.provinceOrState ?  (CurrentSelectedRole.value.function.item.misc.workAddress.provinceOrState !== roleState.value ? '#99A7C8': '#FFF' ): roleState.value !== '' ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.provinceOrState}}"
    />
    <Select
      id="roleCountry"
      allowDeselect={true}
      clearInputValueOnChange={true}
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
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2 ?  (CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2.toUpperCase() !== roleCountry.value ? '#99A7C8': '#FFF' ): roleCountry.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2.toUpperCase()}}"
      values="{{ item.a2.toUpperCase()}}"
    />
    <TextInput
      id="rolePhone"
      customValidation="{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.phone ? (
CurrentSelectedRole.value.function.item.misc.workAddress.phone !== rolePhone.value ? (rolePhone.value !== '' ? (rolePhone.value !== '' ? (/^[0-9+\-()\s]+$/.test(rolePhone.value) ? '' : 'Valid values include numbers, Spaces, +, -, ()') : '' ) : ('')) : ('')
) : (rolePhone.value !== '' ? /^[0-9+\-()\s]+$/.test(rolePhone.value) ? '' : 'Valid values include numbers, Spaces, +, -, ()' : '') }}"
      disabled=""
      hidden=""
      iconBefore="bold/phone-telephone-circle"
      label="Phone"
      labelPosition="top"
      marginType="normal"
      pattern="^[0-9+\-()]+$"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.phone ?  (CurrentSelectedRole.value.function.item.misc.workAddress.phone !== rolePhone.value ? '#99A7C8': '#FFF' ): rolePhone.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      tooltipText="Valid values include numbers, Spaces, +, -, ()"
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.phone }}"
    />
    <Text
      id="text490"
      hidden="true"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Country field cannot be empty. Please select a country."
      verticalAlign="center"
    />
    <TextInput
      id="roleFax"
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
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.fax ?  (CurrentSelectedRole.value.function.item.misc.workAddress.fax !== roleFax.value ? '#99A7C8': '#FFF' ): roleFax.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.fax }}"
    />
    <TextInput
      id="roleEmail"
      disabled=""
      iconBefore="bold/mail-send-envelope"
      label="Email"
      labelPosition="top"
      patternType="email"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.email ?  (CurrentSelectedRole.value.function.item.misc.workAddress.email !== roleEmail.value ? '#99A7C8': '#FFF' ): roleEmail.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.email }}"
    />
  </View>
</Container>
