<Container
  id="AboutContainer3"
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
    <Text id="collapsibleTitle54" value="#### About" verticalAlign="center" />
    <ToggleButton
      id="collapsibleToggle54"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ AboutContainer3.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="AboutContainer3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Include src="./disqualificationContainer3.rsx" />
    <Include src="./NamesContainer5.rsx" />
    <Include src="./NamesContainer6.rsx" />
    <Text
      id="text469"
      value="###### Personal Information"
      verticalAlign="center"
    />
    <Checkbox
      id="deletePersonalInfoFlag5"
      hidden="{{ !deletePersonalInfoFlag5.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName15"
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
      id="personalInfoForm5"
      disabled="{{ deletePersonalInfoFlag5.value || !CurrentSelectedContact.value.personalInfo }}"
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
        <Text id="formTitle18" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="birthDate5"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Birth Date"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date}}"
        />
        <TextInput
          id="placeOfBirth5"
          hidden=""
          label="Place of Birth"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.city}}"
        />
        <Date
          id="deathDate5"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          hidden="{{!isDeceased7.value}}"
          iconBefore="bold/interface-calendar"
          label="Death Date"
          labelPosition="top"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.date}}"
        />
        <Select
          id="birthCountry5"
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
          id="regionOrCountyRemPre"
          hidden=""
          label="RegionOrCounty"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty}}"
        />
        <Checkbox
          id="isDeceased7"
          disabled="true"
          label="Is Deceased"
          labelWidth="70"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.isDeceased}}"
        />
        <Multiselect
          id="nationalities5"
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
          id="gender5"
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
          id="formButton13"
          submit={true}
          submitTargetId="personalInfoForm5"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text468" value="###### Address" verticalAlign="center" />
    <Include src="./newAddressForm9.rsx" />
    <Form
      id="form5"
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
          id="formTitle17"
          value="###### License Information"
          verticalAlign="center"
        />
      </Header>
      <Footer>
        <Button
          id="formButton12"
          submit={true}
          submitTargetId="form5"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
