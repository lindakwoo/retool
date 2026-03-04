<Container
  id="containerHeaderInfo"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
>
  <View id="00030" viewKey="View 1">
    <Button id="button22" text="Reveal PII">
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "await Promise.all([\n  queryBuyer.trigger({additionalScope: {\n  shouldShowPii: true,\n  buyerId: queryRecord.data.user.id\n}}),\n  querySeller.trigger({additionalScope: {\n  shouldShowPii: true,\n  sellerId: orderSeller.value.id,\n}}),\n]);",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textHeaderBuyerData"
      value="**Buyer Data** "
      verticalAlign="center"
    />
    <Text
      id="textHeaderSellerData"
      value="**Seller Data** "
      verticalAlign="center"
    />
    <Button
      id="button23"
      disabled={
        '{{ !queryShipment.data || queryShipment.data.shippo_data.to_address.email.indexOf("@") !== -1}}'
      }
      text="Reveal PII"
    >
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "await queryShipment.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textHeaderShippingCountries"
      value="**Shipping Countries** 
Buyer Country: {{ queryShipment.data.shippo_data.to_address.country }}
Seller Country: {{ queryShipment.data.shippo_data.from_address.country }}
"
      verticalAlign="center"
    />
    <Button
      id="copyTrackingCode2"
      _disclosedFields={{ array: [] }}
      hidden="{{!!!queryShipment.data.tracking_code}}"
      marginType="normal"
      text="Copy Tracking"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{queryShipment.data.tracking_code}}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Image
      id="imageShippingCourierLogo"
      fit="contain"
      heightType="fixed"
      src="{{ queryShipment.data.courier_logo_url }}"
    />
    <Link
      id="linkToBuyerUserPage"
      ariaLabel=""
      text="Username: {{ queryBuyer.data.username }}"
    >
      <Event
        event="click"
        method="openApp"
        params={{
          uuid: "745ca30c-cae5-11f0-9e21-2b0d951bd721",
          options: {
            queryParams: [{ key: "id", value: "{{ queryBuyer.data.id }}" }],
            newTab: true,
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Link>
    <Link
      id="linkToSellerUserPage"
      ariaLabel=""
      text="Username: {{ querySeller.data.username }}"
    >
      <Event
        event="click"
        method="openApp"
        params={{
          uuid: "745ca30c-cae5-11f0-9e21-2b0d951bd721",
          options: {
            queryParams: [{ key: "id", value: "{{ querySeller.data.id }}" }],
            newTab: true,
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Link>
    <Button
      id="buttonOpenTrackingCode2"
      _disclosedFields={{ array: [] }}
      disabled="{{!!!queryShipment.data.tracking_code}}"
      hidden="{{!!!queryShipment.data.tracking_code}}"
      loading=""
      maintainSpaceWhenHidden={null}
      marginType="normal"
      showInEditor={null}
      text="Open Tracking"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            { options: { ordered: [{ newTab: true }] } },
            { url: "{{queryShipment.data.tracking_url}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="textShippingCourier"
      value="{{ queryShipment.data.courier }}"
      verticalAlign="center"
    />
    <Link
      id="linkBuyerEmailClickToCopy"
      ariaLabel=""
      disabled="{{ queryBuyer.data.email.includes('*') }}"
      text="Email: {{ queryBuyer.data.email }}"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ map: { value: "{{ queryBuyer.data.email }}" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Link>
    <Link
      id="linkSellerEmailClickToCopy"
      ariaLabel=""
      disabled="{{ querySeller.data.email.includes('*') }}"
      text="Email: {{ querySeller.data.email }}"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ map: { value: "{{ querySeller.data.email }}" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Link>
  </View>
</Container>
