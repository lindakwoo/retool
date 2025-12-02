<ModalFrame
  id="UserDetailsModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  size="fullScreen"
  style={{ ordered: [{ background: "rgba(232, 238, 250, 1)" }] }}
>
  <Header>
    <Text
      id="modalTitle8"
      hidden="{{ jiraUCIClick.value }}"
      value={
        '#### {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.salutation}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.first}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.middle}} {{CurrentSelectedContact.value.names.filter(function(eachName) {\n  return eachName.item.languageType === "1"\n})[0].item.last}}\n{{NationalitiesList.value.filter((o)=> CurrentSelectedContact.value.personalInfo.item.nationalities.includes(o.code)).map((a) => a.labels.en)}} '
      }
      verticalAlign="center"
    />
    <ButtonGroup2
      id="buttonGroup3"
      alignment="right"
      hidden="{{ jiraUCIClick.value }}"
      overflowPosition={3}
    >
      <ButtonGroup2-Button
        id="de099"
        backgroundColor="rgb(204, 204, 204)"
        icon="bold/interface-arrows-synchronize"
        iconPosition="left"
        styleVariant="custom"
        text="Refresh"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetContactInfoByUCI"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="ResetIndividualFormFields"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetDirectorsIdsManagerAllData"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="GetDisplayDirectorIds"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "GetFunctionBulkProcess.trigger();\n\n //  if(!BulkProcessButtonEnabled.value) {\n //      console.log('UCI Refresh');\n //     GetAllRoles.trigger();\n //  }\n",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="661b0"
        backgroundColor="{{ theme.info }}"
        disabled="{{ CheckUserRole.data || CurrentUserObj.value.level ==='level0' }}"
        icon="bold/shopping-business-startup"
        iconPosition="left"
        styleVariant="custom"
        text="JIRA"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "JiraFlow.setValue(true);\njiraUCIClick.setValue(true);\n// Get the current date\nlet currentDate = moment();\n\n// Subtract 5 years from the current UTC year\nlet oldDate = currentDate.subtract(5, 'years');\n\n// Format the old date to YYYY-MM-DD\nlet fromValue = oldDate.format('YYYY-MM-DD');\n \nlet currentDateTo = moment();\n// Add 1 day to the current date\nlet nextDay = currentDateTo.add(1, 'days');\n\n// Format the next day to YYYY-MM-DD\nlet toValue = nextDay.format('YYYY-MM-DD');\n;\n\nconsole.log(fromValue, toValue)\n\nreadAuditParams.setValue({\n  \"ticket_id\": url?.searchParams?.ticket ? url?.searchParams.ticket: '',\n  \"from\": fromValue,\n  \"to\": toValue,\n})\nif (url?.searchParams?.ticket) {\n  readAuditTrail.trigger();\n  loadingPopUp.setHidden(false);\n}\n",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="a38a2"
        icon="bold/interface-arrows-left-alternate"
        iconPosition="left"
        styleVariant="solid"
        text="Back"
      >
        <Event
          event="click"
          method="hide"
          params={{ ordered: [] }}
          pluginId="UserDetailsModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "[]" }] }}
          pluginId="ContactRemediatedRecordsList"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "GetContactInfoByUCIPreMastering.trigger();\n\nawait GetFunctionBulkProcess.trigger();\n\n  if(!BulkProcessButtonEnabled.value){\n     console.log('UCI Back button');\n   \n    GetAllHistorizationStatusPreMastering.trigger();\n \n  }\n\n loadingPopUp.setHidden(true);",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </Header>
  <Body>
    <Text
      id="text481"
      hidden="{{ Object.keys(CurrentSelectedContact.value).length > 0 ?  CurrentSelectedContact.value.header.state.toLowerCase() !== 'suppressed' : true }}"
      horizontalAlign="center"
      style={{ ordered: [{ color: "danger" }] }}
      value="##### The Contact has been Suppressed"
      verticalAlign="center"
    />
    <Include src="./GoldenContainer.rsx" />
    <Include src="./EditsContainer.rsx" />
    <Include src="./containerJiraUCI.rsx" />
  </Body>
  <Footer>
    <Button
      id="SaveContactBtn"
      disabled={
        '{{(!firstName.value && !lastName.value) || (CurrentSelectedContact.value.disqualifications && (!fromDate.value || !toDate.value)) || CheckUserRole.data || \n  phoneNumber1.validationMessage.length > 0 ||\n  birthYear.validationMessage ||\n   birthMonth.validationMessage ||\n   birthDay.validationMessage || \n   deathYear.validationMessage ||\n   deathMonth.validationMessage ||\n   deathDay.validationMessage  || \n  BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "suppressed" ||\n  BulkProcessButtonEnabled?.value && bulkStatusValue?.value === "active"\n}}\n'
      }
      hidden="{{ jiraUCIClick.value}}"
      text="SAVE"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="HandleSaveContact"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    event="hide"
    method="trigger"
    params={{
      ordered: [
        {
          options: {
            object: { onSuccess: null, onFailure: null, additionalScope: null },
          },
        },
      ],
    }}
    pluginId="ResetIndividualFormFields"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="show"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="GetDirectorsIdsManagerAllData"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="show"
    method="run"
    params={{
      ordered: [
        {
          src: "if (CurrentSelectedContact.value.header.state === 'suppressed') {\n  utils.showNotification(\n    {\n    title: 'Success',\n    description: 'Individual is suppressed, make it active to edit ',\n    notificationType: 'success'\n  })\n}\ngetBirthMonths.trigger();\ngetBirthDays.trigger();\ngetDeathYears.trigger();\ngetDeathMonths.trigger();\ngetDeathDays.trigger();",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="ResetRolesFields"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
