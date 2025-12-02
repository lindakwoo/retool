<ModalFrame
  id="KompanySearchGlobalModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Button
      id="modalCloseButton11"
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
        pluginId="KompanySearchGlobalModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Event
    event="hide"
    method="run"
    params={{
      ordered: [
        {
          src: "searchByRadio.clearValue();\nsearchInput.clearValue();\nkompanyCountry.clearValue();\nkompanyDataSetSearchResponse.setValue({});\n",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
