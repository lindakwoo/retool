<Screen
  id="shipment_data"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="23b45221-29ad-43b6-9513-dc03ca57f9ba"
>
  <Folder id="tools">
    <RESTQuery
      id="createWithShippoRateCRTSL"
      body={
        '[{"key":"rate_id","value":"{{ratesFromQueryCRTSL.value[rates_crtsl.value].id}}"},{"key":"courier","value":"{{ratesFromQueryCRTSL.value[rates_crtsl.value].courier}}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crtsl.value}}"},{"key":"label_file_type","value":"{{ label_format_crtsl.value }}"},{"key":"shipping_rate_source","value":"{{ratesFromQueryCRTSL.value[rates_crtsl.value].source || \\"shippo_public\\"}}"},{"key":"seller_id","value":"{{queryRecord.data.items[0].shipment.seller_id}}"},{"key":"address_from","value":"{city: {{city_seller_crtsl.value}}, company: {{company_seller_crtsl.value}}, country: {{country_seller_crtsl.value}}, email: {{email_seller_crtsl.value}}, name: {{full_name_seller_crtsl.value}}, phone: {{phone_seller_crtsl.value}}, state: {{state_seller_crtsl.value}}, street1: {{street_one_seller_crtsl.value}}, street2: {{street_two_seller_crtsl.value}}, zip: {{zip_seller_crtsl.value}} }"},{"key":"address_to","value":"{city: {{city_crtsl.value}}, company: {{company_crtsl.value}}, country: {{country_crtsl.value}}, email: {{email_crtsl.value}}, name: {{full_name_crtsl.value}}, phone: {{phone_crtsl.value}}, state: {{state_crtsl.value}}, street1: {{street_one_crtsl.value}}, street2: {{street_two_crtsl.value}}, zip: {{zip_crtsl.value}} }"},{"key":"parcel_info","value":"{length: {{Math.round(length_crtsl.value * 100 ) / 100}}, width: {{Math.round(width_crtsl.value * 100) / 100}}, height: {{Math.round(height_crtsl.value * 100) / 100}}, weight: {{weight_crtsl.value}}, weight_scale: {{weight_scale_crtsl.value}}, dimension_scale: {{dimension_scale_crtsl.value}}, product_categories: [{{package_contents_crtsl.value}}]}"},{"key":"shipping_service_id","value":"{{ ratesFromQueryCRTSL.value[rates_crtsl.value].shipping_service_id }}"},{"key":"carrier_account","value":"{{ratesFromQueryCRTSL.value[rates_crtsl.value].carrier_account || null}}"},{"key":"shipment_id","value":"{{queryRecord.data.items[0].shipment.id}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/shipping-label"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [{ value: "{{ createWithShippoRateCRTSL.data }}" }],
        }}
        pluginId="createWithShippoRateStateCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="createWithShippoRateCRTSL2"
      body={
        '[{"key":"rate_id","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].id}}"},{"key":"courier","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].courier}}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crtsl2.value.value}}"},{"key":"label_file_type","value":"{{ label_format_crtsl2.value }}"},{"key":"shipping_rate_source","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].source || \\"shippo_public\\"}}"},{"key":"seller_id","value":"{{queryRecord.data.items[0].shipment.seller_id}}"},{"key":"address_from","value":"{city: {{city_crtsl2.value}}, company: {{company_crtsl2.value}}, country: {{country_crtsl2.value}}, email: {{email_crtsl2.value}}, name: {{full_name_crtsl2.value}}, phone: {{phone_crtsl2.value}}, state: {{state_crtsl2.value}}, street1: {{street_one_crtsl2.value}}, street2: {{street_two_crtsl2.value}}, zip: {{zip_crtsl2.value}} }"},{"key":"address_to","value":"{city: {{city_seller_crtsl2.value}}, company: {{company_seller_crtsl2.value}}, country: {{country_seller_crtsl2.value}}, email: {{email_seller_crtsl2.value}}, name: {{full_name_seller_crtsl2.value}}, phone: {{phone_seller_crtsl2.value}}, state: {{state_seller_crtsl2.value}}, street1: {{street_one_seller_crtsl2.value}}, street2: {{street_two_seller_crtsl2.value}}, zip: {{zip_seller_crtsl2.value}} }"},{"key":"parcel_info","value":"{length: {{Math.round(length_crtsl2.value * 100 ) / 100}}, width: {{Math.round(width_crtsl2.value * 100) / 100}}, height: {{Math.round(height_crtsl2.value * 100) / 100}}, weight: {{weight_crtsl2.value}}, weight_scale: {{weight_scale_crtsl2.value}}, dimension_scale: {{dimension_scale_crtsl2.value}}, product_categories: [{{package_contents_crtsl2.value}}]}"},{"key":"shipping_service_id","value":"{{ ratesFromQueryCRTSL2.value[rates_crtsl2.value].shipping_service_id }}"},{"key":"carrier_account","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].carrier_account || null}}"},{"key":"shipment_id","value":"{{queryRecord.data.items[0].shipment.id}}"},{"key":"shippo_merchant_id","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].merchant_id}}"},{"key":"merchant_id","value":"{{ratesFromQueryCRTSL2.value[rates_crtsl2.value].merchant_id}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="shipments/shipping-label"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{ map: { value: "{{ createWithShippoRateCRTSL2.data }}" } }}
        pluginId="createWithShippoRateStateCRTSL2"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="createWithShippoRateStateCRTSL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="createWithShippoRateStateCRTSL2"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <SqlQueryUnified
      id="customs_weight_calc"
      enableTransformer={true}
      notificationDuration={4.5}
      query={include("../lib/customs_weight_calc.sql", "string")}
      resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="
let converted_weight = 0;
let length = {{ customs_weight_calc.rawData.weight_scale.length }}
for (let i = 0; i < length; ++i) {
  let tmp = 0
  let amount = parseFloat({{  customs_weight_calc.rawData.weight_amount[i]}})
  let scale = {{  customs_weight_calc.rawData.weight_scale[i]}}
  console.log(amount ,scale)
  if (scale == 'POUND') {
    tmp = amount * 16;
  }
  else if (scale == 'OUNCE') {
    tmp = amount;
  }
  else if (scale == 'GRAM') {
    tmp = amount * 0.035274;
  } else if (scale == 'KILOGRAM') {
    tmp = amount * 35.2739999996032;
  }
  console.log(tmp)
  converted_weight += (tmp < 1)? 1 : tmp;
}

return Math.ceil(converted_weight)"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <RESTQuery
      id="getRatesCRL"
      body={
        '[{"key":"insurance_info","value":"{insurance_value: {{insured_value_crl.value}}, currency: \\"USD\\", content: {{package_contents_crl.value}} }"},{"key":"parcel_info","value":"{length: {{Math.round(length_crl.value * 100 ) / 100}}, width: {{Math.round(width_crl.value * 100) / 100}}, height: {{Math.round(height_crl.value * 100) / 100}}, weight: {{weight_crl.value}}, weight_scale: {{weight_scale_crl.value}}, dimension_scale: {{dimension_scale_crl.value}}, product_categories: [{{package_contents_crl.value}}]}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crl.value}}"},{"key":"address_to","value":"{city: {{address_to_city_crl.value}}, company: {{address_to_company_crl.value}}, country: {{address_to_country_crl.value}}, email: {{address_to_email_crl.value}}, name: {{address_to_full_name_crl.value}}, phone: {{address_to_phone_crl.value}}, state: {{address_to_state_crl.value}}, street1: {{address_to_street_one_crl.value}}, street2: {{address_to_street_two_crl.value}}, zip: {{address_to_zip_crl.value}} }"},{"key":"address_from","value":"{city: {{address_from_city_crl.value}}, company: {{address_from_company_crl.value}}, country: {{address_from_country_crl.value}}, email: {{address_from_email_crl.value}}, name: {{address_from_full_name_crl.value}}, phone: {{address_from_phone_crl.value}}, state: {{address_from_state_crl.value}}, street1: {{address_from_street_one_crl.value}}, street2: {{address_from_street_two_crl.value}}, zip: {{address_from_zip_crl.value}} }"},{"key":"refund_reason","value":"{{refund_reason_crl.value}}"},{"key":"order_item_ids","value":"{{tableCreateReturnLabel.selectedRow.data.map(item => item.order_item_id)}}"}]'
      }
      bodyType="json"
      cookies="[]"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/shipping-rates"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer={
        'const returnAddress = String({{ radioGroupReturnAddress.value }} || "").trim();\n\nconst blockedCouriers = ["mondial_relay", "deutsche_post"];\nconst eziWarehouses = ["fr_ezi", "fr_ezi_warehouse", "de_ezi", "de_ezi_warehouse"];\n\n// Clone to avoid mutating Retool\'s internal data\nconst result = _.cloneDeep(data);\n\n// Safety guard\nif (!result || !Array.isArray(result.shipping_rates)) {\n  return result || {};\n}\n\n// Filter only if return address is an Ezi warehouse\nif (eziWarehouses.includes(returnAddress)) {\n  result.shipping_rates = result.shipping_rates.filter((rate) => {\n    return !blockedCouriers.includes(rate.courier);\n  });\n}\nreturn result;'
      }
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value:
              '{{ getRatesCRL.data.shipping_rates.sort((a, b) => Number(a.price.replace(/[^0-9.-]+/g,"")) - Number(b.price.replace(/[^0-9.-]+/g,""))) }}',
          },
        }}
        pluginId="ratesFromQueryCRL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="getRatesCRLResult"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ map: { value: "{{getRatesCRL.data.data.msg}}" } }}
        pluginId="getRatesCRLErrorMsg"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="getRatesCRLResult"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="getShippingRatesLogsURL_ShipmentDataPage"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={
        '{{"https://app.datadoghq.com/logs?query=%40http.url_details.path%3A%22%2Fadmin%2Fapi%2Fshipments%2F" + queryShipment.data.id + "%2Fshipping-rates%22%20&agg_m=count&agg_m_source=base&agg_t=count&cols=host%2Cservice&fromUser=true&messageDisplay=inline&refresh_mode=sliding&storage=hot&stream_sort=desc&viz=stream&from_ts=1652379062995&to_ts=1652379962995&live=true"}}'
      }
    />
    <State
      id="generateLabelLogsURL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value=""
    />
    <RESTQuery
      id="getShippingLabelInfo"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/get-shipping-label-info"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [{ value: "{{getShippingLabelInfo.data.parcel}}" }],
        }}
        pluginId="originalParcel"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="getRates"
      body={
        '[{"key":"insurance_info","value":"{insurance_value: {{insured_value.value}}, currency: \\"USD\\", content: {{package_contents.value}} }"},{"key":"parcel_info","value":"{length: {{Math.round(length.value * 100 ) / 100}}, width: {{Math.round(width.value * 100) / 100}}, height: {{Math.round(height.value * 100) / 100}}, weight: {{weight.value}}, weight_scale: {{weight_scale.value}}, dimension_scale: {{dimension_scale.value}}, product_categories: [{{package_contents.value}}]}"},{"key":"signature_confirmation","value":"{{signature_confirmation.value}}"},{"key":"address_to","value":"{city: {{city.value}}, company: {{company.value}}, country: {{country.value}}, email: {{email.value}}, name: {{full_name.value}}, phone: {{phone.value}}, state: {{state.value}}, street1: {{street_one.value}}, street2: {{street_two.value}}, zip: {{zip.value}} }"},{"key":"address_from","value":"{city: {{city_seller.value}}, company: {{company_seller.value}}, country: {{country_seller.value}}, email: {{email_seller.value}}, name: {{full_name_seller.value}}, phone: {{phone_seller.value}}, state: {{state_seller.value}}, street1: {{street_one_seller.value}}, street2: {{street_two_seller.value}}, zip: {{zip_seller.value}} }"},{"key":"courier_parcel_template_id","value":"{{shipFlatRateToggle.value ? selectFlatRateBoxType.value : \\"\\"}}"},{"key":"override_hazmat","value":"{{hazmat_override.value}}"},{"key":"aes_itn","value":"{{ aes_itn.value }}"}]'
      }
      bodyType="json"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration="5"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/shipping-rates"
      queryFailureConditions={
        '[{"condition":"{{ getRates.metadata.status > 400 }}","message":"{{ getRates.data }}"}]'
      }
      queryTimeout="30000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                '{{ getRates.data.shipping_rates.sort((a, b) => Number(a.price.replace(/[^0-9.-]+/g,"")) - Number(b.price.replace(/[^0-9.-]+/g,""))) }}',
            },
          ],
        }}
        pluginId="ratesFromQuery"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "true" }] }}
        pluginId="getRatesResult"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ ordered: [{ value: "{{getRates.data}}" }] }}
        pluginId="getRatesErrorMsg"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ ordered: [{ value: "true" }] }}
        pluginId="getRatesResult"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="getRatesCRTSL"
      body={
        '[{"key":"insurance_info","value":"{insurance_value: {{insured_value_crtsl.value}}, currency: \\"USD\\", content: {{package_contents_crtsl.value}} }"},{"key":"parcel_info","value":"{length: {{Math.floor(length_crtsl.value * 100) / 100}}, width: {{Math.floor(width_crtsl.value * 100) / 100 }}, height: {{Math.floor(height_crtsl.value * 100) / 100}}, weight: {{weight_crtsl.value}}, weight_scale: {{weight_scale_crtsl.value}}, dimension_scale: {{dimension_scale_crtsl.value}}, product_categories: [{{package_contents_crtsl.value}}]}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crl.value}}"},{"key":"address_to","value":"{city: {{city_crtsl.value}}, company: {{company_crtsl.value}}, country: {{country_crtsl.value}}, email: {{email_crtsl.value}}, name: {{full_name_crtsl.value}}, phone: {{phone_crtsl.value}}, state: {{state_crtsl.value}}, street1: {{street_one_crtsl.value}}, street2: {{street_two_crtsl.value}}, zip: {{zip_crtsl.value}} } "},{"key":"address_from","value":"{city: {{city_seller_crtsl.value}}, company: {{company_seller_crtsl.value}}, country: {{country_seller_crtsl.value}}, email: {{email_seller_crtsl.value}}, name: {{full_name_seller_crtsl.value}}, phone: {{phone_seller_crtsl.value}}, state: {{state_seller_crtsl.value}}, street1: {{street_one_seller_crtsl.value}}, street2: {{street_two_seller_crtsl.value}}, zip: {{zip_seller_crtsl.value}} }"},{"key":"override_hazmat","value":"{{ hazmat_override_crtsl.value }}"}]'
      }
      bodyType="json"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/shipping-rates"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value:
              '{{ getRatesCRTSL.data.shipping_rates.sort((a, b) => Number(a.price.replace(/[^0-9.-]+/g,"")) - Number(b.price.replace(/[^0-9.-]+/g,""))) }}',
          },
        }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ map: { value: "false" } }}
        pluginId="ratesFromQueryCRTSL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="getRatesCRTSL2"
      body={
        '[{"key":"insurance_info","value":"{insurance_value: {{insured_value_crtsl2.value}}, currency: \\"USD\\", content: {{package_contents_crtsl2.value}} }"},{"key":"parcel_info","value":"{length: {{Math.floor(length_crtsl2.value)}}, width: {{Math.floor(width_crtsl2.value)}}, height: {{Math.floor(height_crtsl2.value)}}, weight: {{weight_crtsl2.value}}, weight_scale: {{weight_scale_crtsl2.value}}, dimension_scale: {{dimension_scale_crtsl2.value}}, product_categories: [{{package_contents_crtsl2.value}}]}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crtsl2.value}}"},{"key":"address_to","value":"{city: {{city_seller_crtsl2.value}}, company: {{company_seller_crtsl2.value}}, country: {{country_seller_crtsl2.value}}, email: {{email_seller_crtsl2.value}}, name: {{full_name_seller_crtsl2.value}}, phone: {{phone_seller_crtsl2.value}}, state: {{state_seller_crtsl2.value}}, street1: {{street_one_seller_crtsl2.value}}, street2: {{street_two_seller_crtsl2.value}}, zip: {{zip_seller_crtsl2.value}} }"},{"key":"address_from","value":"{city: {{city_crtsl2.value}}, company: {{company_crtsl2.value}}, country: {{country_crtsl2.value}}, email: {{email_crtsl2.value}}, name: {{full_name_crtsl2.value}}, phone: {{phone_crtsl2.value}}, state: {{state_crtsl2.value}}, street1: {{street_one_crtsl2.value}}, street2: {{street_two_crtsl2.value}}, zip: {{zip_crtsl2.value}} } "},{"key":"override_hazmat","value":"{{ hazmat_override_crtsl2.value }}"}]'
      }
      bodyType="json"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/shipping-rates"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="setValue"
        params={{
          map: {
            value:
              '{{ getRatesCRTSL2.data.shipping_rates.sort((a, b) => Number(a.price.replace(/[^0-9.-]+/g,"")) - Number(b.price.replace(/[^0-9.-]+/g,""))) }}',
          },
        }}
        pluginId="ratesFromQueryCRTSL2"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ map: { value: "false" } }}
        pluginId="ratesFromQueryCRTSL2"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="getRatesResult"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="false"
    />
    <State
      id="getRatesErrorMsg"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <Function
      id="getParcelDimensions"
      funcBody={include("../lib/getParcelDimensions.js", "string")}
      runBehavior="debounced"
    />
    <GoogleSheetsQuery
      id="get_note_for_order"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      runWhenModelUpdates={false}
      sheetTitle="order_shipment_notes"
      showSuccessToaster={false}
      spreadsheetId="1iWEmpRXxYwm3S844PwpethmBBvGGvpRbnXYaClmvFF8"
      transformer={
        'const findRowByOrderId = (array, orderId) => new Map(array.map(i => [i.order_id, i])).get(orderId) || {order_id: ""};\nreturn findRowByOrderId(data, {{orderTransformer_ShipmentDataPage.value.id}})'
      }
      useRawSpreadsheetId={true}
      useSheetRange={true}
      valueFormatting="unformatted"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        enabled="{{get_note_for_order.data.tracking_info}}"
        event="success"
        method="setValue"
        params={{ map: { value: "{{get_note_for_order.data.tracking_info}}" } }}
        pluginId="save_note_tracking_info"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{get_note_for_order.data.zd_ticket}}"
        event="success"
        method="setValue"
        params={{ map: { value: "{{get_note_for_order.data.zd_ticket}}" } }}
        pluginId="save_note_zd"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{get_note_for_order.data.insured}}"
        event="success"
        method="setValue"
        params={{ map: { value: "{{get_note_for_order.data.insured}}" } }}
        pluginId="save_note_insured"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{get_note_for_order.data.notes}}"
        event="success"
        method="setValue"
        params={{ map: { value: "{{get_note_for_order.data.notes}}" } }}
        pluginId="save_note_additional"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </GoogleSheetsQuery>
    <GoogleSheetsQuery
      id="insert_note_for_order"
      actionType="append"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      filterBy={
        '[{"key":"order_id","value":"{{orderTransformer.value.id}}","operation":"="}]'
      }
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      runWhenModelUpdates={false}
      sheetTitle="order_shipment_notes_final"
      sheetUpdate={
        '{"order_id": {{orderTransformer_ShipmentDataPage.value.id}}, "tracking_info": {{save_note_tracking_info.value}}, "insured": {{save_note_insured.value}} , "zd_ticket": {{save_note_zd.value}}, "notes": {{save_note_additional.value}}, }'
      }
      spreadsheetId="1iWEmpRXxYwm3S844PwpethmBBvGGvpRbnXYaClmvFF8"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      useRawSpreadsheetId={true}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{}}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{}}
        pluginId="save_note_modal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "success",
              title: "Success",
              description: "New note added!",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </GoogleSheetsQuery>
    <JavascriptQuery
      id="js_return_label_create_check"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("../lib/js_return_label_create_check.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State
      id="labelGenerationErrors"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="originalParcel"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value=""
    />
    <Function
      id="phoneFormat"
      funcBody={include("../lib/phoneFormat.js", "string")}
      runBehavior="debounced"
    />
    <RESTQuery
      id="queryCRLShipment"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="shipments/{{orderShipmentId.value}}"
      queryTimeout="20000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      showSuccessToaster={false}
      transformer={
        'const items = data.items;\nconst urlAdminOrder = {{urlparams.href}};\nconst currentOrderId = {{ queryRecord.data.id }};\n\nvar ret = [];\nfor (let i = 0; i < items.length; i++) {\n  // Add two custom keys to be used by users to edit the table and to keep them in sync\n  ret.push({\n    "order_id": items[i].order_id,\n    "order_item_id": items[i].id,\n    "name" : items[i].name,\n    "item_weight": items[i].item_weight_amount,\n    "item_weight_scale": items[i].item_weight_scale,\n    "amount_charged_cents": items[i].amount_charged_cents,\n    "taxes_cents": items[i].taxes_cents,\n    "shipping_price_cents": items[i].shipping_price_cents,\n    "admin_order_link": urlAdminOrder.replace("id=" + currentOrderId, "id=" + items[i].order_id),\n    "created_at": items[i].created_at,\n  })\n}\nreturn ret;'
      }
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="selectRow"
        params={{
          ordered: [
            {
              rowIndex:
                "{{ tableCreateReturnLabel.data.findIndex(row => row.order_id === queryRecord.data.id) }}",
            },
            { scrollToRow: true },
          ],
        }}
        pluginId="tableCreateReturnLabel"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="queryMarkShipmentAsDelivered"
      body="[]"
      bodyType="json"
      confirmationMessage="Are you sure you want to mark the order as delivered?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{orderShipmentId.value}}/mark-delivered"
      requireConfirmation={true}
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={["queryRecord"]}
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="queryMarkShipmentAsShipped"
      body="[]"
      bodyType="json"
      confirmationMessage="Are you sure you want to mark the order as shipped?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="/shipments/{{orderShipmentId.value}}/mark-shipped"
      requireConfirmation={true}
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={["queryRecord"]}
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="queryShippingCouriers"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration="7"
      query="/shipments/get-shipping-couriers"
      queryFailureConditions={
        '[{"condition":"{{!!varQuerySubmitActionShipItError.value}}","message":""}]'
      }
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      successMessage="Retr"
      transformer={
        "// type your code here\n// example: return formatDataAsArray(data).filter(row => row.quantity > 20)\nlet couriers = data[\"couriers\"]\nreturn couriers.filter(courier => courier.value !== 'shippo')"
      }
      triggersOnFailure={[]}
      triggersOnSuccess={[]}
      updateSetValueDynamically={true}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="querySubmitVoidAndReassignTrackingCode"
      body={
        '[{"key":"tracking_code","value":"{{modalVoidAndReassignTrackingCodeInput.value}}"},{"key":"courier","value":"{{modalVoidAndReassignCourierInput.value}}"},{"key":"shippo_account_type","value":"{{modalVoidAndReassignShippoAcctInput.value}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration="7"
      query="/shipments/{{selectedShipmentToBeOverridden.value}}/void-and-create-new-by-tracking-code"
      queryFailureConditions={'[{"condition":"","message":""}]'}
      requireConfirmation={true}
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      successMessage="The existing shipment has been cancelled and a new one, based on the passed tracking number, has been created"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={[]}
      type="POST"
      updateSetValueDynamically={true}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="modalVoidAndReassignTrackingCode"
        pluginInstance="0"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{querySubmitVoidAndReassignTrackingCode.data.data.detail || querySubmitVoidAndReassignTrackingCode.data.data.msg}}",
            },
          ],
        }}
        pluginId="voidAndReassignErrorMsg"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="querySubmitVoidAndReassignTrackingCodeBYOL"
      body={
        '[{"key":"sellers_tracking_code","value":"{{modalVoidAndReassignTrackingCodeInputBYOL.value}}"},{"key":"courier","value":"{{modalVoidAndReassignCourierInputBYOL.value}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration="7"
      query="/shipment/{{selectedShipmentToBeOverridden.value}}/override-shipment-with-sellers-tracking-code"
      queryFailureConditions={'[{"condition":"","message":""}]'}
      requireConfirmation={true}
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessConfetti={true}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      successMessage="The existing shipment has been cancelled and a new one, based on the passed tracking number, has been created"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      triggersOnFailure={[]}
      triggersOnSuccess={[]}
      type="POST"
      updateSetValueDynamically={true}
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="modalVoidAndReassignTrackingCodeBYOL"
        pluginInstance=""
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{querySubmitVoidAndReassignTrackingCodeBYOL.data.detail || querySubmitVoidAndReassignTrackingCodeBYOL.data.msg}}",
            },
          ],
        }}
        pluginId="voidAndReassignErrorMsgBYOL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="ratesFromQuery"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="ratesFromQueryCRTSL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="ratesFromQueryCRTSL2"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <JavascriptQuery
      id="return_label_recipient_select_change_js"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include(
        "../lib/return_label_recipient_select_change_js.js",
        "string"
      )}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State
      id="selectedShipmentToBeOverridden"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <GoogleSheetsQuery
      id="update_note_for_order"
      actionType="update"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      filterBy={
        '[{"key":"order_id","value":"{{orderTransformer_ShipmentDataPage.value.id}}","operation":"="}]'
      }
      resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
      runWhenModelUpdates={false}
      sheetUpdate={
        '{"tracking_info": {{save_note_tracking_info.value}}, "insured": {{save_note_insured.value}} , "zd_ticket": {{save_note_zd.value}}, "notes": {{save_note_additional.value}}, }'
      }
      spreadsheetId="1iWEmpRXxYwm3S844PwpethmBBvGGvpRbnXYaClmvFF8"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      useRawSpreadsheetId={true}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{}}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "success",
              title: "Sucess",
              description: "Note Updated!",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{}}
        pluginId="save_note_modal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </GoogleSheetsQuery>
    <State
      id="variable38"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <RESTQuery
      id="voidAndCreateWithDirectCourierRate"
      body={
        '[{"key":"address_from","value":"{city: {{city_seller.value}}, company: {{company_seller.value}}, country: {{country_seller.value}}, email: {{email_seller.value}}, name: {{full_name_seller.value}}, phone: {{phone_seller.value}}, state: {{state_seller.value}}, street1: {{street_one_seller.value}}, street2: {{street_two_seller.value}}, zip: {{zip_seller.value}} }"},{"key":"address_to","value":"{city: {{city.value}}, company: {{company.value}}, country: {{country.value}}, email: {{email.value}}, name: {{full_name.value}}, phone: {{phone.value}}, state: {{state.value}}, street1: {{street_one.value}}, street2: {{street_two.value}}, zip: {{zip.value}} }"},{"key":"parcel_info","value":"{length: {{Math.round(length.value * 100 ) / 100}}, width: {{Math.round(width.value * 100) / 100}}, height: {{Math.round(height.value * 100) / 100}}, weight: {{weight.value}}, weight_scale: {{weight_scale.value}}, dimension_scale: {{dimension_scale.value}}, product_categories: [{{package_contents.value}}]}"},{"key":"courier","value":"{{ ratesFromQuery.value[rates.value].courier }}"},{"key":"shipping_service_name","value":"{{ ratesFromQuery.value[rates.value].product }}"},{"key":"selected_rate_card_name","value":"{{  ratesFromQuery.value[rates.value].rate_card_name }}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration="5"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/direct-integration-shipping-label"
      queryFailureConditions={
        '[{"condition":"{{ voidAndCreateWithDirectCourierRate.data.metadata.status >= 300 }}","message":"{{ voidAndCreateWithDirectCourierRate.data }}"},{"condition":"","message":""}]'
      }
      queryTimeout="30000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="generateNewLabel"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                '{{"https://app.datadoghq.com/logs?query=%40http.url_details.path%3A%22%2Fadmin%2Fapi%2Fshipments%2F" + queryShipment.data.id + "%2Fdirect-integration-shipping-label%22%20&agg_m=count&agg_m_source=base&agg_t=count&cols=host%2Cservice&fromUser=true&messageDisplay=inline&refresh_mode=sliding&storage=hot&stream_sort=desc&viz=stream&from_ts=1728151007748&to_ts=1728151907748&live=true"}}',
            },
          ],
        }}
        pluginId="generateLabelLogsURL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{voidAndCreateWithDirectCourierRate.data.data.detail || voidAndCreateWithDirectCourierRate.data.data.msg}}",
            },
          ],
        }}
        pluginId="labelGenerationErrors"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="voidAndCreateWithShippoRate"
      body={
        '[{"key":"rate_id","value":"{{ratesFromQuery.value[rates.value].id}}"},{"key":"courier","value":"{{ratesFromQuery.value[rates.value].courier}}"},{"key":"signature_confirmation","value":"{{signature_confirmation[0].value}}"},{"key":"is_flat_rate_override","value":"{{requiresFlatRateBox && !shipFlatRateToggle.value}}"},{"key":"seller_id","value":"{{queryRecord.data.items[0].shipment.seller_id}}"},{"key":"shipping_rate_source","value":"{{ratesFromQuery.value[rates.value].source || \\"shippo_public\\"}}"},{"key":"carrier_account","value":"{{ratesFromQuery.value[rates.value].carrier_account || null}}"},{"key":"merchant_id","value":"{{ratesFromQuery.value[rates.value].merchant_id || null}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration="5"
      query="/shipments/{{queryRecord.data.items[0].order_item.internal_shipment_id || queryRecord.data.items[0].shipment.id}}/shipping-label"
      queryFailureConditions={
        '[{"condition":"{{ voidAndCreateWithShippoRate.metadata.status > 400 }}","message":"{{ voidAndCreateWithShippoRate.data }}"},{"condition":"","message":""}]'
      }
      queryTimeout="30000"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="confetti"
        params={{}}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{}}
        pluginId="generateNewLabel"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="queryRecord"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          map: {
            value:
              "{{voidAndCreateWithShippoRate.data.data.data.label_generation_failure_messages}}",
          },
        }}
        pluginId="labelGenerationErrors"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          map: {
            value:
              '{{"https://app.datadoghq.com/logs?query=%40http.url_details.path%3A%22%2Fadmin%2Fapi%2Fshipments%2F" + queryShipment.data.id + "%2Fshipping-label%22%20&agg_m=count&agg_m_source=base&agg_t=count&cols=host%2Cservice&fromUser=true&messageDisplay=inline&refresh_mode=sliding&storage=hot&stream_sort=desc&viz=stream&from_ts=1728151007748&to_ts=1728151907748&live=true"}}',
          },
        }}
        pluginId="generateLabelLogsURL"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{}}
        pluginId="variable38"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="voidAndReassignErrorMsg"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="voidAndReassignErrorMsgBYOL"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
  </Folder>
  <Folder id="shipmentData">
    <JavascriptQuery
      id="downloadCommercialInvoice"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/downloadCommercialInvoice.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="queryCommercialInvoice"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ variable0: "{{ queryShipment.data.id }}" }],
      }}
      playgroundQueryName="Seller Invoice"
      playgroundQueryUuid="9257816c-176a-4515-b75d-a2aa869f7199"
      query="shipments/{{queryShipment.data.id}}/commercial-invoice"
      resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="downloadCommercialInvoice"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <SqlQueryUnified
      id="queryShipmentDB"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("../lib/queryShipmentDB.sql", "string")}
      queryDisabled="{{orderShipmentId.value == null}}"
      resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return data"
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SqlQueryUnified
      id="queryShipmentLabelPrintedAt"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("../lib/queryShipmentLabelPrintedAt.sql", "string")}
      resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return data"
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SqlQueryUnified
      id="queryShipmentBYOL"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("../lib/queryShipmentBYOL.sql", "string")}
      resourceName="1ac87f5a-5f73-42ee-ae88-482ff640cb66"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return data"
      warningCodes={[]}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <GoogleSheetsQuery
    id="appendToGoogleSpreadsheetCRL"
    actionType="append"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    resourceName="2fdedabc-d28f-416f-9a5d-5bc25a021299"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    sheetName="Refund Log"
    sheetUpdate={
      '[\n  {\n    "ReturnedItemProcessingRowDate": {{date_crl.formattedValue}},\n    "BuyerUserName": {{buyer_username_crl.value}},\n    "SellerUserName": {{seller_username_crl.value}},\n    "Buyer Country": {{queryDefaultBuyerAddress_ShipmentDataPage.data.country_code}},\n    "Seller Country": {{orderSeller.value.home_address.country_code}},\n    "SellerEarlyPayout": {{seller_early_payout_enabled_crl.value}},\n    "CategoryForListing": {{category_crl.value}},\n    "ListingName": {{populateTableSelectedOrderInShipmentListingName}},\n    "RefundReason": {{refund_reason_crl.selectedItem.label}},\n    "RefundType": {{refund_type_crl.value}},\n    " RefundAmount ": {{populateTableSelectedOrderInShipmentRefundAmount}},\n    "TotalOrderAmount": {{populateTableSelectedOrderInShipmentRefundAmount}},\n    "Channel": {{sales_channel_crl.value}},\n    "Warehouse": {{warehouse_crl.value}},\n    "ReturnLabelTracking": {{tracking_number_crl.value}},\n    "Refunded": {{refunded_crl.value}},\n    "Fault": {{fault_crl.value}},\n    "Agent": {{agent_name_crl.value}},\n    "AdminOrderLink": {{populateTableSelectedOrderInShipmentAdminOrderLink}},\n    "ZendeskLink": {{zen_desk_crl.value}},\n    "ReturnLabelURL": {{label_url_crl.value}},\n  }\n]'
    }
    spreadsheetId="17n75_rMHo2DvK7n_FQPnKk98vYJiT1gyqNOaqRfTwNA"
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="confetti"
      params={{}}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="close"
      params={{}}
      pluginId="createReturnLabel"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </GoogleSheetsQuery>
  <RESTQuery
    id="createWithShippoRate"
    body={
      '[{"key":"rate_id","value":"{{ratesFromQueryCRL.value[rates_crl.value].id}}"},{"key":"courier","value":"{{ratesFromQueryCRL.value[rates_crl.value].courier}}"},{"key":"signature_confirmation","value":"{{signature_confirmation_crl.value}}"},{"key":"seller_id","value":"{{queryRecord.data.items[0].shipment.seller_id}}"},{"key":"shipping_rate_source","value":"{{ratesFromQueryCRL.value[rates_crl.value].source || \\"shippo_public\\"}}"},{"key":"reason","value":"{{refund_reason_crl.value}}"},{"key":"order_ids","value":"{{tableCreateReturnLabel.selectedRow.data.map(item => item.order_id)}}"},{"key":"refund_payment_payer","value":"{{return_label_covers_cost_select.value.toUpperCase()}}"},{"key":"author_email","value":"{{current_user.email}}"},{"key":"direct_service","value":"{{return_label_covers_cost_select.hidden ? \\"hide\\":\\"show\\"}}"},{"key":"override_existing_shipment","value":"{{ c_override_existing_shipment.value }}"},{"key":"carrier_account","value":"{{ratesFromQueryCRL.value[rates_crl.value].carrier_account || null}}"},{"key":"shipment_id","value":"{{queryRecord.data.items[0].shipment.id}}"},{"key":"address_to","value":"{city: {{address_to_city_crl.value}}, company: {{address_to_company_crl.value}}, country: {{address_to_country_crl.value}}, email: {{address_to_email_crl.value}}, name: {{address_to_full_name_crl.value}}, phone: {{address_to_phone_crl.value}}, state: {{address_to_state_crl.value}}, street1: {{address_to_street_one_crl.value}}, street2: {{address_to_street_two_crl.value}}, zip: {{address_to_zip_crl.value}} }"},{"key":"address_from","value":"{city: {{address_from_city_crl.value}}, company: {{address_from_company_crl.value}}, country: {{address_from_country_crl.value}}, name: {{address_from_full_name_crl.value}}, state: {{address_from_state_crl.value}}, street1: {{address_from_street_one_crl.value}}, street2: {{address_from_street_two_crl.value}}, zip: {{address_from_zip_crl.value}}, email: {{ address_from_email_crl.value }}, phone: {{ address_from_phone_crl.value }} }"},{"key":"parcel_info","value":"{length: {{Math.round(length_crl.value * 100 ) / 100}}, width: {{Math.round(width_crl.value * 100) / 100}}, height: {{Math.round(height_crl.value * 100) / 100}}, weight: {{weight_crl.value}}, weight_scale: {{weight_scale_crl.value}}, dimension_scale: {{dimension_scale_crl.value}}, product_categories: [{{package_contents_crl.value}}]}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query="/shipments/shipping-label"
    queryTimeout="20000"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    type="POST"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="setValue"
      params={{ map: { value: "{{ createWithShippoRate.data }}" } }}
      pluginId="createWithShippoRateStateCRL"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{
        map: {
          options: { onSuccess: null, onFailure: null, additionalScope: null },
        },
      }}
      pluginId="js_return_label_create_check"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="setValue"
      params={{ map: { value: "{{ createWithShippoRate.data }}" } }}
      pluginId="createWithShippoRateStateCRL"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="trigger"
      params={{}}
      pluginId="js_return_label_create_check"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Function
    id="orderTransformer_ShipmentDataPage"
    funcBody={include("../lib/orderTransformer_ShipmentDataPage.js", "string")}
    runBehavior="debounced"
  />
  <JavascriptQuery
    id="queryCRLPopulateTable"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("../lib/queryCRLPopulateTable.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryDefaultBuyerAddress_ShipmentDataPage"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"x-whatnot-pii","value":"show"}]'}
    query="users/{{queryRecord.data.user.id}}/addresses/"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer="for (let i = 0; i < data.length; i++) {
  if (data[i].is_default) {
    return data[i];
  }
}
return null"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="queryIsGlobalCoupon_ShipmentDataPage"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    query={include("../lib/queryIsGlobalCoupon_ShipmentDataPage.sql", "string")}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    transformer="// Query results are available as the `data` variable
return data"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="queryRefundReasonsDropdown_ShipmentDataPage"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Accept","value":"application/json"}]'}
    query="refund_reasons/dropdown"
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    showSuccessToaster={false}
    transformer={
      "for (let i = 0; i < data.length; i++) {\n   var is_user_in_fraud = {{current_user.groups.map(group => group.name).includes('Fraud')}};\n   if (data[i].value == \"fraud\" && !is_user_in_fraud) {\n      data.splice(i, 1);\n   }\n}\n\nreturn data;"
    }
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <SqlQueryUnified
    id="querySellerOrderCancellationReason_ShipmentDataPage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/querySellerOrderCancellationReason_ShipmentDataPage.sql",
      "string"
    )}
    resourceName="47b79e99-459f-47a8-bbca-8b56471f5a9b"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer={
      'return {\n  "reason": (data.reason.length > 0) ? data.reason[0] : null,\n  "reason_input_text": (data.reason_input_text.length > 0) ? data.reason_input_text[0] : null,\n  "buyer_facing_message": (data.buyer_facing_message.length > 0) ? data.buyer_facing_message[0] : null\n}'
    }
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <Function
    id="transformEarliestDropoffType"
    funcBody={include("../lib/transformEarliestDropoffType.js", "string")}
    runBehavior="throttled"
  />
  <RESTQuery
    id="deleteDropoffImage"
    body={'[{"key":"","value":""},{"key":"","value":""}]'}
    bodyType="json"
    enableTransformer={true}
    notificationDuration={4.5}
    query="shipments/{{ queryShipment.data.id }}/soft-delete-dropoff-image"
    queryFailureConditions={
      '[{"condition":"{{ metadata.status == 400 }}","message":"{{ data.msg }}"}]'
    }
    resourceName="81e380e4-c94e-42de-9100-f4f5797607bd"
    runWhenModelUpdates={false}
    successMessage="Successfully removed the dropoff image for users."
    type="PUT"
  >
    <Event
      event="success"
      method="setDisabled"
      params={{}}
      pluginId="delete_dropoff_image"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setHidden"
      params={{ map: { hidden: false } }}
      pluginId="imageDeletedText"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Include src="./confirmMarkDeliveredWithNoLabel.rsx" />
  <Frame
    id="$main4"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./containerShipmentData.rsx" />
    <Include src="./containerTools.rsx" />
    <Container
      id="pudoInfoContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ queryShipment.data.pudo_info == undefined || queryShipment.data.pudo_info == null }}"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="pudoInfoContainerHeader"
          value="#### PUDO Info"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <KeyValue
          id="pudoInfoKeyValue"
          data="{{ queryShipment.data.pudo_info
}}"
          enableSaveActions={true}
          groupLayout="singleColumn"
          labelWrap={true}
        >
          <Property
            id="courier"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Courier"
          />
          <Property
            id="name"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Name"
          />
          <Property
            id="address_line1"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Address line 1"
          />
          <Property
            id="address_line2"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Address line 2"
          />
          <Property
            id="address_line3"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Address line 3"
          />
          <Property
            id="city"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="City"
          />
          <Property
            id="postal_code"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Postal code"
          />
          <Property
            id="country"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Country"
          />
        </KeyValue>
      </View>
    </Container>
    <Include src="./ProofOfDropoffcontainer.rsx" />
    <Container
      id="containerBuyerShippingOriginalOrder"
      disabled=""
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden="{{queryShipment.data.shippo_data && queryShipment.data.shippo_data.to_address}}"
      hoistFetching={true}
      maintainSpaceWhenHidden={null}
      marginType="normal"
      overflowType="hidden"
      padding="12px"
      paddingType="normal"
      selectedView="View 1"
      showBody={true}
      showHeader={true}
      showInEditor={true}
      style={{ ordered: [{ headerBackground: "#ededed" }] }}
      styleContext={{ ordered: [] }}
    >
      <Header>
        <Text
          id="buyerAddressOriginalOrder"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value={
            '**{{queryRecord.data.gifting_preferences?.custom_address_id || queryRecord.data.gifting_preferences?.recipient_user_id ? "GIFT RECIPIENT ADDRESS ": "BUYER ADDRESS "  }} (ORIGINAL ORDER)**'
          }
          verticalAlign="center"
        />
        <Button id="button15" text="copy address">
          <Event
            event="click"
            method="copyToClipboard"
            params={{
              ordered: [
                {
                  value:
                    '{{ [queryRecord.data.shipping_address.line1, queryRecord.data.shipping_address.line2, queryRecord.data.shipping_address.city, queryRecord.data.shipping_address.state, queryRecord.data.shipping_address.postal_code,queryRecord.data.shipping_address.country_code].filter(value => value !== null && value !==  "").join(", ")\n}} ',
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
      <View id="" viewKey="View 1" />
      <Body>
        <Text
          id="text122"
          value={
            '**Address**: {{ [queryRecord.data.shipping_address.line1, queryRecord.data.shipping_address.line2, queryRecord.data.shipping_address.city, queryRecord.data.shipping_address.state, queryRecord.data.shipping_address.postal_code,queryRecord.data.shipping_address.country_code].filter(value => value !== null && value !==  "").join(", ")\n}} '
          }
          verticalAlign="center"
        />
        <KeyValueMap
          id="keyvaluemapBuyerShippingOriginalOrder"
          data="{{ queryRecord.data.shipping_address }}"
          prevRowFormats={{}}
          prevRowMappers={{}}
          rowHeaderNames={{
            line1: "Line 1",
            line2: "Line 2",
            country_code: "Country",
            postal_code: "Postal Code",
            state: "State",
            city: "City",
            full_name: "Full Name",
          }}
          rows={[
            "a",
            "b",
            "c",
            "id",
            "full_name",
            "line1",
            "line2",
            "city",
            "state",
            "postal_code",
            "country_code",
          ]}
          rowVisibility={{
            a: true,
            postal_code: true,
            b: true,
            c: true,
            city: true,
            state: true,
            country_code: true,
            id: false,
            full_name: true,
            line1: true,
            line2: true,
          }}
        />
      </Body>
    </Container>
    <Include src="./containerBuyerShipping.rsx" />
    <Include src="./containerSellerShipping.rsx" />
    <Include src="./containerPickupAddress.rsx" />
  </Frame>
</Screen>
