<Container
  id="LegalFieldsContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle409"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Container
      id="group9"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0px"
      padding="0px"
      showBody={true}
      showBorder={false}
      style={{ ordered: [{ background: "rgba(255, 255, 255, 0)" }] }}
    >
      <View id="c0251" viewKey="View 1">
        <Select
          id="legalFormSelect"
          captionByIndex=""
          colorByIndex=""
          data="{{ legalForms.value }}"
          disabled=""
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="Standardized Legal Form"
          labelPosition="top"
          labels="{{item.code}} - {{item.labels.en}}"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{legalForms.value.filter(function(item) {\n  return item.code === parseInt(selectedCompany.value.entityInfo.item.standardizedLegalForm);\n})[0].code !== self.value ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          tooltipByIndex=""
          value="{{ 
  legalForms.value.filter(function(item) {
    return item.code === parseInt(
      GlobalLegalInformation.value.legal || selectedCompany.value.entityInfo.item.standardizedLegalForm
    );
  })[0]?.code 
}}
"
          values="{{ item.code }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: '//  GlobalLegalInformation.setValue(\n//    { \n//      "change": true,\n//      "legal": legalFormSelect.value \n//    }\n//  )\n\nGlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  legal: legalFormSelect.value\n});\n',
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
    <Container
      id="group10"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0px"
      padding="0px"
      showBody={true}
      showBorder={false}
      style={{ ordered: [{ background: "rgba(255, 255, 255, 0)" }] }}
    >
      <View id="c0251" viewKey="View 1">
        <Select
          id="nationalLegalFormValue"
          captionByIndex=""
          colorByIndex=""
          data="{{ updatedNationalLegalForm.value }}"
          disabled=""
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="National Legal Form"
          labelPosition="top"
          labels="{{item.code}} - {{item.labels.en}}"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{nationalLegalForm.value.filter(function(item) {\n  return item.code === parseInt(selectedCompany.value.entityInfo.item.nationalLegalForm);\n})[0].code !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          tooltipByIndex=""
          value="

{{ 
  nationalLegalForm.value.filter(function(item) {
    return item.code === parseInt(
      GlobalLegalInformation.value.national || selectedCompany.value.entityInfo.item.nationalLegalForm
    );
  })[0]?.code 
}}
"
          values="{{ item.code }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "\nGlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  national: nationalLegalFormValue.value\n});\n",
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
    <Container
      id="group12"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      style={{ ordered: [{ background: "rgba(255, 255, 255, 0)" }] }}
    >
      <View id="35c2a" viewKey="View 1">
        <TextInput
          id="stateOfIncorporationValue"
          disabled=""
          label="State Of Incorporation"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{selectedCompany.value.entityInfo.item.stateOfIncorporation !== self.value ? '#99A7C8': '#fff'}}",
              },
            ],
          }}
          value="{{ 
  GlobalLegalInformation.value.stateOfInc || selectedCompany.value.entityInfo.item.stateOfIncorporation 
}}
"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "GlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  stateOfInc: stateOfIncorporationValue.value\n});",
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
    <Container
      id="group11"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0px"
      padding="0px"
      showBody={true}
      showBorder={false}
      style={{ ordered: [{ background: "rgba(255, 255, 255, 0)" }] }}
    >
      <View id="c0251" viewKey="View 1">
        <Text
          id="IncorporationDate"
          value="**Incorporation Date**"
          verticalAlign="center"
        />
        <Select
          id="incopYear"
          customValidation="{{ (selectedCompany.value.entityInfo.item.incorporationDate.length !== 0 && (incopYear.value === null || incopYear.value.length === 0)) ? 'Please select year': ''}}"
          data="{{ _.range(1800, new Date().getFullYear() + 1) }}"
          disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }}"
          disabledByIndex="{{ lockEntity.value }}"
          emptyMessage="No options"
          label="Year"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{selectedCompany.value.entityInfo.item && selectedCompany.value.entityInfo.item.incorporationDate ?   (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCFullYear() !== incopYear.value ? '#99A7C8' : '#fff') : (incopYear.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{ selectedCompany.value.entityInfo.item.incorporationDate? new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCFullYear() : null}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if ((!incopYear.value || incopYear.value !== null)) {\n  incopMonth.clearValue();\n  incopDay.clearValue();\n}\n\nGlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  year: incopYear.value\n});",
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
          id="incopMonth"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled="{{ !incopYear.value ||  ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          itemMode="static"
          label="Month"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{\n  selectedCompany.value.entityInfo.item && \n  selectedCompany.value.entityInfo.item.incorporationDate && \n  selectedCompany.value.entityInfo.item.incorporationDatePrecision > 9 \n    ? ((new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1).toString().padStart(2, '0') !== String(incopMonth.value).padStart(2, '0')) \n      ? '#99A7C8' \n      : '#fff' \n    : (incopMonth.value && String(incopMonth.value).padStart(2, '0') !== \"00\") \n      ? '#99A7C8' \n      : '#fff'\n}}\n\n\n",
              },
            ],
          }}
          tooltipByIndex=""
          value="{{ GlobalLegalInformation.value.month ||(selectedCompany.value.entityInfo.item.incorporationDatePrecision > 9 ? (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() < 9 ? '0' + (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1) : new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1 ) : '')}}"
          values=""
        >
          <Option
            id="30bd1"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(0)}}"
            label="January"
            value="01"
          />
          <Option
            id="44ed5"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(1)}}"
            label="February"
            value="02"
          />
          <Option
            id="d19dd"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(2)}}"
            label="March"
            value="03"
          />
          <Option
            id="c7c43"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(3)}}"
            label="April"
            value="04"
          />
          <Option
            id="1ebb1"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(4)}}"
            label="May"
            value="05"
          />
          <Option
            id="7c1cb"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(5)}}"
            label="June"
            value="06"
          />
          <Option
            id="765ed"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(6)}}"
            label="July"
            value="07"
          />
          <Option
            id="54494"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(7)}}"
            label="August"
            value="08"
          />
          <Option
            id="80161"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(8)}}"
            label="September"
            value="09"
          />
          <Option
            id="ef65d"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(9)}}"
            label="October"
            value="10"
          />
          <Option
            id="9af58"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(10)}}"
            label="November"
            value="11"
          />
          <Option
            id="3050e"
            disabled={false}
            hidden="{{ incopYear.value === new Date().getFullYear() && new Date().getMonth()+1 <= parseInt(11)}}"
            label="December"
            value="12"
          />
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "if (!incopMonth.value || incopMonth.value !== null) {\n  incopDay.clearValue();\n} \n \n\nGlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  month: incopMonth.value\n});",
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
          id="incopDay"
          data="{{  Array.from(
  { length: (parseInt(incopYear.value) === new Date().getFullYear() && parseInt(incopMonth.value) === (new Date().getMonth() + 1)) ? new Date().getDate() : new Date(incopYear.value, incopMonth.value, 0).getDate() },
  (_, i) => (i + 1).toString().padStart(2, '0')
)}}"
          disabled="{{ !incopMonth.value || ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }}"
          emptyMessage="No options"
          label="Day"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{ \n  selectedCompany.value.entityInfo.item &&\n  selectedCompany.value.entityInfo.item.incorporationDate &&\n  selectedCompany.value.entityInfo.item.incorporationDatePrecision > 10\n    ? ( \n        new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCDate() !== Number(incopDay.value)\n      ) \n        ? '#99A7C8' \n        : '#fff' \n    : (incopDay.value ? '#99A7C8' : '#fff') \n}}\n",
              },
            ],
          }}
          value="{{GlobalLegalInformation.value.day  ||(selectedCompany.value.entityInfo.item.incorporationDatePrecision > 10 ? (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCDate()).toString().padStart(2, '0') : '')}}"
          values="{{ item }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "\nGlobalLegalInformation.setValue({\n  ...GlobalLegalInformation.value,\n  day: incopDay.value\n});",
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
  </View>
</Container>
