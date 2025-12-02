<Container
  id="NamesContainer2"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle171"
      margin="0"
      value="######  International Name"
      verticalAlign="center"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Text id="text454" value="###### Name (Local)" verticalAlign="center" />
    <Checkbox
      id="deleteIntNameFlag"
      hidden="{{ !deleteIntNameFlag.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName"
      disabled={
        "{{ CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== \"1\").length === 0 || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentUserObj.value.level === 'level0'}}"
      }
      hidden={
        '{{  (CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0) || deleteIntNameFlag.value || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !deleteIntName.disabled }}"
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
      id="nameLanguageLocal"
      captionByIndex=""
      clearInputValueOnChange={true}
      colorByIndex=""
      data="{{ _.orderBy(LanguagesList.value, 'labels.en', ['asc']) }}"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value }}'
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
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.languageISO3 ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.languageISO3 !== nameLanguageLocal.value ? '#99A7C8' : '#FFFFFF'): (nameLanguageLocal.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      tooltipByIndex=""
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.languageISO3.toLowerCase()}}'
      }
      values="{{ item && item.Language_code_ISO_639_3 ? item.Language_code_ISO_639_3.toLowerCase() :  null }}"
    />
    <TextInput
      id="titleField1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Title"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.title ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.title !== titleField1.value ? '#99A7C8' : '#FFFFFF'): (titleField1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.title}}'
      }
    />
    <TextInput
      id="firstName1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="First Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.first ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.first !== firstName1.value ? '#99A7C8' : '#FFFFFF'): (firstName1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.first}}'
      }
    />
    <TextInput
      id="suffix1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Suffix"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.suffix ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.suffix !== suffix1.value ? '#99A7C8' : '#FFFFFF'): (suffix1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.suffix}}'
      }
    />
    <Select
      id="salutation1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value }}'
      }
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
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.salutation ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.salutation !== salutation1.value ? '#99A7C8' : '#FFFFFF'): (salutation1.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.salutation || ""}}'
      }
    >
      <Option id="52280" value="Mr" />
      <Option id="c99be" value="Ms" />
      <Option id="25397" value="Mrs" />
    </Select>
    <TextInput
      id="middleName1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Middle Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.middle ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.middle !== middleName1.value ? '#99A7C8' : '#FFFFFF'): (middleName1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.middle}}'
      }
    />
    <TextInput
      id="lastName1"
      disabled={
        '{{CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== "1").length === 0 || deleteIntNameFlag.value}}'
      }
      label="Last Name"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.last ? (CurrentSelectedContact.value.names.find((o) => o.item.languageType !== \"1\").item.last !== lastName1.value ? '#99A7C8' : '#FFFFFF'): (lastName1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value={
        '{{CurrentSelectedContact.value.names.find((o)=> o.item.languageType !== "1").item.last}}'
      }
    />
  </View>
</Container>
