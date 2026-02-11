<Screen
  id="disputes"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="e92db446-b6e6-4660-b8d3-428eab84c6c8"
>
  <Frame
    id="$main10"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Button
      id="button6"
      _disclosedFields={{ array: [] }}
      loading="{{ fetchDisputes.isFetching }}"
      marginType="normal"
      text="Fetch Disputes"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="fetchDisputes"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="containerDisputes"
      disabled=""
      footerPadding="4px 12px"
      footerPaddingType="normal"
      headerPadding="4px 12px"
      headerPaddingType="normal"
      hidden=""
      hoistFetching={true}
      loading="{{fetchDisputes.isFetching}}"
      marginType="normal"
      padding="12px"
      paddingType="normal"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitleDisputes"
          _disclosedFields={{ array: [] }}
          marginType="normal"
          value="### Disputes"
          verticalAlign="center"
        />
        <TableLegacy
          id="tableDisputes"
          _columnVisibility={{
            ordered: [{ ORDER_UUID: false }, { DISPUTE_SYSTEM: false }],
          }}
          _compatibilityMode={false}
          columnColors={{
            ordered: [
              { DISPUTE_SYSTEM: "" },
              { DISPUTE_STATUS: "" },
              { DISPUTE_TYPE: "" },
              { CREATED_AT: "" },
              { DEADLINE_AT: "" },
              { ORDER_UUID: "" },
            ],
          }}
          columnHeaderNames={{
            ordered: [
              { DISPUTE_SYSTEM: "" },
              { DISPUTE_STATUS: "Dispute Status" },
              { DISPUTE_TYPE: "Dispute Type" },
              { CREATED_AT: "Created At" },
              { DEADLINE_AT: "Deadline At" },
            ],
          }}
          customButtonName=""
          data="{{ fetchDisputes.data }}"
          doubleClickToEdit={true}
          showBoxShadow={false}
          showDownloadButton={false}
          showFilterButton={false}
          showRefreshButton={false}
        />
      </Header>
      <View id="e9127" viewKey="View 1" />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="fetchDisputes"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Container>
  </Frame>
</Screen>
