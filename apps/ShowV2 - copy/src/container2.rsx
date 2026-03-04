<Container
  id="container2"
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
      id="containerTitle12"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="### Order Details"
      verticalAlign="center"
    />
    <Button
      id="avalaraUrl2"
      _disclosedFields={{ array: [] }}
      hidden={
        '{{!current_user.groups.find(g => ["Finance", "Engineering", "Engineering Contractors", "Ops Tax Team"].includes(g.name))}}\n'
      }
      marginType="normal"
      text="Fees Avalara Transaction"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "queryAvalaraFeesURL.trigger().then(data => utils.openUrl(data));\n",
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
      id="avalaraUrl"
      _disclosedFields={{ array: [] }}
      hidden={
        '{{!current_user.groups.find(g => ["Finance", "Engineering", "Engineering Contractors", "Ops Tax Team"].includes(g.name))}}\n'
      }
      marginType="normal"
      text="Order Avalara Transaction"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "tempQueryAvalaraURL.trigger().then(data => utils.openUrl(data));\n",
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
      id="buttonOpenLivestream"
      _disclosedFields={{ array: [] }}
      hidden="{{queryRecord.data.sales_channel != 'livestream'}}"
      marginType="normal"
      text="Livestream"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          map: {
            url: "{{\n  `/apps/e835fc56-c7d4-11eb-a81a-838cdaaefd45/Livestreams/Show/recordings#id=${queryRecord.data.channel_reference}&seekTo=${computeSeekTo.data}`\n}}\n",
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="ButtonHubShipment"
      text="Seller Hub Shipment"
      tooltipText="You must be signed into whatnot.com as an admin user to view this seller's Dashboard."
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          map: {
            url: 'https://www.whatnot.com/dashboard/shipments/{{queryShipment.data.id ?? "undefined"}}?&sellerId={{orderSeller.value.id.toString()}}',
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonSellerOrder"
      _disclosedFields={{ array: [] }}
      hidden=""
      marginType="normal"
      text="Seller Hub Order"
      tooltipText="You must be signed into whatnot.com as an admin user to view this seller's Dashboard."
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: 'https://www.whatnot.com/dashboard/orders/{{queryRecord.data.uuid ?? "undefined"}}?sellerId={{orderSeller.value.id.toString()}}',
            },
            { options: { ordered: [{ newTab: true }] } },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="40de5" viewKey="View 1">
    <KeyValueMap
      id="keyvaluemapGeneral"
      data={
        '{{ { ...orderTransformer_OrderDetailsPage.value, \n  channel_name: (queryLivestream.data != null ? queryLivestream.data.title : ""),\n  product_tag: (queryLivestream.data != null && queryLivestream.data.tags != null && queryLivestream.data.tags.length > 0 ? queryLivestream.data.tags[0].label : ""),\n  product_tag_categories: (queryLivestream.data != null && queryLivestream.data.tag_based_categories != null && queryLivestream.data.tag_based_categories.length > 0 ? queryLivestream.data.tag_based_categories[0].label : "")} }}'
      }
      hidden="{{queryRecord.error}}"
      prevRowFormats={{
        cancellation_requested_at: "datetime_tz",
        cancelled_at: "datetime_tz",
        shipping_price_cents: "default",
        taxes_cents: "default",
        seller_shipping_price_sub_units: "default",
        created_at: "datetime_tz",
        user: "string",
        subtotal_cents: "default",
        total_cents: "default",
        seller_shipping_price_currency: "string",
        uuid: "string",
        cancellation_requested_status: "string",
      }}
      prevRowMappers={{
        cancellation_requested_at: '{{ self ? moment.utc(self) : "" }}',
        cancellation_reason: "{{ _.startCase(self) || self}}",
        cancelled_at:
          "{{ queryRecord.data.status == 'cancelled' ? moment.utc(self) : \"\" }}",
        shipping_address: "{{ self.postal_code + ' - ' + self.state}}",
        shipping_price_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        taxes_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        credit_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        coupon_code:
          '{{ queryRecord.data.coupon_code != null ? queryRecord.data.coupon_code : "" }}',
        seller_shipping_price_sub_units:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format((self || 0) / 100) }}",
        created_at: "{{moment.utc(self)}}",
        user: "{{ self.email }}",
        fixed_amount_coupon_discount_sub_units:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(-(self / 100)) }}",
        subtotal_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        total_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        subtotal_cents_before_discount:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        fixed_amount_coupon_discount_currency: "{{ self }}",
        giveaway_credits:
          "{{ self[0] ? new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer.value.currency }).format(self[0] / 100) : \"None\" }}",
        image:
          '<img alt="" src="{{getImageUrl(queryRecord.data.image.bucket, queryRecord.data.image.key)}}" />',
        cancellation_requested_status: '{{ self || "" }}',
      }}
      rowFormats={{
        cancellation_requested_at: "datetime_tz",
        cancelled_at: "datetime_tz",
        shipping_price_cents: "default",
        taxes_cents: "default",
        seller_shipping_price_sub_units: "default",
        created_at: "datetime_tz",
        user: "string",
        subtotal_cents: "default",
        total_cents: "default",
        seller_shipping_price_currency: "string",
        uuid: "string",
        cancellation_requested_status: "string",
      }}
      rowHeaderNames={{
        seller_cancellation_reason: "Seller Cancellation Reason",
        cancellation_requested_at: "Cancellation Requested At",
        cancellation_reason: "Cancellation Reason",
        cancelled_at: "Cancelled At",
        shipping_profile_id: "Shipping Profile #",
        brand_name: "Brand",
        shipping_address: "Ships To",
        shipping_price_cents: "Buyer Shipping",
        taxes_cents: "Taxes",
        credit_cents: "Credits",
        coupon_code: "Coupon Code",
        channel_name: "Channel Name",
        seller_shipping_price_sub_units: "Seller Shipping",
        seller_handling_charge_amount: "Seller Handling Charge",
        product_tag: "Product tags",
        created_at: "Created At",
        seller_cancellation_buyer_facing_message:
          "Seller Cancellation buyer facing message",
        name: "Name",
        user: "Buyer",
        category_name: "Category",
        franchise_name: "Franchise",
        "Product categories": "Product categories",
        fixed_amount_coupon_discount_sub_units: "Coupon Discount",
        channel_reference: "Channel Reference",
        sales_channel: "Sales Channel",
        subtotal_cents: "Subtotal",
        total_cents: "Total",
        product_tag_categories: "Product tag based categories",
        style: "Style",
        subtotal_cents_before_discount: "Original Price",
        shipping_profile_name: "Shipping Profile",
        fixed_amount_coupon_discount_currency: "Coupon Discount Currency",
        status: "Order Status",
        brand_id: "Brand #",
        buyer_handling_charge_amount: "Buyer Handling Charge",
        giveaway_credits: "Giveaway Credits",
        id: "ID",
        image: "Image",
        uuid: "UUID",
        seller_cancellation_reason_other_input:
          "Seller Cancellation Other Reason",
        category_id: "Category #",
        franchise_id: "Franchise #",
        cancellation_requested_status: "Cancellation Requested Status",
      }}
      rowMappers={{
        cancellation_requested_at: '{{ self ? moment.utc(self) : "" }}',
        cancellation_reason: "{{ _.startCase(self) || self}}",
        cancelled_at:
          "{{ queryRecord.data.status == 'cancelled' ? moment.utc(self) : \"\" }}",
        shipping_address: "{{ self.postal_code + ' - ' + self.state}}",
        shipping_price_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        taxes_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        credit_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        coupon_code:
          '{{ queryRecord.data.coupon_code != null ? queryRecord.data.coupon_code : "" }}',
        seller_shipping_price_sub_units:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format((self || 0) / 100) }}",
        created_at: "{{moment.utc(self)}}",
        user: "{{ self.email }}",
        fixed_amount_coupon_discount_sub_units:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(-(self / 100)) }}",
        subtotal_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        total_cents:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        subtotal_cents_before_discount:
          "{{ new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer_OrderDetailsPage.value.currency }).format(self / 100) }}",
        fixed_amount_coupon_discount_currency: "{{ self }}",
        giveaway_credits:
          "{{ self[0] ? new Intl.NumberFormat('en-US', { style: 'currency', currency: orderTransformer.value.currency }).format(self[0] / 100) : \"None\" }}",
        image:
          '<img alt="" src="{{getImageUrl(queryRecord.data.image.bucket, queryRecord.data.image.key)}}" />',
        cancellation_requested_status: '{{ self || "" }}',
      }}
      rowMappersRenderAsHTML={{ ordered: [{ image: true }] }}
      rows={[
        "a",
        "b",
        "c",
        "pluginType",
        "namespace",
        "queryRefreshTime",
        "paginationLimit",
        "body",
        "queryDisabledMessage",
        "successMessage",
        "queryDisabled",
        "playgroundQuerySaveId",
        "resourceNameOverride",
        "runWhenModelUpdates",
        "paginationPaginationField",
        "headers",
        "showFailureToaster",
        "paginationEnabled",
        "query",
        "playgroundQueryUuid",
        "playgroundQueryId",
        "runWhenPageLoadsDelay",
        "cookies",
        "showSuccessConfetti",
        "isImported",
        "showSuccessToaster",
        "cacheKeyTtl",
        "metadata",
        "errorTransformer",
        "confirmationMessage",
        "isFetching",
        "rawData",
        "queryTriggerDelay",
        "enableErrorTransformer",
        "paginationDataField",
        "timestamp",
        "enableTransformer",
        "runWhenPageLoads",
        "transformer",
        "queryTimeout",
        "requireConfirmation",
        "type",
        "queryFailureConditions",
        "enableCaching",
        "bodyType",
        "queryThrottleTime",
        "notificationDuration",
        "requestSentTimestamp",
        "finished",
        "queryRunTime",
        "data",
        "error",
        "box_number",
        "children",
        "classifier_values",
        "description",
        "descriptors",
        "exclusivity",
        "external_id",
        "hobby_db_id",
        "image",
        "id",
        "created_at",
        "uuid",
        "images",
        "is_chase",
        "is_multipack",
        "is_quick_add_product",
        "is_released",
        "item_number",
        "last_merchant_update",
        "license",
        "listing_price_auto_generated",
        "listing_price_cents",
        "listings_activated",
        "market_price_cents",
        "master_product_id",
        "merchant_id",
        "missing_product_profiles",
        "name",
        "category_id",
        "packing_depth",
        "packing_height",
        "packing_scale",
        "packing_width",
        "pricing_sources",
        "product_profile",
        "product_profile_type_id",
        "product_profiles",
        "release_date",
        "category_name",
        "brand_id",
        "sku",
        "slug",
        "tags",
        "thirty_day_sale_count",
        "total_page_views",
        "upc",
        "updated_at",
        "weight_amount",
        "weight_scale",
        "whitelist_approval",
        "rawXml",
        "parsedXml",
        "brand_name",
        "franchise_id",
        "franchise_name",
        "shipping_profile_id",
        "shipping_profile_name",
        "style",
        "status",
        "user",
        "items",
        "shipping_address",
        "subtotal_cents_before_discount",
        "subtotal_cents",
        "shipping_price_cents",
        "seller_shipping_price_sub_units",
        "buyer_handling_charge_amount",
        "seller_handling_charge_amount",
        "taxes_cents",
        "credit_cents",
        "fixed_amount_coupon_discount_sub_units",
        "coupon_code",
        "coupon_is_global",
        "total_cents",
        "seller_shipping_price_currency",
        "comments",
        "payment",
        "statusCode",
        "message",
        "channel_reference",
        "channel_name",
        "Product categories",
        "product_tag_categories",
        "product_tag",
        "sales_channel",
        "shipping_price_currency",
        "subtotal_currency",
        "taxes_currency",
        "total_currency",
        "cancellation_reason",
        "cancelled_at",
        "funcBody",
        "value",
        "renderedFunction",
        "seller_cancellation_reason",
        "seller_cancellation_reason_other_input",
        "seller_cancellation_buyer_facing_message",
        "cancellation_requested_status",
        "cancellation_requested_at",
        "currency",
        "currency_symbol",
        "gifting_preferences",
        "giveaway_preferences",
        "related_shipments",
        "total_paid_across_all_shipments_in_live",
        "buyer_shipments_in_livestream",
        "total_paid_across_all_buyer_shipments_in_live",
        "fixed_amount_coupon_discount_currency",
        "percentage_coupon_discount_currency",
        "percentage_coupon_discount_sub_units",
        "credit_currency",
        "handling_charges",
        "has_quality_listing",
        "processed_at",
        "giveaway_credits",
        "total_weight_all_buyer_shipments_in_livestream",
        "totalWeightAllBuyerShipmentsInLivestream",
      ]}
      rowVisibility={{
        seller_cancellation_reason: true,
        cancellation_requested_at: true,
        classifier_values: true,
        cancellation_reason: true,
        queryRefreshTime: true,
        items: false,
        listings_activated: true,
        license: true,
        paginationLimit: true,
        a: true,
        cancelled_at: true,
        b: true,
        body: true,
        shipping_profile_id: true,
        queryDisabledMessage: true,
        brand_name: "{{queryRecord.data.brand_id}}",
        c: true,
        weight_scale: true,
        shipping_address: false,
        shipping_price_cents: true,
        successMessage: true,
        processed_at: true,
        descriptors: true,
        queryDisabled: true,
        taxes_cents: true,
        playgroundQuerySaveId: true,
        resourceNameOverride: true,
        handling_charges: false,
        credit_cents: true,
        related_shipments: true,
        release_date: true,
        currency_symbol: false,
        payment: false,
        parsedXml: true,
        coupon_code: true,
        runWhenModelUpdates: true,
        paginationPaginationField: true,
        funcBody: true,
        percentage_coupon_discount_sub_units: true,
        headers: true,
        message: true,
        channel_name: true,
        showFailureToaster: true,
        exclusivity: true,
        paginationEnabled: true,
        master_product_id: true,
        query: true,
        playgroundQueryUuid: true,
        upc: true,
        playgroundQueryId: true,
        error: true,
        seller_shipping_price_sub_units: true,
        seller_handling_charge_amount: true,
        is_quick_add_product: true,
        product_tag: true,
        runWhenPageLoadsDelay: true,
        created_at: true,
        total_weight_all_buyer_shipments_in_livestream: true,
        seller_cancellation_buyer_facing_message: true,
        data: true,
        name: true,
        slug: true,
        gifting_preferences: true,
        user: false,
        subtotal_currency: false,
        category_name: true,
        total_currency: false,
        pluginType: true,
        franchise_name: "{{queryRecord.data.franchise_id}}",
        "Product categories": true,
        packing_depth: true,
        renderedFunction: true,
        total_paid_across_all_buyer_shipments_in_live: false,
        showSuccessConfetti: true,
        isImported: true,
        showSuccessToaster: true,
        cacheKeyTtl: true,
        requestSentTimestamp: true,
        external_id: true,
        fixed_amount_coupon_discount_sub_units: true,
        cookies: true,
        rawXml: true,
        channel_reference: true,
        metadata: true,
        hobby_db_id: true,
        sales_channel: true,
        subtotal_cents: true,
        packing_width: true,
        queryRunTime: true,
        total_cents: true,
        listing_price_auto_generated: true,
        currency: true,
        product_tag_categories: true,
        value: true,
        style: true,
        errorTransformer: true,
        finished: true,
        subtotal_cents_before_discount: true,
        is_released: true,
        market_price_cents: true,
        confirmationMessage: true,
        isFetching: true,
        shipping_profile_name: true,
        fixed_amount_coupon_discount_currency: false,
        merchant_id: true,
        rawData: true,
        status: true,
        brand_id: "{{queryRecord.data.brand_id}}",
        missing_product_profiles: true,
        queryTriggerDelay: true,
        buyer_shipments_in_livestream: false,
        packing_scale: true,
        enableErrorTransformer: true,
        comments: false,
        item_number: true,
        buyer_handling_charge_amount: true,
        paginationDataField: true,
        timestamp: true,
        enableTransformer: true,
        updated_at: true,
        credit_currency: false,
        last_merchant_update: true,
        thirty_day_sale_count: true,
        taxes_currency: false,
        seller_shipping_price_currency: false,
        giveaway_preferences: true,
        shipping_price_currency: false,
        images: true,
        tags: true,
        runWhenPageLoads: true,
        total_page_views: true,
        is_chase: true,
        transformer: true,
        product_profile: true,
        queryTimeout: true,
        listing_price_cents: true,
        product_profile_type_id: true,
        product_profiles: true,
        giveaway_credits: true,
        requireConfirmation: true,
        total_paid_across_all_shipments_in_live: true,
        type: true,
        queryFailureConditions: true,
        id: true,
        image: true,
        namespace: true,
        whitelist_approval: true,
        percentage_coupon_discount_currency: true,
        uuid: true,
        totalWeightAllBuyerShipmentsInLivestream: true,
        seller_cancellation_reason_other_input: true,
        enableCaching: true,
        description: true,
        bodyType: true,
        category_id: true,
        box_number: true,
        franchise_id: "{{queryRecord.data.franchise_id}}",
        sku: true,
        is_multipack: true,
        packing_height: true,
        pricing_sources: true,
        statusCode: true,
        cancellation_requested_status: true,
        queryThrottleTime: true,
        children: true,
        coupon_is_global: true,
        notificationDuration: true,
        has_quality_listing: true,
        weight_amount: true,
      }}
    />
    <Include src="./containerBuyerGeneral.rsx" />
    <Include src="./container1.rsx" />
    <Text
      id="ZendeskTicketLink"
      value="**Zendesk Tickets for Order #{{ urlparams.id }}:** [Link to Zendesk Search](https://whatnot.zendesk.com/agent/search/1?copy&type=ticket&q=custom_field_1900004973967%3A{{ urlparams.id }})"
      verticalAlign="center"
    />
    <Button
      id="btnCopyDetails"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      text="Copy details"
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "Order date: {{new Date(orderTransformer_OrderDetailsPage.value.created_at).toUTCString()}}\nOrder number: {{orderTransformer_OrderDetailsPage.value.id}}\nShipment id: {{queryShipment.data.id}}\nTracking: {{queryShipment.data.tracking_code}}\nBuyer Username: {{orderTransformer_OrderDetailsPage.value.user.username}}\n{{orderTransformer_OrderDetailsPage.value.sales_channel === 'livestream' ? `Livestream: ${queryLivestream.data.title}` : \"\"}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="cancelOfferButton"
      _disclosedFields={{ array: [] }}
      hidden={
        '{{queryRecord.data.status !== "ask_pending" && queryRecord.data.items[0].status !== "negotiating"}}'
      }
      marginType="normal"
      showInEditor={true}
      text="Cancel Offer"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryCancelOffer"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
