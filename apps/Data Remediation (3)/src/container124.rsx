<Container
  id="container124"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle182"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="5c1cc" viewKey="View 1">
    <Checkbox
      id="eachEducationDeleteFlag2"
      hidden="true"
      label="Delete"
      labelWidth="100"
      value="{{EducationsDeleteFlags.value[i]}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationsDeleteFlags.value;\n\ntemp[i] = false;\nconsole.log(temp);\nconsole.log(EducationsDeleteFlags.value)\n\nEducationsDeleteFlags.setValue(temp);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <Icon
      id="eachEducationDelete2"
      disabled="{{item.source === 'REMEDIATED'}}"
      hidden="true"
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !eachEducationDelete2.disabled}}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleEducationDelete"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <TextInput
      id="college2"
      disabled="{{ eachEducationDeleteFlag2.value }}"
      label="College"
      labelPosition="top"
      value="{{item.item.college}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\nvar curValues = temp[i];\n\ntemp[i].college= college2.value;\n//console.log(temp);\nEducationValuesList.setValue(temp);",
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
      id="degreeCode2"
      disabled="{{ eachEducationDeleteFlag2.value }}"
      label="Degree Code"
      labelPosition="top"
      value="{{item.item.degreeCode}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\ntemp[i].degreeCode= degreeCode2.value;\n\nEducationValuesList.setValue(temp);",
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
      id="graduationDate2"
      disabled="true"
      hidden="true"
      iconBefore="bold/interface-calendar"
      label="Graduation Date"
      labelPosition="top"
      placeholder="Enter a color"
      value={
        '{{ \n  (() => {\n    const graduationDate = item.item.graduationDate; // Get the graduation date\n    console.log("Graduation Date:", graduationDate);  // Print the graduation date\n\n    const graduationDatePrecision = item.item.graduationDatePrecision; // Get the precision\n    console.log("Graduation Date Precision:", graduationDatePrecision); // Print the precision\n\n    if (!graduationDate) {\n      console.log("No graduation date available."); // Log if graduation date is missing\n      return \'\';  // Return an empty string if the date is null or undefined\n    }\n\n    // Extract only the date part (YYYY-MM-DD) from the ISO string\n    const [dateOnly] = graduationDate.split(\'T\');  // Get the date part\n    console.log("Date Only:", dateOnly); // Print the extracted date\n\n    const [year, month, day] = dateOnly.split(\'-\'); // Split the date into year, month, day\n    console.log("Year:", year); // Print the year\n    console.log("Month:", month); // Print the month\n    console.log("Day:", day); // Print the day\n\n    // Return the formatted date based on precision\n    let formattedDate;\n    switch (graduationDatePrecision) {\n      case 11:\n        formattedDate = `${year}-${month}-${day}`;  // Full date: YYYY-MM-DD\n        break;\n      case 10:\n        formattedDate = `${year}-${month}`;         // Year and month: YYYY-MM\n        break;\n      case 9:\n        formattedDate = `${year}`;                  // Year only: YYYY\n        break;\n      default:\n        formattedDate = `${year}-${month}-${day}`;  // Full date by default\n    }\n\n    console.log("Formatted Date:", formattedDate); // Print the final formatted date\n    return formattedDate; // Return the formatted date\n  })()\n}}\n'
      }
    />
    <TextInput
      id="major2"
      disabled="{{ eachEducationDeleteFlag2.value }}"
      label="Major"
      labelPosition="top"
      value="{{item.item.major}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\ntemp[i].major= major2.value;\n\nEducationValuesList.setValue(temp);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text id="text476" value="**Graduation Date**" verticalAlign="center" />
    <Select
      id="year2"
      data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
      disabled="true"
      label="Year"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{ new Date(item.item.graduationDate).getUTCFullYear()}}"
      values="{{ item }}"
    />
    <Select
      id="month2"
      disabled="true"
      itemMode="static"
      label="Month"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{ item.item.graduationDatePrecision > 9 ? (new Date(item.item.graduationDate).getUTCMonth() < 9 ? '0' + (new Date(item.item.graduationDate).getUTCMonth() + 1) : new Date(item.item.graduationDate).getUTCMonth() + 1 ) : ''}}"
    >
      <Option id="362a7" label="January" value="01" />
      <Option id="180d9" label="February" value="02" />
      <Option id="6e2aa" label="March" value="03" />
      <Option id="25a6b" label="April" value="04" />
      <Option id="bedc7" label="May" value="05" />
      <Option id="fb31f" label="June" value="06" />
      <Option id="fdfa2" label="July" value="07" />
      <Option id="fe72f" label="August" value="08" />
      <Option id="02def" label="September" value="09" />
      <Option id="123aa" label="October" value={10} />
      <Option id="6e75e" label="November" value={11} />
      <Option id="67a56" label="December" value={12} />
    </Select>
    <Select
      id="day2"
      data="{{ _.range(1, 32) }}"
      disabled="true"
      label="Day"
      labelPosition="top"
      showSelectionIndicator={true}
      value="{{item.item.graduationDatePrecision > 10 ? new Date(item.item.graduationDate).getUTCDate() : ''}}"
    />
  </View>
</Container>
