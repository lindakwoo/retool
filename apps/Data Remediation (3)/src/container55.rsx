<Container
  id="container55"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle111"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="c01df" viewKey="View 1">
    <TextInput
      id="newPrevName"
      disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      label=""
      labelPosition="top"
      margin="0"
      placeholder="Add Prev Name"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
      value={
        '{{  GlobalListOfPrevName?.value?.newKey ? GlobalListOfPrevName?.value?.newKey :"" }}'
      }
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "\n// Force create an object with the key \nconst updated = {\n  newKey: newPrevName.value,\n  newDateSince: newDateSince.value,\n  newDateUntil: newDateUntil.value,\n  value:GlobalListOfPrevName?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfPrevName.setValue(updated);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text
      id="textErrorPrevName"
      hidden="{{!PreviousNamesList.value.some(obj => obj.name === newPrevName.value) }}"
      style={{ ordered: [{ color: "danger" }] }}
      value="{{ 'Please enter a unique previous name.' }}"
      verticalAlign="center"
    />
    <Date
      id="newDateSince"
      dateFormat="dd-MM-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ newPrevName.value === '' }}"
      iconBefore="bold/interface-calendar"
      label="Date Since"
      labelPosition="top"
      maxDate="{{ newDateUntil.value ? newDateUntil.value : new Date() }}"
      minDate="{{ prevNamesList.data.reduce((maxDate, item) => {
  const dates = [new Date(item.dateSince)];
  if (item.dateUntil) dates.push(new Date(item.dateUntil));

  const itemMax = new Date(Math.max(...dates.map(d => d.getTime())));

  if (itemMax > maxDate) {
    // Create a new UTC date and increment by 1 day
    const utcDate = new Date(itemMax.getTime());
    utcDate.setUTCDate(utcDate.getUTCDate() + 1);
    return utcDate;
  }

  return maxDate;
}, new Date(0)).toISOString()
 }}"
      style={{
        ordered: [
          { background: "{{ newDateSince.value  ? '#99A7C8' : '#fff'}}" },
        ],
      }}
      value="{{ GlobalListOfPrevName?.value?.newDateSince }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "// Force create an object with the key \nconst updated = {\n  newKey: newPrevName.value,\n  newDateSince: newDateSince.value,\n  newDateUntil: newDateUntil.value,\n  value:GlobalListOfPrevName?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfPrevName.setValue(updated);",
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
      id="newDateUntil"
      dateFormat="dd-MM-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ newPrevName.value === ''}}"
      iconBefore="bold/interface-calendar"
      label="Date Until"
      labelPosition="top"
      maxDate="{{ new Date() }}"
      minDate="{{ newDateSince.value.length !== 0 ? newDateSince.value : 
(PreviousNamesList.value.reduce((maxDate, item) => {
  const dates = [new Date(item.dateSince)];
  if (item.dateUntil) dates.push(new Date(item.dateUntil));

  const itemMax = new Date(Math.max(...dates.map(d => d.getTime())));

  if (itemMax > maxDate) {
    // Create a new UTC date and increment by 1 day
    const utcDate = new Date(itemMax.getTime());
    utcDate.setUTCDate(utcDate.getUTCDate() + 1);
    return utcDate;
  }

  return maxDate;
}, new Date(0))
).toISOString()

 }}

"
      style={{
        ordered: [
          { background: "{{ newDateUntil.value ? '#99A7C8' : '#fff' }}" },
        ],
      }}
      value="{{ GlobalListOfPrevName?.value?.newDateUntil }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "// Force create an object with the key \nconst updated = {\n  newKey: newPrevName.value,\n  newDateSince: newDateSince.value,\n  newDateUntil: newDateUntil.value,\n  value:GlobalListOfPrevName?.value?.value  \n};\n\n// Set the global value to this new object\nGlobalListOfPrevName.setValue(updated);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
  </View>
</Container>
