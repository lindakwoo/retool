<Container
  id="tabbedContainerRefundForm"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabsRefundForms"
      disabled=""
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainerRefundForm"
      value="{{ self.values[0] }}"
    >
      <Option id="00030" value="Tab 1" />
      <Option id="00031" value="Tab 2" />
      <Option id="00032" value="Tab 3" />
    </Tabs>
  </Header>
  <View
    id="8c310"
    disabled={false}
    hidden={'{{ !queryEnabledRefundForms.data.includes("na") }}'}
    iconPosition="left"
    label="Not Available"
    viewKey="na"
  >
    <Text id="text7" value="Refund not available." verticalAlign="center" />
  </View>
  <View
    id="00030"
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("full")) }}'
    }
    label="Full refund"
    viewKey="full"
  >
    <Form
      id="formFullRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle1"
          margin="0"
          value="Provide full refund on the item price, buyer paid shipping, taxes, and return shipping (if any)."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectFullRefundReason"
          data="{{ queryRefundReasons.data }}"
          emptyMessage="No options"
          hiddenByIndex=""
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          value="{{ moduleRefundReason.value }}"
          values="{{ item.value }}"
        >
          <Option id="de396" disabled={false} hidden={false} value="Option 1" />
        </Select>
        <Select
          id="selectFullRefundPaidBy"
          emptyMessage="No options"
          itemMode="static"
          label="Charge Seller"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        >
          <Option id="28b17" label="Yes" value="SELLER" />
          <Option id="765e1" label="No" value="WHATNOT" />
        </Select>
        <Select
          id="selectFullRefundType"
          emptyMessage="No options"
          itemMode="static"
          label="Returned"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value=""
        >
          <Option id="00030" label="Not Returned" value="NO_RETURN" />
          <Option
            id="00031"
            label="Returned to Seller"
            value="RETURN_TO_SELLER"
          />
          <Option id="00032" label="Returned to Whatnot" value="RETURN_TO_WN" />
        </Select>
        <TextArea
          id="textAreaFullRefundNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{}}
        pluginId="prepareFullOrderRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="00031"
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("item_price")) }}'
    }
    label="Partial refund on Item(s)"
    viewKey="item_price"
  >
    <Form
      id="formItemPriceRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle2"
          margin="0"
          value="The subtotal you entered, along with its proportional share of tax, will be refunded."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectItemPriceRefundReason"
          data="{{ queryRefundReasons.data }}"
          emptyMessage="No options"
          hiddenByIndex=""
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          value="{{ moduleRefundReason.value }}"
          values="{{ item.value }}"
        />
        <Select
          id="selectItemPricePaidBy"
          emptyMessage="No options"
          itemMode="static"
          label="Charge Seller"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        >
          <Option id="28b17" label="Yes" value="SELLER" />
          <Option id="765e1" label="No" value="WHATNOT" />
        </Select>
        <TextArea
          id="textAreaItemPriceNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
        <NumberInput
          id="percentageItemPriceRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].amount.currency : "USD" }}'
          }
          decimalPlaces="0"
          format="percent"
          inputValue={0}
          label="Amount"
          labelWidth="70"
          max="1"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "ITEM_PRICE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <NumberInput
          id="currencyItemPriceRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].currency : "USD" }}'
          }
          customValidation={
            '{{ calculateTotalReversibles.data.ITEM_PRICE ? (currencyItemPriceRefund.value > calculateTotalReversibles.data.ITEM_PRICE.amount ? "Maximum "+calculateTotalReversibles.data.ITEM_PRICE.amount:null) : (currencyItemPriceRefund.value > 0 ? "Maximum 0.00" : null)}}'
          }
          decimalPlaces="2"
          format="currency"
          hideLabel={true}
          inputValue={0}
          label="Item Price Refund Amount"
          labelWidth="40"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_PERCENTAGE",
                      reversibleKey: "ITEM_PRICE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <Button
          id="formButtonSetItemPrice"
          submitTargetId="formItemPriceRefund"
          text="Set Full"
        >
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "1" } }}
            pluginId="percentageItemPriceRefund"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "ITEM_PRICE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{ map: { options: { map: { additionalScope: {} } } } }}
        pluginId="prepareItemPriceRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="92103"
    disabled={false}
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("shipping")) }}'
    }
    iconPosition="left"
    label="Shipping refund"
    viewKey="shipping"
  >
    <Form
      id="formShippingRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle4"
          margin="0"
          value="The entered shipping amount and its proportional share of tax will be refunded."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectShippingRefundReason"
          data="{{ queryRefundReasons.data }}"
          emptyMessage="No options"
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          value="{{ moduleRefundReason.value }}"
          values="{{ item.value }}"
        />
        <Select
          id="selectShippingPaidBy"
          emptyMessage="No options"
          itemMode="static"
          label="Charge Seller"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        >
          <Option id="28b17" label="Yes" value="SELLER" />
          <Option id="765e1" label="No" value="WHATNOT" />
        </Select>
        <TextArea
          id="textAreaShippingNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
        <NumberInput
          id="percentageShippingRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].amount.currency : "USD" }}'
          }
          decimalPlaces="0"
          format="percent"
          inputValue={0}
          label="Amount"
          labelWidth="70"
          max="1"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "BUYER_SHIPPING",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <NumberInput
          id="currencyShippingRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].currency : "USD" }}'
          }
          customValidation={
            '{{ calculateTotalReversibles.data.BUYER_SHIPPING ? (currencyItemPriceRefund.value > calculateTotalReversibles.data.BUYER_SHIPPING.amount ? "Maximum "+calculateTotalReversibles.data.BUYER_SHIPPING.amount:null) : (currencyItemPriceRefund.value > 0 ? "Maximum 0.00" : null)}}'
          }
          decimalPlaces="2"
          format="currency"
          hideLabel={true}
          inputValue={0}
          label="Buyer Shipping Refund Amount"
          labelWidth="40"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_PERCENTAGE",
                      reversibleKey: "BUYER_SHIPPING",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <Button
          id="formButtonSetBuyerShipping"
          submitTargetId="formShippingRefund"
          text="Set Full"
        >
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "1" } }}
            pluginId="percentageShippingRefund"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "BUYER_SHIPPING",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "buyer_overcharged_shipping" } }}
            pluginId="selectShippingRefundReason"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "WHATNOT" } }}
            pluginId="selectShippingPaidBy"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{ map: { options: { map: { additionalScope: {} } } } }}
        pluginId="prepareBuyerShippingRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="cdf06"
    disabled={false}
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("legacy")) }}'
    }
    iconPosition="left"
    label="Legacy"
    viewKey="legacy"
  >
    <Form
      id="formLegacyRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle5"
          margin="0"
          value="The entered amount will be refunded from order total and won't capture breakdown of refund."
          verticalAlign="center"
        />
        <Text
          id="formTitle6"
          margin="0"
          style={{
            color: "warning",
            fontSize: "defaultFont",
            fontWeight: "defaultFont",
            fontFamily: "defaultFont",
          }}
          value="Only selected orders with legacy reversals will be processed."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectLegacyRefundReason"
          data="{{ queryRefundReasons.data }}"
          emptyMessage="No options"
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          values="{{ item.value }}"
        />
        <Select
          id="selectLegacyPaidBy"
          emptyMessage="No options"
          itemMode="static"
          label="Charge Seller"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
        >
          <Option id="28b17" label="Yes" value="SELLER" />
          <Option id="765e1" label="No" value="WHATNOT" />
        </Select>
        <Select
          id="selectLegacyReturnedTo"
          emptyMessage="No options"
          itemMode="static"
          label="Returned"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value=""
        >
          <Option id="00030" label="Not Returned" value="NO_RETURN" />
          <Option
            id="00031"
            label="Returned to Seller"
            value="RETURN_TO_SELLER"
          />
          <Option id="00032" label="Returned to Whatnot" value="RETURN_TO_WN" />
        </Select>
        <TextArea
          id="textAreaLegacyNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
        <NumberInput
          id="percentageLegacyRetund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].amount.currency : "USD" }}'
          }
          decimalPlaces="0"
          format="percent"
          hidden=""
          inputValue={0}
          label="Amount"
          labelWidth="70"
          max="1"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "LEGACY_REVERSIBLE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <NumberInput
          id="currencyLegacyRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].currency : "USD" }}'
          }
          customValidation={
            '{{ calculateTotalReversibles.data.LEGACY_REVERSIBLE ? (currencyLegacyRefund.value > calculateTotalReversibles.data.LEGACY_REVERSIBLE.amount ? "Maximum "+calculateTotalReversibles.data.LEGACY_REVERSIBLE.amount:null) : (currencyLegacyRefund.value > 0 ? "Maximum 0.00" : null)}}'
          }
          decimalPlaces="2"
          format="currency"
          hidden=""
          hideLabel={true}
          inputValue={0}
          label="Legacy Refund Amount"
          labelWidth="40"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_PERCENTAGE",
                      reversibleKey: "LEGACY_REVERSIBLE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </NumberInput>
        <Button
          id="formButtonSetLegacyAmount"
          hidden=""
          submitTargetId="formLegacyRefund"
          text="Set All"
        >
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "1" } }}
            pluginId="percentageLegacyRetund"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      direction: "TO_AMOUNT",
                      reversibleKey: "LEGACY_REVERSIBLE",
                    },
                  },
                },
              },
            }}
            pluginId="syncPartialRefundAmountAndPercentage"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{}}
        pluginId="prepareLegacyRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="b9dca"
    disabled={false}
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("tax")) }}'
    }
    iconPosition="left"
    label="Tax refund"
    viewKey="tax"
  >
    <Form
      id="formTaxRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle8"
          margin="0"
          value="Full tax amount will be refunded."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectTaxRefundReason"
          data="{{ queryRefundReasons.data }}"
          disabled="true"
          disabledByIndex=""
          emptyMessage="No options"
          hiddenByIndex=""
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          value="tax_issues"
          values="{{ item.value }}"
        >
          <Option id="de396" disabled={false} hidden={false} value="Option 1" />
        </Select>
        <TextArea
          id="textAreaTaxRefundNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{}}
        pluginId="prepareTaxOrderRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="c852e"
    disabled={false}
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("giveaway")) }}'
    }
    iconPosition="left"
    label="Giveaway refund (credit)"
    viewKey="giveaway"
  >
    <Form
      id="formGiveawayRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle7"
          margin="0"
          value="Selected credit amount will be applied to each giveaway order."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectGiveawayReason"
          data="{{ queryRefundReasons.data }}"
          emptyMessage="No options"
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          values="{{ item.value }}"
        />
        <TextArea
          id="textAreaGiveawayNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
        <NumberInput
          id="currencyGiveawayRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].currency : "USD" }}'
          }
          customValidation={
            '{{ currencyGiveawayRefund.value > 20 ? "Maximum 20.00" : null }}'
          }
          decimalPlaces="2"
          format="currency"
          hideLabel={false}
          inputValue={0}
          label="Amount"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        />
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{}}
        pluginId="prepareGiveawayRefundRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="11576"
    disabled={false}
    hidden={
      '{{ !(queryEnabledRefundForms.data && queryEnabledRefundForms.data.includes("postage_due")) }}'
    }
    iconPosition="left"
    label="Postage Due (credit)"
    viewKey="postage_due"
  >
    <Form
      id="formPostageDueRefund"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter="false"
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle9"
          margin="0"
          value="Selected credit amount will be applied to each order."
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Select
          id="selectPostageDueReason"
          captionByIndex=""
          colorByIndex=""
          data="[{
  value:'postage_due',
  label:'Postage Due',
}]"
          disabled="true"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconByIndex=""
          imageByIndex=""
          label="Refund Reason"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a reason"
          required={true}
          showSelectionIndicator={true}
          tooltipByIndex=""
          value="postage_due"
          values="{{ item.value }}"
        />
        <TextArea
          id="textAreaPostageDueNotes"
          autoResize={true}
          label="Notes"
          minLines={2}
          placeholder="Enter notes"
        />
        <NumberInput
          id="currencyPostageDueRefund"
          currency={
            '{{ tableReversibles.data[0] ? tableReversibles.data[0].currency : "USD" }}'
          }
          customValidation={
            '{{ currencyPostageDueRefund.value > 30 ? "Maximum 30.00" : null }}'
          }
          decimalPlaces="2"
          format="currency"
          hideLabel={false}
          inputValue={0}
          label="Amount"
          min="0"
          placeholder="Enter value"
          preventScroll={true}
          required={true}
          showSeparators={true}
          value={0}
        />
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{}}
        pluginId="preparePostageDueRequests"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <Event
    event="change"
    method="trigger"
    params={{}}
    pluginId="resetRefundForms"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</Container>
