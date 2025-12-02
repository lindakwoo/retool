<ModalFrame
  id="kompanySearchModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
  style={{ ordered: [{ background: "#ffffff" }] }}
>
  <Header>
    <Text
      id="modalTitle6"
      value="### Kompany Config Data"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton9"
      ariaLabel="Close"
      horizontalAlign="right"
      style={{ ordered: [] }}
      text="Home"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="kompanySearchModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="kompanyCountryList"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="kompanyEnableCheck"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="stateCode"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="kompanySearchModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="openPage"
        params={{
          ordered: [
            { options: { ordered: [{ passDataWith: "urlParams" }] } },
            { pageName: "firmohome" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Form
      id="companyForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading=""
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle6" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="kompanyCountryList"
          colorByIndex=""
          data="{{ CountriesList.value }}"
          emptyMessage="No options"
          label="Select a Country"
          labelPosition="top"
          labels="{{item.labels.en}}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showClear={true}
          showSelectionIndicator={true}
          values="{{ item.a2 }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: 'console.log("Clicked Select Country  search", kompanyCountryList.value);\nif(kompanyCountryList.value==null){\n  console.log("Clear search country", kompanyCountryList.value);\n    kompanyInputState.setValue([]);\n   kompanyApiRecord.trigger();\n}\n  ',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Button
          id="searchkompanyRecords"
          disabled="{{!kompanyCountryList.value}}"
          submitTargetId=""
          text="Search"
        >
          <Event
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="kompanyEnableCheck"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setHidden"
            params={{ ordered: [] }}
            pluginId="kompanyEditForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ ordered: [{ value: "true" }] }}
            pluginId="stateCode"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="refreshkompanyRecords"
          disabled=""
          submitTargetId=""
          text="Refresh"
        >
          <Event
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="kompanyEnableCheck"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Table
          id="kompanyTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ kompanyApiRecordData.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          primaryKeyColumnId="9c6d2"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{
            headerBackground: "rgba(6, 13, 97, 1)",
            cellText: "primary",
          }}
          toolbarPosition="bottom"
        >
          <Column
            id="9c6d2"
            alignment="right"
            editable={false}
            format="decimal"
            groupAggregationMode="countDistinct"
            hidden="true"
            key="id"
            label="ID"
            position="center"
            size={31.546875}
            summaryAggregationMode="none"
          />
          <Column
            id="88b5d"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="country_name"
            label="Country Name"
            placeholder="Enter value"
            position="center"
            size={199}
            summaryAggregationMode="none"
          />
          <Column
            id="cda85"
            alignment="left"
            editable="true"
            format="string"
            groupAggregationMode="none"
            key="country_iso"
            label="Country Iso"
            placeholder="Enter value"
            position="center"
            size={143}
            summaryAggregationMode="none"
          />
          <Column
            id="8885c"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="state_name"
            label="State Name"
            placeholder="Enter value"
            position="center"
            size={85}
            summaryAggregationMode="none"
          />
          <Column
            id="bae11"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="state_code"
            label="State Code"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="9dc6d"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="cost"
            label="Cost"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="8124f"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="kompany_api"
            label="Kompany Data"
            placeholder="Enter value"
            position="center"
            size={126}
            summaryAggregationMode="none"
          />
          <Column
            id="0e344"
            alignment="left"
            editable="false"
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            groupAggregationMode="none"
            key="last_modified_by"
            label="Last Modified By"
            placeholder="Enter value"
            position="center"
            referenceId="last_modified_by"
            size={343}
            summaryAggregationMode="none"
          >
            <Event
              event="clickCell"
              method="openUrl"
              params={{ ordered: [{ url: "{{ item }}" }] }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="3bf55"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="create_timestamp"
            label="Create timestamp"
            placeholder="Enter value"
            position="center"
            size={176}
            summaryAggregationMode="none"
          />
          <Column
            id="e5e90"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="update_timestamp"
            label="Update Timestamp"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Action
            id="87706"
            hidden="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
            icon="bold/interface-edit-pencil"
            label="Edit"
          >
            <Event
              event="clickAction"
              method="scrollIntoView"
              params={{
                ordered: [
                  {
                    options: { object: { block: "nearest", behavior: "auto" } },
                  },
                ],
              }}
              pluginId="kompanyEditForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setHidden"
              params={{ ordered: [{ hidden: false }] }}
              pluginId="kompanyEditForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <ToolbarButton
            id="1a"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="kompanyTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="refresh"
              pluginId="kompanyTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </Body>
    </Form>
    <Form
      id="kompanyEditForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData="{{ kompanyTable.selectedRow }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle7"
          value="#### Edit Kompany Config Data"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="editIsoCode"
          disabled="true"
          formDataKey="country_iso"
          label="Country Iso"
          labelPosition="top"
          placeholder="Enter value"
          value="{{kompanyTable.selectedRow.country_iso2_code}}"
        />
        <Select
          id="editCostField"
          emptyMessage="No options"
          formDataKey="cost"
          itemMode="static"
          label="Cost"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value="{{kompanyTable.selectedRow.cost}}"
          values={null}
        >
          <Option id="edd43" value="free" />
          <Option id="53a24" value="charged" />
        </Select>
        <Select
          id="editKompanyApiField"
          emptyMessage="No options"
          formDataKey="kompany_api"
          itemMode="static"
          label="Kompany Data"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value="{{kompanyTable.selectedRow.kompany_api}}"
          values={null}
        >
          <Option id="edd43" value="enable" />
          <Option id="53a24" value="disable" />
        </Select>
        <TextInput
          id="textInput41"
          disabled="true"
          formDataKey="state_code"
          label="State code"
          labelPosition="top"
          placeholder="Enter value"
          value="{{kompanyTable.selectedRow.state_code}}"
        />
        <TextInput
          id="editLastModifiedBy"
          disabled="true"
          formDataKey="last_modified_by"
          label="Last Modified By"
          labelPosition="top"
          placeholder="Enter value"
          value="{{CurrentUserObj.value.email}}"
        />
      </Body>
      <Footer>
        <Button
          id="button7"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "kompanyEditForm.clear();\nkompanyEditForm.setHidden(true);",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="formButton3"
          submit={true}
          submitTargetId="kompanyEditForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="editKompanyData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Event
    event="show"
    method="run"
    params={{
      ordered: [
        {
          src: "kompanyInputState.setValue({});\nkompanyEditForm.setHidden(true);",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="show"
    method="show"
    params={{ ordered: [] }}
    pluginId="loadingPopUp"
    type="widget"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
