<Container
  id="GoldenContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ jiraUCIClick.value }}"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
  style={{ ordered: [{ background: "rgb(232, 238, 250)" }] }}
>
  <Header>
    <Text
      id="containerTitle129"
      value="#### Golden Record"
      verticalAlign="center"
    />
  </Header>
  <View id="2e49b" viewKey="View 1">
    <Container
      id="container69"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle125"
          value={
            '###### {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.salutation}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}\n{{NationalitiesList.value.filter((o)=> CurrentSelectedContact.value.personalInfo.item.nationalities.includes(o.code)).map((a) => a.labels.en)}}'
          }
          verticalAlign="center"
        />
      </Header>
      <View id="2e49b" viewKey="View 1">
        <Text
          id="text349"
          value="**Contact ID:** {{ CurrentSelectedContact.value.header.entityID}}"
          verticalAlign="center"
        />
        <Text
          id="text351"
          value="**Current Roles:** {{CurrentRoleTotalElements.value > 120 ? '120(*)' : CurrentRoleTotalElements.value }}"
          verticalAlign="center"
        />
        <Text
          id="text350"
          value="**Previous Roles:** {{PreviousRoleTotalElements.value > 120 ? '120(*)' : PreviousRoleTotalElements.value }}"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Include src="./AboutContainer2.rsx" />
    <Include src="./EducationContainer4.rsx" />
    <Container
      id="EducationContainer2"
      disabled="{{ValidateUserRole.data }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle52"
          value="#### Education"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle52"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ EducationContainer2.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="EducationContainer2"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="EducationList2"
          data="{{CurrentSelectedContact.value.educations}}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Include src="./container124.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="container110"
      disabled="{{ValidateUserRole.data }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="collapsibleTitle45"
          value="#### Biography"
          verticalAlign="center"
        />
        <ToggleButton
          id="collapsibleToggle45"
          horizontalAlign="right"
          iconForFalse="bold/interface-arrows-button-down"
          iconForTrue="bold/interface-arrows-button-up"
          iconPosition="replace"
          styleVariant="outline"
          text="{{ self.value ? 'Hide' : 'Show' }}"
          value="{{ container110.showBody }}"
        >
          <Event
            event="change"
            method="setShowBody"
            params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
            pluginId="container110"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </ToggleButton>
      </Header>
      <View id="ae4bc" viewKey="View 1">
        <ListViewBeta
          id="BiographiesList2"
          data="{{ CurrentSelectedContact.value.biographies }}"
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Checkbox
            id="eachBiographyDeleteFlag2"
            hidden="true"
            label="Delete"
            labelWidth="100"
            value="{{ BiographyDeleteFlags.value[i] }}"
          />
          <Icon
            id="eachBiographyDelete2"
            disabled="true"
            hidden="true"
            horizontalAlign="center"
            icon="bold/interface-delete-bin-2"
          >
            <Event
              enabled="{{ !eachBiographyDelete2.disabled}}"
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="HandleBiographyDelete"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Icon>
          <TextArea
            id="eachBiography2"
            autoResize={true}
            disabled="{{ eachBiographyDeleteFlag2.value }}"
            label=""
            labelPosition="top"
            maxLines="6"
            minLines="1"
            readOnly="true"
            value="{{ item.item.value }}"
          >
            <Event
              event="change"
              method="run"
              params={{
                ordered: [
                  {
                    src: "var temp = BiographyValuesList.value;\n\ntemp[i].value = eachBiography2.value;\n\nBiographyValuesList.setValue(temp);",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </TextArea>
        </ListViewBeta>
      </View>
    </Container>
    <Include src="./container135.rsx" />
    <Include src="./container132.rsx" />
    <Include src="./container133.rsx" />
  </View>
</Container>
