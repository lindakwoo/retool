<Container
  id="container125"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle183"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="5c1cc" viewKey="View 1">
    <TextInput
      id="major3"
      disabled=""
      label="Major"
      labelPosition="top"
      value="{{item.item.major}}"
    />
    <TextInput
      id="college3"
      disabled=""
      label="College"
      labelPosition="top"
      value="{{item.item.college}}"
    />
    <TextInput
      id="degreeCode3"
      disabled=""
      label="Degree Code"
      labelPosition="top"
      value="{{item.item.degreeCode}}"
    />
    <Text id="text478" value="**Graduation Date**" verticalAlign="center" />
    <Select
      id="year3"
      allowCustomValue={true}
      data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
      disabled="true"
      label="Year"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{ new Date(item.item.graduationDate).getUTCFullYear()}}

"
      values="{{ item }}"
    />
    <Select
      id="month3"
      disabled="true"
      itemMode="static"
      label="Month"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{ item.item.graduationDatePrecision > 9 ? (new Date(item.item.graduationDate).getUTCMonth() < 9 ? '0' + (new Date(item.item.graduationDate).getUTCMonth() + 1) : new Date(item.item.graduationDate).getUTCMonth() + 1 ) : ''}}"
    >
      <Option id="362a7" label="January" value="01" />
      <Option id="180d9" label="February" value="02" />
      <Option id="6e2aa" label="March" value="03" />
      <Option id="25a6b" label="April" value="04" />
      <Option id="bedc7" label="May" value="05" />
      <Option id="fb31f" label="June" value="06" />
      <Option id="fdfa2" label="July" value="07" />
      <Option id="fe72f" label="August" value="08" />
      <Option id="02def" label="September" value="09" />
      <Option id="123aa" label="October" value={10} />
      <Option id="6e75e" label="November" value={11} />
      <Option id="67a56" label="December" value={12} />
    </Select>
    <Select
      id="day3"
      data="{{ _.range(1, 32) }}"
      disabled="true"
      label="Day"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{item.item.graduationDatePrecision > 10 ? new Date(item.item.graduationDate).getUTCDate() : ''}}"
    />
  </View>
</Container>
