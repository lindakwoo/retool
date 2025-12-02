<Container
  id="preandAndRemNewAddressFormIndividual"
  disabled="true"
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
      id="containerTitle198"
      marginType="normal"
      value="###### Address"
      verticalAlign="center"
    />
  </Header>
  <View id="76445" viewKey="View 1">
    <TextInput
      id="functionPreAndRemPreAndRemroleAddressLine"
      disabled=""
      hideLabel={false}
      label="Address Line"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.addressLines.join('; ')}}"
    />
    <TextInput
      id="functionPreAndRemRoleCity"
      disabled=""
      label="City"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.city}}"
    />
    <TextInput
      id="functionPreAndRemPostCode"
      disabled=""
      label="Post Code"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.postCode}}"
    />
    <TextInput
      id="roleState3"
      disabled=""
      label="State"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.provinceOrState}}"
    />
    <Select
      id="roleCountry3"
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
      style={{ ordered: [] }}
      value="{{CurrentSelectedRole.value.function.item.misc.workAddress.countryISO2.toLowerCase()}}"
      values="{{ item.a2.toLowerCase()}}"
    />
    <TextInput
      id="functionPreAndRemRolePhone"
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
              "{{ CurrentSelectedRole.value.function.item.misc.workAddress && CurrentSelectedRole.value.function.item.misc.workAddress.phone ?  (CurrentSelectedRole.value.function.item.misc.workAddress.phone !== functionPreAndRemRolePhone.value ? '#99A7C8': '#FFF' ): functionPreAndRemRolePhone.value ? '#99A7C8': '#FFF' }}",
          },
        ],
      }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.phone }}"
    />
    <Text
      id="text501"
      hidden="true"
      style={{ ordered: [{ color: "danger" }] }}
      value="The Country field cannot be empty. Please select a country."
      verticalAlign="center"
    />
    <TextInput
      id="functionPreAndRemRoleFax"
      disabled=""
      hidden=""
      iconBefore="bold/mail-inbox-envelope-open"
      label="Fax"
      labelPosition="top"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.fax }}"
    />
    <TextInput
      id="functionPreAndRemRoleEmail"
      disabled=""
      iconBefore="bold/mail-send-envelope"
      label="Email"
      labelPosition="top"
      patternType="email"
      style={{ ordered: [] }}
      value="{{ CurrentSelectedRole.value.function.item.misc.workAddress.email }}"
    />
  </View>
</Container>
