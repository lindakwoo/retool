<Container
  id="MyEditsContainer2"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ ordered: [] }}
  styleContext={{ ordered: [] }}
>
  <Header>
    <IconText
      id="firmoGoldenRecordIcon"
      iconPosition="right"
      style={{
        ordered: [
          { fontSize: "h4Font" },
          { fontWeight: "h4Font" },
          { fontFamily: "h4Font" },
        ],
      }}
      text="Golden record ✪"
      tooltipText="Please hover the mouse over the name or field name to find the information provider name"
    />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Container
      id="CompanyNameContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="CompanyNameLocalContainer3"
          tooltipText="Please hover the mouse over the value to see the information provider's name."
          value="**Company Name***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="companyNamesList2"
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
            id="container41"
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
                id="containerTitle87"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachCompanyName2"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                readOnly="true"
                spellCheck={true}
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"1\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() === \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}\n"
                }
                value="{{item}}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = CompanyNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachCompanyName2.value.trim() !== '') {\n  //console.log('rad');\n  temp[i] = eachCompanyName2.value;\n  \n  CompanyNames.setValue(temp);\n}\n",
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
        <Container
          id="container42"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="true"
          maintainSpaceWhenHidden={true}
          margin="0"
          marginType="normal"
          overflowType="hidden"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle89"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newCompanyName2"
              disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
              label=""
              labelPosition="top"
              placeholder="Add Company Name"
              readOnly=""
              spellCheck={true}
              style={{ ordered: [] }}
            />
          </View>
        </Container>
        <Text
          id="text139"
          hidden="true"
          marginType="normal"
          style={{ ordered: [{ color: "danger" }] }}
          value="The Company Name field cannot be empty. Please provide a company name"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Container
      id="CompanyNamesLocalContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="CompanyNameLocalContainer2"
          tooltipText="Please hover the mouse over the value to see the information provider's name."
          value="**Company Name Local***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="companyLocalNamesList2"
          _primaryKeys="{{ i }}"
          computeAllInstanceValues={true}
          data="{{ CompanyNamesLocalList.value }}"
          heightType="auto"
          hidden="{{CompanyNamesLocalList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container43"
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
                id="containerTitle90"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachCompanyLocalName2"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"1\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() !== \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}\n"
                }
                value="{{ item.name}} 
 {{LanguagesList.value.filter((eachObj) => eachObj.Language_code_ISO_639_1 === item.language.toLowerCase())[0].Language_code_ISO_639_1}} - {{LanguagesList.value.filter((eachObj) => eachObj.Language_code_ISO_639_1 === item.language.toLowerCase())[0].labels.en}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = CompanyLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachCompanyLocalName2.value.trim() !== '') {\n  temp[i] = eachCompanyLocalName2.value;\n  \n  CompanyLocalNames.setValue(temp);\n}\n",
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
                id="icon62"
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
        <Container
          id="container58"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle114"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="c01df" viewKey="View 1">
            <TextInput
              id="newCompanyLocalName2"
              disabled=""
              hidden="true"
              label=""
              labelPosition="top"
              maintainSpaceWhenHidden={true}
              margin="0"
              placeholder="Add Company Local Name"
              readOnly="true"
              style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="PrevNameContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle249"
          tooltipText="Please hover the mouse over the value to see the information provider's name."
          value="**Prev Name***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="prevNamesList3"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ showAllPrevNames.value ? PreviousNamesList.value : PreviousNamesList.value.length > 0 ? PreviousNamesList.value.slice(0,1): []}}"
          heightType="auto"
          hidden="{{PreviousNamesList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Include src="./container164.rsx" />
        </ListViewBeta>
        <Link
          id="showMorePrevNames2"
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
        <Container
          id="container163"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden=""
          maintainSpaceWhenHidden={true}
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle248"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="c01df" viewKey="View 1">
            <TextInput
              id="newPrevName3"
              disabled=""
              hidden="true"
              label=""
              labelPosition="top"
              maintainSpaceWhenHidden={true}
              margin="0"
              placeholder="Add Prev Name"
              style={{
                ordered: [
                  { background: "{{ self.value ? '#99A7C8' : '#fff' }}" },
                ],
              }}
            />
            <Date
              id="newDateSince2"
              dateFormat="MM-dd-YYYY"
              datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
              hidden="{{ newPrevName3.value === '' }}"
              iconBefore="bold/interface-calendar"
              label="Date Since"
              labelPosition="top"
              maxDate="{{ new Date() }}"
              required="{{ newPrevName3.value !== '' ? true: false }}"
              style={{
                ordered: [
                  {
                    background:
                      "{{ newDateSince2.value  ? '#99A7C8' : '#fff'}}",
                  },
                ],
              }}
            />
            <Date
              id="newDateUntil2"
              dateFormat="MM-dd-YYYY"
              datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
              hidden="{{ newPrevName3.value === ''}}"
              iconBefore="bold/interface-calendar"
              label="Date Until"
              labelPosition="top"
              minDate="{{ new Date(new Date().setDate(new Date().getDate() + 1)) }}"
              style={{
                ordered: [
                  {
                    background:
                      "{{ newDateUntil2.value ? '#99A7C8' : '#fff' }}",
                  },
                ],
              }}
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="PrevLocalNameContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle94"
          tooltipText="Please hover the mouse over the value to see the information provider's name."
          value="**Prev Name Local***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="prevLocalNamesList2"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ PreviousNameLocalsList.value }}"
          heightType="auto"
          hidden="{{ PreviousNameLocalsList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container45"
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
                id="containerTitle93"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachPrevLocalName2"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"3\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() !== \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}"
                }
                value="{{ item}}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = prevLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachPrevLocalName2.value.trim() !== '') {\n  temp[i] = eachPrevLocalName2.value;\n  \n  prevLocalNames.setValue(temp);\n}\n",
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
                id="icon69"
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
          id="container57"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle113"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="c01df" viewKey="View 1">
            <TextInput
              id="newPrevLocalName2"
              disabled=""
              hidden="true"
              label=""
              labelPosition="top"
              maintainSpaceWhenHidden={true}
              margin="0"
              placeholder="Add Prev Local Name"
              readOnly="true"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="AkaNameContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle97"
          tooltipText="Please hover the mouse over the value to see the information provider's name."
          value="**AKA Name***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="akaNamesList2"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ AKANamesList.value }}"
          heightType="auto"
          hidden="{{AKANamesList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container46"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle95"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachAkaName2"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"2\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() === \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}"
                }
                value="{{ item}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = akaNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachAkaName2.value.trim() !== '') {\n  temp[i] = eachAkaName2.value;\n  \n  akaNames.setValue(temp);\n} ",
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
                id="icon72"
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
          id="container47"
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
              id="containerTitle96"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newAkaName2"
              disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data|| lockEntity.value }}"
              hidden="true"
              label=""
              labelPosition="top"
              maintainSpaceWhenHidden={true}
              margin="0"
              placeholder="Add AKA Name"
              readOnly=""
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="AkaNameLocalContainer2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle100"
          tooltipText={
            '{{sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source}).length > 0 ? \'Source: \' + sourceCodes.value.filter((obj)=> {\n  return obj.code === selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source})[0].label : \'\'}}\n{{!parseInt(selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source) ? \'Source: \' + selectedCompany.value.names.filter(item => item.item.type ==="2" && item.item.localizedNames[0].language.toLocaleLowerCase() !== "ii")[i].source : \'\'}}'
          }
          value="**AKA Name Local***"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <ListViewBeta
          id="akaLocalNamesList2"
          _primaryKeys="{{ item }}"
          computeAllInstanceValues={true}
          data="{{ AKANameLocalsList.value }}"
          heightType="auto"
          hidden="{{AKANameLocalsList.value.length === 0}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container48"
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
                id="containerTitle98"
                marginType="normal"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="ee81e" viewKey="View 1">
              <TextInput
                id="eachAkaLocalName2"
                disabled=""
                label=""
                labelPosition="top"
                margin="0"
                placeholder="Enter value"
                readOnly="true"
                style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                tooltipText={
                  " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"2\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() !== \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}"
                }
                value="{{ item}}"
              >
                <Event
                  event="blur"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: "var temp = akaLocalNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachAkaLocalName2.value.trim() !== '') {\n  temp[i] = eachAkaLocalName2.value;\n  \n  akaLocalNames.setValue(temp);\n}\n",
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
                id="icon75"
                hidden="{{ (eachAkaLocalName2.value.trim() == masterRecordAllAttributeHashDict.value.aka_name_local[i][2]) || (iconHiddenFlag.value.aka_name_local[i][0] && eachAkaLocalName2.value == iconHiddenFlag.value.aka_name_local[i][1])}}
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
                          '{{\n{"iteration" : i,\n"new_value" : eachAkaLocalName.value.trim(),\n"attribute_flag" : "aka_name_local",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.aka_name_local[i][1],\n  "remediation_action" : "update"}\n  }}',
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
              <Icon
                id="icon74"
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
                          '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "aka_name_local",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.aka_name_local[i][1],\n  "remediation_action" : "delete"}\n}}',
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
          id="container49"
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
              id="containerTitle99"
              marginType="normal"
              value="#### {{ item }}"
              verticalAlign="center"
            />
          </Header>
          <View id="ee81e" viewKey="View 1">
            <TextInput
              id="newAkaLocalName2"
              disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
              hidden="tru"
              label=""
              labelPosition="top"
              margin="0"
              placeholder="Add AKA Name Local"
              readOnly=""
            />
          </View>
        </Container>
      </View>
    </Container>
  </View>
</Container>
