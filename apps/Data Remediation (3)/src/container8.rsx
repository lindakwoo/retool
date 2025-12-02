<Container
  id="container8"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ !showAllPrevNames.value  && i > 0}}"
  marginType="normal"
  overflowType="hidden"
  padding="0"
  showBody={true}
  showBorder={false}
  style={{ ordered: [] }}
>
  <Header>
    <Text
      id="containerTitle15"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="ee81e" viewKey="View 1">
    <TextInput
      id="eachPrevName"
      disabled=""
      label=""
      labelPosition="top"
      margin="0"
      placeholder="Enter value"
      style={{
        ordered: [
          {
            background:
              "{{ item.name !== PreviousNamesList.value[i]?.name\n    ? '#99A7C8' \n    : '#fff' }}\n",
          },
        ],
      }}
      value="{{ item.name }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = prevNames.value;\n\nif (eachPrevName.value.trim() !== \'\') {\n  temp[i].name = eachPrevName.value;\n  prevNames.setValue(temp);\n  GlobalListOfPrevName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newPrevName.value,\n    "newDateSince": newDateSince.value,\n    "newDateUntil": newDateUntil.value,\n    \n  })\n} else {\n  temp[i].name = "";\n  prevNames.setValue(temp);\n}\n\n  ',
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
      id="dateSince"
      dateFormat="dd-MM-yyyy"
      disabled=""
      iconBefore="bold/interface-calendar"
      label="Date Since"
      labelPosition="top"
      maxDate="{{ dateUntil.value ? dateUntil.value : new Date() }}"
      showClear={true}
      style={{
        ordered: [
          {
            background:
              "{{\n  (\n    (() => {\n      const current = item.dateSince;\n      const previous = PreviousNamesList.value[i].dateSince;\n\n      const extractDate = (d) => d ? (d.includes('T') ? d.split('T')[0] : d) : '';\n\n      const c = extractDate(current);\n      const p = extractDate(previous);\n\n      if (!current && previous) return '#99A7C8';\n\n      return c !== p ? '#99A7C8' : '#fff';\n    })()\n  )\n}}\n\n",
          },
        ],
      }}
      tooltipText="Add a Date from the calendar rather than typing it"
      value="{{ item.dateSince ? item.dateSince: ''}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateSince.value !== \'\') {\n  temp[i].dateSince = dateSince.value;\n  \n  prevNames.setValue(temp);\n\n  GlobalListOfPrevName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newPrevName.value,\n    "newDateSince": newDateSince.value,\n    "newDateUntil": newDateUntil.value,\n    \n  })\n} else {\n  //  dateSince.setValue( PreviousNamesList.value[i].dateSince);\n  temp[i].dateSince = null;\n  prevNames.setValue(temp);\n //prevNameFieldChange.trigger();\n}',
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
      id="icon8"
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
      id="dateUntil"
      dateFormat="dd-MM-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled=""
      iconBefore="bold/interface-calendar"
      label="Date Until"
      labelPosition="top"
      maxDate="{{ new Date() }}"
      minDate="{{ dateSince.value }}"
      showClear={true}
      style={{
        ordered: [
          {
            background:
              "{{\n  (\n    (() => {\n      const current = item.dateUntil;\n      const previous = PreviousNamesList.value[i].dateUntil;\n\n      const extractDate = (d) => d ? (d.includes('T') ? d.split('T')[0] : d) : '';\n\n      const c = extractDate(current);\n      const p = extractDate(previous);\n\n      if (!current && previous) return '#99A7C8';\n\n      return c !== p ? '#99A7C8' : '#fff';\n    })()\n  )\n}}\n",
          },
        ],
      }}
      tooltipText="Add a Date from the calendar rather than typing it"
      value="{{item.dateUntil ? item.dateUntil : '' }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateUntil.value !== \'\') {\n  temp[i].dateUntil = dateUntil.value;\n  \n  prevNames.setValue(temp);\n  GlobalListOfPrevName.setValue({\n    "change": true,\n    "value": temp,\n    "newKey": newPrevName.value,\n    "newDateSince": newDateSince.value,\n    "newDateUntil": newDateUntil.value,\n    \n  })\n} else {\n   temp[i].dateUntil = null;\n  \n  prevNames.setValue(temp);\n  //  dateUntil.setValue( PreviousNamesList.value[i].dateUntil);\n  //prevNameFieldChange.trigger();\n}',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Divider id="divider1" style={{ ordered: [{ color: "primary" }] }} />
  </View>
</Container>
