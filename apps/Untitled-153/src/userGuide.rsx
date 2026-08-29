<ModalFrame
  id="userGuide"
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
  size="medium"
>
  <Header>
    <Text id="modalTitle1" value="### User Guide" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="userGuide"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <PDFViewer
      id="pdf2"
      margin="0"
      retoolStorageFileId="c9034f6e-575a-40fd-bc44-1f4ec746b864"
      showTopBar={true}
      src="https://upload.wikimedia.org/wikipedia/commons/1/14/Marspathfinder.pdf"
      srcType="retoolStorageFileId"
    />
  </Body>
</ModalFrame>
