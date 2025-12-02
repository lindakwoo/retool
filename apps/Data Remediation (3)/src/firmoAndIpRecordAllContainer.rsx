<Container
  id="firmoAndIpRecordAllContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showBorder={false}
  style={{ ordered: [] }}
>
  <View id="3eabc" viewKey="View 1">
    <Container
      id="firmoIpAndRemCompanyNameContainer"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="CompanyNameLocalContainer4"
          value="**Company Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoAndIpCompanyNames"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ CompanyNamesList.value }}"
          heightType="auto"
          itemWidth="200px"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="firmoIpAndRemCompanyEachContainer"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            margin="0"
            marginType="normal"
            overflowType="hidden"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle422"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="firmoIpAndRemEachCompanyName"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                readOnly="true"
                spellCheck={true}
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{item}}"
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemCompanyNamesLocalContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemCompanyLocalTitle"
          value="**Company Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemCompanyLocalNamesList"
          _primaryKeys="{{ i }}"
          computeAllInstanceValues={true}
          data="{{ CompanyNamesLocalList.value }}"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container245"
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
                id="containerTitle423"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="firmoIpAndRemEachCompanyLocalName"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{ item.name}} 
 {{LanguagesList.value.filter((eachObj) => eachObj.Language_code_ISO_639_1 === item.language)[0].Language_code_ISO_639_1}} - {{LanguagesList.value.filter((eachObj) => eachObj.Language_code_ISO_639_1 === item.language)[0].labels.en}}"
              />
              <Icon
                id="icon282"
                hidden="true"
                horizontalAlign="center"
                icon="bold/interface-delete-bin-2"
                maintainSpaceWhenHidden={true}
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
      </View>
    </Container>
    <Container
      id="firmoPreAndRemPrevNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle430"
          value="**Prev Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoPreAndRemPrevNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ PreviousNamesList.value }}"
          hidden="{{PreviousNamesList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Include src="./container250.rsx" />
        </ListViewBeta>
        <Link
          id="showMorePrevNames4"
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
        <Include src="./container249.rsx" />
      </View>
    </Container>
    <Container
      id="firmoIpAndRemPrevLocalNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemPreNameLocalTitle"
          value="**Prev Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemPrevLocalNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ PreviousNameLocalsList.value }}"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container248"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            overflowType="hidden"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle428"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachPrevLocalName3"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  '{{sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="1" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source}).length > 0 ? \'Source: \' + sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="3" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source})[0].label : \'\'}}\n{{!parseInt(selectedCompany.value.names.filter(item => item.item.type ==="3" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source) ? \'Source: \' + selectedCompany.value.names.filter(item => item.item.type ==="1" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source : \'\'}}'
                }
                value="{{ item}}"
              />
              <Icon
                id="icon285"
                hidden="{{ (eachPrevLocalName3.value.trim() == masterRecordAllAttributeHashDict.value.prev_name_local[i][2]) || (iconHiddenFlag.value.prev_name_local[i][0] && eachPrevLocalName3.value == iconHiddenFlag.value.prev_name_local[i][1])}}
"
                horizontalAlign="center"
                icon="bold/interface-edit-attachment-1"
              >
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : eachPrevLocalName.value.trim(),\n"attribute_flag" : "prev_name_local",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.prev_name_local[i][1],\n  "remediation_action" : "update"}\n  }}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="docLinkOpen"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemAkaNameContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemAkaTitle"
          value="**AKA Name**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemAkaNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ AKANamesList.value }}"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container243"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle418"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="firmoIpAndRemEachAkaName"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{ item}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = akaNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (firmoIpAndRemEachAkaName.value.trim() !== '') {\n  temp[i] = firmoIpAndRemEachAkaName.value;\n  \n  akaNames.setValue(temp);\n} ",
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
                id="icon281"
                hidden="{{ (firmoIpAndRemEachAkaName.value.trim() == masterRecordAllAttributeHashDict.value.aka_name[i][2]) || (iconHiddenFlag.value.aka_name[i][0] && firmoIpAndRemEachAkaName.value == iconHiddenFlag.value.aka_name[i][1])}}
"
                horizontalAlign="center"
                icon="bold/interface-edit-attachment-1"
              >
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : eachAkaName.value.trim(),\n"attribute_flag" : "aka_name",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.aka_name[i][1],\n  "remediation_action" : "update"}\n  }}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="docLinkOpen"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemAkaNameLocalContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemAkaNameLocaTitle"
          value="**AKA Name Local**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemAkaLocalNamesList"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ AKANameLocalsList.value }}"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container244"
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
                id="containerTitle419"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachAkaLocalName3"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  '{{sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source}).length > 0 ? \'Source: \' + sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source})[0].label : \'\'}}\n{{!parseInt(selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source) ? \'Source: \' + selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source : \'\'}}'
                }
                value="{{ item}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = akaLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachAkaLocalName3.value.trim() !== '') {\n  temp[i] = eachAkaLocalName3.value;\n  \n  akaLocalNames.setValue(temp);\n}\n",
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
        </ListViewBeta>
      </View>
    </Container>
    <Include src="./firmoIpAndRemLegalFieldsContainer.rsx" />
    <Container
      id="firmoIpAndRemBusinessDescriptionContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle420"
          tooltipText="{{sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.activityDescriptions[i].source}).length > 0 ? 'Source: ' + sourceCodes.value.filter((obj)=> {
  return obj.code === selectedCompany.value.activityDescriptions[i].source})[0].label : ''}}"
          value="**Business Description**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemBusinessDescriptionList"
          _primaryKeys="{{item.itemObjectHash}}"
          data="{{selectedCompany.value.activityDescriptions}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="firmoIpAndRemBusinessEachContainer"
            disabled=""
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle421"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="855d7" viewKey="View 1">
              <Select
                id="firmoIpAndRemBusinessDescLanguageInputField"
                allowCustomValue={true}
                data="{{LanguagesList.value}}"
                disabled=""
                emptyMessage="No options"
                label="Language"
                labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                marginType="normal"
                overlayMaxHeight={375}
                placeholder="Select an option"
                readOnly="true"
                showSelectionIndicator={true}
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{LanguagesList.value.filter((obj)=> {
  return obj.Language_code_ISO_639_1.toLocaleLowerCase() === item.item.language.toLocaleLowerCase()
})[0].labels.en}}"
                values="{{ item.Language_code_ISO_639_1.toString() }}"
              />
              <TextArea
                id="businessDescInputField6"
                autoResize={true}
                disabled=""
                hidden=""
                label=""
                labelPosition="top"
                margin="0"
                minLines={2}
                readOnly="true"
                spellCheck={true}
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{item.item.value}}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = BusinessDescriptionsVariableList.value;\n\n//var oldValue = temp; // Optionally store the old value if needed\n\nif (businessDescInputField6.value.trim() !== '') {\n  \n  temp[i].value = businessDescInputField6.value.trim().replace(/\\s{2,}/g, ' ');\n  BusinessDescriptionsVariableList.setValue(temp);\n  //console.log(\"BusinessDescriptionsVariableList\", BusinessDescriptionsVariableList.value)\n}",
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextArea>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemWebsitesContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoAndRemWebsitesTitle"
          value="**Websites**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoIpAndRemListOfWebsites"
          _primaryKeys="{{ i }}"
          computeAllInstanceValues={true}
          data="{{ selectedCompany.value.digitalPresences 
  ? selectedCompany.value.digitalPresences.filter(item => item.item.type === '1') 
  : [] 
}}
"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <TextInput
            id="firmoIpAndRemEachWebsite"
            disabled=""
            iconBefore="bold/interface-link"
            label=""
            labelPosition="top"
            margin="0"
            patternType="url"
            readOnly="true"
            style={{ ordered: [{ border: "#ffffff" }] }}
            value="{{item.item.value}}"
          />
          <Icon
            id="icon287"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            style={{ ordered: [{ background: "canvas" }] }}
            styleVariant="background"
          >
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="websiteFieldChange"
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
                      '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "website",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.website[i][1],\n  "remediation_action" : "delete"}\n}}',
                  },
                ],
              }}
              pluginId="linkAttributeItem"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
          <Icon
            id="icon286"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-edit-attachment-1"
          >
            <Event
              event="click"
              method="setValue"
              params={{
                ordered: [
                  {
                    value:
                      '{{\n{"iteration" : i,\n"new_value" : websiteListAddress.value.trim(),\n"attribute_flag" : "website",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.website[i][1],\n  "remediation_action" : "update"}\n  }}',
                  },
                ],
              }}
              pluginId="linkAttributeItem"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="docLinkOpen"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemEmailsContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemContainerTitleName"
          value="**Emails**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoAndRemEmailsList"
          _primaryKeys="{{ i }}"
          computeAllInstanceValues={true}
          data="{{selectedCompany.value.digitalPresences ? selectedCompany.value.digitalPresences.filter(function (item) {
  return item.item.type === '2'
}): []}}"
          heightType="auto"
          hidden=""
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container246"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            marginType="normal"
            padding="0"
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle424"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1" />
          </Container>
          <TextInput
            id="firmoIpAndRemEachEmail"
            disabled=""
            iconBefore="bold/mail-send-envelope"
            label=""
            labelPosition="top"
            margin="0"
            patternType="email"
            readOnly="true"
            style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
            value="{{item.item.value}}"
          />
          <Icon
            id="icon283"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
            maintainSpaceWhenHidden={true}
            style={{ ordered: [{ background: "canvas" }] }}
            styleVariant="background"
          >
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="emailFieldChange"
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
                      '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "email",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.email[i][1],\n  "remediation_action" : "delete"}\n}}',
                  },
                ],
              }}
              pluginId="linkAttributeItem"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemAddressContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle417"
          value="**Addresses**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="firmoAndRemAddressListView"
          data="{{ ipAndRemAddressRecord.value}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container242"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
            showHeader={true}
          >
            <Header>
              <Text
                id="firmoAndRemAddressTitle"
                margin="0"
                value="**Address {{i+1}}**"
                verticalAlign="center"
              />
            </Header>
            <View id="c85c9" viewKey="View 1">
              <Form
                id="eachAddressForm6"
                disabled=""
                disableSubmit=""
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                margin="0"
                padding="0"
                requireValidation={true}
                resetAfterSubmit={true}
                showBody={true}
                showBorder={false}
              >
                <Header>
                  <Text
                    id="formTitle61"
                    value="#### Form title"
                    verticalAlign="center"
                  />
                </Header>
                <Body>
                  <Select
                    id="firmoIpAndRemAddressType"
                    allowCustomValue={true}
                    data="{{AddressTypesList.value}}"
                    disabled=""
                    emptyMessage="No options"
                    label="Type"
                    labelPosition="top"
                    labels="{{item.code}} - {{item.labels.en}}"
                    marginType="normal"
                    overlayMaxHeight={375}
                    placeholder="Select an option"
                    readOnly="true"
                    showSelectionIndicator={true}
                    style={{ ordered: [] }}
                    value="
{{AddressTypesList.value.filter(function (item){
  return item.code === ipAndRemAddressRecord.value[i].item.types[0]
})[0].labels.en}}"
                    values="{{item.code}}"
                  />
                  <Select
                    id="firmoIpAndRemAddressLanguage"
                    allowCustomValue={true}
                    data="{{LanguagesList.value}}"
                    disabled=""
                    emptyMessage="No options"
                    label="Language"
                    labelPosition="top"
                    labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
                    marginType="normal"
                    overlayMaxHeight={375}
                    placeholder="Select an option"
                    readOnly="true"
                    showSelectionIndicator={true}
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i].item.localizedAddresses[0].language }}
"
                    values="{{ item.Language_code_ISO_639_1.toString() }}"
                  />
                  <TextInput
                    id="firmoIpAndRemAddressLine"
                    disabled=""
                    hideLabel={false}
                    label="Address Line"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{
                      ordered: [{ background: "" }, { border: "#ffffff" }],
                    }}
                    value="{{  ipAndRemAddressRecord.value[i].item.localizedAddresses.map(localizedAddress => localizedAddress.reportedAddress.addressLines.join(', ')).join(', ') }}"
                  />
                  <TextInput
                    id="firmoIpAndRemCity"
                    disabled=""
                    label="City"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{ ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.city}}"
                  />
                  <TextInput
                    id="firmoIpAndRemPostCode"
                    disabled=""
                    label="PostCode"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{ ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.postCode }}
"
                  />
                  <TextInput
                    id="firmoIpAndRemPoBox"
                    disabled=""
                    label="Po_Box"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.poBox }}
"
                  />
                  <TextInput
                    id="firmoIpAndRemState"
                    disabled=""
                    label="State"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                  />
                  <Select
                    id="firmoIpAndRemCountry"
                    data="{{ _.uniq(CountriesList.value) }}"
                    disabled=""
                    emptyMessage="No options"
                    label="Country"
                    labelPosition="top"
                    labels="{{ item.labels.en }}"
                    marginType="normal"
                    overlayMaxHeight={375}
                    placeholder="Select an option"
                    readOnly="true"
                    showSelectionIndicator={true}
                    style={{ ordered: [{ background: "" }] }}
                    value="{{CountriesList.value.filter(function (item){
  return item.a2 ===  ipAndRemAddressRecord.value[i]?.item.countryISO2 

})[0].labels.en}}"
                    values="{{ item.labels.en }}"
                  />
                  <TextInput
                    id="firmoIpAndRemCountryISO"
                    disabled=""
                    label="Country Isocode"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i]?.item.countryISO2 }}"
                  />
                  <TextInput
                    id="firmoIpAndRemCounty"
                    disabled=""
                    label="County"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.county }}
"
                  />
                  <TextInput
                    id="firmoIpAndRemCountryRegion"
                    disabled=""
                    label="Country Region"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i]?.item.countryISO2 }}
"
                  />
                  <TextInput
                    id="firmoIpAndRemWorldRegion"
                    disabled=""
                    label="World Region"
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{  ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.worldRegion}}"
                  />
                  <TextInput
                    id="firmoIpAndRemRegionGeoCode"
                    disabled=""
                    label="Region Geocode"
                    labelPosition="top"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{ ordered: [{ background: "" }] }}
                    value="{{ 
   ipAndRemAddressRecord.value[i]?.item?.geoClassifications?.find(
    item => item.type === '1'
  )?.code 
}}
"
                  />
                  <IconText
                    id="firmoIpAndRemPhoneNumLabel"
                    icon="bold/interface-alert-information-circle"
                    iconPosition="right"
                    style={{
                      ordered: [{ fontSize: "12" }, { fontWeight: "700" }],
                    }}
                    text="Phone Numbers"
                    textSize="h6"
                    tooltipText="Add multiple Phone Numbers using comma (,) separated"
                  />
                  <IconText
                    id="firmoIpAndRemFaxNumberLabel"
                    icon="bold/interface-alert-information-circle"
                    iconPosition="right"
                    style={{
                      ordered: [{ fontSize: "12" }, { fontWeight: "700" }],
                    }}
                    text="Fax Numbers"
                    textSize="h6"
                    tooltipText="Add multiple Fax Numbers using comma (,) separated"
                  />
                  <TextInput
                    id="firmoIpAndRemPhoneNumber"
                    disabled=""
                    hidden=""
                    iconBefore="bold/phone-telephone-circle"
                    label=""
                    labelPosition="top"
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{
                      ordered: [{ background: "" }, { border: "#ffffff" }],
                    }}
                    value={
                      '{{_.compact( ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.phoneNumbers).join(", ")}}'
                    }
                  />
                  <TextInput
                    id="firmoIpAndRemFaxNumber"
                    disabled=""
                    hidden=""
                    iconBefore="bold/mail-inbox-envelope-open"
                    label=""
                    labelPosition="top"
                    labelWrap={true}
                    marginType="normal"
                    placeholder="Enter value"
                    readOnly="true"
                    style={{
                      ordered: [{ background: "" }, { border: "#ffffff" }],
                    }}
                    value={
                      '{{_.compact( ipAndRemAddressRecord.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.faxNumbers).join(", ")}}'
                    }
                  />
                </Body>
                <Footer>
                  <Button
                    id="formButton48"
                    submit={true}
                    submitTargetId="eachAddressForm6"
                    text="Submit"
                  />
                </Footer>
              </Form>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="firmoIpAndRemIdentifiersContainerList"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      margin="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="firmoIpAndRemContainerTitle"
          value="**Identifiers**"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Include src="./container247.rsx" />
        <ListViewBeta
          id="firmoIpAndRemCurrentIdentifiersList"
          computeAllInstanceValues={true}
          data={
            '{{selectedCompany.value.identifiers && selectedCompany.value.identifiers.filter(function(item) {\n  return item.item.type !== \'115\' && item.item.type !== \'992\'\n}).sort((a, b) => {\n    // First, move REMEDIATED items to the end\n    if (a.source === "REMEDIATED" && b.source !== "REMEDIATED") return 1;\n    if (b.source === "REMEDIATED" && a.source !== "REMEDIATED") return -1;\n\n    // Then sort by type in ascending order\n    return parseInt(a.item.type) - parseInt(b.item.type);\n})}}'
          }
          heightType="auto"
          itemWidth="200px"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="firmoIpAndRemIdentifierContainer"
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
                id="containerTitle426"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="62b09" viewKey="View 1">
              <TextInput
                id="firmoIpAndRemEachIdentifierVal"
                disabled=""
                label="{{IdentifiersList.value.filter((e) => {
  return e.code === item.item.type
})[0].labels.en}}{{ i ? '' :'' }}"
                marginType="normal"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                value="{{item.item.id}}"
              />
              <Icon
                id="icon284"
                hidden="true

"
                horizontalAlign="center"
                icon="bold/interface-edit-attachment-1"
              >
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      {
                        value:
                          '{{\n{"iteration" : i,\n"new_value" : eachIdentifierVal.value.trim(),\n"attribute_flag" : "identifier",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.identifier[i][1],\n  "remediation_action" : "update"}\n  }}',
                      },
                    ],
                  }}
                  pluginId="linkAttributeItem"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="docLinkOpen"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Icon>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
  </View>
</Container>
