<Container
  id="container176"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle276"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="855d7" viewKey="View 1">
    <Select
      id="businessDescLanguageInputField"
      allowCustomValue={true}
      data="{{LanguagesList.value}}"
      disabled="{{ deleteFlag2.value }}"
      emptyMessage="No options"
      label="Language"
      labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      style={{
        ordered: [
          {
            background:
              "{{\n  GlobalBusinessList?.value?.value?.length > 0\n    ? (\n        GlobalBusinessList.value.value[i].language?.toLowerCase() !==\n        selectedCompany?.value?.activityDescriptions?.[i]?.item?.language?.toLowerCase()\n      )\n      ? '#99A7C8'\n      : '#fff'\n    : '#fff'\n}}\n\n\n",
          },
        ],
      }}
      value="{{ 
  LanguagesList.value.filter(obj => 
    obj.Language_code_ISO_639_1?.toLowerCase() === 
    (item?.item?.language?.toLowerCase() || item?.language?.toLowerCase())
  )[0]?.Language_code_ISO_639_1 
}}
"
      values="{{ item.Language_code_ISO_639_1.toString() }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = BusinessDescriptionsVariableList.value;\n\nvar oldValue = temp[i]; // Optionally store the old value if needed\n\nconsole.log(\'inside change of lang\',BusinessDescriptionsVariableList.value);\nconsole.log(temp);\n\nif (businessDescLanguageInputField.value.trim() !== \'\') {\n  console.log(\'businessDescLanguage\');\n  //console.log(businessDescLanguageInputField.value)\n   console.log("temp",BusinessDescriptionsVariableList.value);\n  temp[i].language = businessDescLanguageInputField.value; \n\n \n    BusinessDescriptionsVariableList.setValue(temp);\n  console.log("final", BusinessDescriptionsVariableList.value);\n   GlobalBusinessList.setValue({\n    "change": true,\n    "value": temp\n  });\n \n}',
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
      id="deleteBusiness2"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || deleteFlag2.value || lockEntity.value }}"
      horizontalAlign="center"
      icon="bold/interface-delete-bin-2"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          ],
        }}
        pluginId="businessDeleteFlag"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [] }}
        pluginId="linkAttributeItem"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Checkbox
      id="deleteFlag2"
      disabled=""
      hidden="{{!deleteFlag2.value}}"
      label="Delete"
      labelAlign="right"
      labelPosition="left"
      labelWidth={100}
      marginType="normal"
      value="false"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="businessDeleteCheckBox"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <TextArea
      id="businessDescInputField"
      autoResize={true}
      disabled="{{ deleteFlag2.value }}"
      hidden=""
      label=""
      labelPosition="top"
      margin="0"
      minLines={2}
      placeholder="Enter value"
      spellCheck={true}
      style={{
        ordered: [
          {
            background:
              "{{ GlobalBusinessList?.value?.value?.length > 0 ? ( GlobalBusinessList.value.value[i].value !== selectedCompany?.value?.activityDescriptions?.[i]?.item?.value)  ? '#99A7C8' : '#fff' : '#fff' }}\n",
          },
        ],
      }}
      value="{{item?.value||item?.item?.value}}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'var temp = BusinessDescriptionsVariableList.value;\n\n//var oldValue = temp; // Optionally store the old value if needed\n\nif (businessDescInputField.value.trim() !== \'\') {\n  \n  temp[i].value = businessDescInputField.value.trim().replace(/\\s{2,}/g, \' \');\n  GlobalBusinessList.setValue({ "change": true, "value": temp })\n  \n BusinessDescriptionsVariableList.setValue(temp);\n  //console.log("BusinessDescriptionsVariableList", BusinessDescriptionsVariableList.value)\n}',
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
