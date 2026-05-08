<Container
  id="containerLabelDebugInfo"
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden="{{!!!queryShipment.data.shippo_transaction_id}}"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle7"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="5ffc9" viewKey="View 1">
    <Text
      id="textTxnID"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Txn ID:**<br />{{ queryShipment.data.shippo_transaction_id }}"
      verticalAlign="center"
    />
    <Button
      id="buttonCopyTxnID"
      _disclosedFields={{ array: [] }}
      disabled=""
      hidden={null}
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{queryShipment.data.shippo_transaction_id}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textRateID"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      hidden="{{!!!queryShipment.data.shippo_data.rate_id}}"
      marginType="normal"
      value="**Rate ID:**<br />{{ queryShipment.data.shippo_data.rate_id }}"
      verticalAlign="center"
    />
    <Button
      id="buttonCopyTxnID2"
      _disclosedFields={{ array: [] }}
      disabled=""
      hidden="{{!!!queryShipment.data.shippo_data.rate_id}}"
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{queryShipment.data.shippo_data.rate_id}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textRateID2"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Shipment ID:** {{ queryShipment.data.shippo_data.shipment_id }}"
      verticalAlign="center"
    />
    <Button
      id="copyShippoShipmentId"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!queryShipment.data.shippo_data.shipment_id}}"
      marginType="normal"
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            { value: "{{queryShipment.data.shippo_data.shipment_id}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textShippingLabelMerchantID"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Merchant ID:** {{ queryShipment.data.shipping_label_metadata.shippo_data.merchant_id }}"
      verticalAlign="center"
    />
    <Button
      id="copyTextShippingLabelMerchantID"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!queryShipment.data.shipping_label_metadata.shippo_data.merchant_id}}"
      marginType="normal"
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{queryShipment.data.shipping_label_metadata.shippo_data.merchant_id}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textShippingLabelCarrierAccountID"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Carrier Account ID:** {{ queryShipment.data.shipping_label_metadata.shippo_data.carrier_account_id }}"
      verticalAlign="center"
    />
    <Button
      id="copyTextShippingLabelCarrierAccountID"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!queryShipment.data.shipping_label_metadata.shippo_data.carrier_account_id}}"
      marginType="normal"
      text="Copy"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{queryShipment.data.shipping_label_metadata.shippo_data.carrier_account_id}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
