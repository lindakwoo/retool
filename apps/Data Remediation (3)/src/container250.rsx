<Container
  id="container250"
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
      id="containerTitle431"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="ee81e" viewKey="View 1">
    <TextInput
      id="firmoPreAndRemEachPrevName"
      disabled=""
      label=""
      labelPosition="top"
      margin="0"
      placeholder="Enter value"
      readOnly="true"
      style={{ ordered: [{ border: "#ffffff" }] }}
      value="{{ item.name }}"
    />
    <Date
      id="dateSince4"
      dateFormat="MM-dd-yyyy"
      iconBefore="bold/interface-calendar"
      label="Date Since"
      labelPosition="top"
      maxDate="{{  new Date()}}"
      readOnly="true"
      required="{{ item.name !== firmoPreAndRemEachPrevName.value ? true: false }}"
      style={{ ordered: [] }}
      value="{{ item.dateSince }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateSince4.value !== '') {\n  temp[i].dateSince = moment.utc(dateSince4.value).format('MM-DD-YYYY');\n  \n  prevNames.setValue(temp);\n} else {\n  dateSince4.setValue( PreviousNamesList.value[i].dateSince);\n  prevNameFieldChange.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Date
      id="dateUntil4"
      dateFormat="MM-dd-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Date Until"
      labelPosition="top"
      minDate="{{ new Date(new Date().setDate(new Date().getDate() + 1)) }}"
      readOnly="true"
      style={{ ordered: [{ background: "#ffffff" }, { border: "#ffffff" }] }}
      value="{{item.dateUntil }}"
    >
      <Event
        event="blur"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = prevNames.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nif (dateUntil4.value !== '') {\n  temp[i].dateUntil = moment.utc(dateUntil4.value).format('MM-DD-YYYY');\n  \n  prevNames.setValue(temp);\n} else {\n  dateUntil4.setValue( PreviousNamesList.value[i].dateUntil);\n  prevNameFieldChange.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Divider id="divider8" style={{ ordered: [{ color: "primary" }] }} />
  </View>
</Container>
