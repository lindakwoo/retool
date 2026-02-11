<Screen
  id="invoice"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="7d11c91b-0230-41c1-bf0b-75e8ee397308"
>
  <RESTQuery
    id="querySellerInvoice"
    _additionalScope={["shouldShowPii"]}
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={
      '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"},{"key":"","value":""}]'
    }
    isMultiplayerEdited={false}
    query="invoices/order/{{urlparams.id}}/seller_payout"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    transformer={
      'const order = [\n  "PAYMENT_PROCESSING_FEE",\n"EFFECTIVE_COMMISSION_FEE",\n"COMMISSION_FEE",\n"WN_DEFAULT_COMMISSION_FEE",\n"REDUCED_USER_COMMISSION_FEE",\n"REDUCED_PROMOTION_COMMISSION_FEE",\n"HIGH_VALUE_LTE_THRESHOLD_COMMISSION_FEE",\n"HIGH_VALUE_GT_THRESHOLD_COMMISSION_FEE",\n"TS_ACTION_INCREASED_COMMISSION_FEE",\n"PREMIER_SHOP_DISCOUNT_ON_COMMISSION_FEE",\n"SELLER_PAID_SHIPPING_FEE",\n"SUBTOTAL",\n"TAXES",\n"VAT"\n];\n\nfunction sort_items(a, b) {\n  const result = order.indexOf(a.line_item_type) - order.indexOf(b.line_item_type);\n  if (result !== 0) return result;\n\n  const a_parent = a.parent_line_item_id === null ? 0 : 1;\n  const b_parent = b.parent_line_item_id === null ? 0 : 1;\n  \n  return a_parent - b_parent\n}\n\ndata.line_items.sort(sort_items);\n\nif (data.currency === null) {\n  data.currency = data.line_items.length >= 1 ? data.line_items[0].currency : \'USD\';\n}\n\nreturn data'
    }
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="querySellerEarningInvoice"
    _additionalScope={["shouldShowPii"]}
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={
      '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"}]'
    }
    query="invoices/order/{{urlparams.id}}/seller_earning"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    transformer={
      'const order = [\n  "ORIGINAL_ITEM_PRICE",\n  "SELLER_FIXED_AMOUNT_COUPON",\n  "SELLER_PERCENTAGE_COUPON",\n  "SELLER_FREE_SHIPPING_COUPON",\n  "SUBTOTAL"\n];\n\nfunction sort_items(a, b) {\n  const result = order.indexOf(a.line_item_type) - order.indexOf(b.line_item_type);\n  if (result !== 0) return result;\n\n  const a_parent = a.parent_line_item_id === null ? 0 : 1;\n  const b_parent = b.parent_line_item_id === null ? 0 : 1;\n  \n  return a_parent - b_parent\n}\n\ndata.line_items.sort(sort_items);\n\nif (data.currency === null) {\n  data.currency = data.line_items.length >= 1 ? data.line_items[0].currency : \'USD\';\n}\n\nreturn data'
    }
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryBuyerInvoice"
    _additionalScope={["shouldShowPii"]}
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={
      '[{"key":"x-whatnot-pii","value":"{{shouldShowPii === true ? \\"show\\" : \\"hide\\"}}"}]'
    }
    isMultiplayerEdited={false}
    query="invoices/order/{{urlparams.id}}/order"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    transformer={
      'const order = [\n  "ITEM_PRICE",\n  "SELLER_FIXED_AMOUNT_COUPON",\n  "SELLER_PERCENTAGE_COUPON",\n  "SELLER_FREE_SHIPPING_COUPON",\n  "SUBTOTAL",\n  "GLOBAL_FIXED_AMOUNT_COUPON",\n  "GLOBAL_PERCENTAGE_COUPON",\n  "GLOBAL_FREE_SHIPPING_COUPON",\n  "REWARD_CREDITS",\n  "SHIPPING_FEE",\n  "SHIPPING_CREDIT",\n  "HANDLING_CHARGE",\n  "AUTHENTICATION_FEE",\n  "CUSTOMS_FEE",\n  "TAXES"\n];\n\nfunction sort_items(a, b) {\n    return order.indexOf(a.line_item_type) - order.indexOf(b.line_item_type);\n}\n\ndata.line_items.sort(sort_items);\n\n\nif (data.currency === null) {\n  data.currency = data.line_items.length >= 1 ? data.line_items[0].currency : \'USD\';\n}\n\nreturn data'
    }
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <Frame
    id="$main9"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="invoiceContainer"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="title"
          marginType="normal"
          value="### Invoice"
          verticalAlign="center"
        />
      </Header>
      <View id="8cc33" viewKey="View 1">
        <Include src="./container12.rsx" />
        <Include src="./SellerInvoice.rsx" />
        <Include src="./SellerInvoice2.rsx" />
      </View>
    </Container>
  </Frame>
</Screen>
