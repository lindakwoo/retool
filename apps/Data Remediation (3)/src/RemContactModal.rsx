<ModalFrame
  id="RemContactModal"
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
      id="RemContactContainer"
      value="### View Remediated Record"
      verticalAlign="center"
    />
    <ButtonGroup2
      id="ContactButtonGroup2"
      alignment="right"
      overflowPosition={2}
    >
      <ButtonGroup2-Button id="dd704" styleVariant="solid" text="Refresh">
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: 'loadingPopUp.setHidden(false);\nawait GetFunctionBulkProcess.trigger()\n  .then(async () => {\n    if (!BulkProcessButtonEnabled.value) {\n      await GetAllHistorizationStatusPreMastering.trigger()\n        .then(() => {\n          filteredRemRoles.trigger();\n        })\n        .catch(() => {\n          console.log("Failed to fetch historization data.");\n        });\n    }\n  })\n  .catch(() => {\n    console.log("Failed to check bulk process status.");\n  })\n  .finally(() => {\n    loadingPopUp.setHidden(true);\n  });\n\n\n',
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
          pluginId="RemContactModal"
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
                src: "PreAndRemFlagDelete.setValue(true);\nPreAndRemFlagRefresh.setValue(false);\nremPreSearchOrbisId.clearValue();\n\n\nif(ContactRemediatedRecordsList.value && ContactRemediatedRecordsList.value.length === 0 && \n  RemCurrentRolePreMasteringList.value && RemCurrentRolePreMasteringList.value.length === 0 && \n  RemPreviousRolePreMasteringList.value && RemPreviousRolePreMasteringList.value.length === 0 &&\n  PreFunctionRolesGreaterThan120.value && PreFunctionRolesGreaterThan120.value.length === 0) {\n  container3.setHidden(true);\n  }",
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
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="DeleteFunctionRoleFlag"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "''" }] }}
          pluginId="remPreSearchOrbisId"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </Header>
  <Body>
    <Include src="./RemediatedRecordWrap.rsx" />
  </Body>
</ModalFrame>
