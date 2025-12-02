<ModalFrame
  id="directoIdsManager"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="false"
  showFooterBorder={false}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text id="modalTitle10" value="#### Director Ids Source" />
    <Button
      id="modalCloseButton13"
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
        pluginId="directoIdsManager"
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
              src: "directorsIdInputState.setValue({});\ndirectorSearchIds.setValue('');\ndirectorSearchIds.clearValue();\ncreateEntityIPButton.setDisabled(false)\n\n\n\n\nif (CurrentUserObj.value.user_role && (CurrentUserObj.value.user_role.includes('admin') || CurrentUserObj.value.user_role.includes('super_admin'))) {\n  createEntityIPButton.setDisabled(false)\n}else\n{\n  console.log(\"true\")\n  createEntityIPButton.setDisabled(true)\n}",
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
</ModalFrame>
