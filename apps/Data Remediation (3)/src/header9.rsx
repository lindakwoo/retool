<Frame
  id="$header9"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text id="text651" value="#### Director Ids Source" verticalAlign="center" />
  <Button id="button31" text="Button">
    <Event
      event="click"
      method="openPage"
      params={{
        ordered: [
          { options: { ordered: [{ passDataWith: "urlParams" }] } },
          { pageName: "home" },
        ],
      }}
      pluginId=""
      type="util"
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
</Frame>
