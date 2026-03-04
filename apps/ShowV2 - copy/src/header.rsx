<Frame
  id="$header"
  isHiddenOnMobile={false}
  padding="8px 12px"
  paddingType="normal"
  sticky={false}
  type="header"
>
  <Container
    id="containerBuyerMain"
    disabled=""
    footerPadding="4px 12px"
    footerPaddingType="normal"
    headerPadding="4px 12px"
    headerPaddingType="normal"
    hidden={null}
    loading="{{queryRecord.isFetching}}"
    maintainSpaceWhenHidden={null}
    marginType="normal"
    overflowType="hidden"
    padding="12px"
    paddingType="normal"
    selectedView="View 1"
    showBody={true}
    showInEditor={null}
    style={{ ordered: [] }}
    styleContext={{ ordered: [] }}
  >
    <View id="" viewKey="View 1" />
    <Container
      id="containerShipment"
      _gap="0px"
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hoistFetching={true}
      loading="{{!!!queryShipment.data}}"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitleShipment"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="### Shipment"
          verticalAlign="center"
        />
      </Header>
      <View id="e9127" viewKey="View 1" />
    </Container>
  </Container>
</Frame>
