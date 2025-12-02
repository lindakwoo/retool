<ModalFrame
  id="ConfirmationPopUp"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
>
  <Header>
    <Text
      id="modalTitle14"
      value="##### You have unsaved changes"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton17"
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
        pluginId="ConfirmationPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text531"
      value="If you close, you will loose all changes you have made "
      verticalAlign="center"
    />
    <Text
      id="text532"
      value="Are you sure you want to close?"
      verticalAlign="center"
    />
  </Body>
  <Footer>
    <ButtonGroup2 id="buttonGroup8" overflowPosition={2}>
      <ButtonGroup2-Button id="e5cf7" styleVariant="outline" text="NO">
        <Event
          event="click"
          method="hide"
          params={{ ordered: [] }}
          pluginId="ConfirmationPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button id="4380e" styleVariant="solid" text="YES">
        <Event
          event="click"
          method="hide"
          params={{ ordered: [] }}
          pluginId="ConfirmationPopUp"
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
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </Footer>
</ModalFrame>
