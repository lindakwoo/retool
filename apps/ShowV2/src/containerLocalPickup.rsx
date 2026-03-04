<Container
  id="containerLocalPickup"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden="{{!!!queryShipment.data.pickup_data}}"
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader="false"
>
  <View id="159cc" viewKey="View 1">
    <Text
      id="text83"
      marginType="normal"
      value="###### Local Pickup Info"
      verticalAlign="center"
    />
    <Text
      id="text84"
      marginType="normal"
      value="**instructions:** &nbsp;&nbsp;{{queryShipment.data.pickup_data.instructions}}"
      verticalAlign="center"
    />
    <Text
      id="text85"
      marginType="normal"
      value="**Picked Up Date:** &nbsp;&nbsp;{{queryShipment.data.pickup_data.picked_up_date}}"
      verticalAlign="center"
    />
    <Text
      id="text86"
      marginType="normal"
      value="**Pickup Code:** &nbsp;&nbsp;{{queryShipment.data.pickup_data.pickup_code}}"
      verticalAlign="center"
    />
    <Button
      id="buttonOrderItemPrintLabel2"
      _disclosedFields={{ array: [] }}
      disabled="{{queryShipment.data.bundled_file_url === null && queryShipment.data.file_url === null}}"
      hidden={null}
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      submitTargetId=""
      text="Pickup Slip"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [{ url: "{{queryShipment.data.bundled_file_url}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
