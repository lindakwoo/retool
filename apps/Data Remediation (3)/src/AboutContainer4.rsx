<Container
  id="AboutContainer4"
  disabled="true"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  overflowType="hidden"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="collapsibleTitle63" value="#### About" verticalAlign="center" />
    <ToggleButton
      id="collapsibleToggle63"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ AboutContainer4.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="AboutContainer4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Include src="./disqualificationContainer4.rsx" />
    <Include src="./NamesContainer7.rsx" />
    <Include src="./NamesContainer8.rsx" />
    <Text
      id="text523"
      value="###### Personal Information"
      verticalAlign="center"
    />
    <Checkbox
      id="deletePersonalInfoFlag6"
      hidden="{{ !deletePersonalInfoFlag6.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName16"
      disabled="{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.source === 'REMEDIATED' }}"
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
                  {
                    additionalScope: {
                      ordered: [{ fieldName: "personalInfo" }],
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
    <Form
      id="personalInfoForm6"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle43" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="birthDate6"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Birth Date"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date}}"
        />
        <TextInput
          id="placeOfBirth6"
          hidden=""
          label="Place of Birth"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.city}}"
        />
        <Checkbox
          id="isDeceased8"
          disabled="true"
          label="Is Deceased"
          labelWidth="70"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.isDeceased}}"
        />
        <Date
          id="deathDate6"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          hidden="{{!isDeceased8.value}}"
          iconBefore="bold/interface-calendar"
          label="Death Date"
          labelPosition="top"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.date}}"
        />
        <Select
          id="birthCountry6"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          emptyMessage="No options"
          label="Birth Country"
          labelPosition="top"
          labels="{{item.a2 }} - {{ item.labels.en }}"
          overlayMaxHeight={375}
          readOnly="true"
          showSelectionIndicator={true}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.countryISO2}}"
          values="{{item.a2 }} "
        />
        <TextInput
          id="regionOrCountyRemPre2"
          hidden=""
          label="RegionOrCounty"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty}}"
        />
        <Multiselect
          id="nationalities6"
          data="{{ NationalitiesList.value }}"
          emptyMessage="No options"
          label="Nationalities"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          readOnly="true"
          showSelectionIndicator={true}
          value="{{CurrentSelectedContact.value.personalInfo.item.nationalities}}"
          values="{{item.code }} "
          wrapTags={true}
        />
        <Select
          id="gender6"
          data="{{ GendersList.value }}"
          disabled=""
          emptyMessage="No options"
          label="Gender"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          readOnly="true"
          showSelectionIndicator={true}
          value="{{CurrentSelectedContact.value.personalInfo.item.cleanedGender}}"
          values="{{ item.code }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton40"
          submit={true}
          submitTargetId="personalInfoForm6"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text522" value="###### Address" verticalAlign="center" />
    <Include src="./newAddressForm14.rsx" />
  </View>
</Container>
