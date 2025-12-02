<Container
  id="disqualificationContainer2"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{!CurrentSelectedContact.value.disqualifications ||  (!(CurrentSelectedContact.value.disqualifications[0].item.date.to) &&  !(CurrentSelectedContact.value.disqualifications[0].item.date.from)) }}"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle173"
      margin="0"
      value="###### Disqualification Details"
      verticalAlign="center"
    />
    <Checkbox
      id="deleteDisqualificationFlag2"
      hidden="{{ !deleteDisqualificationFlag2.value }}"
      label="Delete"
      labelWidth="100"
    />
    <Icon
      id="deleteIntName11"
      disabled="{{ CurrentSelectedContact.value.disqualifications && CurrentSelectedContact.value.disqualifications[0].source === 'REMEDIATED' }}"
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
      id="disqualificationText2"
      icon="bold/interface-alert-warning-triangle-alternate"
      style={{ ordered: [{ iconColor: "danger" }] }}
      text="This director is disqualified by UK Company law {{CurrentSelectedContact.value.disqualifications[0].item.date.from? 'from ' + CurrentSelectedContact.value.disqualifications[0].item.date.from.split('T')[0] : ''}} {{ CurrentSelectedContact.value.disqualifications[0].item.date.to ? 'until ' + CurrentSelectedContact.value.disqualifications[0].item.date.to.split('T')[0] : ''}} (under {{ CurrentSelectedContact.value.disqualifications[0].item.act }})"
      textSize="default"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Date
      id="fromDate2"
      dateFormat="yyyy-MM-dd"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
      iconBefore="bold/interface-calendar"
      label="From"
      labelPosition="top"
      readOnly="true"
      value="{{CurrentSelectedContact.value.disqualifications[0].item.date.from}}"
    />
    <Date
      id="toDate2"
      dateFormat="yyyy-MM-dd"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.to  }}"
      iconBefore="bold/interface-calendar"
      label="To"
      labelPosition="top"
      minDate="{{ fromDate2.value }}"
      readOnly="true"
      value="{{CurrentSelectedContact.value.disqualifications[0].item.date.to}}"
    />
    <TextInput
      id="actField2"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.to &&  !CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
      label="Act"
      labelPosition="top"
      placeholder="Enter value"
      readOnly="true"
      value="{{ CurrentSelectedContact.value.disqualifications[0].item.act }}"
    />
  </View>
</Container>
