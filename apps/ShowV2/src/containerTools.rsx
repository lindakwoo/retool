<Container
  id="containerTools"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle6"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Tools"
      verticalAlign="center"
    />
  </Header>
  <View id="5ffc9" viewKey="View 1">
    <Text
      id="newLabelToolsHeader"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="###### New Label Tools"
      verticalAlign="center"
    />
    <Alert
      id="alert3"
      description=""
      hidden="{{ queryRecord.data.payment?.refund == null }}"
      title="Order was refunded"
      type="warning"
    />
    <Include src="./generateNewLabel.rsx" />
    <Include src="./createReturnLabel.rsx" />
    <Include src="./returnToSellerLabel.rsx" />
    <Include src="./returnToSellerLabel2.rsx" />
    <Include src="./modalVoidAndReassignTrackingCode.rsx" />
    <Include src="./modalVoidAndReassignTrackingCodeBYOL.rsx" />
    <Include src="./save_note_modal.rsx" />
    <Text
      id="shipmentActions"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="###### Shipment Actions"
      verticalAlign="center"
    />
    <Button
      id="markShipped"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{!["printed", "failed"].includes(queryShipment.data.status) }}'
      }
      marginType="normal"
      text="Mark as Shipped"
      tooltipText={
        '{{["printed", "failed"].includes(queryShipment.data.status) ? "Mark the shipment as shipped. This is the same as hitting Bulk Confirm Package Drop-Off on the seller dashboard" : `Shipment cannot be marked as shipped because it is in the state: (${queryShipment.data.status}). It must be in either "printed" or "failed" state`}}'
      }
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryMarkShipmentAsShipped"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="markDelivered"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{!["created", "printed", "in_transit", "failed"].includes(queryShipment.data.status) }}'
      }
      marginType="normal"
      text="Mark as Delivered"
      tooltipText={
        '{{["printed", "in_transit", "failed", "created"].includes(queryShipment.data.status) ? "Mark the shipment as delivered." : `Shipment cannot be marked as shipped because it is in the state: ${queryShipment.data.status}. It must be in either the "created", "printed", "in_transit", or "failed" state`}}'
      }
    >
      <Event
        enabled={
          '{{["printed", "in_transit", "failed"].includes(queryShipment.data.status) }}'
        }
        event="click"
        method="trigger"
        params={{
          map: {
            options: {
              object: {
                onSuccess: null,
                onFailure: null,
                additionalScope: null,
              },
            },
          },
        }}
        pluginId="queryMarkShipmentAsDelivered"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{ ["created"].includes(queryShipment.data.status) }}'}
        event="click"
        method="show"
        params={{}}
        pluginId="confirmMarkDeliveredWithNoLabel"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
