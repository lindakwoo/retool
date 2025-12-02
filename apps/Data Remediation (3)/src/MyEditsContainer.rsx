<Container
  id="MyEditsContainer"
  disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }} "
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text id="containerTitle67" value="#### My Edits" verticalAlign="center" />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Container
      id="CompanyNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle69"
          value="**Company Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="companyNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{GlobalListOfCompanyName?.value?.value?.length>0? GlobalListOfCompanyName?.value?.value: CompanyNamesList.value }}"
          heightType="auto"
          itemWidth="200px"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container6"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            margin="0"
            marginType="normal"
            overflowType="hidden"
            padding="0"
            showBody={true}
            showBorder={false}
            style={{ ordered: [] }}
          >
            <Header>
              <Text
                id="containerTitle13"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachCompanyName"
                disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly=""
                spellCheck={true}
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item !== CompanyNamesList?.value[i]\n    ? '#99A7C8' \n    : '#fff' }}\n",
                    },
                  ],
                }}
                value="{{item}}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'var temp = CompanyNames.value;\n\nif (eachCompanyName.value.trim() !== \'\') {\n // console.log(\'rad\');\n  temp[i] = eachCompanyName.value;\n  \n  CompanyNames.setValue(temp);\n  GlobalListOfCompanyName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newCompanyName.value\n  })\n  \n\n} else {\n  temp[i] = "";\n  CompanyNames.setValue(temp);\n}\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextInput>
              <Icon
                id="icon7"
                hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value}}"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                style={{ ordered: [] }}
              >
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="companyNameFieldChange"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "company_name",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.company_name[i][1],\n  "remediation_action" : "delete"}\n}}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
        <Container
          id="container37"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          maintainSpaceWhenHidden={true}
          marginType="normal"
          overflowType="hidden"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle78"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newCompanyName"
              disabled=""
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add Company Name"
              readOnly=""
              spellCheck={true}
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              value="{{  GlobalListOfCompanyName.value ?GlobalListOfCompanyName.value.newKey :''
 }}"
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: '\nconst company = newCompanyName.value;\n\n// Force create an object with the key "sravan"\nconst updated = {\n  newKey: company,\n  value:GlobalListOfCompanyName?.value?.value\n};\n\n// Set the global value to this new object\nGlobalListOfCompanyName.setValue(updated);\n',
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
          </View>
        </Container>
        <Text
          id="text94"
          hidden="{{CompanyNames.value.filter((name)=> name.trim() !== '').length > 0 || (
  CompanyNames.value.filter((name)=> name.trim() !== '').length === 0 && newCompanyName.value.trim() !== ''
) }}"
          marginType="normal"
          style={{ ordered: [{ color: "danger" }] }}
          value="The Company Name field cannot be empty. Please provide a company name"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Container
      id="CompanyNamesLocalContainer"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="CompanyNameLocalContainer"
          value="**Company Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="companyLocalNamesList"
          _primaryKeys="{{ i }}"
          computeAllInstanceValues={true}
          data="{{ GlobalListOfLocalCompanyName?.value &&  GlobalListOfLocalCompanyName?.value?.value?.length>0 ?
  GlobalListOfLocalCompanyName?.value?.value : CompanyNamesLocalList.value }}"
          heightType="auto"
          hidden="{{CompanyNamesLocalList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container24"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            marginType="normal"
            overflowType="hidden"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle54"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachCompanyLocalName"
                disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly=""
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item.name !== CompanyNamesLocalList.value[i]?.name\n    ? '#99A7C8' \n    : '#fff' }}\n",
                    },
                  ],
                }}
                value="{{ item.name}}"
              >
                <Event
                  enabled=""
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: '\nvar temp = CompanyLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachCompanyLocalName.value.trim() !== \'\') {\n  temp[i].name= eachCompanyLocalName.value;\n  \n  CompanyLocalNames.setValue(temp);\n   GlobalListOfLocalCompanyName.setValue({\n    "change": true,\n    "value": temp,\n     "newKey":newCompanyLocalName.value,\n      "newLang": newCompanyLocalNameLanguage.value\n  })\n  \n  \n} else {\neachCompanyLocalName.setValue(CompanyNamesLocalList.value[i].name)\ncompanyLocalNameFieldChange.trigger();\n}\n\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextInput>
              <Select
                id="eachCompanyLocalNameLanguage"
                data="{{ LanguagesList.value }}"
                emptyMessage="No options"
                label=""
                labelPosition="top"
                labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                margin="0"
                overlayMaxHeight={375}
                placeholder="Language"
                showSelectionIndicator={true}
                style={{
                  ordered: [
                    {
                      background:
                        "{{ item.language.toLowerCase() !== CompanyNamesLocalList.value[i]?.language\n    ? '#99A7C8' \n    : '#fff' }}",
                    },
                  ],
                }}
                value="{{item.language.toLowerCase()}}"
                values="{{ item.Language_code_ISO_639_1.toString() }}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'var temp = CompanyLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachCompanyLocalName.value.trim() !== \'\') {\n  temp[i].language= eachCompanyLocalNameLanguage.value;\n  \n  CompanyLocalNames.setValue(temp);\n    GlobalListOfLocalCompanyName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey":newCompanyLocalName.value,\n    "newLang": newCompanyLocalNameLanguage.value\n  })\n} else {\neachCompanyLocalNameLanguage.setValue(CompanyNamesLocalList.value[i].language)\ncompanyLocalNameFieldChange.trigger();\n}\n  ',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </Select>
              <Icon
                id="icon11"
                hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }}"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                style={{ ordered: [] }}
              >
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="companyLocalNameFieldChange"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "company_name_local",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.company_name_local[i][1],\n  "remediation_action" : "delete"}\n}}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
        <Container
          id="container54"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle110"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="c01df" viewKey="View 1">
            <TextInput
              id="newCompanyLocalName"
              disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add Company Name Local"
              readOnly=""
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              value={
                '{{  GlobalListOfLocalCompanyName?.value?.newKey ? GlobalListOfLocalCompanyName?.value?.newKey :"" }}'
              }
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: 'const company = newCompanyLocalName.value;\n\n// Force create an object with the key "sravan"\nconst updated = {\n  newKey: company,\n  value:GlobalListOfLocalCompanyName?.value?.value,\n   newLang:newCompanyLocalNameLanguage.value\n};\n\n// Set the global value to this new object\nGlobalListOfLocalCompanyName.setValue(updated);\n\n',
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
            <Select
              id="newCompanyLocalNameLanguage"
              captionByIndex=""
              colorByIndex=""
              data="{{ LanguagesList.value.filter((lang) => lang.Language_code_ISO_639_1.toLocaleLowerCase() !== 'ii') }}"
              disabledByIndex=""
              emptyMessage="No options"
              fallbackTextByIndex=""
              hidden="{{newCompanyLocalName.value.trim() === ''}}"
              hiddenByIndex=""
              iconByIndex=""
              imageByIndex=""
              label=""
              labelPosition="top"
              labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
              margin="0"
              overlayMaxHeight={375}
              placeholder="Select Language"
              showSelectionIndicator={true}
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              tooltipByIndex=""
              value="{{  GlobalListOfLocalCompanyName?.value?.newLang ? GlobalListOfLocalCompanyName?.value?.newLang :null }}"
              values="{{ item.Language_code_ISO_639_1.toString() }}"
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: '\n\n// Force create an object with the key "sravan"\nconst updated = {\n  newKey: newCompanyLocalName.value,\n  value:GlobalListOfLocalCompanyName?.value?.value,\n  newLang:newCompanyLocalNameLanguage.value\n};\n\n// Set the global value to this new object\nGlobalListOfLocalCompanyName.setValue(updated);',
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </Select>
            <Text
              id="companyLocalErrorMsg"
              hidden="{{ !(newCompanyLocalName.value.trim() !== '' && (!newCompanyLocalNameLanguage.value || newCompanyLocalNameLanguage.value === ''))}}"
              style={{ ordered: [{ color: "danger" }] }}
              value="Please select language"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="PrevNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
      styleContext={{ ordered: [] }}
    >
      <Header>
        <Text
          id="containerTitle70"
          value="**Prev Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="prevNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{GlobalListOfPrevName?.value?.value?.length>0 ?GlobalListOfPrevName?.value?.value : PreviousNamesList?.value}}"
          heightType="auto"
          hidden="{{PreviousNamesList?.value?.length === 0 && GlobalListOfPrevName?.value?.value?.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Include src="./container8.rsx" />
        </ListViewBeta>
        <Link
          id="showMorePrevNames"
          hidden="{{ PreviousNamesList.value.length < 2 }}"
          text="{{ showAllPrevNames.value ? 'Show Less' : 'Show More'}}"
        >
          <Event
            event="click"
            method="setValue"
            params={{ ordered: [{ value: "{{ !showAllPrevNames.value }}" }] }}
            pluginId="showAllPrevNames"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
        </Link>
        <Include src="./container55.rsx" />
      </View>
    </Container>
    <Container
      id="PrevLocalNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle71"
          value="**Prev Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="prevLocalNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{
  GlobalListOfPrevLocalName?.value && GlobalListOfPrevLocalName?.value?.value?.length > 0
    ? GlobalListOfPrevLocalName?.value?.value
    : PreviousNameLocalsList.value
}}
"
          heightType="auto"
          hidden="{{ PreviousNameLocalsList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container10"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle17"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachPrevLocalName"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly=""
                style={{
                  ordered: [
                    {
                      background:
                        "\n{{ item !== PreviousNameLocalsList?.value[i]\n    ? '#99A7C8' \n    : '#fff' }}\n",
                    },
                  ],
                }}
                value="{{ item}}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'var temp = prevLocalNames.value;\n\nif (eachPrevLocalName.value.trim() !== \'\') {\n  temp[i] = eachPrevLocalName.value;\n  \n  prevLocalNames.setValue(temp);\n  GlobalListOfPrevLocalName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newPrevLocalName.value\n  })\n} else {\n  temp[i].name = "";\n  prevLocalNames.setValue(temp);\n}\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextInput>
              <Icon
                id="icon12"
                hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value}}"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                style={{ ordered: [] }}
              >
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="prevNameLocalFieldChange"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "prev_name_local",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.prev_name_local[i][1],\n  "remediation_action" : "delete"}\n}}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
        <Container
          id="container56"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle112"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="c01df" viewKey="View 1">
            <TextInput
              id="newPrevLocalName"
              disabled=""
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add Prev Name Local"
              readOnly=""
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              value={
                '{{  GlobalListOfPrevLocalName?.value?.newKey ? GlobalListOfPrevLocalName?.value?.newKey :"" }}'
              }
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "// Force create an object with the key \nconst updated = {\n  newKey: newPrevLocalName.value,\n  value:GlobalListOfPrevLocalName?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfPrevLocalName.setValue(updated);",
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="AkaNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle72"
          value="**AKA Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="akaNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data=" {{
 GlobalListOfAkaName?.value?.value && GlobalListOfAkaName.value?.value.length > 0
    ? GlobalListOfAkaName?.value?.value
    : AKANamesList.value

 }}"
          heightType="auto"
          hidden="{{AKANamesList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container9"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle16"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachAkaName"
                disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly=""
                style={{
                  ordered: [
                    {
                      background:
                        "\n{{ item !==  AKANamesList?.value[i]\n    ? '#99A7C8' \n    : '#fff' }}\n",
                    },
                  ],
                }}
                value="{{ item}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'var temp = akaNames.value;\n\nif (eachAkaName.value.trim() !== \'\') {\n  temp[i] = eachAkaName.value;\n  \n  akaNames.setValue(temp);\n  GlobalListOfAkaName.setValue({\n    "change": true,\n    "value": temp,\n     "newKey": newAkaName.value\n  })\n} else {\n  temp[i].name = "";\n  akaNames.setValue(temp);\n}\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextInput>
              <Icon
                id="icon9"
                hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value}}"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                style={{ ordered: [] }}
              >
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="akaNameFieldChange"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "aka_name",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.aka_name[i][1],\n  "remediation_action" : "delete"}\n}}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
        <Container
          id="container29"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          heightType="fixed"
          marginType="normal"
          overflowType="hidden"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle59"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newAkaName"
              disabled=""
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add AKA Name"
              readOnly=""
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              value={
                '{{  GlobalListOfAkaName?.value?.newKey ? GlobalListOfAkaName?.value?.newKey :"" }}'
              }
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "// Force create an object with the key \nconst updated = {\n  newKey: newAkaName.value,\n  value:GlobalListOfAkaName?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfAkaName.setValue(updated);\n",
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="AkaNameLocalContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle73"
          value="**AKA Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="akaLocalNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data=" {{
  GlobalListOfAkaNameLocal?.value && GlobalListOfAkaNameLocal?.value?.value?.length > 0
    ? GlobalListOfAkaNameLocal?.value?.value
    : AKANameLocalsList.value
}}"
          heightType="auto"
          hidden="{{AKANameLocalsList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container11"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle18"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <Container
                id="group4"
                _gap="0px"
                _type="stack"
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                margin="0"
                padding="0"
                showBody={true}
                showBorder={false}
                style={{ ordered: [{ background: "rgba(255, 255, 255, 0)" }] }}
              >
                <View id="5c019" viewKey="View 1">
                  <TextInput
                    id="eachAkaLocalName"
                    disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
                    label=""
                    labelPosition="top"
                    margin="0"
                    placeholder="Enter value"
                    readOnly=""
                    style={{
                      ordered: [
                        {
                          background:
                            "{{ item !== \n      AKANameLocalsList.value[i]\n    ? '#99A7C8' \n    : '#fff' }}\n",
                        },
                      ],
                    }}
                    value="{{ item}}"
                  >
                    <Event
                      event="blur"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: 'var temp = akaLocalNames.value;\n\nif (eachAkaLocalName.value.trim() !== \'\') {\n  temp[i] = eachAkaLocalName.value;\n  \n  akaLocalNames.setValue(temp);\n  GlobalListOfAkaNameLocal.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newAkaLocalName.value\n  })\n} else {\n  temp[i].name = "";\n  akaLocalNames.setValue(temp);\n}\n',
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                </View>
              </Container>
              <Icon
                id="icon10"
                hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value}}"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                style={{ ordered: [] }}
              >
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="akaNameLocalFieldChange"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "aka_name_local",\n"itemObjectHash" : masterRecordAllAttributeHashDict.value.aka_name_local[i][1],\n  "remediation_action" : "delete"}\n}}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
        <Container
          id="container30"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          heightType="fixed"
          marginType="normal"
          overflowType="hidden"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle60"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newAkaLocalName"
              disabled=""
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add AKA Name Local"
              readOnly=""
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
              value={
                '{{  GlobalListOfAkaNameLocal?.value?.newKey ? GlobalListOfAkaNameLocal?.value?.newKey :"" }}'
              }
            >
              <Event
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: "\n\n// Force create an object with the key \nconst updated = {\n  newKey: newAkaLocalName.value,\n\n  value:GlobalListOfAkaNameLocal?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfAkaNameLocal.setValue(updated);",
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </TextInput>
            <TextInput
              id="newPrevLocalName3"
              disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add Prev Name Local"
              readOnly=""
            />
          </View>
        </Container>
      </View>
    </Container>
  </View>
</Container>
