<Container
  id="AboutContainer1"
  disabled="{{CheckUserRole.data || CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  overflowType="hidden"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="collapsibleTitle27" value="#### About" verticalAlign="center" />
    <ToggleButton
      id="collapsibleToggle27"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ AboutContainer1.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="AboutContainer1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="ae4bc" viewKey="View 1">
    <Include src="./disqualificationContainer.rsx" />
    <Include src="./NamesContainer.rsx" />
    <Include src="./NamesContainer2.rsx" />
    <Text
      id="text433"
      value="###### Personal Information"
      verticalAlign="center"
    />
    <Checkbox
      id="deletePersonalInfoFlag"
      hidden="{{ !deletePersonalInfoFlag.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deletePersonalInfo"
      disabled="{{ CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value }}"
      hidden={
        '{{ deletePersonalInfoFlag.value || !CurrentSelectedContact.value.personalInfo || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !deletePersonalInfo.disabled }}"
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
      id="personalInfoForm"
      disabled="{{ deletePersonalInfoFlag.value || !CurrentSelectedContact.value.personalInfo }}"
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
        <Text id="formTitle8" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Text id="text502" value="**Birth Date**" verticalAlign="center" />
        <Select
          id="birthYear"
          data="{{  _.range(new Date().getFullYear() - 99, new Date().getFullYear() -17).map(day => day.toString())}}"
          label="Year"
          labelPosition="top"
          placeholder="Select Year"
          required=""
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{CurrentSelectedContact.value.personalInfo.item.birth.date ? \n((new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCFullYear().toString() !== birthYear.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? (CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(0,4) !== birthYear.value ? '#99A7C8':'#fff') : birthYear.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date ? 
(new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCFullYear().toString() : 
(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(0,4) : '')}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!birthYear.value) {\n  birthMonth.clearValue();\n  birthDay.clearValue();\n  getNominationStartYears.trigger();\n  getNominationEndYears.trigger();\n}\n  getBirthMonths.trigger();\n  getBirthDays.trigger();\n  getDeathYears.trigger();\n  getDeathMonths.trigger();\n  getDeathDays.trigger();",
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
          id="birthMonth"
          disabled="{{ !birthYear.value }}"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          required=""
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{CurrentSelectedContact.value.personalInfo.item.birth.date ? \n(((new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCMonth() +1).toString().padStart(2, '0') !== birthMonth.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? \n(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) !== '00' && CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) !== birthMonth.value ? '#99A7C8': \nCurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) === '00' && birthMonth.value ? '#99A7C8' : '#fff') : birthMonth.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{ CurrentSelectedContact.value.personalInfo.item.birth.date ? ((new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCMonth() +1 ).toString().padStart(2, '0') : 
CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) !== '00' ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(4,6) : '' : ''
}}"
        >
          <Option
            id="b6f69"
            disabled="{{  !getBirthMonths.data.includes('01')}}"
            label="January"
            value={'"01"'}
          />
          <Option
            id="2594e"
            disabled="{{  !getBirthMonths.data.includes('02')}}"
            label="February"
            value={'"02"'}
          />
          <Option
            id="2bb57"
            disabled="{{  !getBirthMonths.data.includes('03')}}"
            label="March"
            value={'"03"'}
          />
          <Option
            id="2dc91"
            disabled="{{  !getBirthMonths.data.includes('04')}}"
            label="April"
            value={'"04"'}
          />
          <Option
            id="84341"
            disabled="{{  !getBirthMonths.data.includes('05')}}"
            label="May"
            value={'"05"'}
          />
          <Option
            id="f03e9"
            disabled="{{  !getBirthMonths.data.includes('06')}}"
            label="June"
            value={'"06"'}
          />
          <Option
            id="18677"
            disabled="{{  !getBirthMonths.data.includes('07')}}"
            label="July"
            value={'"07"'}
          />
          <Option
            id="42cd9"
            disabled="{{  !getBirthMonths.data.includes('08')}}"
            label="August"
            value={'"08"'}
          />
          <Option
            id="eb1c2"
            disabled="{{  !getBirthMonths.data.includes('09')}}"
            label="September"
            value={'"09"'}
          />
          <Option
            id="84c21"
            disabled="{{  !getBirthMonths.data.includes('10')}}"
            label="October"
            value={'"10"'}
          />
          <Option
            id="d8c2c"
            disabled="{{  !getBirthMonths.data.includes('11')}}"
            label="November"
            value={'"11"'}
          />
          <Option
            id="95e70"
            disabled="{{  !getBirthMonths.data.includes('12')}}"
            label="December"
            value={'"12"'}
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!birthMonth.value) {\n  birthDay.clearValue();\n}\n  getBirthDays.trigger();\n  getDeathYears.trigger();\n  getDeathMonths.trigger();\n  getDeathDays.trigger();",
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
          id="birthDay"
          data={
            '{{  Array.from(\n  { length: new Date(birthYear.value, birthMonth.value, 0).getDate() },\n  (_, i) => (i + 1).toString().padStart(2, "0")\n)}}'
          }
          disabled="{{ !birthMonth.value}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          required=""
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{CurrentSelectedContact.value.personalInfo.item.birth.date ? \n(((new Date(CurrentSelectedContact.value.personalInfo.item.birth.date)).getUTCDate()).toString().padStart(2, '0') !== birthDay.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? \n(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) !== '00' && CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) !== birthDay.value ? '#99A7C8': \nCurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) === '00' && birthDay.value ? '#99A7C8' : '#fff' ) : birthDay.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.date ? (new Date(CurrentSelectedContact.value.personalInfo.item.birth.date).getUTCDate()).toString().padStart(2, '0') : CurrentSelectedContact.value.miscellaneous.item.rawBirthDate ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) !== '00' ? CurrentSelectedContact.value.miscellaneous.item.rawBirthDate.slice(6,8) : '' : ''}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "  getDeathYears.trigger();\n  getDeathMonths.trigger();\n  getDeathDays.trigger();\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <TextInput
          id="placeOfBirth"
          hidden=""
          label="Place of Birth"
          labelPosition="top"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.city ? (CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.city !== placeOfBirth.value ? '#99A7C8' : '#FFFFFF') : (placeOfBirth.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.city}}"
        />
        <TextInput
          id="regionOrCounty"
          hidden=""
          label="Region or County"
          labelPosition="top"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty ? (CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty !== regionOrCounty.value ? '#99A7C8' : '#FFFFFF') : (regionOrCounty.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.regionOrCounty}}"
        />
        <Select
          id="gender"
          data="{{ GendersList.value }}"
          disabled=""
          emptyMessage="No options"
          label="Gender"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.cleanedGender ? (CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.cleanedGender !== gender.value ? '#99A7C8' : '#FFFFFF'): (gender.value ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.cleanedGender ? CurrentSelectedContact.value.personalInfo.item.cleanedGender : ''}}"
          values="{{ item.code }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (gender.value === 'M') {\n  salutation.setValue('Mr');\n      if(CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== \"1\").length !== 0) {\n    salutation1.setValue('Mr');\n  }\n\n} else {\n  salutation.setValue('Ms');\n  if(CurrentSelectedContact.value.names.filter((o)=> o.item.languageType !== \"1\").length !== 0) {\n    salutation1.setValue('Ms');\n  }\n}",
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
          id="birthCountry"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          emptyMessage="No options"
          label="Birth Country"
          labelPosition="top"
          labels="{{item.a2 }} - {{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select a Country"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.countryISO2 ? (CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.birth.countryISO2 !== birthCountry.value ? '#99A7C8' : '#FFFFFF') : (birthCountry.value ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.birth.countryISO2 ? CurrentSelectedContact.value.personalInfo.item.birth.countryISO2 : undefined}}"
          values="{{item.a2 }} "
        />
        <Multiselect
          id="nationalities"
          data="{{ NationalitiesList.value }}"
          emptyMessage="No options"
          label="Nationalities"
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
                  "{{ CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.nationalities ? (CurrentSelectedContact.value.personalInfo && CurrentSelectedContact.value.personalInfo.item.nationalities.join(', ') !==    nationalities.value.join(', ') ? '#99A7C8' : '#FFFFFF') : (nationalities.value.length !== 0 ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.personalInfo.item.nationalities}}"
          values="{{item.code }} "
          wrapTags={true}
        />
        <Checkbox
          id="isDeceased"
          label="Is Deceased"
          labelWidth="70"
          value="{{CurrentSelectedContact.value.personalInfo.item.death.isDeceased}}"
        />
        <Container
          id="deathDateContainer"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{!isDeceased.value}}"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle202"
              margin="0"
              value="**Death Date**"
              verticalAlign="center"
            />
          </Header>
          <View id="41ac0" viewKey="View 1">
            <Select
              id="deathYear"
              allowCustomValue={true}
              data="{{ getDeathYears.data }}"
              label="Year"
              labelPosition="top"
              placeholder="Select Year"
              required=""
              showClear={true}
              showSelectionIndicator={true}
              style={{
                ordered: [
                  {
                    background:
                      "{{CurrentSelectedContact.value.personalInfo.item.death.date ? \n((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCFullYear().toString() !== deathYear.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? (CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(0,4) !== deathYear.value ? '#99A7C8':'#fff') : deathYear.value ? '#99A7C8' : '#fff')}}",
                  },
                ],
              }}
              value="{{CurrentSelectedContact.value.personalInfo.item.death.date ? 
(new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCFullYear().toString() : 
(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(0,4) : '')}}"
              values=""
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "if (!deathYear.value) {\n  deathMonth.clearValue();\n  deathDay.clearValue(); \n}\n  getDeathMonths.trigger();\n  getDeathDays.trigger();",
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
              id="deathMonth"
              captionByIndex=""
              colorByIndex=""
              data=""
              disabled="{{ !deathYear.value }}"
              disabledByIndex=""
              fallbackTextByIndex=""
              hiddenByIndex=""
              iconByIndex=""
              imageByIndex=""
              itemMode="static"
              label="Month"
              labelPosition="top"
              labels=""
              placeholder="Select a month"
              required=""
              showClear={true}
              showSelectionIndicator={true}
              style={{
                ordered: [
                  {
                    background:
                      "{{CurrentSelectedContact.value.personalInfo.item.death.date ? \n(((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCMonth() +1).toString().padStart(2, '0') !== deathMonth.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? (CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) !== deathMonth.value && CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) !== '00' ? '#99A7C8':'#fff') : deathMonth.value ? '#99A7C8' : '#fff')}}",
                  },
                ],
              }}
              tooltipByIndex=""
              value="{{ CurrentSelectedContact.value.personalInfo.item.death.date ? ((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCMonth() +1 ).toString().padStart(2, '0') : 
CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) !== '00' ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(4,6) : '' : ''
}}"
              values=""
            >
              <Option
                id="7aa84"
                disabled="{{  !getDeathMonths.data.includes('01')}}"
                hidden={false}
                label="January"
                value={'"01"'}
              />
              <Option
                id="24825"
                disabled="{{  !getDeathMonths.data.includes('02')}}"
                hidden={false}
                label="February"
                value={'"02"'}
              />
              <Option
                id="ac624"
                disabled="{{  !getDeathMonths.data.includes('03')}}"
                hidden={false}
                label="March"
                value={'"03"'}
              />
              <Option
                id="0cff5"
                disabled="{{  !getDeathMonths.data.includes('04')}}"
                hidden={false}
                label="April"
                value={'"04"'}
              />
              <Option
                id="d3b08"
                disabled="{{  !getDeathMonths.data.includes('05')}}"
                hidden={false}
                label="May"
                value={'"05"'}
              />
              <Option
                id="1df03"
                disabled="{{  !getDeathMonths.data.includes('06')}}"
                hidden={false}
                label="June"
                value={'"06"'}
              />
              <Option
                id="e5d52"
                disabled="{{  !getDeathMonths.data.includes('07')}}"
                hidden={false}
                label="July"
                value={'"07"'}
              />
              <Option
                id="1a772"
                disabled="{{  !getDeathMonths.data.includes('08')}}"
                hidden={false}
                label="August"
                value={'"08"'}
              />
              <Option
                id="c7c02"
                disabled="{{  !getDeathMonths.data.includes('09')}}"
                hidden={false}
                label="September"
                value={'"09"'}
              />
              <Option
                id="377dc"
                disabled="{{  !getDeathMonths.data.includes('10')}}"
                hidden={false}
                label="October"
                value={'"10"'}
              />
              <Option
                id="c8fac"
                disabled="{{  !getDeathMonths.data.includes('11')}}"
                hidden={false}
                label="November"
                value={'"11"'}
              />
              <Option
                id="dfec1"
                disabled="{{  !getDeathMonths.data.includes('12')}}"
                hidden={false}
                label="December"
                value={'"12"'}
              />
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "if (!deathMonth.value) {\n  deathDay.clearValue();\n  \n}\ngetDeathDays.trigger();",
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
              id="deathDay"
              allowCustomValue={true}
              data="{{ getDeathDays.data }}"
              disabled="{{ !deathMonth.value }}"
              label="Day"
              labelPosition="top"
              labels="{{ _.startCase(item) }}"
              placeholder="Select a day"
              required=""
              showClear={true}
              showSelectionIndicator={true}
              style={{
                ordered: [
                  {
                    background:
                      "{{CurrentSelectedContact.value.personalInfo.item.death.date ? \n(((new Date(CurrentSelectedContact.value.personalInfo.item.death.date)).getUTCDate()).toString().padStart(2, '0') !== deathDay.value ? '#99A7C8' : '#fff') : \n(CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? (CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) !== deathDay.value && CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) !== '00' ? '#99A7C8':'#fff') : deathDay.value ? '#99A7C8' : '#fff')}}",
                  },
                ],
              }}
              value="{{CurrentSelectedContact.value.personalInfo.item.death.date ? (new Date(CurrentSelectedContact.value.personalInfo.item.death.date).getUTCDate()).toString().padStart(2, '0') : CurrentSelectedContact.value.miscellaneous.item.rawDeathDate ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) !== '00' ? CurrentSelectedContact.value.miscellaneous.item.rawDeathDate.slice(6,8) : '' : ''}}"
              values="{{ item }}"
            />
          </View>
        </Container>
      </Body>
      <Footer>
        <Button
          id="formButton4"
          submit={true}
          submitTargetId="personalInfoForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Text id="text430" value="###### Address" verticalAlign="center" />
    <Checkbox
      id="addressDeleteFlag1"
      hidden="{{ !addressDeleteFlag1.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteAddress"
      disabled="{{ CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value }}"
      hidden={
        '{{ addressDeleteFlag1.value || !CurrentSelectedContact.value.addresses || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !deleteAddress.disabled }}"
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { additionalScope: { ordered: [{ fieldName: "address" }] } },
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
    <Include src="./newAddressForm3.rsx" />
    <Text id="text474" value="###### Contact Info" verticalAlign="center" />
    <Checkbox
      id="contactDeleteFlag"
      hidden="{{ !contactDeleteFlag.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteContactInfo"
      disabled="{{ CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value }}"
      hidden={
        '{{ contactDeleteFlag.value || !CurrentSelectedContact.value.contactInformations || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !deleteContactInfo.disabled }}"
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { additionalScope: { ordered: [{ fieldName: "contact" }] } },
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
      id="form6"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle20" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="phoneNumber1"
          customValidation={
            "{{ CurrentSelectedContact.value.contactInformations && CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"1\") ? ( CurrentSelectedContact.value.contactInformations?.find((o) => o.item.type === \"1\").item.value !== phoneNumber1.value ? (phoneNumber1.value !== '' ? (/^[0-9+\\-()\\s]+$/.test(phoneNumber1.value) ? '' : 'Valid values include numbers, Spaces, +, -, ()') : ('')) : ('')) : (phoneNumber1.value !== '' ? (/^[0-9+\\-()\\s]+$/.test(phoneNumber1.value) ? '' : 'Valid values include numbers, Spaces, +, -, ()') : '')}}"
          }
          disabled="{{ !CurrentSelectedContact.value.contactInformations ||  CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '1').length === 0 || contactDeleteFlag.value}}"
          hidden=""
          iconBefore="bold/phone-telephone-circle"
          label="Phone"
          labelPosition="top"
          marginType="normal"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.contactInformations && CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"1\") ?  (CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"1\").item.value !== phoneNumber1.value ? '#99A7C8' : '#FFFFFF') : (phoneNumber1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          tooltipText="Valid values include numbers, Spaces, +, -, ()"
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '1')[0].item.value}}"
        >
          <Event
            event="submit"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="ResetRolesFields"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="faxNumber1"
          disabled="{{  !CurrentSelectedContact.value.contactInformations ||  CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '3').length === 0 || contactDeleteFlag.value || contactDeleteFlag.value}}"
          hidden=""
          iconBefore="bold/mail-inbox-envelope-open"
          label="Fax"
          labelPosition="top"
          marginType="normal"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.contactInformations && CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"3\") ? (CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"3\").item.value !== faxNumber1.value ? '#99A7C8' : '#FFFFFF') : (faxNumber1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '3')[0].item.value}}"
        />
        <TextInput
          id="email1"
          disabled="{{  !CurrentSelectedContact.value.contactInformations ||  CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '2').length === 0}}"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedContact.value.contactInformations && CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"2\") ? (CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === \"2\").item.value !== email1.value ? '#99A7C8' : '#FFFFFF') : (email1.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
              },
            ],
          }}
          value="{{CurrentSelectedContact.value.contactInformations.filter((o)=> o.item.type === '2')[0].item.value}}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton15"
          submit={true}
          submitTargetId="form6"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
