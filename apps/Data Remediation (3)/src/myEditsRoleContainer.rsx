<Container
  id="myEditsRoleContainer"
  disabled="{{ CheckUserRole.data  || bulkEditRolesDisable.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ ordered: [] }}
>
  <Header>
    <Text id="containerTitle193" value="#### My Edits" verticalAlign="center" />
    <Switch
      id="suppressRoleFlag"
      disabled={
        "{{CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\"|| rolesModalOptions.value.readOnly}}"
      }
      hidden="{{ CurrentSelectedRole.value.state === 'suppressed' }}"
      label="Suppress"
      labelAlign="right"
      labelPosition="left"
    />
    <Switch
      id="roleActiveFlag"
      disabled={
        "{{ bulkEditRolesDisable.value || (CurrentUserObj?.value?.user_role[0] === 'uci_analyst' && CurrentUserObj?.value?.level === \"level1\") }}\n"
      }
      hidden="{{ CurrentSelectedRole.value.state === 'active' }}"
      label="Active"
      labelAlign="right"
      labelPosition="left"
    />
  </Header>
  <View id="21431" viewKey="View 1">
    <Form
      id="rolesForm"
      disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle32" value="###### Role" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="currentRole"
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
                  "{{ CurrentSelectedRole.value.functionCode !== currentRole.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.functionCode }}"
          values="{{ item.code }}"
        />
        <TextInput
          id="suppressStatus"
          label="State"
          labelPosition="top"
          placeholder="Enter value"
          readOnly="true"
          value="{{ CurrentSelectedRole.value.state.toUpperCase() === 'ACTIVE' ? 'Not Suppressed' : 'Suppressed' }}"
        />
        <Select
          id="roleStatus"
          captionByIndex=""
          colorByIndex=""
          data="{{ RoleStatusList.value.filter((e)=> e.code <=2) }}"
          disabledByIndex={
            "{{ (item.code == 1 && isDeceased.value) || ( item.code == 1 && ((nominationEndYear.value && moment(`${nominationEndYear.value}-${nominationEndMonth.value || '01'}-${nominationEndDay.value || '01'}`, \"YYYY-MM-DD\").isBefore(moment(), 'day')) \n|| (nominationEndYear.value && !nominationEndMonth.value && !nominationEndDay.value && moment(`${nominationEndYear.value}-01-01`, \"YYYY-MM-DD\").isBefore(moment(), 'year')) \n|| (nominationEndYear.value && nominationEndMonth.value && !nominationEndDay.value && moment(`${nominationEndYear.value}-${nominationEndMonth.value}-01`, \"YYYY-MM-DD\").isBefore(moment(), 'month')) ) ) || (item.code == 1 && CurrentSelectedRole.value.function.item.historizationStatus === 4 && CurrentSelectedRole.value.function.item.currentPrevious === 2)}}"
          }
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
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.historizationStatus === 5 || CurrentSelectedRole.value.function.item.historizationStatus === 4 || CurrentSelectedRole.value.function.item.historizationStatus === 3 \n ?  CurrentSelectedRole.value.function.item.currentPrevious !== roleStatus.value ? '#99A7C8': '#FFF'  : CurrentSelectedRole.value.function.item.historizationStatus !== roleStatus.value ? '#99A7C8': '#FFF'    }}",
              },
            ],
          }}
          tooltipByIndex=""
          value="{{ CurrentSelectedRole.value.function.item.historizationStatus === 5 || CurrentSelectedRole.value.function.item.historizationStatus === 4 || CurrentSelectedRole.value.function.item.historizationStatus === 3 
 ?  CurrentSelectedRole.value.function.item.currentPrevious : CurrentSelectedRole.value.function.item.historizationStatus   }}"
          values="{{ item.code }}"
        />
        <Text id="text492" value="**Nomination Date**" verticalAlign="center" />
        <Select
          id="nominationYear"
          captionByIndex=""
          colorByIndex=""
          data="{{ getNominationStartYears.data }}"
          disabledByIndex=""
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="Year"
          labelPosition="top"
          labels=""
          placeholder="YYYY"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.nominationDate ?  (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear() !== nominationYear.value ? '#99A7C8' : '#fff') : (nominationYear.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          tooltipByIndex=""
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!nominationYear.value) {\n  nominationDay.clearValue();\n  nominationDay.setValue('');\n  nominationMonth.clearValue();\n  nominationMonth.setValue('');\n  \n}\ngetNominationEndYears.trigger();\ngetNominationEndMonths.trigger();\ngetNominationEndDays.trigger();\ngetNominationStartYears.trigger();\ngetNominationStartMonths.trigger();\ngetNominationStartDays.trigger();",
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
          id="nominationMonth"
          disabled="{{ !nominationYear.value || (birthYear.value && Number(nominationYear.value) - Number(birthYear.value) < 18) }}"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.nominationDate && CurrentSelectedRole.value.function.item.nominationDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1 ).toString() !== nominationMonth.value ? '#99A7C8' : '#fff' : nominationMonth.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{( CurrentSelectedRole.value.function.item.nominationDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCMonth() + 1 ) : '').toString()}}"
        >
          <Option
            id="54a68"
            disabled="{{  !getNominationStartMonths.data.includes('01')}}"
            label="January"
            tooltip="{{  getNominationStartMonths.data}}"
            value={'"01"'}
          />
          <Option
            id="9842a"
            disabled="{{ !getNominationStartMonths.data.includes('02') }}"
            label="February"
            value={'"02"'}
          />
          <Option
            id="bafe6"
            disabled="{{ !getNominationStartMonths.data.includes('03') }}"
            label="March"
            value={'"03"'}
          />
          <Option
            id="598aa"
            disabled="{{ !getNominationStartMonths.data.includes('04') }}"
            label="April"
            value={'"04"'}
          />
          <Option
            id="27725"
            disabled="{{ !getNominationStartMonths.data.includes('05') }}"
            label="May"
            value={'"05"'}
          />
          <Option
            id="b6992"
            disabled="{{ !getNominationStartMonths.data.includes('06') }}"
            label="June"
            value={'"06"'}
          />
          <Option
            id="a4e12"
            disabled="{{ !getNominationStartMonths.data.includes('07') }}"
            label="July"
            value={'"07"'}
          />
          <Option
            id="80cf0"
            disabled="{{ !getNominationStartMonths.data.includes('08') }}"
            label="August"
            value={'"08"'}
          />
          <Option
            id="52690"
            disabled="{{ !getNominationStartMonths.data.includes('09') }}"
            label="September"
            value={'"09"'}
          />
          <Option
            id="0e3b7"
            disabled="{{ !getNominationStartMonths.data.includes('10') }}"
            label="October"
            value={'"10"'}
          />
          <Option
            id="dcc38"
            disabled="{{ !getNominationStartMonths.data.includes('11') }}"
            label="November"
            value={'"11"'}
          />
          <Option
            id="58d14"
            disabled="{{ !getNominationStartMonths.data.includes('12') }}"
            label="December"
            value={'"12"'}
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!nominationMonth.value) {\n  nominationDay.clearValue();\n  nominationDay.setValue('');\n  \n}\ngetNominationStartDays.trigger();\ngetNominationEndMonths.trigger();",
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
          id="nominationDay"
          data="{{ getNominationStartDays.data }}"
          disabled="{{ !nominationMonth.value || (Number(nominationYear.value) - Number(birthYear.value) < 18)}}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ \n CurrentSelectedRole.value.function.item.nominationDate && CurrentSelectedRole.value.function.item.nominationDate.precision > 10 ? (moment(CurrentSelectedRole.value.function.item.nominationDate.date).date()).toString().padStart(2, '0') !== nominationDay.value ? '#99A7C8' : '#fff' : (nominationDay.value ? '#99A7C8' : '#fff') }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.nominationDate && CurrentSelectedRole.value.function.item.nominationDate.precision > 10 ?(moment(CurrentSelectedRole.value.function.item.nominationDate.date).date()).toString().padStart(2, '0') : '' }}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getNominationEndMonths"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="change"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getNominationEndDays"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Text
          id="text493"
          value="**Nomination End Date**"
          verticalAlign="center"
        />
        <Select
          id="nominationEndYear"
          data="{{getNominationEndYears.data}}"
          label="Year"
          labelPosition="top"
          placeholder="YYYY"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.nominationEndDate ?  (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCFullYear() !== nominationEndYear.value ? '#99A7C8' : '#fff') : (nominationEndYear.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{ new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCFullYear()}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!nominationEndYear.value) {\n  nominationEndDay.clearValue();\n  nominationEndDay.setValue('');\n  nominationEndMonth.clearValue();\n  nominationEndMonth.setValue('');\n}\ngetNominationEndMonths.trigger();\ngetNominationEndDays.trigger();\ngetNominationStartYears.trigger();\ngetNominationStartMonths.trigger();\ngetNominationStartDays.trigger();",
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
          id="nominationEndMonth"
          disabled="{{ !nominationEndYear.value || (Number(nominationEndYear.value) - Number(birthYear.value) < 18)}}"
          itemMode="static"
          label="Month"
          labelPosition="top"
          placeholder="Select a month"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.nominationEndDate && CurrentSelectedRole.value.function.item.nominationEndDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1 ).toString() !== nominationEndMonth.value ? '#99A7C8' : '#fff' : nominationEndMonth.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{ (CurrentSelectedRole.value.function.item.nominationEndDate.precision > 9 ? (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() < 9 ? '0' + (new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1) : new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCMonth() + 1 ) : '').toString()}}"
        >
          <Option
            id="54a68"
            disabled="{{  !getNominationEndMonths.data.includes('01')}}"
            label="January"
            value={'"01"'}
          />
          <Option
            id="9842a"
            disabled="{{  !getNominationEndMonths.data.includes('02')}}"
            label="February"
            value={'"02"'}
          />
          <Option
            id="bafe6"
            disabled="{{  !getNominationEndMonths.data.includes('03')}}"
            label="March"
            value={'"03"'}
          />
          <Option
            id="598aa"
            disabled="{{  !getNominationEndMonths.data.includes('04')}}"
            label="April"
            value={'"04"'}
          />
          <Option
            id="27725"
            disabled="{{  !getNominationEndMonths.data.includes('05')}}"
            label="May"
            value={'"05"'}
          />
          <Option
            id="b6992"
            disabled="{{  !getNominationEndMonths.data.includes('06')}}"
            label="June"
            value={'"06"'}
          />
          <Option
            id="a4e12"
            disabled="{{  !getNominationEndMonths.data.includes('07')}}"
            label="July"
            value={'"07"'}
          />
          <Option
            id="80cf0"
            disabled="{{  !getNominationEndMonths.data.includes('08')}}"
            label="August"
            value={'"08"'}
          />
          <Option
            id="52690"
            disabled="{{  !getNominationEndMonths.data.includes('09')}}"
            label="September"
            value={'"09"'}
          />
          <Option
            id="0e3b7"
            disabled="{{  !getNominationEndMonths.data.includes('10')}}"
            label="October"
            value={'"10"'}
          />
          <Option
            id="dcc38"
            disabled="{{  !getNominationEndMonths.data.includes('11')}}"
            label="November"
            value={'"11"'}
          />
          <Option
            id="58d14"
            disabled="{{  !getNominationEndMonths.data.includes('12')}}"
            label="December"
            value={'"12"'}
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!nominationEndMonth.value) {\n  nominationEndDay.clearValue();\n  nominationEndDay.setValue('');\n}\ngetNominationEndDays.trigger();\ngetNominationStartMonths.trigger();",
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
          id="nominationEndDay"
          data="{{ getNominationEndDays.data }}"
          disabled="{{ !nominationEndMonth.value || (Number(nominationEndYear.value) - Number(birthYear.value) < 18) }}"
          label="Day"
          labelPosition="top"
          placeholder="Select a day"
          showClear={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.nominationEndDate && CurrentSelectedRole.value.function.item.nominationEndDate.precision > 10 ? \n(moment(CurrentSelectedRole.value.function.item.nominationEndDate.date).date()).toString().padStart(2, '0') !== nominationEndDay.value ? '#99A7C8' : '#fff' : \n(nominationEndDay.value ? '#99A7C8' : '#fff') }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.nominationEndDate.precision > 10 ?(moment(CurrentSelectedRole.value.function.item.nominationEndDate.date).date()).toString().padStart(2, '0') : '' }}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getNominationStartDays"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
      </Body>
      <Footer>
        <Button
          id="formButton27"
          submit={true}
          submitTargetId="rolesForm"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form14"
      disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
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
          id="formTitle29"
          value="###### Permissions"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="executivePower"
          captionByIndex=""
          colorByIndex=""
          data="{{ _.sortBy(ExecutivePowerList.value, function(c) {
  return c.labels.en;
}) }}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hidden="true"
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="Executive Power"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          overlayMaxHeight={375}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.permissions.executivePower !== executivePower.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          tooltipByIndex=""
          value="{{ CurrentSelectedRole.value.function.item.permissions.executivePower }}"
          values="{{ item.code }}"
        />
        <Select
          id="shareholder"
          data="{{ _.sortBy(ShareholderList.value, function(c) {
  return c.labels.en;
}) }}"
          disabled="{{ CurrentSelectedRole.value.function.item.permissions.shareholder === 2 }}"
          disabledByIndex="{{ item.code === 2 }}"
          emptyMessage="No options"
          hiddenByIndex=""
          label="Share Holder"
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
                  "{{ CurrentSelectedRole.value.function.item.permissions.shareholder !== shareholder.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.permissions.shareholder }}"
          values="{{ item.code }}"
        />
        <Checkbox
          id="attorneyPower"
          label="Attorney Power"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.attorneyPower }}"
        />
        <Checkbox
          id="signatoryRight"
          label="Signatory Right"
          labelWidth="100"
          value="{{ CurrentSelectedRole.value.function.item.permissions.signatoryRight }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton24"
          submit={true}
          submitTargetId="form14"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form15"
      disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
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
          id="formTitle30"
          value="###### Exemption"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Date
          id="exemptionFromDate"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="From Date"
          labelPosition="top"
          maxDate="{{ exemptionToDate.value }}"
          showClear={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.exemption && CurrentSelectedRole.value.function.item.exemption.fromDate ? CurrentSelectedRole.value.function.item.exemption.fromDate !==  exemptionFromDate.value.split('T')[0] ? '#99A7C8' : '#fff' : exemptionFromDate.value !== '' ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          value="{{CurrentSelectedRole.value.function.item.exemption.fromDate }}"
        />
        <Date
          id="exemptionToDate"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="To Date"
          labelPosition="top"
          minDate="{{ exemptionFromDate.value }}"
          showClear={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.exemption && CurrentSelectedRole.value.function.item.exemption.toDate ? CurrentSelectedRole.value.function.item.exemption.toDate !==  exemptionToDate.value.split('T')[0] ? '#99A7C8' : '#fff' : exemptionToDate.value !== '' ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          value="{{CurrentSelectedRole.value.function.item.exemption.toDate }}"
        />
        <Text
          id="text508"
          hidden="{{ !exemptionFromDate.value && exemptionToDate.value ? false: true }}"
          style={{ ordered: [{ color: "danger" }] }}
          value="From Date is Required"
          verticalAlign="center"
        />
        <Text
          id="text509"
          hidden="{{ exemptionFromDate.value && !exemptionToDate.value ? false: true }}"
          style={{ ordered: [{ color: "danger" }] }}
          value="To Date is Required"
          verticalAlign="center"
        />
      </Body>
      <Footer>
        <Button
          id="formButton25"
          submit={true}
          submitTargetId="form15"
          text="Submit"
        />
      </Footer>
    </Form>
    <Form
      id="form16"
      disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
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
          id="formTitle31"
          value="###### Compensation"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="currency"
          colorByIndex=""
          data="{{ _.sortBy(Currencies.value, function(c) {
  return c.labels.en;
}) }}"
          disabled="true"
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
                  "{{ CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.currency ? (CurrentSelectedRole.value.function.item.compensation.currency  !== currency.value ? '#99A7C8': '#FFF') : currency.value ? '#99A7C8': '#FFF'}}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.currency }}"
          values="{{ item.code }}"
        />
        <NumberInput
          id="salary"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.salary !== undefined && CurrentSelectedRole.value.function.item.compensation.salary !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.salary !== salary.value ? '#99A7C8' : '#FFF')\n  : (salary.value !== null && salary.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.salary }}"
        />
        <NumberInput
          id="otherShortTerm"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.otherShortTerm !== undefined && CurrentSelectedRole.value.function.item.compensation.otherShortTerm !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.otherShortTerm !== otherShortTerm.value ? '#99A7C8' : '#FFF')\n  : (otherShortTerm.value !== null && otherShortTerm.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherShortTerm }}"
        />
        <NumberInput
          id="longTermIncentivePayout"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout !== undefined && CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout !== longTermIncentivePayout.value ? '#99A7C8' : '#FFF')\n  : (longTermIncentivePayout.value !== null && longTermIncentivePayout.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.longTermIncentivePayout }}"
        />
        <NumberInput
          id="total"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.total !== undefined && CurrentSelectedRole.value.function.item.compensation.total !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.total !== total.value ? '#99A7C8' : '#FFF')\n  : (total.value !== null && total.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.total }}"
        />
        <NumberInput
          id="exercisedNumber"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Excercised Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.exercised && CurrentSelectedRole.value.function.item.compensation.options.exercised.number !== undefined && CurrentSelectedRole.value.function.item.compensation.options.exercised.number !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.exercised.number !== exercisedNumber.value ? '#99A7C8' : '#FFF')\n  : (exercisedNumber.value !== null && exercisedNumber.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.number }}"
        />
        <NumberInput
          id="unExercisedNumber"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Excercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "\n{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number !== undefined && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number !== unExercisedNumber.value ? '#99A7C8' : '#FFF')\n  : (unExercisedNumber.value !== null && unExercisedNumber.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.number }}"
        />
        <NumberInput
          id="unExercisedUnexNumber"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Unexcercisable Number"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number !== undefined && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number !== unExercisedUnexNumber.value ? '#99A7C8' : '#FFF')\n  : (unExercisedUnexNumber.value !== null && unExercisedUnexNumber.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.number }}"
        />
        <NumberInput
          id="bonus"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.bonus !== undefined && CurrentSelectedRole.value.function.item.compensation.bonus !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.bonus !== bonus.value ? '#99A7C8' : '#FFF')\n  : (bonus.value !== null && bonus.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.bonus }}"
        />
        <NumberInput
          id="totalShortTerm"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.totalShortTerm !== undefined && CurrentSelectedRole.value.function.item.compensation.totalShortTerm !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.totalShortTerm !== totalShortTerm.value ? '#99A7C8' : '#FFF')\n  : (totalShortTerm.value !== null && totalShortTerm.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.totalShortTerm }}"
        />
        <NumberInput
          id="otherLongTerm"
          allowNull={true}
          currency="{{ currency.value }}"
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
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.otherLongTerm !== undefined && CurrentSelectedRole.value.function.item.compensation.otherLongTerm !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.otherLongTerm !== otherLongTerm.value ? '#99A7C8' : '#FFF')\n  : (otherLongTerm.value !== null && otherLongTerm.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.otherLongTerm }}"
        />
        <Date
          id="compensationDate"
          dateFormat="yyyy-MM-dd"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Date"
          labelPosition="top"
          showClear={true}
          style={{
            ordered: [
              {
                background:
                  "{{ CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.date ?  (CurrentSelectedRole.value.function.item.compensation.date != compensationDate.value ? '#99A7C8': '#FFF' ): compensationDate.value ? '#99A7C8': '#FFF' }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.date}}"
        />
        <NumberInput
          id="exercisedValue"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Excercised Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.exercised && CurrentSelectedRole.value.function.item.compensation.options.exercised.value !== undefined && CurrentSelectedRole.value.function.item.compensation.options.exercised.value !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.exercised.value !== exercisedValue.value ? '#99A7C8' : '#FFF')\n  : (exercisedValue.value !== null && exercisedValue.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.exercised.value }}"
        />
        <NumberInput
          id="unExercisedValue"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Excercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "\n{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value !== undefined && CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value !== unExercisedValue.value ? '#99A7C8' : '#FFF')\n  : (unExercisedValue.value !== null && unExercisedValue.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedExercisable.value }}"
        />
        <NumberInput
          id="unExercisedUnexValue"
          allowNull={true}
          currency="USD"
          inputValue={0}
          label="Unexcercised Unexcercisable Value"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          style={{
            ordered: [
              {
                background:
                  "{{ (CurrentSelectedRole.value.function.item.compensation && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value !== undefined && CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value !== null\n  ? (CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value !== unExercisedUnexValue.value ? '#99A7C8' : '#FFF')\n  : (unExercisedUnexValue.value !== null && unExercisedUnexValue.value !== undefined ? '#99A7C8' : '#FFF')) }}",
              },
            ],
          }}
          value="{{ CurrentSelectedRole.value.function.item.compensation.options.unexercisedUnexercisable.value }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton26"
          submit={true}
          submitTargetId="form16"
          text="Submit"
        />
      </Footer>
    </Form>
    <Include src="./newAddressForm12.rsx" />
    <Form
      id="RoleBiographies"
      disabled=""
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
          id="RoleBiographiesFormTitle"
          value="###### Biographies"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <ListViewBeta
          id="RoleBiographyList"
          data="{{ CurrentSelectedRole.value.function.item.biographies}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container137"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle203"
                value="{{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="26a34" viewKey="View 1">
              <TextArea
                id="eachRoleBiography"
                disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value || CurrentSelectedRole.value.state === 'suppressed' || suppressRoleFlag.value || rolesModalOptions.value.readOnly}}"
                label=""
                labelPosition="top"
                maxLines="6"
                minLines="5"
                placeholder="Enter value"
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item ? (item !== eachRoleBiography.value ? '#99A7C8': '#FFF' ): eachRoleBiography.value ? '#99A7C8': '#FFF' }}",
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
                        src: "var originalVals = RoleBiographyListValues.value;\n\noriginalVals[i] = eachRoleBiography.value;\n\nRoleBiographyListValues.setValue(originalVals);",
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
          id="formButton36"
          submit={true}
          submitTargetId="RoleBiographies"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
