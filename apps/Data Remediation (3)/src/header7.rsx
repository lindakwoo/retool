<Frame
  id="$header7"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text
    id="modalImportExportExcel2"
    value="### Batch Processing"
    verticalAlign="center"
  />
  <Button
    id="modalCloseButton21"
    ariaLabel="Close"
    horizontalAlign="right"
    iconBefore="bold/interface-delete-1"
    style={{ ordered: [{ border: "transparent" }] }}
    styleVariant="outline"
  >
    <Event
      event="click"
      method="setHidden"
      params={{ ordered: [{ hidden: true }] }}
      pluginId="batchProcessing"
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
            src: "batchTab.setValue('batchProcess');\ndropDownHistorySearchBatchName.clearValue();  \n  batchHistoryToDate.setValue(new Date());\nbatchHistoryFromDate.setValue(\nmoment(new Date(), \"DD-MM-YYYY\").subtract(1,'months'))\nhistoryBatchTable.clearFilterStack();\n  batchHistoryData.setValue([]);\n\nradioSearchSelection.setValue('batch_date')",
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
</Frame>
