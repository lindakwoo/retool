<App>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Text id="text2" value="some new change here" verticalAlign="center" />
      <Text
        id="text1"
        value="👋 **Hello!!! {{ current_user.firstName || 'friend' }}!**"
        verticalAlign="center"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
