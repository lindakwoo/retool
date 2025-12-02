<Frame
  id="$header6"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  style={{ ordered: [{ "primary-surface": "#ffffff" }] }}
  type="header"
>
  <Text id="auditTrailTitle2" value="### Audit trail" verticalAlign="center" />
  <Button
    id="modalCloseButton20"
    ariaLabel="Close"
    horizontalAlign="right"
    iconBefore="bold/interface-delete-1"
    style={{ ordered: [{ border: "transparent" }] }}
    styleVariant="outline"
  >
    <Event
      event="click"
      method="run"
      params={{
        ordered: [
          {
            src: 'if(CurrentUserObj.value.product ===\'firmographics\'){\n  utils.openPage("firmohome", { newTab: false });\n} else{\n  utils.openPage("home", { newTab: false });\n}\n',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="run"
      params={{
        ordered: [
          {
            src: "txtboxSearchAuditInfo2.setValue('');\nVarAuditTrailData.setValue([]);\nradioAudit2.setValue('UCI');",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Divider id="divider7" margin="0" />
  <RadioGroup
    id="radioAudit2"
    groupLayout="wrap"
    heightType="fixed"
    itemMode="static"
    label=""
    labelPosition="top"
    value="{{ self.values[0] }}"
  >
    <Option id="d1146" value="UCI" />
    <Option id="565b8" label="Orbis ID/BVDID" value="Orbis or BVDID" />
    <Option
      id="b24a8"
      disabled={false}
      hidden={false}
      label="Ticket Number"
      value="Ticket Number"
    />
    <Option
      id="6228c"
      disabled={false}
      hidden={false}
      label="User Email"
      value="User Email"
    />
    <Event
      event="change"
      method="run"
      params={{ ordered: [{ src: 'txtboxSearchAuditInfo2.setValue("");' }] }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RadioGroup>
  <Date
    id="from_date2"
    customValidation="{{ from_date2.value === '' ? 'Please select a From date within two year of To date' : ''}}"
    dateFormat="MM-dd-yyyy"
    datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
    disabled=""
    hideLabel={false}
    iconBefore="bold/interface-calendar"
    label="From"
    labelPosition="top"
    maxDate="{{ new Date().setDate(new Date().getDate() +1) }}"
    value="{{ new Date().setFullYear(new Date().getUTCFullYear() - 2)}}"
  >
    <Event
      event="change"
      method="run"
      params={{
        ordered: [
          {
            src: "// Given dates in MM-DD-YYYY format\nconst fromDateStr = from_date2.formattedValue;\nconst date2Str = to_date.formattedValue;\n\n\n// Convert the given date strings to Date objects\nconst [fromMonth, fromDay, fromYear] = fromDateStr.split('-');\nconst [toMonth, toDay, toYear] = date2Str.split('-');\n\n// Check if the difference is within two years\nconst isWithinTwoYears = (toYear - fromYear < 2) || (toYear - fromYear === 2 && toMonth <= fromMonth && toDay <= fromDay);\n\nconsole.log(isWithinTwoYears); // This will print true if the difference is within two years\n\n// Clear the to_date value if the difference is more than two years\nif (!isWithinTwoYears) {\n  to_date.setValue('');\n}\n",
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
    id="to_date2"
    customValidation="{{ to_date2.value === '' ? 'Please select a To date within two year of From date.' : ''}}"
    dateFormat="MM-dd-yyyy"
    datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
    disabled=""
    hideLabel={false}
    iconBefore="bold/interface-calendar"
    label="To"
    labelPosition="top"
    maxDate="{{ new Date().setDate(new Date().getDate() +1) }}"
    value="{{ new Date() }}"
  >
    <Event
      event="change"
      method="run"
      params={{
        ordered: [
          {
            src: "// Given dates in MM-DD-YYYY format\nconst fromDateStr = from_date2.formattedValue;\nconst date2Str = to_date.formattedValue;\n\n\n// Convert the given date strings to Date objects\nconst [fromMonth, fromDay, fromYear] = fromDateStr.split('-');\nconst [toMonth, toDay, toYear] = date2Str.split('-');\n\n// Check if the difference is within two years\nconst isWithinTwoYears = (toYear - fromYear < 2) || (toYear - fromYear === 2 && toMonth <= fromMonth && toDay <= fromDay);\n\nconsole.log(isWithinTwoYears); // This will print true if the difference is within two years\n\n// Clear the to_date value if the difference is more than two years\nif (!isWithinTwoYears) {\n  from_date2.setValue('');\n}\n\n",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </Date>
  <Button
    id="buttonAuditSearch3"
    disabled="{{ from_date2.value.length === 0 || to_date2.value.length === 0}}"
    text="Search"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="auditBVDOrUCI"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <TextInput
    id="txtboxSearchAuditInfo2"
    disabled=""
    label=""
    labelPosition="top"
    placeholder="{{ `Search by ${radioAudit2.value}`}}"
  />
</Frame>
