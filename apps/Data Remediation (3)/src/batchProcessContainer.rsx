<Container
  id="batchProcessContainer"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="batchTab"
      disabled="{{ CurrentUserObj?.value?.user_role.length === 0 ? true : false }}"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="batchProcessContainer"
      value="{{ self.values[0] }}"
    >
      <Option id="7da06" value="Tab 1" />
      <Option id="fa3d5" value="Tab 2" />
      <Option id="2f148" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="d2a01" label="Batch Process" viewKey="batchProcess">
    <FileInput
      id="browseExcelFile"
      _isUpgraded={true}
      accept="['.xlsx']"
      disabled="{{ (CurrentUserObj?.value?.user_role?.filter((data) => data === 'admin' || data === 'data_analyst' ||  data === 'super_admin').length === 0 ) ? true :!UploadBtnControl.value ? false : true }}"
      label=""
      labelPosition="top"
      loading="{{browseExcelFile.parsing}}"
      parseFiles={true}
      style={{ ordered: [] }}
      textBefore="Browse"
    >
      <Event
        event="parse"
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
        pluginId="batchProcessDataSet"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </FileInput>
    <Button
      id="uploadFileBtn"
      disabled="{{(UploadBtnControl.value || browseExcelFile.value.length === 0) && ((!(CurrentUserObj?.value?.user_role?.includes('admin')) || !(CurrentUserObj?.value?.user_role?.includes('data_analyst')) ||!(CurrentUserObj?.value?.user_role?.includes('super_admin'))) ? true: false)  }}"
      text="Upload"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="UploadPdfBatchProcess"
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
    </Button>
    <Button
      id="BtnProcessDataAfterUpload"
      ariaLabel="button process"
      disabled="{{ (CurrentUserObj?.value?.user_role?.filter((data) => data === 'admin' || data === 'data_analyst' || data === 'super_admin').length === 0 ) ? true :!UploadBtnControl.value ? true : false }}"
      text="Process"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "const recordToProcess = batchProcessTable.selectedSourceRows.map(item => item.id);\nconst recordsNotToProcess = batchProcessTable.data\n  .filter(item2 => !recordToProcess.includes(item2.id))\n  .map(item => item.id);\n\nconsole.log('recordToProcess',recordToProcess);\nconsole.log('recordsNotToProcess', recordsNotToProcess);\n\nBatchProcessApiVar.setValue({\n  ...BatchProcessApiVar,\n  \"records_to_process\": recordToProcess,\n  \"records_not_to_process\":recordsNotToProcess\n});\nloadingPopUp.setHidden(false);\nBatchProcessData.trigger();",
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
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="BatchResetCancel"
      ariaLabel="button cancel processing"
      disabled="{{ (CurrentUserObj?.value?.user_role?.filter((data) => data === 'admin' || data === 'data_analyst' || data === 'super_admin').length === 0 ) ? true :!UploadBtnControl.value ? true : false }}"
      horizontalAlign="right"
      text="Cancel Processing"
    >
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="UploadBtnControl"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'browseExcelFile.resetValue();\nCancelProcessBtnClicked.setValue(true);\n\n// Select all table id \nconst recordsNotToProcess = batchProcessTable.data.map(item => item.id);\nBatchProcessApiVar.setValue({\n  ...BatchProcessApiVar,\n  "records_to_process": [],\n  "records_not_to_process":recordsNotToProcess\n});\n\nBatchProcessData.trigger();',
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
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="batchProcessTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ VarBatchProcessData.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: "0" }}
      dynamicColumnProperties={{ formatByIndex: "auto" }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowBackgroundColor="{{((currentRow.status && currentRow.status === 'process_failed') ? '#fecaca' : (currentRow.status && currentRow.status === 'validation_failed') ? '#fecaca' : (currentRow.bvd_id === '' || currentRow.sr === '' || currentRow.case_no === '' || currentRow.requester === '') ? '#fecaca' : '') }}"
      rowHeight="small"
      rowSelection="multiple"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ rowSeparator: "rgba(9, 5, 5, 1)" }}
    >
      <Column
        id="467c1"
        alignment="left"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="sr"
        label="Sr"
        placeholder="Enter value"
        position="center"
        size={69}
        summaryAggregationMode="none"
      />
      <Column
        id="cc3dd"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        key="case_no"
        label="Case No"
        placeholder="Enter value"
        position="center"
        size={75}
        summaryAggregationMode="none"
      />
      <Column
        id="1c639"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        optionList={{ mode: "manual" }}
        placeholder="Select option"
        position="center"
        referenceId="status"
        size={158}
        summaryAggregationMode="none"
      />
      <Column
        id="51e18"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="error_message"
        label="Error Message"
        placeholder="Enter value"
        position="center"
        referenceId="errorMessage"
        size={228}
        summaryAggregationMode="none"
      />
      <Column
        id="f6c7d"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="requester"
        label="Requester"
        position="center"
        size={221}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "mailto:{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="084be"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="date_added"
        label="Date Added"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="ef050"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="country_iso_code"
        label="Country ISO Code"
        optionList={{
          mode: "mapped",
          manualData: [],
          mappedData: "",
          valueByIndex: "",
        }}
        placeholder="Select option"
        position="center"
        size={120}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="d3780"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="action"
        label="Action"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="f7ee7"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="field_type"
        label="Field Type"
        placeholder="Select option"
        position="center"
        size={144}
        summaryAggregationMode="none"
      />
      <Column
        id="5f41b"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="BVD ID"
        placeholder="Enter value"
        position="center"
        size={120}
        summaryAggregationMode="none"
      />
      <Column
        id="4636a"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="field_name"
        label="Field Name"
        placeholder="Select option"
        position="center"
        size={162}
        summaryAggregationMode="none"
      />
      <Column
        id="52b33"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="current_language"
        label="Current Language"
        placeholder="Enter value"
        position="center"
        size={115}
        summaryAggregationMode="none"
      />
      <Column
        id="1ad87"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="new_language"
        label="New Language"
        placeholder="Enter value"
        position="center"
        size={140}
        summaryAggregationMode="none"
      />
      <Column
        id="8e9ea"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        key="current_value"
        label="Current Value"
        placeholder="Enter value"
        position="center"
        size={166}
        summaryAggregationMode="none"
      />
      <Column
        id="84e07"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        key="new_value"
        label="New Value"
        placeholder="Enter value"
        position="center"
        size={128}
        summaryAggregationMode="none"
      />
      <Column
        id="e7c8c"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        key="current_name"
        label="Current Name"
        placeholder="Enter value"
        position="center"
        referenceId="current_name"
        size={133}
        summaryAggregationMode="none"
      />
      <Column
        id="7cdd2"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        groupAggregationMode="none"
        key="new_name"
        label="New Name"
        placeholder="Enter value"
        position="center"
        referenceId="new_name"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5c093"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="current_datesince"
        label="Current DateSince"
        placeholder="Enter value"
        position="center"
        referenceId="current datesince"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a2117"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="current_dateuntil"
        label="Current DateUntil"
        placeholder="Enter value"
        position="center"
        referenceId="current dateuntil"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5c257"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="new_datesince"
        label="New DateSince"
        placeholder="Enter value"
        position="center"
        referenceId="new_datesince"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5cfe2"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="new_dateuntil"
        label="New DateUntil"
        placeholder="Enter value"
        position="center"
        referenceId="new_dateuntil"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b965c"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="address_type"
        label="Address Type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="efd0a"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="language"
        label="Language"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="d2f64"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="address_lines"
        label="Address Lines"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d47c1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="post_code"
        label="Post Code"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8b5a9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="pobox"
        label="Po_Box"
        placeholder="Enter value"
        position="center"
        referenceId="poBox"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="4654d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="city"
        label="City"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="2dc8e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="county"
        label="County"
        placeholder="Enter value"
        position="center"
        referenceId="county"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="4a083"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="region"
        label="Region"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7e5d1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="region_geocode"
        label="Region Geocode"
        placeholder="Enter value"
        position="center"
        size={117}
        summaryAggregationMode="none"
      />
      <Column
        id="eda88"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="phoneNumber"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        groupAggregationMode="sum"
        key="phone"
        label="Phone"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="0929d"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="phoneNumber"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        groupAggregationMode="sum"
        key="fax"
        label="Fax"
        placeholder="Enter value"
        position="center"
        size={166}
        summaryAggregationMode="none"
      />
      <Column
        id="8d27d"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="batch_file"
        label="Batch File"
        placeholder="Enter value"
        position="center"
        referenceId="batchFile"
        size={267}
        summaryAggregationMode="none"
      />
      <Column
        id="07cb3"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="batch_id"
        label="Batch ID"
        placeholder="Enter value"
        position="center"
        referenceId="batchId"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="47e5d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ticket_id"
        label="Ticket id"
        placeholder="Enter value"
        position="center"
        referenceId="ticketId"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="719e5"
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
          params={{
            ordered: [
              { fileType: "xlsx" },
              {
                data: "{{batchProcessTable.data.length !== 0  && batchProcessTable.data}}",
              },
              { options: { ordered: [{ sheetName: "batchData" }] } },
              {
                fileName:
                  "{{'batchFile_' + moment().format(\"DD-MM-YYYY_hh:mm:ss A\")}}",
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Reload"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="run"
          params={{
            ordered: [{ src: "batchProcessTable.clearFilterStack();" }],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        enabled=""
        event="selectRow"
        method="run"
        params={{
          ordered: [
            {
              src: "if (!UploadBtnControl.value) {\n  batchProcessTable.clearSelection();\n} ",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View id="956b0" label="Batch History" viewKey="batchHistory">
    <RadioGroup
      id="radioSearchSelection"
      groupLayout="wrap"
      itemMode="static"
      label=""
      labelPosition="top"
      value="{{ self.values[0] }}"
    >
      <Option id="1ccb3" label="Search by date" value="batch_date" />
      <Option id="ee04a" label="Search by batch name" value="batch_name" />
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "if (radioSearchSelection.value==='batch_name') { \n  loadingPopUp.setHidden(false);\n  GetBatchFileName.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <Include src="./batchHistorySearchContainer.rsx" />
    <Table
      id="historyBatchTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ batchHistoryData.value }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
    >
      <Column
        id="451d5"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="sr"
        label="Sr"
        placeholder="Enter value"
        position="center"
        size={68.96875}
        summaryAggregationMode="none"
      />
      <Column
        id="14986"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="case_no"
        label="Case No"
        placeholder="Enter value"
        position="center"
        size={73}
        summaryAggregationMode="none"
      />
      <Column
        id="d6eb6"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        placeholder="Select option"
        position="center"
        referenceId="status"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="3fb8f"
        alignment="left"
        cellTooltipMode="overflow"
        format="string"
        groupAggregationMode="none"
        key="error_message"
        label="Error Message"
        placeholder="Enter value"
        position="center"
        referenceId="error_message"
        size={226}
        summaryAggregationMode="none"
      />
      <Column
        id="3f6e6"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="requester"
        label="Requester"
        position="center"
        size={198}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "mailto:{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="6c054"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="date_added"
        label="Date Added"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8c1ee"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="country_iso"
        label="Country ISO Code"
        placeholder="Enter value"
        position="center"
        size={115}
        summaryAggregationMode="none"
        valueOverride="{{item }}"
      />
      <Column
        id="138c9"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="action"
        label="Action"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="8b093"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="field_type"
        label="Field Type"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="fd4ea"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="bvd_id"
        label="BVD ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d632c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="field_name"
        label="Field Name"
        placeholder="Select option"
        position="center"
        size={130}
        summaryAggregationMode="none"
        valueOverride="{{item}}"
      />
      <Column
        id="daf3e"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="current_language"
        label="Current Language"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="624c4"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="new_language"
        label="New Language"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="c00da"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="current_value"
        label="Current Value"
        placeholder="Enter value"
        position="center"
        size={105}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="5384b"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="new_value"
        label="New Value"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="96213"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="current_name"
        label="Current Name"
        placeholder="Enter value"
        position="center"
        referenceId="current_name"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="9ddaa"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="new_name"
        label="New name"
        placeholder="Enter value"
        position="center"
        referenceId="new_name"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="0a2db"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="current_datesince"
        label="Current DateSince"
        placeholder="Enter value"
        position="center"
        referenceId="current_datesince"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="b8632"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="current_dateuntil"
        label="Current DateUntil"
        placeholder="Enter value"
        position="center"
        referenceId="current_dateuntill"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="da769"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="new_datesince"
        label="New DateSince"
        placeholder="Enter value"
        position="center"
        referenceId="new_datesince"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="d26bd"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM-dd-yyyy" }}
        groupAggregationMode="none"
        key="new_dateuntil"
        label="New DateUntil"
        placeholder="Enter value"
        position="center"
        referenceId="new_dateuntill"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="c2625"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="address_type"
        label="Address Type"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="e8f17"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="language"
        label="Language"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="d90b5"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="address_lines"
        label="Address Lines"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="05736"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="post_code"
        label="Post Code"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="80a4e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="pobox"
        label="Po_Box"
        placeholder="Enter value"
        position="center"
        referenceId="poBox"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="cde1f"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="city"
        label="City"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="3e35f"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="region"
        label="Region"
        placeholder="Enter value"
        position="center"
        size={89}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="3933f"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="region_geocode"
        label="Region Geocode"
        placeholder="Enter value"
        position="center"
        size={105}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="b4589"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="phoneNumber"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        groupAggregationMode="sum"
        key="phone"
        label="Phone"
        placeholder="Enter value"
        position="center"
        size={113}
        summaryAggregationMode="none"
      />
      <Column
        id="da1da"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="phoneNumber"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        groupAggregationMode="sum"
        key="fax"
        label="Fax"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="4b8d1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ticket_id"
        label="Ticket ID"
        placeholder="Enter value"
        position="center"
        referenceId="ticketID"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="951ca"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="batch_file"
        label="Batch File"
        placeholder="Enter value"
        position="center"
        referenceId="batchFile"
        size={295}
        summaryAggregationMode="none"
      />
      <Column
        id="83c0e"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="batch_id"
        label="Batch ID"
        placeholder="Enter value"
        position="center"
        referenceId="batch_id"
        size={273}
        summaryAggregationMode="none"
      />
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
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { fileType: "xlsx" },
                    {
                      fileName:
                        "{{'batchFile_' + moment().format(\"DD-MM-YYYY_hh:mm:ss A\")}}",
                    },
                  ],
                },
              },
            ],
          }}
          pluginId="historyBatchTable"
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
          method="clearFilterStack"
          params={{ ordered: [] }}
          pluginId="historyBatchTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
