<Container
  id="NamesContainer6"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle178"
      margin="0"
      value="######  International Name"
      verticalAlign="center"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Text id="text466" value="###### Name Local" verticalAlign="center" />
    <Select
      id="nameLanguage5"
      allowCustomValue={true}
      captionByIndex=""
      colorByIndex=""
      data="{{ _.orderBy(LanguagesList.value, 'labels.en', ['asc']) }}"
      disabled=""
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Language"
      labelPosition="top"
      labels="{{ item.labels.en }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      readOnly="true"
      showSelectionIndicator={true}
      tooltipByIndex=""
      value={
        '{{CurrentSelectedContact.value.names && CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1")? CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.languageISO3.toLowerCase() : null}}'
      }
      values="{{ item.Language_code_ISO_639_3.toLowerCase() }}"
    />
    <TextInput
      id="titleField5"
      label="Title"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.title}}'
      }
    />
    <TextInput
      id="firstName9"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag5.value}}'
      }
      label="First Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.first}}'
      }
    />
    <TextInput
      id="suffix5"
      label="Suffix"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.suffix}}'
      }
    />
    <Select
      id="salutation9"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag5.value }}'
      }
      emptyMessage="No options"
      itemMode="static"
      label="Salutation"
      labelPosition="top"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.salutation}}'
      }
    >
      <Option id="52280" value="Mr" />
      <Option id="c99be" value="Ms" />
      <Option id="25397" value="Mrs" />
    </Select>
    <TextInput
      id="middleName9"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag5.value}}'
      }
      label="Middle Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.middle}}'
      }
    />
    <TextInput
      id="lastName9"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag5.value}}'
      }
      label="Last Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.last}}'
      }
    />
  </View>
</Container>
