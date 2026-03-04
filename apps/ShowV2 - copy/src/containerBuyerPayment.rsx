<Container
  id="containerBuyerPayment"
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
      id="containerTitle10"
      _disclosedFields={{ array: [] }}
      heightType="fixed"
      marginType="normal"
      value="**PAYMENT DATA**"
      verticalAlign="center"
    />
    <Button
      id="button21"
      disabled="{{ queryRefundArnStan.isFetching }}"
      loading="{{ queryRefundArnStan.isFetching }}"
      text="Fetch ARN/STAN"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="queryRefundArnStan"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="revealPaymentPIIButton"
      _disclosedFields={{ array: [] }}
      disabled={
        '{{ !queryRecord.data || queryRecord.data?.payment?.card?.indexOf("@") !== -1}}'
      }
      marginType="normal"
      text="Reveal PII"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "await queryRecord.trigger({\n  additionalScope: {\n    shouldShowPii: true,\n  }  \n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="" viewKey="View 1" />
  <Body>
    <Text
      id="text107"
      marginType="normal"
      value="This section lacks details on refunded buyer balances. Please refer to the 'Refund Requests' section below for comprehensive refund information."
      verticalAlign="center"
    />
    <KeyValue
      id="keyValue6"
      data="{{ transformerPaymentDetails.value }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
      style={{}}
    >
      <Property
        id="amount_charged_cents"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
          decimalPlaces: "2",
        }}
        hidden="false"
        label="Amount Charged"
        valueOverride="{{ item/100 }}"
      />
      <Property
        id="refund"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Refund"
        placeholder="-"
      />
      <Property
        id="amount_refunded_cents"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
          decimalPlaces: "2",
        }}
        hidden="false"
        label="Amount Refunded"
        valueOverride="{{ item/100 }}"
      />
      <Property
        id="arn_stan"
        editable="false"
        editableOptions={{}}
        format="html"
        formatOptions={{}}
        label="ARN/STAN"
        valueOverride={
          '{{ queryRefundArnStan.isFetching ? "⏳ Fetching ARN/STAN..." : "" }}'
        }
      />
      <Property
        id="fund_source_identifier"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Source ID"
      />
      <Property
        id="gateway"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Source"
      />
      <Property
        id="status"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Status"
      />
      <Property
        id="card"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Card"
      />
      <Property
        id="payment_method"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Payment Method"
      />
      <Property
        id="giveaway_credits"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Giveaway"
      />
      <Property
        id="id"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        hidden="true"
        label="ID"
      />
    </KeyValue>
  </Body>
</Container>
