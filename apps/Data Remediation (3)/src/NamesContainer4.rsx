<Container
  id="NamesContainer4"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle175"
      margin="0"
      value="######  International Name"
      verticalAlign="center"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Text id="text460" value="###### Name (Local)" verticalAlign="center" />
    <Checkbox
      id="deleteIntNameFlag4"
      hidden="{{ !deleteIntNameFlag4.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName13"
      disabled={
        '{{ (CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length !== 0 && CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1")[0].source === \'REMEDIATED\') }}'
      }
      hidden="true"
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { additionalScope: { ordered: [{ fieldName: "intName" }] } },
                ],
              },
            },
          ],
        }}
        pluginId="handleDeleteField"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Select
      id="nameLanguage4"
      captionByIndex=""
      colorByIndex=""
      data="{{ _.orderBy(LanguagesList.value, 'labels.en', ['asc']) }}"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag4.value }}'
      }
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
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.languageISO3.toLowerCase()}}'
      }
      values="{{ item && item.Language_code_ISO_639_3 ? item.Language_code_ISO_639_3.toLowerCase() :  null }}"
    />
    <TextInput
      id="titleField3"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Title"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.title}}'
      }
    />
    <TextInput
      id="firstName7"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag4.value}}'
      }
      label="First Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.first}}'
      }
    />
    <TextInput
      id="suffix3"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Suffix"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.suffix}}'
      }
    />
    <Select
      id="salutation7"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag4.value }}'
      }
      emptyMessage="No options"
      itemMode="static"
      label="Salutation"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select an option"
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
      id="middleName7"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag4.value}}'
      }
      label="Middle Name"
      labelPosition="top"
      readOnly="true"
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.middle}}'
      }
    />
    <TextInput
      id="lastName7"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag4.value}}'
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
