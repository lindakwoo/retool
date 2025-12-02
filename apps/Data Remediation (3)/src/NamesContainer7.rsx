<Container
  id="NamesContainer7"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle210"
      margin="0"
      value="######  Names"
      verticalAlign="center"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Text
      id="text519"
      value="###### Name International"
      verticalAlign="center"
    />
    <TextInput
      id="titleField6"
      label="Title"
      labelPosition="top"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.title}}'
      }
    />
    <Select
      id="salutation10"
      disabled=""
      emptyMessage="No options"
      itemMode="static"
      label="Salutation"
      labelPosition="top"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      style={{ ordered: [] }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.salutation}}'
      }
    >
      <Option id="52280" value="Mr" />
      <Option id="c99be" value="Ms" />
      <Option id="25397" value="Mrs" />
    </Select>
    <TextInput
      id="firstName10"
      label="First Name"
      labelPosition="top"
      readOnly="true"
      style={{ ordered: [{ border: "#ffffff" }] }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.first}}'
      }
    />
    <TextInput
      id="middleName10"
      label="Middle Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.middle}}'
      }
    />
    <TextInput
      id="suffix6"
      label="Suffix"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.suffix}}'
      }
    />
    <TextInput
      id="lastName10"
      label="Last Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType === "1").item.last}}'
      }
    />
  </View>
</Container>
