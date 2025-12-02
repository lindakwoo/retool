<Container
  id="batchHistorySearchContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="false"
  margin="0"
  overflowType="hidden"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader="false"
>
  <View id="7ba3a" viewKey="View 1">
    <Date
      id="batchHistoryFromDate"
      dateFormat="MM-dd-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{radioSearchSelection.value !== 'batch_date'}}"
      hidden="false"
      iconBefore="bold/interface-calendar"
      label=""
      labelPosition="top"
      value={"{{ moment(new Date(), \"DD-MM-YYYY\").subtract(1,'months')}}"}
    />
    <Date
      id="batchHistoryToDate"
      dateFormat="MM-dd-yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{radioSearchSelection.value !== 'batch_date'}}"
      iconBefore="bold/interface-calendar"
      label=""
      labelPosition="top"
      value="{{ new Date() }}"
    />
    <Tags
      id="tags1"
      allowWrap={true}
      colors=""
      hashColors={true}
      horizontalAlign="center"
      style={{ ordered: [] }}
      value="['OR']"
    />
    <Multiselect
      id="dropDownHistorySearchBatchName"
      captionByIndex=""
      data="{{ batchFileList.value }}"
      disabled="{{radioSearchSelection.value == 'batch_date'}}"
      emptyMessage="No options"
      label=""
      labelPosition="top"
      labels=""
      overlayMaxHeight={375}
      placeholder="Select batch name"
      showSelectionIndicator={true}
      values="{{ item.batch_file }}"
      wrapTags={true}
    />
    <Button
      id="ButtonHistory"
      disabled={
        '{{radioSearchSelection.value === "batch_date" ? false : dropDownHistorySearchBatchName.value.length === 0}}'
      }
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetBatchHistroyInfo"
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
    <Button id="ButtonReloadData" text="Reset">
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "if (radioSearchSelection.value === 'batch_name') {\n  dropDownHistorySearchBatchName.clearValue();\n  \n} else {\n  batchHistoryToDate.setValue(new Date());\nbatchHistoryFromDate.setValue(\nmoment(new Date(), \"DD-MM-YYYY\").subtract(1,'months'))\n}\nhistoryBatchTable.clearFilterStack();\n  batchHistoryData.setValue([]);\n",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
