<Container
  id="disqualificationContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ !CurrentSelectedContact.value.disqualifications || (!(CurrentSelectedContact.value.disqualifications[0].item.date.to) &&  !(CurrentSelectedContact.value.disqualifications[0].item.date.from)) }}"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle169"
      margin="0"
      value="###### Disqualification Details"
      verticalAlign="center"
    />
    <Checkbox
      id="deleteDisqualificationFlag"
      hidden="{{ !deleteDisqualificationFlag.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteDisqualification"
      disabled="{{  CurrentSelectedContact.value.header.state === 'suppressed' || suppressFlag.value}}"
      hidden={
        '{{deleteDisqualificationFlag.value || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !deleteDisqualification.disabled }}"
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [{ fieldName: "disqualification" }],
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
    <IconText
      id="disqualificationText"
      icon="bold/interface-alert-warning-triangle-alternate"
      style={{ ordered: [{ iconColor: "danger" }] }}
      text="This director is disqualified by UK Company law {{CurrentSelectedContact.value.disqualifications[0].item.date.from? 'from ' + CurrentSelectedContact.value.disqualifications[0].item.date.from.split('T')[0] : ''}} {{ CurrentSelectedContact.value.disqualifications[0].item.date.to ? 'until ' + CurrentSelectedContact.value.disqualifications[0].item.date.to.split('T')[0] : ''}} (under {{ CurrentSelectedContact.value.disqualifications[0].item.act }})"
      textSize="default"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Date
      id="fromDate"
      customValidation="{{ !fromDate.value ? 'From Date is required' : ''}}"
      dateFormat="yyyy-MM-dd"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden=""
      iconBefore="bold/interface-calendar"
      label="From"
      labelPosition="top"
      maxDate="{{ toDate.value }}"
      required={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.disqualifications && CurrentSelectedContact.value.disqualifications[0].item.date.from ? (CurrentSelectedContact.value.disqualifications[0].item.date.from.split('T')[0] !== fromDate.value.split('T')[0] ? '#99A7C8' : '#FFFFFF'): (fromDate.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.disqualifications[0].item.date.from}}"
    />
    <Date
      id="toDate"
      customValidation="{{ !toDate.value ? 'To Date is required' : ''}}"
      dateFormat="yyyy-MM-dd"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden=""
      iconBefore="bold/interface-calendar"
      label="To"
      labelPosition="top"
      minDate="{{ fromDate.value }}"
      required={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.disqualifications && CurrentSelectedContact.value.disqualifications[0].item.date.to? (CurrentSelectedContact.value.disqualifications[0].item.date.to.split('T')[0] !== toDate.value.split('T')[0] ? '#99A7C8' : '#FFFFFF'): (toDate.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{CurrentSelectedContact.value.disqualifications[0].item.date.to}}"
    />
    <TextInput
      id="actField"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.to &&  !CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
      label="Act"
      labelPosition="top"
      placeholder="Enter value"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.disqualifications ? (CurrentSelectedContact.value.disqualifications[0].item.act !== actField.value ? '#99A7C8' : '#FFFFFF'): (actField.value !== '' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{ CurrentSelectedContact.value.disqualifications[0].item.act }}"
    />
  </View>
</Container>
