<Container
  id="LegalFieldsContainer3"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle406"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Select
      id="legalFormSelect3"
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
      label="Standardized Legal Form*"
      labelPosition="top"
      labels="{{item.code}} - {{item.labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipByIndex=""
      tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}
"
      value="{{legalForms.value.filter(function(item) {
  return item.code === parseInt(selectedCompany.value.entityInfo.item.standardizedLegalForm);
})[0].code}}"
      values="{{ item.code }}"
    />
    <Select
      id="nationalLegalFormdis2"
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
      label="National Legal Form*"
      labelPosition="top"
      labels="{{item.code}} - {{item.labels.en}}"
      marginType="normal"
      overlayMaxHeight={375}
      readOnly="true"
      showSelectionIndicator={true}
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipByIndex=""
      tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
      value="{{nationalLegalForm.value.filter(function(item) {
  return item.code === parseInt(selectedCompany.value.entityInfo.item.nationalLegalForm);
})[0].code}}"
      values="{{ item.code }}"
    />
    <TextInput
      id="stateOfIncoperationgld2"
      disabled=""
      label="State Of Incorporation*"
      labelPosition="top"
      marginType="normal"
      readOnly="true"
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
      value="{{selectedCompany.value.entityInfo.item.stateOfIncorporation}}"
    />
    <Container
      id="group7"
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
          id="IncorporationDate5"
          value="**Incorporation Date***"
          verticalAlign="center"
        />
        <Select
          id="editIncopYear"
          data="{{ _.range(1800, new Date().getFullYear() + 1) }}"
          disabled="true"
          emptyMessage="No options"
          label="Year"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
          value="{{ new Date(selectedCompany.value.entityInfo.item.incorporationDate.substring(0, 4)).getUTCFullYear()}}"
          values="{{ item }}"
        />
        <Select
          id="editIncopMonth"
          captionByIndex=""
          colorByIndex=""
          data=""
          disabled="true"
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
          style={{ ordered: [] }}
          tooltipByIndex=""
          tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
          value="{{ selectedCompany.value.entityInfo.item.incorporationDatePrecision > 9 ? (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() < 9 ? '0' + (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1) : new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1 ) : ''}}"
          values=""
        >
          <Option
            id="30bd1"
            disabled={false}
            hidden={false}
            label="January"
            value="01"
          />
          <Option
            id="44ed5"
            disabled={false}
            hidden={false}
            label="February"
            value="02"
          />
          <Option
            id="d19dd"
            disabled={false}
            hidden={false}
            label="March"
            value="03"
          />
          <Option
            id="c7c43"
            disabled={false}
            hidden={false}
            label="April"
            value="04"
          />
          <Option
            id="1ebb1"
            disabled={false}
            hidden={false}
            label="May"
            value="05"
          />
          <Option
            id="7c1cb"
            disabled={false}
            hidden={false}
            label="June"
            value="06"
          />
          <Option
            id="765ed"
            disabled={false}
            hidden={false}
            label="July"
            value="07"
          />
          <Option
            id="54494"
            disabled={false}
            hidden={false}
            label="August"
            value="08"
          />
          <Option
            id="80161"
            disabled={false}
            hidden={false}
            label="September"
            value="09"
          />
          <Option
            id="ef65d"
            disabled={false}
            hidden={false}
            label="October"
            value="10"
          />
          <Option
            id="9af58"
            disabled={false}
            hidden={false}
            label="November"
            value="11"
          />
          <Option
            id="3050e"
            disabled={false}
            hidden={false}
            label="December"
            value="12"
          />
        </Select>
        <Select
          id="editIncopDay"
          data="{{  Array.from(
  { length: (incopYear.value === new Date().getUTCFullYear() && editIncopMonth.value === (new Date().getUTCMonth() + 1)) ? new Date().getUTCDate() : new Date(incopYear.value, editIncopMonth.value, 0).getUTCDate() },
  (_, i) => (i + 1).toString().padStart(2, '0')
)}}"
          disabled="true"
          emptyMessage="No options"
          label="Day"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          style={{ ordered: [] }}
          tooltipText="{{ 
  (() => {
    const source = selectedCompany.value.entityInfo.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
          value="{{selectedCompany.value.entityInfo.item.incorporationDatePrecision > 10 ? new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCDate().toString().padStart(2, '0') : ''}}"
          values="{{ item }}"
        />
      </View>
    </Container>
  </View>
</Container>
