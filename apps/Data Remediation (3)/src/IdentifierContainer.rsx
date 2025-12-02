<Container
  id="IdentifierContainer"
  disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle55"
      value="#### Identifiers"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle55"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ IdentifierContainer.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="IdentifierContainer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Text
      id="text461"
      value="###### License Information"
      verticalAlign="center"
    />
    <Form
      id="identifiersForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="formTitle11"
          value="###### License Information"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="licenseField"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || licenseDeleteFlag.value}}"
          hideLabel={true}
          label="{{ IndividualIdentifiersList.value.find((o) => o.code === 2).labels.en }}"
          labelPosition="top"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.identifiers && CurrentSelectedContact.value.identifiers.find((o) => o.item.type === \"2\") ? (CurrentSelectedContact.value.identifiers.find((o) => o.item.type === \"2\").item.id !== licenseField.value ? '#99A7C8' : '#FFFFFF') : (licenseField.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length > 0 ? CurrentSelectedContact.value.identifiers.find((o)=> o.item.type == 2).item.id: '' }}"
        />
        <Checkbox
          id="licenseDeleteFlag"
          hidden="{{ !licenseDeleteFlag.value }}"
          label="Delete"
          labelWidth="100"
        />
        <Icon
          id="deleteLicense"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
          hidden={
            '{{ licenseDeleteFlag.value || CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
          }
          horizontalAlign="center"
          icon="bold/interface-delete-bin-2"
          style={{ ordered: [] }}
        >
          <Event
            enabled="{{ !deleteLicense.disabled}}"
            event="click"
            method="trigger"
            params={{
              ordered: [
                {
                  options: {
                    ordered: [
                      {
                        additionalScope: {
                          ordered: [{ fieldName: "license" }],
                        },
                      },
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
      </Body>
      <Footer>
        <Button
          id="formButton7"
          submit={true}
          submitTargetId="identifiersForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text470" value="###### Director IDs" verticalAlign="center" />
    <ListViewBeta
      id="directorIdsList"
      data="{{ DisplayDirectorIds.value }}"
      heightType="auto"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="directorIdContainerList"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        padding="0"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle180"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="68b4c" viewKey="View 1">
          <TextInput
            id="eachId"
            label=""
            labelPosition="top"
            placeholder="Enter value"
            style={{
              ordered: [
                {
                  background:
                    "{{ item.source + '_' + item.value !==  item.id ? '#99A7C8' : '#FFFFFF'}}",
                },
              ],
            }}
            textBefore="{{  item.source }}"
            value="{{ item.value }}"
          >
            <Event
              event="change"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="HandleDirectorIdChange"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </TextInput>
          <Checkbox
            id="eachIdDeleteFlag"
            hidden="{{ !eachIdDeleteFlag.value }}"
            label="Delete"
            labelWidth="100"
          />
          <Icon
            id="eachDirectorIdDelete"
            disabled=""
            hidden={
              '{{ eachIdDeleteFlag.value || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
            }
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            style={{ ordered: [] }}
          >
            <Event
              enabled="{{ !eachDirectorIdDelete.disabled}}"
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="HandleDirectorIdDelete"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
        </View>
      </Container>
    </ListViewBeta>
  </View>
</Container>
