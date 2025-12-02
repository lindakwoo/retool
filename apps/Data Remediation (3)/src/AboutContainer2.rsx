<Container
  id="AboutContainer2"
  disabled="{{ValidateUserRole.data }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  overflowType="hidden"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="collapsibleTitle53" value="#### About" verticalAlign="center" />
    <ToggleButton
      id="collapsibleToggle53"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ AboutContainer2.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="AboutContainer2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Include src="./disqualificationContainer2.rsx" />
    <Include src="./NamesContainer3.rsx" />
    <Include src="./NamesContainer4.rsx" />
    <Text
      id="text457"
      value="###### Personal Information"
      verticalAlign="center"
    />
    <Checkbox
      id="deletePersonalInfoFlag4"
      hidden="{{ !deletePersonalInfoFlag4.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName9"
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
    <Text id="text503" value="**Birth Date**" verticalAlign="center" />
    <Form
      id="personalInfoForm4"
      disabled="{{ deletePersonalInfoFlag4.value || !CurrentSelectedContact.value.personalInfo }}"
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
        <Text id="formTitle12" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="birthYear2"
          allowCustomValue={true}
          data="{{  _.range(new Date().getFullYear() - 99, new Date().getFullYear() -17).map(day => day.toString())}}"
          label="Year"
          labelPosition="top"
          readOnly="true"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date ? 
(new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCFullYear().toString() : 
(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(0,4) : '')}}"
          values="{{ item }}"
        />
        <Select
          id="birthMonth2"
          itemMode="static"
          label="Month"
          labelPosition="top"
          readOnly="true"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          value="{{ CurrentSelectedContact.value.personalInfo.item.birth.date ? ((new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCMonth() +1 ).toString().padStart(2, '0') : 
CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) : ''
}}"
        >
          <Option id="b6f69" label="January" value={'"01"'} />
          <Option id="2594e" label="February" value={'"02"'} />
          <Option id="2bb57" label="March" value={'"03"'} />
          <Option id="2dc91" label="April" value={'"04"'} />
          <Option id="84341" label="May" value={'"05"'} />
          <Option id="f03e9" label="June" value={'"06"'} />
          <Option id="18677" label="July" value={'"07"'} />
          <Option id="42cd9" label="August" value={'"08"'} />
          <Option id="eb1c2" label="September" value={'"09"'} />
          <Option id="84c21" label="October" value={'"10"'} />
          <Option id="d8c2c" label="November" value={'"11"'} />
          <Option id="95e70" label="December" value={'"12"'} />
        </Select>
        <Select
          id="birthDay2"
          data="{{  _.range(1, 32).map(day => day.toString().padStart(2, '0'))}}"
          label="Day"
          labelPosition="top"
          readOnly="true"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date ? (new Date(CurrentSelectedContact.value.personalInfo.item.birth.date).getUTCDate()).toString().padStart(2, '0') : CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) : ''}}"
        />
        <TextInput
          id="placeOfBirth4"
          hidden=""
          label="Place of Birth"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.city}}"
        />
        <TextInput
          id="regionOrCounty1"
          hidden=""
          label="Region or County"
          labelPosition="top"
          readOnly="true"
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty}}"
        />
        <Select
          id="gender4"
          data="{{ GendersList.value }}"
          disabled=""
          emptyMessage="No options"
          label="Gender"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          readOnly="true"
          showSelectionIndicator={true}
          value="{{CurrentSelectedContact.value.personalInfo.item.cleanedGender}}"
          values="{{ item.code }}"
        />
        <Select
          id="birthCountry4"
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
        <Multiselect
          id="nationalities4"
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
        <Checkbox
          id="isDeceased6"
          disabled="true"
          label="Is Deceased"
          labelWidth="70"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.isDeceased}}"
        />
        <Container
          id="deathDateContainer2"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{!isDeceased6.value}}"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
        >
          <Header>
            <Text
              id="deathDateeContainer2"
              margin="0"
              value="**Death Date**"
              verticalAlign="center"
            />
          </Header>
          <View id="41ac0" viewKey="View 1">
            <Select
              id="deathYear2"
              allowCustomValue={true}
              data="{{  _.range(new Date(birthYear.value, birthMonth.value, birthDay.value).getFullYear() + 1, new Date().getFullYear() + 1).map(yr => yr.toString())}}"
              label="Year"
              labelPosition="top"
              readOnly="true"
              showClear={true}
              showSelectionIndicator={true}
              style={{ ordered: [{ background: "" }] }}
              value="{{CurrentSelectedContact.value.personalInfo.item.death.date ? 
(new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCFullYear().toString() : 
(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(0,4) : '')}}"
              values="{{ item }}"
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "if (!deathYear2.value) {\n  birthMonth.clearValue();\n  birthDay.clearValue();\n}",
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </Select>
            <Select
              id="deathMonth2"
              itemMode="static"
              label="Month"
              labelPosition="top"
              readOnly="true"
              required=""
              showClear={true}
              showSelectionIndicator={true}
              style={{
                ordered: [
                  {
                    background:
                      "{{CurrentSelectedContact.value.personalInfo.item.death.date ? \n(((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCMonth() +1).toString().padStart(2, '0') !== deathMonth2.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? (CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) !== deathMonth2.value ? '#99A7C8':'#fff') : deathMonth2.value ? '#99A7C8' : '#fff')}}",
                  },
                ],
              }}
              value="{{ CurrentSelectedContact.value.personalInfo.item.death.date ? ((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCMonth() +1 ).toString().padStart(2, '0') : 
CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) : ''
}}"
            >
              <Option id="b6f69" label="January" value={'"01"'} />
              <Option id="2594e" label="February" value={'"02"'} />
              <Option id="2bb57" label="March" value={'"03"'} />
              <Option id="2dc91" label="April" value={'"04"'} />
              <Option id="84341" label="May" value={'"05"'} />
              <Option id="f03e9" label="June" value={'"06"'} />
              <Option id="18677" label="July" value={'"07"'} />
              <Option id="42cd9" label="August" value={'"08"'} />
              <Option id="eb1c2" label="September" value={'"09"'} />
              <Option id="84c21" label="October" value={'"10"'} />
              <Option id="d8c2c" label="November" value={'"11"'} />
              <Option id="95e70" label="December" value={'"12"'} />
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "if (!deathMonth2.value) {\n  birthDay.clearValue();\n}",
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </Select>
            <Select
              id="deathDay2"
              allowCustomValue={true}
              data="{{  _.range(1, 32).map(day => day.toString().padStart(2, '0'))}}"
              label="Day"
              labelPosition="top"
              readOnly="true"
              showClear={true}
              showSelectionIndicator={true}
              style={{ ordered: [{ background: "" }] }}
              value="{{CurrentSelectedContact.value.personalInfo.item.death.date ? (new Date(CurrentSelectedContact.value.personalInfo.item.death.date).getUTCDate()).toString().padStart(2, '0') : CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) !== '00' ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) : '' : ''}}"
            />
          </View>
        </Container>
      </Body>
      <Footer>
        <Button
          id="formButton8"
          submit={true}
          submitTargetId="personalInfoForm4"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text456" value="###### Address" verticalAlign="center" />
    <Include src="./newAddressForm8.rsx" />
    <Form
      id="form7"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle21" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="phoneNumber9"
          hidden=""
          iconBefore="bold/phone-telephone-circle"
          label="Phone"
          labelPosition="top"
          marginType="normal"
          readOnly="true"
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '1')[0].item.value}}"
        />
        <TextInput
          id="faxNumber9"
          hidden=""
          iconBefore="bold/mail-inbox-envelope-open"
          label="Fax"
          labelPosition="top"
          marginType="normal"
          readOnly="true"
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '3')[0].item.value}}"
        />
        <TextInput
          id="email6"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          readOnly="true"
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '2')[0].item.value}}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton16"
          submit={true}
          submitTargetId="form7"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
