<Container
  id="containerShipmentData"
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
      id="shipmentDataTitle"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="#### Shipment Data"
      verticalAlign="center"
    />
  </Header>
  <View id="e9127" viewKey="View 1">
    <Text
      id="textShipmentID"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Shipment ID:** &nbsp;&nbsp;{{ queryShipment.data.id || 'none' }}"
      verticalAlign="center"
    />
    <Button
      id="buttonCopyShipmentID"
      _disclosedFields={{ array: [] }}
      disabled="{{!!! queryShipment.data.id}}"
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
          ordered: [{ value: "{{queryShipment.data.id.toString()}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textShipmentID2"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Shipment Status:** &nbsp;&nbsp;{{queryShipment.data.pickup_data? queryShipment.data.pickup_data.pickup_status:queryShipment.data.status}}"
      verticalAlign="center"
    />
    <Text
      id="textShipmentID3"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Weight:** &nbsp;&nbsp;{{(queryShipment.data.weight.amount).toFixed(1)}} {{queryShipment.data.weight.scale}}"
      verticalAlign="center"
    />
    <Text
      id="textShipmentCubicWeight"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      hidden="{{  queryShipment.data.cubic_weight == undefined || queryShipment.data.cubic_weight == null }}"
      marginType="normal"
      value="**Cubic Weight:** &nbsp;&nbsp;{{(queryShipment.data.cubic_weight?.amount)?.toFixed(1)}} {{queryShipment.data.cubic_weight?.scale}}"
      verticalAlign="center"
    />
    <Text
      id="text17"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Dimensions:** &nbsp;&nbsp;{{(queryShipment.data.dimensions.length).toFixed(2)}} x {{(queryShipment.data.dimensions.width).toFixed(2)}} x {{(queryShipment.data.dimensions.height).toFixed(2)}} {{queryShipment.data.dimensions.scale}}"
      verticalAlign="center"
    />
    <Text
      id="text105"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Created:** &nbsp;&nbsp;{{queryShipmentDB.data.created_at}}

"
      verticalAlign="center"
    />
    <Text
      id="text109"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**Printed:** &nbsp;&nbsp;{{queryShipmentLabelPrintedAt.data?.LABEL_PRINTED_AT}}

"
      verticalAlign="center"
    />
    <Text
      id="text137"
      heightType="fixed"
      value="**Dropoff Scan**: {{ transformEarliestDropoffType.value.dropoffType }}"
      verticalAlign="center"
    />
    <Text
      id="text136"
      heightType="fixed"
      value="**Dropoff Scan At**: {{ transformEarliestDropoffType.value.dropoffTimestamp }}
"
      verticalAlign="center"
    />
    <Text
      id="text138"
      heightType="fixed"
      value="**First Transit Scan**: {{ queryShipmentScanTraits.data.FIRST_CARRIER_SCAN_TIMESTAMP }}"
      verticalAlign="center"
    />
    <Text
      id="text110"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value={
        '**SCAN Form ID:** &nbsp;&nbsp;{{queryShipment.data?.shipping_manifest_id || "None" }}\n\n'
      }
      verticalAlign="center"
    />
    <Divider
      id="divider3"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      textSize="default"
    />
    <Include src="./containerLocalPickup.rsx" />
    <Alert
      id="flatRateBoxAlert1"
      description="Based on the show's shipping settings and package weight, the seller will be prompted to enter a flat-rate box. You & the seller can still generate a regular Priority Mail label."
      hidden="{{!!!requiresFlatRateBox.value}}"
      title="Should Use Flat-Rate Box"
    />
    <Text
      id="textTrackingCode"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="###### Label Info"
      verticalAlign="center"
    />
    <Alert
      id="BYOL"
      description={
        '{{ queryShipmentBYOL.data?.IS_TRACKABLE_BYOL == "true" ? "Trackable" : "Not Trackable" }}'
      }
      hidden={
        '{{(queryShipmentBYOL.data?.IS_BUY_YOUR_OWN_LABEL == "false" || queryShipmentBYOL.data?.IS_BUY_YOUR_OWN_LABEL === undefined) ? true : false }}'
      }
      title="BYOL"
      type="warning"
    />
    <Alert
      id="packageInsured"
      description="{{queryShipment.data.shippo_data.insurance.amount}} — {{queryShipment.data.shippo_data.insurance.content}}"
      hidden={
        '{{ queryShipment.data?.shippo_data?.insurance?.amount == null || queryShipment.data?.shippo_data?.insurance?.amount == "$0.00" }}'
      }
      title="Package Insured"
    />
    <Alert
      id="sigRequiredAlert"
      description=""
      hidden="{{ !queryShipment.data?.signature_required }}"
      title="A signature is required on this package"
      type="warning"
    />
    <Text
      id="text47"
      _disclosedFields={{ array: [] }}
      hidden=""
      marginType="normal"
      value={
        'Price Whatnot paid for label: {{queryShipment.data.price ? queryShipment.data.price : "0.00" }}\n\n*Note, this may be less than the amount we charged the user.*'
      }
      verticalAlign="center"
    />
    <Text
      id="textRateInfo"
      hidden="{{  queryShipment.data.rate_info == undefined || queryShipment.data.rate_info == null }}"
      value="**Over 5kg Rate Info:**<br> ***From Zone:*** {{queryShipment.data.rate_info?.from_parcel_zone}}&nbsp;&nbsp;&nbsp; ***To Zone:*** {{queryShipment.data.rate_info?.to_parcel_zone}}<br/> ***Cost per Kilo:*** {{ (queryShipment.data.rate_info?.price_per_kilo?.amount)/100 }} {{ (queryShipment.data.rate_info?.price_per_kilo?.currency) }}"
      verticalAlign="center"
    />
    <Include src="./containerLabelInfo.rsx" />
    <Text
      id="textTrackingCode4"
      _defaultValue=""
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="###### Shipping Label Debug Info (Shippo)"
      verticalAlign="center"
    />
    <Include src="./containerLabelDebugInfo.rsx" />
    <Container
      id="containerLabelInfoDNE"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{queryShipment.data.tracking_code}}"
      hoistFetching={true}
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
    >
      <Header>
        <Text
          id="containerTitle5"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="5ffc9" viewKey="View 1">
        <Text
          id="text15"
          _disclosedFields={{ array: [] }}
          horizontalAlign="center"
          marginType="normal"
          value="Label has not been generated"
          verticalAlign="center"
        />
      </View>
    </Container>
    <Button id="button19" text="View Historical Events">
      <Event
        event="click"
        method="openUrl"
        params={{
          map: {
            url: "https://admin2.whatnot.com/app/logistics-event-explorer/explorer?buyerId=&endDate=&sellerId=&shipmentId={{ queryShipmentDB.data.id }}&startDate={{queryShipmentDB.data.created_at }}",
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
