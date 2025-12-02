<Container
  id="GoldenRecordRoleContainer"
  disabled="true"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle195"
      value="#### Golden Record"
      verticalAlign="center"
    />
  </Header>
  <View id="21431" viewKey="View 1">
    <Form
      id="form21"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle36" value="###### Role" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="currentRole2"
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
                  "{{ CurrentSelectedRole.value.functionCode !== currentRole2.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.functionCode }}"
          values="{{ item.code }}"
        />
        <TextInput
          id="suppressStatus2"
          label="State"
          labelPosition="top"
          placeholder="Enter value"
          readOnly="true"
          value="{{ CurrentSelectedRole.value.state.toUpperCase() === 'ACTIVE' ? 'NOT SUPPRESSED' : CurrentSelectedRole.value.state.toUpperCase() }}"
        />
        <Select
          id="roleStatus2"
          captionByIndex=""
          colorByIndex=""
          data="{{ RoleStatusList.value.filter((e)=> e.code <=2) }}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="Role Status"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          tooltipByIndex=""
          value="{{ CurrentSelectedRole.value.function.item.historizationStatus === 5 || CurrentSelectedRole.value.function.item.historizationStatus === 4 || CurrentSelectedRole.value.function.item.historizationStatus === 3 
 ?  CurrentSelectedRole.value.function.item.currentPrevious : CurrentSelectedRole.value.function.item.historizationStatus   }}"
          values="{{ item.code }}"
        />
        <Text id="text496" value="**Nomination Date**" verticalAlign="center" />
        <Select
          id="year6"
          allowCustomValue={true}
          data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
          label="Year"
          labelPosition="top"
          placeholder="YYYY"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear() !== nominationYear.value ? '' : '#fff'}}",
              },
            ],
          }}
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        />
        <Select
          id="month6"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showSelectionIndicator={true}
          value="{{( CurrentSelectedRole.value.function.item.nominationDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1 ) : '').toString()}}"
        >
          <Option id="54a68" label="January" value={'"01"'} />
          <Option id="9842a" label="February" value={'"02"'} />
          <Option id="bafe6" label="March" value={'"03"'} />
          <Option id="598aa" label="April" value={'"04"'} />
          <Option id="27725" label="May" value={'"05"'} />
          <Option id="b6992" label="June" value={'"06"'} />
          <Option id="a4e12" label="July" value={'"07"'} />
          <Option id="80cf0" label="August" value={'"08"'} />
          <Option id="52690" label="September" value={'"09"'} />
          <Option id="0e3b7" label="October" value={'"10"'} />
          <Option id="dcc38" label="November" value={'"11"'} />
          <Option id="58d14" label="December" value={'"12"'} />
        </Select>
        <Select
          id="day6"
          data="{{  _.range(1, 32).map(day => day.toString().padStart(2, '0'))}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showSelectionIndicator={true}
          value="{{ CurrentSelectedRole.value.function.item.nominationDate && CurrentSelectedRole.value.function.item.nominationDate.precision > 10 ?(moment(CurrentSelectedRole.value.function.item.nominationDate.date).date()).toString().padStart(2, '0') : '' }}"
        />
        <Text
          id="text497"
          value="**Nomination End Date**"
          verticalAlign="center"
        />
        <Select
          id="year7"
          allowCustomValue={true}
          data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
          label="Year"
          labelPosition="top"
          placeholder="YYYY"
          showSelectionIndicator={true}
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getNominationStartYears"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="month10"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showSelectionIndicator={true}
          value="{{ (CurrentSelectedRole.value.function.item.nominationEndDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1 ) : '').toString()}}"
        >
          <Option id="54a68" label="January" value={'"01"'} />
          <Option id="9842a" label="February" value={'"02"'} />
          <Option id="bafe6" label="March" value={'"03"'} />
          <Option id="598aa" label="April" value={'"04"'} />
          <Option id="27725" label="May" value={'"05"'} />
          <Option id="b6992" label="June" value={'"06"'} />
          <Option id="a4e12" label="July" value={'"07"'} />
          <Option id="80cf0" label="August" value={'"08"'} />
          <Option id="52690" label="September" value={'"09"'} />
          <Option id="0e3b7" label="October" value={'"10"'} />
          <Option id="dcc38" label="November" value={'"11"'} />
          <Option id="58d14" label="December" value={'"12"'} />
        </Select>
        <Select
          id="day7"
          data="{{  _.range(1, 32).map(day => day.toString().padStart(2, '0'))}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showSelectionIndicator={true}
          value="{{ CurrentSelectedRole.value.function.item.nominationEndDate.precision > 10 ?(moment(CurrentSelectedRole.value.function.item.nominationEndDate.date).date()).toString().padStart(2, '0') : '' }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton31"
          submit={true}
          submitTargetId="form21"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form18"
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
          id="formTitle33"
          value="###### Permissions"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="executivePower2"
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
                  "{{ CurrentSelectedRole.value.function.item.permissions.executivePower !== executivePower2.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.permissions.executivePower }}"
          values="{{ item.code }}"
        />
        <Select
          id="shareholder2"
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
                  "{{ CurrentSelectedRole.value.function.item.permissions.shareholder !== shareholder2.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.permissions.shareholder }}"
          values="{{ item.code }}"
        />
        <Checkbox
          id="attorneyPower2"
          label="Attorney Power"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.attorneyPower }}"
        />
        <Checkbox
          id="signatoryRight2"
          label="Signatory Right"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.signatoryRight }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton28"
          submit={true}
          submitTargetId="form18"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form19"
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
          id="formTitle34"
          value="###### Exemption"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Date
          id="exemptionFromDate2"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="From Date"
          labelPosition="top"
          value="{{CurrentSelectedRole.value.function.item.exemption.fromDate }}"
        />
        <Date
          id="exemptionToDate2"
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
          id="formButton29"
          submit={true}
          submitTargetId="form19"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form20"
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
          id="formTitle35"
          value="###### Compensation"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="currency2"
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
                  "{{ CurrentSelectedRole.value.function.item.compensation.currency !== currency2.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.currency }}"
          values="{{ item.code }}"
        />
        <NumberInput
          id="salary2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Salary"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.salary }}"
        />
        <NumberInput
          id="otherShortTerm2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Other Short Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherShortTerm }}"
        />
        <NumberInput
          id="longTermIncentivePayout2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Long Term Incentive Payout"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout }}"
        />
        <NumberInput
          id="total2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Total"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.total }}"
        />
        <NumberInput
          id="exercisedNumber2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Excercised Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.number }}"
        />
        <NumberInput
          id="unExercisedNumber2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Excercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number }}"
        />
        <NumberInput
          id="unExercisedUnexNumber2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Unexcercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number }}"
        />
        <NumberInput
          id="bonus2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Bonus"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.bonus }}"
        />
        <NumberInput
          id="totalShortTerm2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Total Short Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.totalShortTerm }}"
        />
        <NumberInput
          id="otherLongTerm2"
          allowNull={true}
          currency="{{ currency2.value }}"
          decimalPlaces="0"
          format="currency"
          inputValue={0}
          label="Other Long Term"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [{ background: "" }] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherLongTerm }}"
        />
        <Date
          id="textInput121"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Date"
          labelPosition="top"
          value="{{ CurrentSelectedRole.value.function.item.compensation.date }}"
        />
        <NumberInput
          id="exercisedValue2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Excercised Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{ ordered: [] }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.value }}"
        />
        <NumberInput
          id="unExercisedValue2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Excercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value }}"
        />
        <NumberInput
          id="unExercisedUnexValue2"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Unexcercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton30"
          submit={true}
          submitTargetId="form20"
          text="Submit"
        />
      </Footer>
    </Form>
    <Include src="./newAddressForm13.rsx" />
    <Form
      id="RoleBiographies2"
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
          id="RoleBiographiesFormTitle2"
          value="###### Biographies"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <ListViewBeta
          id="goldenFunctionRoleBiographyList"
          data="{{ CurrentSelectedRole.value.function.item.biographies}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="goldenFunctionBio"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle206"
                value="{{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="26a34" viewKey="View 1">
              <TextArea
                id="goldenfunctionEachRoleBiography"
                label=""
                labelPosition="top"
                maxLines="6"
                minLines="5"
                placeholder="Enter value"
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item ? (item !== goldenfunctionEachRoleBiography.value ? '#99A7C8': '#FFF' ): goldenfunctionEachRoleBiography.value ? '#99A7C8': '#FFF' }}",
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
                        src: "var originalVals = RoleBiographyListValues.value;\n\noriginalVals[i] = goldenfunctionEachRoleBiography.value;\n\nRoleBiographyListValues.setValue(originalVals);",
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
      <Footer>
        <Button
          id="formButton37"
          submit={true}
          submitTargetId="RoleBiographies2"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
