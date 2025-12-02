<Frame
  id="$header3"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={true}
  type="header"
>
  <Text id="text556" value="### User Management" verticalAlign="center" />
  <Button id="button20" text="Home">
    <Event
      event="click"
      method="run"
      params={{
        ordered: [
          {
            src: 'if(CurrentUserObj.value.product ===\'firmographics\'){\n  utils.openPage("firmohome", { newTab: false });\n} else{\n  utils.openPage("home", { newTab: false });\n}\ncreateUserForm.clear();\ncreateUserForm.setHidden(true);\neditUserForm.clear();\neditUserForm.setHidden(true);\n',
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
