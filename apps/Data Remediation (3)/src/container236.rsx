<Container
  id="container236"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle399"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="7647e" viewKey="View 1">
    <TextInput
      id="TextInBVDIDSelected21"
      disabled=""
      label="BVD ID"
      labelWidth="30
"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipText="{{sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.entityInfo.source}).length > 0 ? 'Source: ' + sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.entityInfo.source})[0].label: ''}}"
      value="{{selectedCompany.value.header.bvdID}}"
    />
    <TextInput
      id="textInOrbisIDSelected10"
      disabled=""
      label="ORBIS ID"
      labelWidth="30

"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipText="{{sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.entityInfo.source}).length > 0 ? 'Source: ' + sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.entityInfo.source})[0].label: ''}}"
      value="{{selectedCompany.value.header.entityID}}"
    />
    <TextInput
      id="TextInMultiIdSelected3"
      disabled=""
      label="MULTI ID*"
      labelWidth="30"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipText={
        "{{  (() => {\n  const type992Identifier = selectedCompany.value.identifiers.find(\n    (item) => item.item.type === '992'\n  );\n\n  const sourceCode = type992Identifier?.source;\n  console.log(\"sourceCodesourceCode11\", sourceCode);\n  const matched = /^\\d+$/.test(sourceCode) ? sourceCodes.value.find(obj => obj.code === sourceCode)?.labels?.en : null; \n  return sourceCode ? 'Source: ' + (matched?.trim() ? matched : sourceCode) : '';\n})() }}\n\n\n\n"
      }
      value="{{selectedCompany.value.identifiers.filter(function(item) {
  return item.item.type === '992'
})[0].item.id}}"
    />
    <TextInput
      id="TextInBVDIDSelected20"
      disabled=""
      label="LEI*"
      labelWidth="30"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipText="{{  (() => {
  const type115Identifier = selectedCompany.value.identifiers.find(
    (item) => item.item.type === '115'
  );

  const sourceCode = type115Identifier?.source;
  const matched = /^\d+$/.test(sourceCode) ? sourceCodes.value.find(obj => obj.code === sourceCode)?.labels?.en : null; 
  return sourceCode ? 'Source: ' + (matched?.trim() ? matched : sourceCode) : '';
})() }}


"
      value="{{selectedCompany.value.identifiers.filter(function(item) {
  return item.item.type === '115'
})[0].item.id}}"
    />
  </View>
</Container>
