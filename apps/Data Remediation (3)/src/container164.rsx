<Container
  id="container164"
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
      id="containerTitle250"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="ee81e" viewKey="View 1">
    <TextInput
      id="eachPrevName3"
      disabled=""
      label=""
      labelPosition="top"
      margin="0"
      placeholder="Enter value"
      readOnly="true"
      style={{
        ordered: [
          { background: "{{ item.name !== self.value ? '#99A7C8' : '#fff' }}" },
        ],
      }}
      tooltipText={
        " {{ (() => { \n  const entry = selectedCompany.value.names.filter(item => \n    item.item.type === \"3\" && \n    item.item.localizedNames?.some(name => name.language.toLowerCase() === \"ii\")\n  )[i]; \n  \n  const src = entry?.source; \n  const matched = /^\\d+$/.test(src) \n    ? sourceCodes.value.find(obj => obj.code === src)?.labels?.en \n    : null; \n  \n  return src ? 'Source: ' + (matched?.trim() ? matched : src) : ''; \n})() }}"
      }
      value="{{ item.name }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (eachPrevName3.value.trim() !== '') {\n  temp[i].name = eachPrevName3.value;\n  \n  prevNames.setValue(temp);\n} else {\n  eachPrevName3.setValue( PreviousNamesList.value[i].name);\n  prevNameFieldChange.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Date
      id="dateSince2"
      dateFormat="dd-MM-yyyy"
      iconBefore="bold/interface-calendar"
      label="Date Since"
      labelPosition="top"
      maxDate="{{  new Date()}}"
      readOnly="true"
      required="{{ item.name !== eachPrevName3.value ? true: false }}"
      style={{ ordered: [] }}
      tooltipText="Add a Date from the calendar rather than typing it"
      value="{{ item.dateSince }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateSince2.value !== '') {\n  temp[i].dateSince = moment.utc(dateSince2.value).format('MM-DD-YYYY');\n  \n  prevNames.setValue(temp);\n} else {\n  dateSince2.setValue( PreviousNamesList.value[i].dateSince);\n  prevNameFieldChange.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Icon
      id="icon213"
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
        pluginId="prevNameFieldChange"
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
                '{{\n{"iteration" : i,\n"new_value" : "",\n"attribute_flag" : "prev_name",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.prev_name[i][1],\n  "remediation_action" : "delete"}\n}}',
            },
          ],
        }}
        pluginId="linkAttributeItem"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Date
      id="dateUntil2"
      dateFormat="dd-MM-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Date Until"
      labelPosition="top"
      minDate="{{ new Date(new Date().setDate(new Date().getDate() + 1)) }}"
      readOnly="true"
      style={{ ordered: [{ background: "#ffffff" }, { border: "#ffffff" }] }}
      tooltipText="Add a Date from the calendar rather than typing it"
      value="{{item.dateUntil }}"
    >
      <Event
        event="blur"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateUntil2.value !== '') {\n  temp[i].dateUntil = moment.utc(dateUntil2.value).format('MM-DD-YYYY');\n  \n  prevNames.setValue(temp);\n} else {\n  dateUntil2.setValue( PreviousNamesList.value[i].dateUntil);\n  prevNameFieldChange.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Divider id="divider2" style={{ ordered: [{ color: "primary" }] }} />
  </View>
</Container>
