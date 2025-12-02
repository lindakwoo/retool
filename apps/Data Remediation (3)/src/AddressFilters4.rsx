<Container
  id="AddressFilters4"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{!(selectedCompany.value.addresses && selectedCompany.value.addresses.length > 0)}}"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle366"
      marginType="normal"
      value="#### Filters"
      verticalAlign="center"
    />
  </Header>
  <View id="44119" viewKey="View 1">
    <Select
      id="typeFilter4"
      data="{{_.uniq(selectedCompany.value.addresses.map(eachAdd => eachAdd.item.types[0]))}}"
      emptyMessage="No options"
      label="Type"
      labelPosition="top"
      labels="{{item}} - {{AddressTypesList.value.filter(function (curAdd){
  return curAdd.code === item
})[0].labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value="null"
    />
    <Select
      id="languageFilter4"
      data="{{_.uniq(selectedCompany.value.addresses.map(eachAdd => eachAdd.item.localizedAddresses[0].language))}}"
      emptyMessage="No options"
      label="Language"
      labelPosition="top"
      labels="{{item}} - {{LanguagesList.value.filter(function (curLang){
  return curLang.Language_code_ISO_639_1.toString() === item.toString()
})[0].labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value="''"
    />
    <Button
      id="applyFilter4"
      marginType="normal"
      style={{ ordered: [{ background: "primary" }] }}
      text="Apply Filter"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "const curType = typeFilter4.value || ''; \nconst curLang = languageFilter2.value || '';\nvar displayAdd =  [];\n\nif (curType === '' && curLang !== '') {\n  // Filter based on language when type is not specified\n  displayAdd = selectedCompany.value.addresses.filter(item => {\n    return item.item.localizedAddresses[0].language === curLang;\n  });\n} else if (curType !== '' && curLang === '') {\n  // Filter based on type when language is not specified\n  displayAdd = selectedCompany.value.addresses.filter(item => {\n    return item.item.types && item.item.types.includes(curType);\n  });\n} else if (curType !== '' && curLang !== '') {\n  // Filter based on both type and language\n  displayAdd = selectedCompany.value.addresses.filter(item => {\n    return item.item.types && item.item.types.includes(curType) &&\n           item.item.localizedAddresses[0].language === curLang;\n  });\n} else {\n  // If both filters are empty, return all addresses\n  displayAdd = selectedCompany.value.addresses;\n}\n\ntypeFilter.setValue(curType);\nlanguageFilter.setValue(curLang);\n//console.log(displayAdd);\nselectedCompany.value.addresses = displayAdd;\n//contactListLength.setValue(displayAdd.length);\nAddressesList.setValue(displayAdd);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="clearFilter4"
      marginType="normal"
      style={{ ordered: [{ background: "canvas" }] }}
      text="Clear Filter"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "typeFilter4.clearValue();\nlanguageFilter2.clearValue();\ntypeFilter4.setValue('');\nlanguageFilter2.setValue('');\ntypeFilter.clearValue();\nlanguageFilter.clearValue();\ntypeFilter.setValue('');\nlanguageFilter.setValue('');\nconst curType = ''; // Get the selected filter criteria\nconst curLang = '';\nconst displayAdd =  selectedCompany.value.addresses;\n\n//  selectedCompany.value.addresses = displayAdd;\n//contactListLength.setValue(displayAdd.length);\nAddressesList.setValue(displayAdd);\n\n",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
