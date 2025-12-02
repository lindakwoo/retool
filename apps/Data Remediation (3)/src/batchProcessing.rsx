<ModalFrame
  id="batchProcessing"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="{{!batchProcess.value}}"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="false"
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text
      id="modalImportExportExcel"
      value="### Batch Processing"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton10"
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
    </Button>
  </Header>
  <Body>
    <Include src="./batchProcessContainer.rsx" />
  </Body>
  <Event
    event="show"
    method="setValue"
    params={{ ordered: [{ value: "true" }] }}
    pluginId="batchProcess"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
