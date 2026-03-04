<Container
  id="container1"
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
  style={{ ordered: [{ headerBackground: "rgb(237, 237, 237)" }] }}
>
  <Header>
    <Text
      id="containerTitle11"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**SELLER DATA**"
      verticalAlign="center"
    />
    <Button
      id="buttonRevealSellerData"
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
              src: "await querySeller.trigger({additionalScope: {\n  shouldShowPii: true,\n  sellerId: orderSeller.value.id,\n}})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button5"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Open"
    >
      <Event
        event="click"
        method="openApp"
        params={{
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
                          { value: "{{orderSeller.value.id}}" },
                        ],
                      },
                    ],
                  },
                  { newTab: true },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="7e7fc" viewKey="View 1">
    <KeyValueMap
      id="keyValue2"
      data="{{querySeller.data}}"
      prevRowFormats={{ map: { phone_number: "default" } }}
      prevRowMappers={{}}
      rowFormats={{ ordered: [{ phone_number: "default" }] }}
      rowHeaderNames={{
        username: "Username",
        id: "ID",
        email: "Email",
        first_name: "First Name",
        last_name: "Last Name",
        phone_number: "Phone Number",
        is_ep_enabled: "Early Payout",
      }}
      rows={[
        "a",
        "b",
        "c",
        "cancellation_reason",
        "cancelled_at",
        "channel_reference",
        "comments",
        "created_at",
        "id",
        "items",
        "payment",
        "sales_channel",
        "shipping_address",
        "shipping_price_cents",
        "shipping_price_currency",
        "status",
        "style",
        "subtotal_cents",
        "subtotal_currency",
        "taxes_cents",
        "taxes_currency",
        "total_cents",
        "total_currency",
        "user",
        "uuid",
        "actions",
        "cancellation_request",
        "listing",
        "name",
        "price_cents",
        "product_id",
        "quantity",
        "shipment",
        "tracking_url",
        "condition",
        "description",
        "ledger_transaction",
        "owner",
        "title",
        "username",
        "email",
        "first_name",
        "home_address",
        "last_name",
        "phone_number",
        "seller_early_payout_enabled",
        "pluginType",
        "persistedValueKey",
        "persistValue",
        "_persistedValueGetter",
        "value",
        "_persistedValueSetter",
        "shippo_platform_merchant_id",
        "is_ep_enabled",
      ]}
      rowVisibility={{
        cancellation_reason: true,
        items: true,
        a: true,
        persistedValueKey: true,
        cancelled_at: true,
        b: true,
        is_ep_enabled: true,
        c: true,
        shipping_address: true,
        shipping_price_cents: true,
        listing: true,
        seller_early_payout_enabled: true,
        taxes_cents: true,
        payment: true,
        tracking_url: true,
        ledger_transaction: true,
        _persistedValueGetter: true,
        created_at: true,
        shippo_platform_merchant_id: true,
        quantity: true,
        product_id: true,
        name: true,
        user: true,
        subtotal_currency: true,
        total_currency: true,
        pluginType: true,
        channel_reference: true,
        sales_channel: true,
        subtotal_cents: true,
        total_cents: true,
        value: true,
        style: true,
        status: true,
        owner: true,
        cancellation_request: true,
        home_address: false,
        comments: true,
        last_name: true,
        price_cents: true,
        username: true,
        taxes_currency: true,
        shipping_price_currency: true,
        title: true,
        shipment: true,
        first_name: true,
        phone_number: true,
        id: true,
        condition: true,
        uuid: true,
        _persistedValueSetter: true,
        email: true,
        description: true,
        actions: true,
        persistValue: true,
      }}
    />
    <Button
      id="copySellerID"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy User ID"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ ordered: [{ value: "{{orderSeller.value.id.toString()}}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="copySellerUsername"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy Username"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ ordered: [{ value: "{{orderSeller.value.username}}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="copySellerEmail"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !querySeller.data || querySeller.data.email.indexOf("@") === -1 }}'
      }
      marginType="normal"
      text="Copy Email"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{ ordered: [{ value: "{{querySeller.data.email}}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text33"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Automated Tags**"
      verticalAlign="center"
    />
    <KeyValueMap
      id="keyValue4"
      data="{{ sellerAutomatedTags.data }}"
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
      id="text35"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**Manual T&S Tags**"
      verticalAlign="center"
    />
    <TableLegacy
      id="table2"
      _columns={[
        "tag",
        "created_at",
        "id",
        "active_v2",
        "ls_category",
        "notes",
        "last_updated_by",
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
          { notes: true },
          { tag_id: false },
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
      columnEditable={{ ordered: [{ tag_id: false }] }}
      columnMappers={{ ordered: [{ tag: "{{ self.title }}" }] }}
      columnWidths={[
        { object: { id: "active", value: 62 } },
        { object: { id: "tag", value: 158 } },
      ]}
      data="{{ sellerManualTags.data }}"
      defaultSortByColumn="active_v2"
      defaultSortDescending={true}
      doubleClickToEdit={true}
      emptyMessage="No T&S tags found"
      maintainSpaceWhenHidden={false}
      margin="0"
      rowHeight="compact"
      showBoxShadow={false}
      showDownloadButton={false}
      showFilterButton={false}
      showRefreshButton={false}
    />
    <Text
      id="SellerTSStatusText"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="**T&S Status**"
      verticalAlign="center"
    />
    <TableLegacy
      id="TSSellerTable"
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
Object.keys(querySellerTSStanding.data).map(m=> [m,querySellerTSStanding.data[m]])
}}"
      margin="0"
      rowHeight="dense"
      showBoxShadow={false}
      showDownloadButton={false}
      showFilterButton={false}
      showRefreshButton={false}
    />
  </View>
</Container>
