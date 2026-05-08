<Modal
  id="modalQueryRefundSummary"
  buttonText="Refund Summary"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: "setData" },
        { pluginId: "tableRefundSummary" },
        { targetId: null },
        { params: { ordered: [{ data: "[]" }] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  hidden="true"
  modalHeight="504px"
  modalWidth="900px"
  showInEditor={true}
>
  <Text
    id="text27"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### <b>Query Refund Status</b>"
    verticalAlign="center"
  />
  <TableLegacy
    id="tableRefundSummary"
    _columnSummaryTypes={{
      ordered: [{ user_refund_amount: "sum" }, { status: "" }],
    }}
    _columnSummaryValues={{
      ordered: [{ user_refund_amount: "" }, { status: "" }],
    }}
    _compatibilityMode={false}
    columnAlignment={{
      ordered: [{ user_refund_amount: "right" }, { status: "left" }],
    }}
    columnColors={{
      ordered: [
        { order_id: "" },
        { user_refund_amount: "" },
        { status: "" },
        { order_created_at: "" },
      ],
    }}
    columnFormats={{
      ordered: [
        { user_refund_amount: "CurrencyDataCell" },
        { status: "TextMultiDataCell" },
      ],
    }}
    columnHeaderNames={{
      ordered: [
        { order_id: "Order ID" },
        { user_refund_amount: "REQ Amount" },
        { status: "STATUS" },
      ],
    }}
    columnMappers={{ ordered: [{ user_refund_amount: "{{ self / 100}}" }] }}
    columnTypeProperties={{
      ordered: [
        {
          user_refund_amount: {
            ordered: [
              { showSeparators: true },
              { currency: "USD" },
              { padDecimal: true },
              { decimalPlaces: "2" },
            ],
          },
        },
        { status: { ordered: [] } },
      ],
    }}
    columnWidths={[
      { object: { id: "order_id", value: 123.671875 } },
      { object: { id: "status", value: 541.1640625 } },
    ]}
    data="{{ queryBulkRefundRequestsState.value }}"
    defaultSelectedRow="none"
    doubleClickToEdit={true}
    dynamicRowHeights={true}
    overflowType="scroll"
    showColumnBorders={true}
    showDownloadButton={false}
    showRefreshButton={false}
  />
  <Button
    id="button9"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    text="Copy results"
  >
    <Event
      event="click"
      method="copyToClipboard"
      params={{
        ordered: [{ value: "{{ JSON.stringify(tableRefundSummary.data) }}" }],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
