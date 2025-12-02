<Container
  id="NamesContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle170"
      margin="0"
      value="######  Names"
      verticalAlign="center"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Text
      id="text453"
      value="###### Name (International)"
      verticalAlign="center"
    />
    <TextInput
      id="titleField"
      label="Title"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.title ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.title !== titleField.value ? '#99A7C8' : '#FFFFFF'): (titleField.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.title}}'
      }
    />
    <Select
      id="salutation"
      disabled=""
      emptyMessage="No options"
      itemMode="static"
      label="Salutation"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.salutation ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.salutation !== salutation.value ? '#99A7C8' : '#FFFFFF'): (salutation.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.salutation || ""}}'
      }
    >
      <Option id="52280" value="Mr" />
      <Option id="c99be" value="Ms" />
      <Option id="25397" value="Mrs" />
    </Select>
    <TextInput
      id="firstName"
      customValidation={
        '{{ !firstName.value && !lastName.value ? "First or last name is required." : "" }}\n'
      }
      label="First Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{  CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.first ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.first !== firstName.value ? '#99A7C8' : '#FFFFFF'): (firstName.value !== '' ? '#99A7C8' : '#FFFFFF')}}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.first}}'
      }
    />
    <TextInput
      id="middleName"
      label="Middle Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.middle ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.middle !== middleName.value ? '#99A7C8' : '#FFFFFF'): (middleName.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.middle}}'
      }
    />
    <TextInput
      id="suffix"
      label="Suffix"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.suffix ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.suffix !== suffix.value ? '#99A7C8' : '#FFFFFF'): (suffix.value !== '' ? '#99A7C8' : '#FFFFFF')}}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.suffix}}'
      }
    />
    <TextInput
      id="lastName"
      customValidation={
        '{{ !firstName.value && !lastName.value ? "First or last name is required." : "" }}\n'
      }
      label="Last Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.last ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType === \"1\").item.last !== lastName.value ? '#99A7C8' : '#FFFFFF'): (lastName.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.last}}'
      }
    />
  </View>
</Container>
