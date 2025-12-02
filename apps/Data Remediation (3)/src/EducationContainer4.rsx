<Container
  id="EducationContainer4"
  disabled="{{ValidateUserRole.data }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle56"
      value="#### Identifiers"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle56"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ EducationContainer4.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="EducationContainer4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Text
      id="text471"
      value="###### License Information"
      verticalAlign="center"
    />
    <Form
      id="identifiersForm2"
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
          id="formTitle19"
          value="###### License Information"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="licenseField4"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || licenseDeleteFlag2.value}}"
          hideLabel={true}
          label="{{ IndividualIdentifiersList.value.find((o) => o.code === 2).labels.en }}"
          labelPosition="top"
          readOnly="true"
          value="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length > 0 ? CurrentSelectedContact.value.identifiers.find((o)=> o.item.type == 2).item.id: '' }}"
        />
        <Checkbox
          id="licenseDeleteFlag2"
          hidden="{{ !licenseDeleteFlag2.value }}"
          label="Delete"
          labelWidth="100"
        />
        <Icon
          id="deleteLicense2"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2)[0].source === 'REMEDIATED' }}"
          hidden="true"
          horizontalAlign="center"
          icon="bold/interface-delete-bin-2"
          style={{ ordered: [] }}
        >
          <Event
            enabled="{{ !deleteLicense2.disabled}}"
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
          id="formButton14"
          submit={true}
          submitTargetId="identifiersForm2"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text472" value="###### Director IDs" verticalAlign="center" />
    <ListViewBeta
      id="directorIdsList4"
      _primaryKeys="{{ item }}"
      data="{{ OriginalDisplayDirectorIds.value }}"
      heightType="auto"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="directorIdContainer"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        padding="0"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle185"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="68b4c" viewKey="View 1">
          <TextInput
            id="eachId2"
            label=""
            labelPosition="top"
            placeholder="Enter value"
            readOnly="true"
            textBefore="{{  item.source }}"
            value="{{ item }}"
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
          <Icon
            id="eachDirectorIdDelete4"
            disabled="{{item.source === 'REMEDIATED'}}"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            style={{ ordered: [] }}
          >
            <Event
              enabled="{{ !eachDirectorIdDelete4.disabled}}"
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
