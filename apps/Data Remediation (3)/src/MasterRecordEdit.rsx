<ModalFrame
  id="MasterRecordEdit"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
>
  <Event
    event="hide"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="ResetFormFields"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
