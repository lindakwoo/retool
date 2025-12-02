<Container
  id="container95"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle146"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="5c1cc" viewKey="View 1">
    <Checkbox
      id="eachEducationDeleteFlag"
      hidden="{{ !eachEducationDeleteFlag.value }}"
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
      id="eachEducationDelete"
      disabled=""
      hidden={
        '{{ eachEducationDeleteFlag.value || ValidateUserRole.data || CurrentUserObj.value.level === "level0"}}'
      }
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        enabled="{{ !eachEducationDelete.disabled}}"
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
      id="college"
      disabled="{{ eachEducationDeleteFlag.value }}"
      label="College"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.college ? (CurrentSelectedContact.value.educations[i].item.college !== college.value ? '#99A7C8' : '#FFFFFF') : (college.value !=='' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{item.item.college}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\nvar curValues = temp[i];\n\ntemp[i].college= college.value;\n//console.log(temp);\nEducationValuesList.setValue(temp);",
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
      id="degreeCode"
      disabled="{{ eachEducationDeleteFlag.value }}"
      label="Degree Code"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.degreeCode ? (CurrentSelectedContact.value.educations[i].item.degreeCode !== degreeCode.value ? '#99A7C8' : '#FFFFFF') : (degreeCode.value !=='' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{item.item.degreeCode}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\ntemp[i].degreeCode= degreeCode.value;\n\nEducationValuesList.setValue(temp);",
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
      id="graduationDate"
      disabled="true"
      hidden="true"
      iconBefore="bold/interface-calendar"
      label="Graduation Date"
      labelPosition="top"
      placeholder="Enter a color"
      value={
        '{{ \n  (() => {\n    const graduationDate = item.item.graduationDate; // Get the graduation date\n    console.log("Graduation Date:", graduationDate);  // Print the graduation date\n\n    const graduationDatePrecision = item.item.graduationDatePrecision; // Get the precision\n    console.log("Graduation Date Precision:", graduationDatePrecision); // Print the precision\n\n    if (!graduationDate) {\n      console.log("No graduation date available."); // Log if graduation date is missing\n      return \'\';  // Return an empty string if the date is null or undefined\n    }\n\n    // Extract only the date part (YYYY-MM-DD) from the ISO string\n    const [dateOnly] = graduationDate.split(\'T\');  // Get the date part\n    console.log("Date Only:", dateOnly); // Print the extracted date\n\n    const [year, month, day] = dateOnly.split(\'-\'); // Split the date into year, month, day\n    console.log("Year:", year); // Print the year\n    console.log("Month:", month); // Print the month\n    console.log("Day:", day); // Print the day\n\n    // Return the formatted date based on precision\n    let formattedDate;\n    switch (graduationDatePrecision) {\n      case 11:\n        formattedDate = `${year}-${month}-${day}`;  // Full date: YYYY-MM-DD\n        break;\n      case 10:\n        formattedDate = `${year}-${month}`;         // Year and month: YYYY-MM\n        break;\n      case 9:\n        formattedDate = `${year}`;                  // Year only: YYYY\n        break;\n      default:\n        formattedDate = `${year}-${month}-${day}`;  // Full date by default\n    }\n\n    console.log("Formatted Date:", formattedDate); // Print the final formatted date\n    return formattedDate; // Return the formatted date\n  })()\n}}\n'
      }
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\ntemp[i].graduationDate= graduationDate.formattedValue;\n\nEducationValuesList.setValue(temp);",
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
      id="major"
      disabled="{{ eachEducationDeleteFlag.value }}"
      label="Major"
      labelPosition="top"
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.major ? (CurrentSelectedContact.value.educations[i].item.major !== major.value ? '#99A7C8' : '#FFFFFF') : (major.value !=='' ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{item.item.major}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\n\ntemp[i].major= major.value;\n\nEducationValuesList.setValue(temp);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text id="text473" value="**Graduation Date**" verticalAlign="center" />
    <Select
      id="gradYear"
      data="{{ _.range(1900, new Date().getFullYear() + 1) }}"
      disabled=""
      label="Year"
      labelPosition="top"
      placeholder="Select Year"
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.graduationDate ? (new Date(CurrentSelectedContact.value.educations[i].item.graduationDate).getUTCFullYear() !== gradYear.value ? '#99A7C8' : '#FFFFFF') : (gradYear.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{ new Date(item.item.graduationDate).getUTCFullYear()}}"
      values="{{ item }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = EducationValuesList.value;\n\nif(gradYear.value!= null){\n  temp[i].changedGradYear = gradYear.value;\n  temp[i].graduationDate = gradYear.value + "-" + "01";\n  temp[i].graduationDatePrecision = 9\n} else {\n  gradMonth.clearValue();\n  gradDate.clearValue();\n  delete temp[i].graduationDate; \n  delete temp[i].graduationDatePrecision \n}\n\n\nconsole.log(\'changedGradYear\',temp);\n\nEducationValuesList.setValue(temp);',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="gradMonth"
      disabled="{{ 
  !gradYear.value || gradYear.value === ''
}}
"
      itemMode="static"
      label="Month"
      labelPosition="top"
      placeholder="Select a month"
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.graduationDate &&  CurrentSelectedContact.value.educations[i].item.graduationDatePrecision > 9 ? ((new Date(item.item.graduationDate).getUTCMonth() < 9 ? '0' + (new Date(item.item.graduationDate).getUTCMonth() + 1) : new Date(item.item.graduationDate).getUTCMonth() + 1 )  !== gradMonth.value ? '#99A7C8' : '#FFFFFF') : (gradMonth.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
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
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "var temp = EducationValuesList.value;\nconsole.log('gradMonth.value', gradMonth.value)\nconsole.log('gradMonth11.value', gradMonth.value)\nif (gradMonth.value !== null) {\n   gradDate.clearValue();\n  temp[i].changedGradMonth = gradMonth.value;\n  temp[i].graduationDate = gradYear.value + \"-\" + gradMonth.value;\n  \n  // Ensure both gradMonth.value and gradDate.value are not null\n  temp[i].graduationDatePrecision = 10;\n} else {\n  gradDate.clearValue(); // clear gradDate if no month is provided\n  temp[i].graduationDate = gradYear.value + \"-01\"; // default to January if no month\n  temp[i].graduationDatePrecision = 9; // precision when month is unknown\n}\n\nconsole.log('changedGradMonth', temp)\nEducationValuesList.setValue(temp);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="gradDate"
      data="{{  Array.from(
  { length: (gradYear.value === new Date().getUTCFullYear() && gradMonth.value === (new Date().getUTCMonth() + 1)) ? new Date().getUTCDate() : new Date(gradYear.value, gradMonth.value, 0).getUTCDate() },
  (_, i) => (i + 1)
)}}"
      disabled="{{ 
 
  (gradYear.value && !gradMonth.value) || 
  (!gradYear.value && gradMonth.value) || 
  (!gradYear.value && !gradMonth.value)
}}"
      label="Day"
      labelPosition="top"
      placeholder="Select a day"
      showClear={true}
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{ CurrentSelectedContact.value.educations && CurrentSelectedContact.value.educations[i].item.graduationDate && CurrentSelectedContact.value.educations[i].item.graduationDatePrecision > 10 ? (new Date(CurrentSelectedContact.value.educations[i].item.graduationDate).getUTCDate() !== gradDate.value ? '#99A7C8' : '#FFFFFF') : (gradDate.value ? '#99A7C8' : '#FFFFFF') }}",
          },
        ],
      }}
      value="{{item.item.graduationDatePrecision > 10 ? new Date(item.item.graduationDate).getUTCDate(): ''}}"
      values=""
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = EducationValuesList.value;\n\n\nif(gradMonth.value!== null && gradDate.value !== null ) {\n temp[i].changedGradDay = gradDate.value;\n  console.log(\'gradDate.value.length\', gradDate.value);\n\n // temp[i].graduationDate = gradYear.value + "-" + gradMonth.value+ "-" +gradDate.value;\ntemp[i].graduationDate = gradYear.value + "-" + gradMonth.value + "-" +\n  (gradDate.value < 10 ? `0${gradDate.value}` : gradDate.value);\n  temp[i].graduationDatePrecision = 11\n}else{\n  temp[i].graduationDate = gradYear.value + "-" + "01";\n  temp[i].graduationDatePrecision = 9\n}\nconsole.log(\'changedGradDay\', temp);\nEducationValuesList.setValue(temp);',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
  </View>
</Container>
