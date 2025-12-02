<Container
  id="container233"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle392"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="7647e" viewKey="View 1">
    <TextInput
      id="TextInBVDIDSelected18"
      disabled="true"
      label="BVD ID"
      labelWidth="30
"
      marginType="normal"
      placeholder="Enter value"
      value="{{selectedCompany.value.header.bvdID}}"
    />
    <TextInput
      id="textInOrbisIDSelected9"
      disabled="true"
      label="ORBIS ID"
      labelWidth="30

"
      marginType="normal"
      value="{{selectedCompany.value.header.entityID}}"
    />
    <TextInput
      id="TextIMutliIDSelected3"
      disabled="true"
      label="MULTI ID"
      labelWidth="30"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{selectedCompany.value.identifiers.filter(function(item) {
  return item.item.type === '992'
})[0].item.id}}"
    />
    <TextInput
      id="TextInBVDIDSelected19"
      disabled="true"
      label="LEI"
      labelWidth="30"
      marginType="normal"
      style={{ ordered: [] }}
      value="{{selectedCompany.value.identifiers.filter(function(item) {
  return item.item.type === '115'
})[0].item.id}}"
    />
  </View>
</Container>
