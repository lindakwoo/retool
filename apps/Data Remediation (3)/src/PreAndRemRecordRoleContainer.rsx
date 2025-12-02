<Container
  id="PreAndRemRecordRoleContainer"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle197"
      value="#### View Record"
      verticalAlign="center"
    />
  </Header>
  <View id="21431" viewKey="View 1">
    <Form
      id="form25"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle40" value="###### Role" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="currentRole3"
          data="{{ FunctionCodesList.value }}"
          emptyMessage="No options"
          hidden="true"
          label="Current Role"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.functionCode !== currentRole3.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.functionCode }}"
          values="{{ item.code }}"
        />
        <Text
          id="text498"
          value="**{{CurrentSelectedRole.value.function.item.misc.functionOriginals}}**"
          verticalAlign="center"
        />
        <Select
          id="functionPreAndRemRoleStatus"
          allowCustomValue={true}
          data="{{ RoleStatusList.value }}"
          disabled=""
          emptyMessage="No options"
          label="Role Status"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select a Role"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.currentPrevious }}"
          values="{{ item.code }}"
        />
        <Text id="text499" value="**Nomination Date**" verticalAlign="center" />
        <Select
          id="functionPreAndRemBirthYear"
          allowCustomValue={true}
          data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
          label="Year"
          labelPosition="top"
          placeholder="YYYY"
          showSelectionIndicator={true}
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        />
        <Select
          id="functionPreAndRemBirthMonth"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showSelectionIndicator={true}
          value="{{ CurrentSelectedRole.value.function.item.nominationDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1 ) : ''}}"
        >
          <Option id="54a68" label="January" value="01" />
          <Option id="9842a" label="February" value="02" />
          <Option id="bafe6" label="March" value="03" />
          <Option id="598aa" label="April" value="04" />
          <Option id="27725" label="May" value="05" />
          <Option id="b6992" label="June" value="06" />
          <Option id="a4e12" label="July" value="07" />
          <Option id="80cf0" label="August" value="08" />
          <Option id="52690" label="September" value="09" />
          <Option id="0e3b7" label="October" value={10} />
          <Option id="dcc38" label="November" value={11} />
          <Option id="58d14" label="December" value={12} />
        </Select>
        <Select
          id="functionPreAndRemBirthDay"
          data="{{  Array.from(
  { length: (functionPreAndRemBirthYear.value === new Date().getUTCFullYear() && functionPreAndRemBirthMonth.value === (new Date().getUTCMonth() + 1)) ? new Date().getUTCDate() : new Date(functionPreAndRemBirthYear.value, functionPreAndRemBirthMonth.value, 0).getUTCDate() },
  (_, i) => (i + 1)
)}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showSelectionIndicator={true}
          value="{{CurrentSelectedRole.value.function.item.nominationDate.precision > 10 ? new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCDate() : ''}}"
        />
        <Text
          id="text500"
          value="**Nomination End Date**"
          verticalAlign="center"
        />
        <Select
          id="functionPreAndRemYear"
          allowCustomValue={true}
          data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
          label="Year"
          labelPosition="top"
          placeholder="YYYY"
          showSelectionIndicator={true}
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        />
        <Select
          id="functionPreAndRemMonth"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showSelectionIndicator={true}
          value="{{ CurrentSelectedRole.value.function.item.nominationEndDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1 ) : ''}}"
        >
          <Option id="54a68" label="January" value="01" />
          <Option id="9842a" label="February" value="02" />
          <Option id="bafe6" label="March" value="03" />
          <Option id="598aa" label="April" value="04" />
          <Option id="27725" label="May" value="05" />
          <Option id="b6992" label="June" value="06" />
          <Option id="a4e12" label="July" value="07" />
          <Option id="80cf0" label="August" value="08" />
          <Option id="52690" label="September" value="09" />
          <Option id="0e3b7" label="October" value={10} />
          <Option id="dcc38" label="November" value={11} />
          <Option id="58d14" label="December" value={12} />
        </Select>
        <Select
          id="functionPreAndRemDay"
          data="{{  Array.from(
  { length: (functionPreAndRemYear.value === new Date().getUTCFullYear() && functionPreAndRemMonth.value === (new Date().getUTCMonth() + 1)) ? new Date().getUTCDate() : new Date(functionPreAndRemYear.value, functionPreAndRemMonth.value, 0).getUTCDate() },
  (_, i) => (i + 1)
)}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showSelectionIndicator={true}
          value="{{CurrentSelectedRole.value.function.item.nominationEndDate.precision > 10 ? new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCDate(): ''}}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton35"
          submit={true}
          submitTargetId="form25"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="functionPreAndRemPermissionForm"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle37"
          value="###### Permissions"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="functionPreAndRemShareholder"
          data="{{ ShareholderList.value }}"
          emptyMessage="No options"
          label="Share Holder"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.permissions.shareholder !== functionPreAndRemShareholder.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.permissions.shareholder }}"
          values="{{ item.code }}"
        />
        <Checkbox
          id="functionPreAndRemSignatoryRight"
          label="Signatory Right"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.signatoryRight }}"
        />
        <Select
          id="executivePower3"
          data="{{ ExecutivePowerList.value }}"
          emptyMessage="No options"
          hidden="true"
          label="Executive Power"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.permissions.executivePower !== executivePower3.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.permissions.executivePower }}"
          values="{{ item.code }}"
        />
        <Checkbox
          id="functionPreAndRemAttorneyPower"
          label="Attorney Power"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.attorneyPower }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton32"
          submit={true}
          submitTargetId="functionPreAndRemPermissionForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="functionPreAndRemExemptionForm"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle38"
          value="###### Exemption"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Date
          id="exemptionFromDate3"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="From Date"
          labelPosition="top"
          value="{{CurrentSelectedRole.value.function.item.exemption.fromDate }}"
        />
        <Date
          id="exemptionToDate3"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="To Date"
          labelPosition="top"
          value="{{ CurrentSelectedRole.value.function.item.exemption.toDate }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton33"
          submit={true}
          submitTargetId="functionPreAndRemExemptionForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="functionPreAndRemCompensationForm"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle39"
          value="###### Compensation"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="functionPreAndRemCurrency"
          allowCustomValue={true}
          colorByIndex=""
          data="{{ Currencies.value }}"
          emptyMessage="No options"
          label="Currency"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.currency !== functionPreAndRemCurrency.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.currency }}"
          values="{{ item.code }}"
        />
        <NumberInput
          id="functionPreAndRemSalary"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Salary"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.salary ?  (CurrentSelectedRole.value.function.item.compensation.salary !== functionPreAndRemSalary.value ? '#99A7C8': '#FFF' ): functionPreAndRemSalary.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.salary }}"
        />
        <NumberInput
          id="functionPreAndRemOtherShortTerm"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Other Short Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.otherShortTerm ?  (CurrentSelectedRole.value.function.item.compensation.otherShortTerm !== functionPreAndRemOtherShortTerm.value ? '#99A7C8': '#FFF' ): functionPreAndRemOtherShortTerm.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherShortTerm }}"
        />
        <NumberInput
          id="functionPreAndRemLongTermIncentivePayout"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Long Term Incentive Payout"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout ?  (CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout !== functionPreAndRemLongTermIncentivePayout.value ? '#99A7C8': '#FFF' ): functionPreAndRemLongTermIncentivePayout.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout }}"
        />
        <NumberInput
          id="functionPreAndRemTotal"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Total"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.total ?  (CurrentSelectedRole.value.function.item.compensation.total !== functionPreAndRemTotal.value ? '#99A7C8': '#FFF' ): functionPreAndRemTotal.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.total }}"
        />
        <TextInput
          id="functionPreAndRemExercisedNumber"
          label="Excercised Number"
          labelPosition="top"
          placeholder="Enter value"
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.number }}"
        />
        <TextInput
          id="functionPreAndRemUnExercisedNumber"
          label="Unexcercised Excercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number }}"
        />
        <TextInput
          id="functionPreAndRemUnExercisedUnexNumber"
          label="Unexcercised Unexcercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number }}"
        />
        <NumberInput
          id="functionPreAndRemBonus"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Bonus"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.bonus ?  (CurrentSelectedRole.value.function.item.compensation.bonus !== functionPreAndRemBonus.value ? '#99A7C8': '#FFF' ): functionPreAndRemBonus.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.bonus }}"
        />
        <NumberInput
          id="functionPreAndRemTotalShortTerm"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Total Short Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.totalShortTerm ?  (CurrentSelectedRole.value.function.item.compensation.totalShortTerm !== functionPreAndRemTotalShortTerm.value ? '#99A7C8': '#FFF' ): functionPreAndRemTotalShortTerm.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.totalShortTerm }}"
        />
        <NumberInput
          id="functionPreAndRemOtherLongTerm"
          currency="{{ functionPreAndRemCurrency.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Other Long Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation.otherLongTerm ?  (CurrentSelectedRole.value.function.item.compensation.otherLongTerm !== functionPreAndRemOtherLongTerm.value ? '#99A7C8': '#FFF' ): functionPreAndRemOtherLongTerm.value !== 0 ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherLongTerm }}"
        />
        <Date
          id="functionPreAndRemDate"
          dateFormat="MMM d, yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Date"
          labelPosition="top"
          value="{{ CurrentSelectedRole.value.function.item.compensation.date }}"
        />
        <TextInput
          id="functionPreAndRemExercisedValue"
          label="Excercised Value"
          labelPosition="top"
          placeholder="Enter value"
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.value }}"
        />
        <TextInput
          id="functionPreAndRemUnExercisedValue"
          label="Unexcercised Excercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value }}"
        />
        <TextInput
          id="functionPreAndRemUnExercisedUnexValue"
          label="Unexcercised Unexcercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton34"
          submit={true}
          submitTargetId="functionPreAndRemCompensationForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Include src="./preandAndRemNewAddressFormIndividual.rsx" />
    <Form
      id="PreAndRemFunctionRoleBiographies"
      disabled="true"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="functionPreAndRemRoleBiographiesFormTitle"
          value="###### Biographies"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <ListViewBeta
          id="functionPreAndRemRoleBiographyList"
          data="{{ CurrentSelectedRole.value.function.item.biographies}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="functionPreAndRemContainer"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle205"
                value="{{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="26a34" viewKey="View 1">
              <TextArea
                id="functionPreAndRemEachRoleBiography"
                label=""
                labelPosition="top"
                maxLines="6"
                minLines="5"
                placeholder="Enter value"
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item ? (item !== functionPreAndRemEachRoleBiography.value ? '#99A7C8': '#FFF' ): functionPreAndRemEachRoleBiography.value ? '#99A7C8': '#FFF' }}",
                    },
                  ],
                }}
                value="{{ item }}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var originalVals = RoleBiographyListValues.value;\n\noriginalVals[i] = functionPreAndRemEachRoleBiography.value;\n\nRoleBiographyListValues.setValue(originalVals);",
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextArea>
            </View>
          </Container>
        </ListViewBeta>
      </Body>
    </Form>
  </View>
</Container>
