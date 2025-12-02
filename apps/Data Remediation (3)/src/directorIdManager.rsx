<Screen
  id="directorIdManager"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="5cbd799b-8c07-4635-ad51-3f04b6f82dd6"
>
  <Include src="./header9.rsx" />
  <Include src="./directoIdsManager.rsx" />
  <Frame
    id="$main18"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Form
      id="companyForm2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading=""
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle58" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="directorSearchIds"
          colorByIndex=""
          data="{{ directorsIdsFullData.value }}"
          emptyMessage="No options"
          label="Select a EntityIP Source"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select an option"
          showClear={true}
          showSelectionIndicator={true}
          values="{{ item.entityIPSource}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: '\nconsole.log("Clicked EntityIp  search", directorSearchIds.value);\nif(directorSearchIds.value==null){\n  console.log("Clear search country", directorSearchIds.value);\n    directorsIdInputState.setValue([]);\n   directorsIdsManagerApi.trigger();\n}\n  ',
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
          id="searchDirectorIds"
          disabled="{{!directorSearchIds.value}}"
          submitTargetId=""
          text="Search"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: 'loadingPopUp.setHidden(false)\nconsole.log(\'directorSearchIds Value\', directorSearchIds.value);\nconst directorsInput = {\n  "entityIPSource":directorSearchIds?.value,\n  "officialID": "",\n  "isActive": "",\n  "countriesCovered": "",\n  "action": "",\n  "last_modified_by": ""\n}\ndirectorsIdInputState.setValue(directorsInput);\n\nconsole.log(\'directorsIdInputState Value\', directorsIdInputState);\n\ndirectorsIdsManagerApi.trigger();\n',
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
            method="setHidden"
            params={{ ordered: [] }}
            pluginId="kompanyEditForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="searchDirectorIds2"
          disabled=""
          submitTargetId=""
          text="Refresh"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "loadingPopUp.setHidden(false)\nconsole.log('directorSearchIds Value', directorSearchIds.value);\nconst directorsInput = {\n}\ndirectorsIdInputState.setValue(directorsInput);\n\nconsole.log('directorsIdInputState Value', directorsIdInputState);\ndirectorSearchIds.clearValue();\ndirectorsIdsManagerApi.trigger();\nGetDirectorsIdsManagerAllData.trigger();",
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
            method="setHidden"
            params={{ ordered: [] }}
            pluginId="kompanyEditForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="createEntityIPButton"
          disabled="{{CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin')) ? false : true}}"
          submitTargetId=""
          text="Create Entity IP Source"
        >
          <Event
            event="click"
            method="setHidden"
            params={{ ordered: [{ hidden: false }] }}
            pluginId="directorIdsAddForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ ordered: [{ value: "{{ current_user.email}}" }] }}
            pluginId="editLastModifiedBy3"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Table
          id="directorIdTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ directorsIdManagerData.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
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
            id="84b9a"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="entityIPSource"
            label="Entity IP Source"
            placeholder="Enter value"
            position="center"
            size={173}
            summaryAggregationMode="none"
          />
          <Column
            id="78008"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="countriesCovered"
            label="Countries Covered"
            placeholder="Enter value"
            position="center"
            size={397}
            summaryAggregationMode="none"
          />
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
            size={184.3125}
            summaryAggregationMode="none"
          />
          <Column
            id="2212d"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="isActive"
            label="Is Active"
            placeholder="Select option"
            position="center"
            size={207}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
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
            size={341.125}
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
            id="e5e90"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="update_timestamp"
            label="Update TimeStamp"
            placeholder="Enter value"
            position="center"
            size={347.3125}
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
              pluginId="directorIdsEditForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setHidden"
              params={{ ordered: [{ hidden: false }] }}
              pluginId="directorIdsEditForm"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setDisabled"
              params={{ ordered: [] }}
              pluginId="createEntityIPButton"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              event="clickAction"
              method="setValue"
              params={{ ordered: [{ value: "{{ current_user.email }}" }] }}
              pluginId="editLastModifiedBy2"
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
              pluginId="directorIdTable"
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
              pluginId="directorIdTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </Body>
    </Form>
    <Form
      id="directorIdsAddForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData="{{ kompanyTable.selectedRow }}"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle59"
          margin="0"
          value="#### Add Director Entity IP Source"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextArea
          id="editIsoCode5"
          autoResize={true}
          formDataKey="entityIPSource"
          label="Entity IP Source"
          labelPosition="top"
          minLines={2}
          placeholder="Enter value"
          required={true}
        />
        <TextArea
          id="textInput126"
          autoResize={true}
          formDataKey="countriesCovered"
          inputTooltip="`Enter` to have more room, `Esc` to cancel"
          label="Countries Covered"
          labelPosition="top"
          minLines={2}
          placeholder="Enter value"
        />
        <TextInput
          id="editIsoCode7"
          disabled=""
          formDataKey="action"
          hidden="true"
          label="Action"
          labelPosition="top"
          placeholder="Enter value"
          value="update"
        />
        <Select
          id="editKompanyApiField3"
          emptyMessage="No options"
          formDataKey="isActive"
          itemMode="static"
          label="Is Active"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value=""
          values={null}
        >
          <Option id="edd43" value="Active" />
          <Option id="53a24" label="Inactive" value="Inactive" />
        </Select>
        <TextInput
          id="editLastModifiedBy3"
          disabled="true"
          formDataKey=""
          label="Last Modified By"
          labelPosition="top"
          placeholder="Enter value"
          value="{{current_user.email ? current_user.email : ''}}"
        />
      </Body>
      <Footer>
        <Button
          id="button29"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "directorIdsAddForm.clear();\ndirectorIdsAddForm.setHidden(true);",
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
          id="formButton46"
          submit={true}
          submitTargetId="directorIdsAddForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="CreateDirectorsIdData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Form
      id="directorIdsEditForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="true"
      initialData="{{ kompanyTable.selectedRow }}"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle60"
          margin="0"
          value="#### Edit Director Entity IP Source"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextArea
          id="editIsoCode8"
          autoResize={true}
          disabled="true"
          formDataKey="entityIPSource"
          label="Entity IP Source"
          labelPosition="top"
          minLines={2}
          placeholder="Enter value"
          value="{{directorIdTable.selectedRow.entityIPSource}}"
        />
        <TextArea
          id="textInput127"
          autoResize={true}
          formDataKey="countriesCovered"
          inputTooltip="`Enter` to have more room, `Esc` to cancel"
          label="Countries Covered"
          labelPosition="top"
          minLines={2}
          placeholder="Enter value"
          value="{{directorIdTable.selectedRow.countriesCovered}}"
        />
        <Select
          id="editKompanyApiField4"
          emptyMessage="No options"
          formDataKey="isActive"
          itemMode="static"
          label="Is Active"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value="{{directorIdTable.selectedRow.isActive}}"
          values={null}
        >
          <Option id="edd43" value="Active" />
          <Option id="53a24" value="Inactive" />
        </Select>
        <TextInput
          id="editLastModifiedBy4"
          disabled="true"
          formDataKey="last_modified_by"
          label="Last Modified By"
          labelPosition="top"
          placeholder="Enter value"
          value="{{current_user.email? current_user.email : ''}}"
        />
        <TextInput
          id="editIsoCode9"
          disabled=""
          formDataKey="action"
          hidden="true"
          label="Action"
          labelPosition="top"
          placeholder="Enter value"
          value="update"
        />
      </Body>
      <Footer>
        <Button
          id="button30"
          style={{ ordered: [{ background: "canvas" }] }}
          text="Cancel"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "directorIdsEditForm.clear();\ndirectorIdsEditForm.setHidden(true);\ncreateEntityIPButton.setDisabled(false)",
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
            method="clear"
            params={{ ordered: [] }}
            pluginId="directorIdsEditForm"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="formButton47"
          submit={true}
          submitTargetId="directorIdsEditForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="editDirectorsIdData"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Frame>
</Screen>
