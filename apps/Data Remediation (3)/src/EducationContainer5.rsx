<Container
  id="EducationContainer5"
  disabled="true"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle57"
      value="#### Identifiers"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle57"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ EducationContainer5.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="EducationContainer5"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Text
      id="text479"
      value="###### License Information"
      verticalAlign="center"
    />
    <Form
      id="identifiersForm3"
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
          id="formTitle22"
          value="###### License Information"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="licenseField5"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || licenseDeleteFlag3.value}}"
          hideLabel={true}
          label="{{ IndividualIdentifiersList.value.find((o) => o.code === 2).labels.en }}"
          labelPosition="top"
          readOnly="true"
          value="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length > 0 ? CurrentSelectedContact.value.identifiers.find((o)=> o.item.type == 2).item.id: '' }}"
        />
        <Checkbox
          id="licenseDeleteFlag3"
          hidden="{{ !licenseDeleteFlag3.value }}"
          label="Delete"
          labelWidth="100"
        />
        <Icon
          id="deleteLicense3"
          disabled="{{ CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2).length === 0 || CurrentSelectedContact.value.identifiers.filter((o)=> o.item.type == 2)[0].source === 'REMEDIATED' }}"
          hidden="true"
          horizontalAlign="center"
          icon="bold/interface-delete-bin-2"
          style={{ ordered: [] }}
        >
          <Event
            enabled="{{ !deleteLicense3.disabled}}"
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
          id="formButton17"
          submit={true}
          submitTargetId="identifiersForm3"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text480" value="###### Director IDs" verticalAlign="center" />
    <ListViewBeta
      id="directorIdsList5"
      data="{{ DisplayDirectorIds.value }}"
      heightType="auto"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container128"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        padding="0"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle186"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="68b4c" viewKey="View 1">
          <TextInput
            id="eachId3"
            label=""
            labelPosition="top"
            placeholder="Enter value"
            readOnly="true"
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
          <Icon
            id="eachDirectorIdDelete5"
            disabled="{{item.source === 'REMEDIATED'}}"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            style={{ ordered: [] }}
          >
            <Event
              enabled="{{ !eachDirectorIdDelete5.disabled}}"
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
