<Container
  id="EntityInfoActionsWrapper5"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ jiraClick.value }}"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle384"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="3eabc" viewKey="View 1">
    <Text
      id="text550"
      value="**Orbis Id:** {{selectedCompany.value.header.entityID}}"
      verticalAlign="center"
    />
    <Text
      id="text551"
      value="**BVD ID:** {{selectedCompany.value.header.bvdID}}"
      verticalAlign="center"
    />
    <Text
      id="companyCategory5"
      value="**Company Type:** {{EntityTypes.value.filter((obj)=> obj.code.toLowerCase() === selectedCompany.value.entityInfo.item.type.toLowerCase())[0].labels.en}}"
      verticalAlign="center"
    />
    <ButtonGroup2
      id="buttonGroup13"
      alignment="center"
      hidden="{{ lockEntity.value === false ? true : false }}"
      overflowPosition={1}
    >
      <ButtonGroup2-Button
        id="e46ce"
        disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
        hidden="{{ lockEntity.value === false ? true : false }}"
        icon="bold/interface-lock"
        iconPosition="replace"
        styleVariant="danger"
        text="lock"
        tooltip={
          '{{ "This entity is locked by user " + varLockMessage.value }}'
        }
      />
    </ButtonGroup2>
    <LinkList
      id="linkList6"
      disabled="{{
    NewIdentifiersFlag.value.filter((item) => item.isInvalid === true).length > 0 
    || ExistingIdentifierFlag.value.filter((item)=> item.isInvalid === true).length > 0
    || Object.values(NewIdentifiersValues.value).some(value => !value)
}}"
      groupLayout="wrap"
      hidden="{{ jiraClick.value }}"
      itemMode="static"
      label=""
      labelPosition="top"
      showUnderline="never"
      style={{ ordered: [] }}
      underlineStyle="dotted"
    >
      <Option
        id="65df5"
        disabled="{{ 
  !(CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('data_analyst') || CurrentUserObj.value.user_role.includes('super_admin')) ||  lockEntity.value || kompanyApiRecordData.value[0]?.kompany_api !== 'enable' 
}}
"
        icon="bold/nature-ecology-green-house"
        tooltip="Kompany search for the country"
      >
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
          method="setValue"
          params={{
            ordered: [
              {
                value:
                  "{{{\n  searchValue : selectedCompany.value.header.bvdID\n }}}",
              },
            ],
          }}
          pluginId="kompanySearchPayload"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { additionalScope: { ordered: [{ showDrawer: "true" }] } },
                  ],
                },
              },
            ],
          }}
          pluginId="idSearch"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="9087e"
        disabled="{{ValidateUserRole.data || lockEntity.value }}"
        icon="bold/computer-logo-google"
        tooltip="Search in Google"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="googleCompanyData"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="19c73"
        disabled="{{ValidateUserRole.data || lockEntity.value }}"
        icon="bold/interface-link"
        tooltip="Open Registry URL"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="googleRegristryData"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="dee1e"
        disabled="{{ValidateUserRole.data || lockEntity.value }}"
        hidden={false}
        icon="bold/interface-file-folder"
        tooltip="Upload Document"
      >
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="documentManagement"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "### Upload Document " }] }}
          pluginId="documentPageTitle"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="0fd2d"
        disabled="{{ValidateUserRole.data || lockEntity.value }}"
        hidden={false}
        icon="bold/shopping-business-startup"
        tooltip="Jira"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "jiraClick.setValue(true);\n  JiraFlow.setValue(true);\n\n// Get the current date\nlet currentDate = moment();\n\n// Subtract 5 years from the current UTC year\nlet oldDate = currentDate.subtract(5, 'years');\n\n// Format the old date to YYYY-MM-DD\nlet fromValue = oldDate.format('YYYY-MM-DD');\n \nlet currentDateTo = moment();\n// Add 1 day to the current date\nlet nextDay = currentDateTo.add(1, 'days');\n\n// Format the next day to YYYY-MM-DD\nlet toValue = nextDay.format('YYYY-MM-DD');\n;\n\nconsole.log(fromValue, toValue)\nif (url?.searchParams?.ticket.length !== 0) {\n  readAuditParams.setValue({\n  \"ticket_id\": url.searchParams.ticket,\n  \"from\": fromValue,\n  \"to\": toValue,\n})\n  readAuditTrail.trigger();\nloadingPopUp.setHidden(false);\n  \n} else {\n  auditJsonForJiraValue.setValue([]);\n}\n\n",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="f0cc4"
        disabled="{{ValidateUserRole.data || lockEntity.value }}"
        hidden={false}
        icon="bold/interface-edit-binocular"
        tooltip="CDS Viewer"
      >
        <Event
          event="click"
          method="openUrl"
          params={{
            ordered: [
              { url: "{{ retoolContext.configVars.data_viewer_url }}" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </LinkList>
  </View>
</Container>
