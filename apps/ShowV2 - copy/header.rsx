<Frame
  id="$header2"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  padding="8px 12px"
  sticky={false}
  type="header"
>
  <Text
    id="textOrderTitle"
    _defaultValue=""
    _disclosedFields={{ array: [] }}
    marginType="normal"
    style={{ ordered: [] }}
    value={
      '## Order# {{ queryRecord.data.id }} | UUID: {{queryRecord.data.uuid}} {{queryRecord.data.gifting_preferences?.custom_address_id || queryRecord.data.gifting_preferences?.recipient_user_id ? `🎁` : ""}}\n\n'
    }
    verticalAlign="center"
  />
  <Text
    id="textDisputed"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    style={{ ordered: [{ color: "rgba(255, 0, 0, 1)" }] }}
    value={'## {{fetchDisputes.data.DISPUTE_SYSTEM? "DISPUTED" : ""}}'}
    verticalAlign="center"
  />
  <ButtonWidget
    id="buttonGoBack"
    buttonType="internal-url"
    color="#555555"
    events={[
      {
        ordered: [
          { event: "click" },
          { method: "openApp" },
          { type: "util" },
          { pluginId: "" },
          { waitType: "debounce" },
          { waitMs: "0" },
          {
            params: {
              ordered: [
                { uuid: "0580c8fe-bfd3-11eb-abc6-a38238801047" },
                {
                  options: {
                    ordered: [
                      { queryParams: null },
                      { hashParams: null },
                      { newTab: false },
                    ],
                  },
                },
              ],
            },
          },
        ],
      },
    ]}
    internalUrlPath="186c9538-bfd3-11eb-ac64-97382bd4cafa"
    style={{ ordered: [{ "accent-background": "" }] }}
    value="Go Back"
  />
  <Text
    id="textErrorMessage"
    _defaultValue=""
    _disclosedFields={{ array: [] }}
    hidden="{{ !errorTransformer.value }}"
    marginType="normal"
    style={{ ordered: [{ color: "danger" }] }}
    value="## {{ errorTransformer.value }}"
    verticalAlign="center"
  />
  <TagsWidget2
    id="weeklybundletag"
    _colorByIndex={["rgba(129, 201, 218, 1)"]}
    _hiddenByIndex={[false]}
    _iconByIndex={[""]}
    _ids={["44304"]}
    _imageByIndex={[""]}
    _labels={[
      "Bundle Ship Date: {{ queryShipment.data?.bundling_window_info?.ship_date }}",
    ]}
    _textColorByIndex={["#ffffff"]}
    _tooltipByIndex={[""]}
    _values={["{{\nqueryShipment.data?.bundling_window_info?.ship_date }}\n"]}
    allowWrap={true}
    colorByIndex=""
    data=""
    hidden="{{  queryShipment?.data?.bundling_window_info == null }}"
    hiddenByIndex=""
    iconByIndex=""
    imageByIndex=""
    itemMode="static"
    labels=""
    textColorByIndex=""
    tooltipByIndex=""
    value="{{ [queryShipment.data?.bundling_window_info?.ship_date] }}"
    values=""
  />
  <TagsWidget2
    id="freeShippingForFtbTag"
    _colorByIndex={["rgba(232, 206, 155, 1)"]}
    _hiddenByIndex={["{{ hasFreeShippingForFtb.data.count == 0 }}"]}
    _iconByIndex={[""]}
    _ids={["78eac"]}
    _imageByIndex={[""]}
    _labels={[""]}
    _textColorByIndex={[""]}
    _tooltipByIndex={[""]}
    _values={["Free Shipping For FTB Credit Applied To This Order"]}
    allowWrap={true}
    colorByIndex=""
    data=""
    hidden="{{ hasFreeShippingForFtb.data.count == 0 }}"
    hiddenByIndex=""
    iconByIndex=""
    imageByIndex=""
    itemMode="static"
    labels=""
    textColorByIndex=""
    tooltipByIndex=""
    value=""
    values=""
  />
  <TagsWidget2
    id="timedEventTag"
    allowWrap={true}
    data="{{ queryTimedListingEvents.data }}"
    hiddenByIndex="{{ queryTimedListingEvents.data.id.length === 0 }}"
    value=""
    values="{{ item.type }}"
  />
  <Include src="./src/containerHeaderInfo.rsx" />
  <Navigation
    id="navigation1"
    appTargetByIndex=""
    captionByIndex=""
    data=""
    disabledByIndex=""
    hiddenByIndex=""
    highlightByIndex=""
    iconByIndex=""
    iconPositionByIndex=""
    itemMode="static"
    itemTypeByIndex=""
    keyByIndex=""
    labels=""
    parentKeyByIndex=""
    persistUrlParamsByIndex=""
    retoolFileObject={{}}
    screenTargetByIndex=""
    screenTargetIdByIndex=""
    tooltipByIndex=""
  >
    <Option
      id="eb399"
      highlight={'{{ retoolContext.currentPage === "order_details" }}'}
      iconPosition="left"
      itemType="custom"
      label="Order Details"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "order_details",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="7912a"
      highlight={'{{ retoolContext.currentPage === "payment_details" }}'}
      iconPosition="left"
      itemType="custom"
      label="Payment Details"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "payment_details",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="f5af0"
      disabled={false}
      hidden={false}
      iconPosition="left"
      itemType="app"
      key="5f91953b-5762-4e09-a8b0-ed3788aa274e"
      label="Shipment"
    />
    <Option
      id="96a8a"
      highlight={'{{ retoolContext.currentPage === "shipment_data" }}'}
      iconPosition="left"
      itemType="custom"
      label="Shipment Data"
      parentKey="5f91953b-5762-4e09-a8b0-ed3788aa274e"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "shipment_data",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="9b824"
      highlight={'{{ retoolContext.currentPage === "orders_in_shipment" }}'}
      iconPosition="left"
      itemType="custom"
      label="Orders in Shipment"
      parentKey="5f91953b-5762-4e09-a8b0-ed3788aa274e"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "orders_in_shipment",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="8491f"
      highlight={
        '{{ retoolContext.currentPage === "buyer_shipments_in_this_livestream" }}'
      }
      iconPosition="left"
      itemType="custom"
      label="Buyer Shipments in this Livestream"
      parentKey="5f91953b-5762-4e09-a8b0-ed3788aa274e"
      tooltip="Buyer Shipments in this Livestream"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "buyer_shipments_in_this_livestream",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="33a24"
      highlight={'{{ retoolContext.currentPage === "shipping_adjustments" }}'}
      iconPosition="left"
      itemType="custom"
      label="Shipping Adjustments"
      parentKey="5f91953b-5762-4e09-a8b0-ed3788aa274e"
      tooltip="Shipping Adjustments"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "shipping_adjustments",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="183ff"
      highlight={'{{ retoolContext.currentPage === "listing" }}'}
      iconPosition="left"
      itemType="custom"
      label="Listing"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "listing",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="7aab2"
      highlight={'{{ retoolContext.currentPage === "invoice" }}'}
      iconPosition="left"
      itemType="custom"
      label="Invoice"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "invoice",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="d97fa"
      highlight={'{{ retoolContext.currentPage === "disputes" }}'}
      iconPosition="left"
      itemType="custom"
      label="Disputes"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "disputes",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="00030"
      highlight={
        '{{ retoolContext.currentPage === "tracking_updates_from_shippo" }}'
      }
      iconPosition="left"
      itemType="custom"
      label="Tracking Updates from Shippo"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "tracking_updates_from_shippo",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Option
      id="f6ea5"
      hidden={false}
      highlight={
        '{{ retoolContext.currentPage === "seller_cancellation_fee" }}'
      }
      iconPosition="left"
      itemType="custom"
      label="Cancellation Fee"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          options: { map: { passDataWith: "urlParams" } },
          pageName: "seller_cancellation_fee",
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Option>
    <Event
      event="click"
      method="openPage"
      params={{ map: { pageName: "{{ item.id }}" } }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Navigation>
</Frame>
