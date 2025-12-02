<ModalFrame
  id="UserDeatilsIpAndRemedation"
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
  size="fullScreen"
>
  <Header>
    <Text
      id="modalTitle9"
      hidden="{{PreAndRemFlagRefresh.value}}"
      value="#### View Remediated Fields Only"
      verticalAlign="center"
    />
    <ButtonGroup2
      id="ContactButtonGroup"
      alignment="right"
      overflowPosition={2}
    >
      <ButtonGroup2-Button
        id="dd704"
        hidden="{{ PreAndRemFlagRefresh.value }}"
        styleVariant="solid"
        text="Refresh"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: " // Start the loader\nloadingPopUp.setHidden(true);\nNoFilterForPreCheck.setValue(false);\n\n// Set up a setTimeout to trigger the functions after 5 seconds\nsetTimeout(async () => {\n  try {\n    // Trigger both functions asynchronously (in parallel)\n    await Promise.all([\n      //GetCurrentFunctionsPreMastering.trigger(),\n      GetAllHistorizationStatusPreMastering.trigger(),\n      //GetPreviousFunctionsPreMastering.trigger(),\n      GetContactInfoByUCIPreMastering.trigger(),\n    ]);\n\n    // If both functions are successful, trigger filteredRemRoles\n    await filteredRemRoles.trigger();\n\n  } catch (error) {\n    // Log any error if any of the functions fail\n    console.error('Error triggering functions:', error);\n  }\n\n  // Hide the loader after 10 seconds\n  //  setTimeout(() => {\n  //    loadingPopUp.setHidden(true);\n  //  }, 15000);\n\n}, 0.1); // Initial delay of 5 seconds\n\n\nif(ContactRemediatedRecordsList.value && ContactRemediatedRecordsList.value.length === 0 && \n  CurrentRolePreMasteringList.value && CurrentRolePreMasteringList.value.length === 0 && \n  PreviousRolePreMasteringList.value && PreviousRolePreMasteringList.value.length === 0) {\n  console.error('ALl List is zero on refresh:');\n  UserDeatilsIpAndRemedation.setHidden(true);\n  container3.setHidden(true);\n  }",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button id="5c92e" styleVariant="solid" text="Close">
        <Event
          event="click"
          method="setHidden"
          params={{ ordered: [] }}
          pluginId="UserDeatilsIpAndRemedation"
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
                src: "PreAndRemFlagDelete.setValue(true);\nPreAndRemFlagRefresh.setValue(false);\nNoFilterForPreCheck.setValue(false);\nGetContactInfoByUCIPreMastering.trigger();\nGetAllHistorizationStatusPreMastering.trigger();",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "''" }] }}
          pluginId="preSearchOrbisId"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Text
      id="modalTitle13"
      hidden="{{!PreAndRemFlagRefresh.value}}"
      value="#### View PreMastering Record"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Include src="./GoldenContainer2.rsx" />
  </Body>
</ModalFrame>
