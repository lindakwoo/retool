<Container
  id="container249"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  maintainSpaceWhenHidden={true}
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle429"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="c01df" viewKey="View 1">
    <TextInput
      id="newPrevName5"
      disabled=""
      hidden="true"
      label=""
      labelPosition="top"
      maintainSpaceWhenHidden={true}
      margin="0"
      placeholder="Add Prev Name"
      style={{
        ordered: [{ background: "{{ self.value ? '#99A7C8' : '#fff' }}" }],
      }}
    />
    <Date
      id="newDateSince4"
      dateFormat="MM-dd-YYYY"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ newPrevName5.value === '' }}"
      iconBefore="bold/interface-calendar"
      label="Date Since"
      labelPosition="top"
      maxDate="{{ new Date() }}"
      required="{{ newPrevName5.value !== '' ? true: false }}"
      style={{
        ordered: [
          { background: "{{ newDateSince4.value  ? '#99A7C8' : '#fff'}}" },
        ],
      }}
    />
    <Icon
      id="icon288"
      hidden={
        "{{ (newPrevName5.value.trim() == \"\") || (iconHiddenFlag.value.prev_name['new'][0] && newPrevName5.value.trim() == iconHiddenFlag.value.prev_name['new'][1])}}"
      }
      horizontalAlign="center"
      icon="bold/interface-edit-attachment-1"
    >
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                '{{\n{"type":"3",\n"iteration" : "new",\n"new_value" : newPrevName.value.trim(),\n"attribute_flag" : "prev_name",\n  "remediation_action" : "create"}\n  }}',
            },
          ],
        }}
        pluginId="linkAttributeItem"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="docLinkOpen"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Date
      id="newDateUntil4"
      dateFormat="MM-dd-YYYY"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      hidden="{{ newPrevName5.value === ''}}"
      iconBefore="bold/interface-calendar"
      label="Date Until"
      labelPosition="top"
      minDate="{{ new Date(new Date().setDate(new Date().getDate() + 1)) }}"
      style={{
        ordered: [
          { background: "{{ newDateUntil4.value ? '#99A7C8' : '#fff' }}" },
        ],
      }}
    />
  </View>
</Container>
