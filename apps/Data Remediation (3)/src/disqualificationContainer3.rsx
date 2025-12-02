<Container
  id="disqualificationContainer3"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="

{{ 
  !(
    CurrentSelectedContact?.value?.disqualifications?.[0]?.item?.date?.to &&
    CurrentSelectedContact?.value?.disqualifications?.[0]?.item?.date?.from
  )
}}
"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle176"
      margin="0"
      value="###### Disqualification Details"
      verticalAlign="center"
    />
    <IconText
      id="disqualificationText3"
      icon="bold/interface-alert-warning-triangle-alternate"
      style={{ ordered: [{ iconColor: "danger" }] }}
      text="This director is disqualified by UK Company law {{fromDate.value? 'from ' + fromDate.value.split('T')[0] : ''}} {{ toDate.value ? 'until ' + toDate.value.split('T')[0] : ''}} (under {{ actField.value }})"
      textSize="default"
    />
  </Header>
  <View id="2d0b8" viewKey="View 1">
    <Date
      id="fromDate3"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
      iconBefore="bold/interface-calendar"
      label="From"
      labelPosition="top"
      value="{{ CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
    />
    <Date
      id="toDate3"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.to  }}"
      iconBefore="bold/interface-calendar"
      label="To"
      labelPosition="top"
      minDate="{{ fromDate3.value }}"
      value="{{CurrentSelectedContact.value.disqualifications[0].item.date.to }}"
    />
    <TextInput
      id="actField3"
      hidden="{{ !CurrentSelectedContact.value.disqualifications[0].item.date.to &&  !CurrentSelectedContact.value.disqualifications[0].item.date.from }}"
      label="Act"
      labelPosition="top"
      placeholder="Enter value"
      value="{{ CurrentSelectedContact.value.disqualifications[0].item.act }}"
    />
  </View>
</Container>
