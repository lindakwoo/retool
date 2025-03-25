<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <DynamicWidget_LindaLibrary_HelloWorldDev
      id="helloWorldDev1"
      collectionUuid="5f3540c2-9a81-415f-ae6c-2b3507b344b3"
      heightType="fixed"
      hidden="{{ retoolContext.environment==='production' }}"
      name="Debbie"
    />
    <DynamicWidget_LindaLibrary_HelloWorld
      id="helloWorld1"
      collectionUuid="5f3540c2-9a81-415f-ae6c-2b3507b344b3"
      heightType="fixed"
      hidden="{{ retoolContext.environment==='staging' }}"
      maintainSpaceWhenHidden={false}
      name="martha"
    />
  </Frame>
</App>
