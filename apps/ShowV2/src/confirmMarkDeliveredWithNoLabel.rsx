<ModalFrame
  id="confirmMarkDeliveredWithNoLabel"
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
  <Footer>
    <ButtonGroup2 id="buttonGroup4" alignment="left" overflowPosition={2}>
      <ButtonGroup2-Button id="67095" styleVariant="solid" text="Confirm">
        <Event
          event="click"
          method="trigger"
          params={{}}
          pluginId="queryMarkShipmentAsDelivered"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setHidden"
          params={{}}
          pluginId="confirmMarkDeliveredWithNoLabel"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button id="e456e" styleVariant="outline" text="Cancel">
        <Event
          event="click"
          method="setHidden"
          params={{}}
          pluginId="confirmMarkDeliveredWithNoLabel"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </Footer>
</ModalFrame>
