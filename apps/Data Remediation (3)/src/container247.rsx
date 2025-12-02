<Container
  id="container247"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle425"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="7647e" viewKey="View 1">
    <TextInput
      id="firmoIpAndRemTextInBVDIDSelected"
      disabled=""
      label="BVD ID"
      labelWidth="30
"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      value="{{selectedCompany.value.header.bvdID}}"
    />
    <TextInput
      id="firmoIpAndRemTextInOrbisIDSelected"
      disabled=""
      label="Orbis ID"
      labelWidth="30

"
      marginType="normal"
      placeholder="Enter value"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      value="{{selectedCompany.value.header.entityID}}"
    />
    <TextInput
      id="firmoIpAndRemTextInMultiIDSelected"
      disabled=""
      label="Multi ID"
      labelWidth="30

"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      value="{{selectedCompany.value?.identifiers?.filter(function(item) {
  return item.item.type === '992'
})[0].item.id}}"
    />
    <TextInput
      id="firmoIpAndRemTextInLEISelected"
      disabled=""
      label="LEI"
      labelWidth="30

"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      value="{{selectedCompany.value?.identifiers?.filter(function(item) {
  return item.item.type === '115'
})[0].item.id}}"
    />
  </View>
</Container>
