<Container
  id="containerBuyerGeneral"
  disabled=""
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hidden={null}
  hoistFetching={true}
  maintainSpaceWhenHidden={null}
  marginType="normal"
  overflowType="hidden"
  padding="12px"
  paddingType="normal"
  selectedView="View 1"
  showBody={true}
  showHeader={true}
  showInEditor={null}
  style={{ ordered: [{ headerBackground: "#ededed" }] }}
  styleContext={{ ordered: [] }}
>
  <Header>
    <Text
      id="containerTitle9"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**BUYER DATA**"
      verticalAlign="center"
    />
    <Button
      id="buttonRevealBuyerData"
      disabled=""
      hidden={null}
      loading=""
      maintainSpaceWhenHidden={null}
      showInEditor={null}
      style={{ ordered: [] }}
      text="Reveal PII"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "await queryBuyer.trigger({additionalScope: {\n  shouldShowPii: true,\n  buyerId: queryRecord.data.user.id\n}})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <ButtonWidget
      id="buttonOpenBuyerProfile"
      buttonType="internal-url"
      color="#3c92dc"
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
                  { uuid: "745ca30c-cae5-11f0-9e21-2b0d951bd721" },
                  {
                    options: {
                      ordered: [
                        {
                          queryParams: [
                            {
                              ordered: [
                                { key: "id" },
                                { value: "{{queryRecord.data.user.id}}" },
                              ],
                            },
                          ],
                        },
                        { hashParams: null },
                        { newTab: true },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
      ]}
      internalUrlPath="745ca30c-cae5-11f0-9e21-2b0d951bd721"
      internalUrlQuery={
        '"[{\\"key\\":\\"id\\",\\"value\\":\\"{{queryRecord.data.user.id}}\\"}]"'
      }
      newWindow={true}
      style={{ ordered: [] }}
      value="Open
"
    />
  </Header>
  <View id="" viewKey="View 1" />
  <Body>
    <KeyValueMap
      id="keyvaluemapBuyerGeneral"
      data="{{ queryBuyer.data }}"
      prevRowFormats={{}}
      prevRowMappers={{}}
      rowHeaderNames={{
        email: "Email",
        first_name: "First Name",
        last_name: "Last Name",
        id: "ID",
        username: "Username",
        phone_number: "Phone Number",
      }}
      rows={[
        "a",
        "b",
        "c",
        "id",
        "username",
        "email",
        "first_name",
        "last_name",
        "phone_number",
        "home_address",
        "seller_early_payout_enabled",
        "shippo_platform_merchant_id",
        "uuid",
        "user",
        "payment",
        "shipping_address",
        "created_at",
        "processed_at",
        "status",
        "comments",
        "items",
        "style",
        "total_cents",
        "total_currency",
        "subtotal_cents",
        "subtotal_currency",
        "taxes_cents",
        "taxes_currency",
        "credit_cents",
        "credit_currency",
        "shipping_price_cents",
        "shipping_price_currency",
        "sales_channel",
        "channel_reference",
        "cancellation_reason",
        "cancelled_at",
        "currency",
        "currency_symbol",
        "gifting_preferences",
        "giveaway_preferences",
        "seller_shipping_price_sub_units",
        "seller_shipping_price_currency",
        "buyer_shipments_in_livestream",
        "total_paid_across_all_buyer_shipments_in_live",
        "fixed_amount_coupon_discount_sub_units",
        "fixed_amount_coupon_discount_currency",
        "percentage_coupon_discount_sub_units",
        "percentage_coupon_discount_currency",
        "coupon_code",
        "handling_charges",
        "has_quality_listing",
      ]}
      rowVisibility={{
        cancellation_reason: true,
        items: true,
        a: true,
        cancelled_at: true,
        b: true,
        c: true,
        shipping_address: true,
        shipping_price_cents: true,
        seller_early_payout_enabled: false,
        processed_at: true,
        taxes_cents: true,
        handling_charges: true,
        credit_cents: true,
        currency_symbol: true,
        payment: true,
        coupon_code: true,
        percentage_coupon_discount_sub_units: true,
        seller_shipping_price_sub_units: true,
        created_at: true,
        shippo_platform_merchant_id: false,
        gifting_preferences: true,
        user: true,
        subtotal_currency: true,
        total_currency: true,
        total_paid_across_all_buyer_shipments_in_live: true,
        fixed_amount_coupon_discount_sub_units: true,
        channel_reference: true,
        sales_channel: true,
        subtotal_cents: true,
        total_cents: true,
        currency: true,
        style: true,
        fixed_amount_coupon_discount_currency: true,
        status: true,
        buyer_shipments_in_livestream: true,
        home_address: false,
        comments: true,
        last_name: true,
        username: true,
        credit_currency: true,
        taxes_currency: true,
        seller_shipping_price_currency: true,
        giveaway_preferences: true,
        shipping_price_currency: true,
        first_name: true,
        phone_number: true,
        id: true,
        percentage_coupon_discount_currency: true,
        uuid: true,
        email: true,
        has_quality_listing: true,
      }}
    />
    <Button
      id="copyBuyerID"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy User ID"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{ queryRecord.data.user.id.toString() }}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="copyBuyerUsername"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy Username
"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [{ value: "{{ queryRecord.data.user.username }}" }],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="copyBuyerEmail"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !queryBuyer.data || queryBuyer.data.email.indexOf("@") === -1 }}'
      }
      marginType="normal"
      text="Copy Email"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ ordered: [{ value: "{{ queryBuyer.data.email }}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text32"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Automated Tags**"
      verticalAlign="center"
    />
    <KeyValueMap
      id="keyValue3"
      data="{{  buyerAutomatedTags.data }}"
      margin="0"
      prevRowFormats={{}}
      prevRowMappers={{}}
      rows={[
        "a",
        "b",
        "c",
        "MAIN_LS_CATEGORY",
        "SELLER_RATING_OVERALL",
        "VIP_SELLER",
        "REFUND_THRESHOLD",
        "DELAYED_DROPOFF_THRESHOLD",
        "VIP_BUYER",
        "error",
        "message",
        "queryExecutionMetadata",
        "source",
        "isRetoolSystemError",
        "statusCode",
        "data",
      ]}
      rowVisibility={{
        a: true,
        VIP_SELLER: true,
        b: true,
        c: true,
        REFUND_THRESHOLD: false,
        isRetoolSystemError: true,
        message: true,
        error: true,
        data: true,
        SELLER_RATING_OVERALL: false,
        DELAYED_DROPOFF_THRESHOLD: false,
        MAIN_LS_CATEGORY: false,
        VIP_BUYER: true,
        source: true,
        statusCode: true,
        queryExecutionMetadata: true,
      }}
    />
    <Text
      id="text34"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Manual T&S Tags**"
      verticalAlign="center"
    />
    <TableLegacy
      id="table1"
      _columns={[
        "tag",
        "active_v2",
        "ls_category",
        "notes",
        "last_updated_by",
        "created_at",
        "id",
        "tag_id",
        "tagged_by",
        "updated_at",
        "user_id",
        "zendesk_id",
        "start_timestamp",
        "end_timestamp",
        "deactivated_at_v2",
      ]}
      _columnVisibility={{
        ordered: [
          { created_at: false },
          { deactivated_at: false },
          { id: false },
          { tag_id: false },
          { updated_at: false },
          { user_id: false },
        ],
      }}
      _compatibilityMode={false}
      columnColors={{
        tag_id: "",
        notes: "",
        deactivated_at: "",
        last_updated_by: "",
        active: "",
        tagged_by: "",
        created_at: "",
        user_id: "",
        end_timestamp: "",
        active_v2: "",
        ls_category: "",
        updated_at: "",
        start_timestamp: "",
        deactivated_at_v2: "",
        tag: "",
        id: "",
        zendesk_id: "",
      }}
      columnMappers={{ ordered: [{ tag: "{{ self.title }}" }] }}
      columnWidths={[
        { object: { id: "tag", value: 105 } },
        { object: { id: "active", value: 62 } },
        { object: { id: "ls_category", value: 118 } },
        { object: { id: "notes", value: 115 } },
        { object: { id: "last_updated_by", value: 142 } },
        { object: { id: "tagged_by", value: 139 } },
      ]}
      data="{{ buyerManualTags.data }}"
      defaultSortByColumn="active_v2"
      doubleClickToEdit={true}
      emptyMessage="No T&S tags found"
      margin="0"
      rowHeight="compact"
      showBoxShadow={false}
      showDownloadButton={false}
      showFilterButton={false}
      showRefreshButton={false}
    />
    <Text
      id="BuyerTSStatusText"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**T&S Status**"
      verticalAlign="center"
    />
    <TableLegacy
      id="TSBuyerTable"
      _compatibilityMode={false}
      columnColors={{
        0: "",
        1: "{{ !self ? 'green' : self ? 'red' : 'white' }}",
      }}
      columnHeaderNames={{ ordered: [{ 0: "Action Type" }, { 1: "Status" }] }}
      columnMappers={{
        ordered: [{ 1: "{{ !self ? 'False' : self ? 'True' : '' }}" }],
      }}
      data="{{ 
Object.keys(queryBuyerTSStanding.data).map(m=> [m,queryBuyerTSStanding.data[m]])
}}"
      margin="0"
      rowHeight="dense"
      showBoxShadow={false}
      showDownloadButton={false}
      showFilterButton={false}
      showRefreshButton={false}
    />
  </Body>
</Container>
