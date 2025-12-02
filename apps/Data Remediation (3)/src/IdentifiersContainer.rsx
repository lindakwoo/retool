<Container
  id="IdentifiersContainer"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle393"
      value="**Identifiers**"
      verticalAlign="center"
    />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Include src="./container233.rsx" />
    <ListViewBeta
      id="CurrentIdentifiersList"
      computeAllInstanceValues={true}
      data="{{GlobalIdentifierList?.value.length>0? GlobalIdentifierList?.value:
  CurIdentifiers?.value}}"
      enableInstanceValues={true}
      heightType="auto"
      itemWidth="200px"
      marginType="none"
      numColumns={3}
      padding="0"
    >
      <Alert2
        id="alertExistingIdentifiers"
        hidden="{{
  ExistingIdentifierFlag.value[i]?.errorMessage !== 'Please consult the Osiris team before modifying CIK/RSSD values.' &&
  ExistingIdentifierFlag.value[i]?.errorMessage !== 'Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number.'
}}

"
        margin="0"
        value="warning"
      >
        <State
          id="2"
          actionIconPositions="right"
          actionPositions="bottom"
          actionTooltips={null}
          backgroundColors={null}
          borderColors={null}
          colors="rgba(45, 113, 227, 0.93)"
          descriptions={
            '{{\n  ExistingIdentifierFlag.value[i]?.errorMessage === "Please consult the Osiris team before modifying CIK/RSSD values."\n    ? "Please consult the Osiris team before modifying CIK/RSSD values."\n    : ExistingIdentifierFlag.value[i]?.errorMessage === "Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number."\n      ? "Please ensure identifiers do not contain leading and trailing spaces. They should match the local VAT or tax identification number."\n      : \'\'\n}}\n'
          }
          iconPositions="center"
          icons="bold/interface-alert-information-circle"
          styleVariants="warning"
          tooltips={null}
          values="warning"
        />
      </Alert2>
      <Container
        id="EachIdentifierContainer"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        marginType="normal"
        padding="12px"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle394"
            marginType="normal"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="62b09" viewKey="View 1">
          <TextInput
            id="eachIdentifierVal"
            customValidation="{{
  ExistingIdentifierFlag.value[i].errorMessage === 'Please consult the Osiris team before modifying CIK/RSSD values.' ||
  ExistingIdentifierFlag.value[i].errorMessage === 'Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number.'
    ? ''
    : ExistingIdentifierFlag.value[i].isInvalid
      ? ExistingIdentifierFlag.value[i].errorMessage
      : self.value === ''
        ? 'This identifier will be deleted as value is empty'
        : ''
}}
"
            disabled=""
            label="{{IdentifiersList.value.filter((e) => {
  return e.code === item.item.type
})[0].labels.en}}{{ i ? '' :'' }}"
            marginType="normal"
            placeholder="Enter value"
            style={{
              ordered: [
                {
                  background:
                    "{{ self.value !== IdentifiersFromAPIList.value[i].item.id ? '#99A7C8' : '#fff' }}",
                },
              ],
            }}
            value="{{item.item.id}}"
          >
            <Event
              event="change"
              method="run"
              params={{
                ordered: [
                  {
                    src: "\nvar temp = CurIdentifiers.value;\n\nvar oldValue = temp[i].item.id;\n\n//  if (eachIdentifierVal.value.trim() !== '') {\n  temp[i].item.id = eachIdentifierVal.value;\n\nCurIdentifiers.setValue(temp);\nGlobalIdentifierList.setValue(temp);\n\n//  } else {\n//    eachIdentifierVal.setValue(item.item.id);\n//    identifierFieldChange.trigger();\n//  }\n//var curVal = eachIdentifierVal.value;\n//var type =temp[i].item.type\n\n\n\n",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="change"
              method="trigger"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        {
                          additionalScope: {
                            ordered: [
                              { i: "{{ i }}" },
                              { curVal: "{{ self.value}}" },
                              { curType: "{{item.item.type}}" },
                            ],
                          },
                        },
                      ],
                    },
                  },
                ],
              }}
              pluginId="ExistingIdentifierValidation"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </TextInput>
          <Icon
            id="icon235"
            disabled=""
            hidden="{{ ValidateUserRole.data ||
  ValidateBvdId.data || 
 ValidateOrbisId.data || lockEntity.value ||  (item.item.type === '990' || item.item.type === '989')}}"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            style={{ ordered: [{ background: "canvas" }] }}
            styleVariant="background"
          >
            <Event
              event="click"
              method="run"
              params={{ ordered: [{ src: "console.log()" }] }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="identifierFieldChange"
              type="datasource"
              waitMs="500"
              waitType="debounce"
            />
            <Event
              event="click"
              method="setValue"
              params={{
                ordered: [
                  {
                    value:
                      '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "identifier",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.identifier[i][1],\n  "remediation_action" : "delete"}\n}}',
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
    <Multiselect
      id="newIdentifiersAdded"
      data="{{ GetAvailableNewIdentifiers.data }}"
      disabled="{{((CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('create')) ? false : true) ||
  lockEntity.value }}"
      emptyMessage="No options"
      itemAdornmentSize="large"
      label="Add New Identifiers"
      labelPosition="top"
      labels="{{ item.labels.en}}"
      overlayMaxHeight={375}
      placeholder="Select options"
      showSelectionIndicator={true}
      style={{
        ordered: [
          { background: "{{ self.value.length > 0 ? '#99A7C8' : '#fff' }}" },
        ],
      }}
      value="{{ GlobalNewIdentifierDropDownList?.value.value || []}}"
      values="{{ item.code }}"
      wrapTags={true}
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: '\n\n// Sample arrays\nlet curIdFlags = NewIdentifiersFlag.value;\nconsole.log("curIdFlags", curIdFlags);\nlet curSelectedIds = newIdentifiersAdded.value; // New selected codes from dropdown\nconsole.log("newIdentifiersAdded", newIdentifiersAdded);\nconst tempObj = { isInvalid: false, errorMessage: "", code: "" };\nGlobalNewIdentifierDropDownList.setValue(newIdentifiersAdded);\n// Step 1: Add missing codes from curSelectedIds to curIdFlags\ncurSelectedIds.forEach(code => {\n  // Check if the code exists in curIdFlags\n  const existsInCurIdFlags = curIdFlags.some(obj => obj.code === code);\n\n  if (!existsInCurIdFlags) {\n    // Code doesn\'t exist in curIdFlags, add tempObj with the code\n    curIdFlags.push({ ...tempObj, code: code });\n  }\n});\n\n// Step 2: Remove objects from curIdFlags if their code is not in curSelectedIds\ncurIdFlags = curIdFlags.filter(obj => curSelectedIds.includes(obj.code));\n\n//console.log(\'curIdFlags\');\n//console.log(curIdFlags);\n\n\n\nNewIdentifiersFlag.setValue(curIdFlags);\nconsole.log("finalNewIdentifiersValues.setValue(temp);",NewIdentifiersValues.value);\n\nvar tempValues = NewIdentifiersValues.value;\n//console.log(newIdentifiersAdded.value);\n//console.log(tempValues);\ntempValues = Object.fromEntries(self.value.map(key => [key, tempValues[key] ? tempValues[key] : \'\']));\nconsole.log(\'newly added\');\nconsole.log(tempValues);\nNewIdentifiersValues.setValue(tempValues);\nGlobalNewIdentifierValueList.setValue(tempValues);\n\n\n\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var icon_link = iconHiddenFlag.value\nvar link_dict = masterRecordLinkedRemFields.value\n\nvar identifier_link = icon_link.identifier\n\n\nfor (var key_id in identifier_link){\n  if (key_id.includes(\'new\')){\n    delete identifier_link[key_id]\n    for (var doc_id in link_dict){\n      var i = 0\n      for (var doc_row of link_dict[doc_id]){\n        if(doc_row.iteration == key_id){\n          link_dict[doc_id].splice(i, 1);\n        }\n        i += 1 \n      }\n    }\n  }\n}\n\n\nicon_link.identifier = identifier_link\niconHiddenFlag.setValue(icon_link)\nconsole.log("Icon Link After NewIndenitifer Change: ", icon_link)\n\nmasterRecordLinkedRemFields.setValue(link_dict)\nconsole.log("Master Link After NewIndenitifer Change: ", link_dict)',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Multiselect>
    <Alert2
      id="alertNewIdentifiers"
      hidden={
        '{{ \n  NewIdentifiersFlag.value[i]?.errorMessage !== "Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number."\n}}'
      }
      margin="0"
      value="warning"
    >
      <State
        id="2"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors="rgba(45, 113, 227, 0.93)"
        descriptions={
          '{{ \n  NewIdentifiersFlag.value[i]?.errorMessage === "Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number." \n    ? "Please ensure identifiers do not contain leading and trailing spaces. They should match the local VAT or tax identification number." \n    : "" \n}}'
        }
        iconPositions="center"
        icons="bold/interface-alert-information-circle"
        styleVariants="warning"
        tooltips={null}
        values="warning"
      />
    </Alert2>
    <ListViewBeta
      id="newIdentifiersList5"
      _primaryKeys=""
      data="{{
  newIdentifiersAdded.data.filter((obj)=> newIdentifiersAdded.value.includes(obj.code))
 
}}

"
      heightType="auto"
      hidden="{{newIdentifiersAdded.value.length === 0}}"
      itemWidth="200px"
      margin="0"
      maxHeight="100vh"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container234"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle395"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="bf06c" viewKey="View 1">
          <TextInput
            id="eachNewIdentifier"
            customValidation={
              '{{ \n  NewIdentifiersFlag.value.find((e)=>e.code === item.code).isInvalid\n    ? NewIdentifiersFlag.value.find((e)=>e.code === item.code).errorMessage \n    : "" \n}}\n'
            }
            label="{{item.labels.en}} {{ i ? '': '' }}"
            placeholder="Enter value"
            style={{
              ordered: [
                { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
              ],
            }}
            value="{{  
  GlobalNewIdentifierValueList?.value?.[item.code] || NewIdentifiersValues?.value?.[item.code] 
}}
 
"
          >
            <Event
              event="change"
              method="run"
              params={{
                ordered: [
                  {
                    src: 'var temp = NewIdentifiersValues.value;\n//console.log("item.code", item.code);\ntemp[item.code] = eachNewIdentifier.value;\n//console.log("NewIdentifiersValues", temp);\nNewIdentifiersValues.setValue(temp);\nCopiedNewIdentifiersValues.setValue(temp);\nGlobalNewIdentifierValueList.setValue(temp);',
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="change"
              method="trigger"
              params={{
                ordered: [
                  {
                    options: {
                      ordered: [
                        {
                          additionalScope: {
                            ordered: [
                              { i: "{{ i }}" },
                              { curNewType: "{{ item.code }}" },
                            ],
                          },
                        },
                      ],
                    },
                  },
                ],
              }}
              pluginId="NewIdentifierValidation"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </TextInput>
        </View>
      </Container>
    </ListViewBeta>
  </View>
</Container>
