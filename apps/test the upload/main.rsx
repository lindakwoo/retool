<App>
  <Include src="./functions.rsx" />
  <DocumentTitle id="$customDocumentTitle" value="woo hoo title here" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text1"
      value="Please 1) upload artists and then 2) upload art"
      verticalAlign="center"
    />
    <FileButton
      id="fileButton1"
      _isUpgraded={true}
      accept=".csv"
      iconBefore="bold/programming-browser-search"
      maxCount={20}
      maxSize="250mb"
      parseFiles={true}
      styleVariant="outline"
      text="Step 1: 
upload artists"
    >
      <Event
        id="a0a022f3"
        event="parse"
        method="setValue"
        params={{ ordered: [{ value: "{{ fileButton1.parsedValue[0] }}" }] }}
        pluginId="artists"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </FileButton>
    <FileButton
      id="fileButton2"
      _isUpgraded={true}
      iconBefore="bold/programming-browser-search"
      maxCount={20}
      maxSize="250mb"
      parseFiles={true}
      styleVariant="outline"
      text="Step 2:
upload art"
    >
      <Event
        id="db2af2c6"
        event="parse"
        method="setValue"
        params={{ ordered: [{ value: "{{ fileButton2.parsedValue[0] }}" }] }}
        pluginId="artwork"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="680257af"
        event="parse"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="filterArtwork"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </FileButton>
    <Button id="button1" text="Button" />
    <Table
      id="table3"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ artists.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="c3592"
        alignment="left"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ConstituentID"
        label="Constituent id"
        placeholder="Enter value"
        position="center"
        size={95.78125}
        summaryAggregationMode="none"
      />
      <Column
        id="46b0a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="DisplayName"
        label="Display name"
        placeholder="Enter value"
        position="center"
        size={137.09375}
        summaryAggregationMode="none"
      />
      <Column
        id="3f08d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ArtistBio"
        label="Artist bio"
        placeholder="Enter value"
        position="center"
        size={260.59375}
        summaryAggregationMode="none"
      />
      <Column
        id="51068"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Nationality"
        label="Nationality"
        placeholder="Select option"
        position="center"
        size={85.34375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="03b3b"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Gender"
        label="Gender"
        placeholder="Select option"
        position="center"
        size={70.09375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="35288"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="BeginDate"
        label="Begin date"
        placeholder="Enter value"
        position="center"
        size={76.859375}
        summaryAggregationMode="none"
      />
      <Column
        id="aa858"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="EndDate"
        label="End date"
        placeholder="Enter value"
        position="center"
        size={66.53125}
        summaryAggregationMode="none"
      />
      <Column
        id="03372"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Wiki QID"
        label="Wiki qid"
        placeholder="Enter value"
        position="center"
        size={81.390625}
        summaryAggregationMode="none"
      />
      <Column
        id="f9d78"
        alignment="left"
        format="json"
        groupAggregationMode="none"
        key="ULAN"
        label="Ulan"
        placeholder="Enter value"
        position="center"
        size={80.8125}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          id="5bcaf866"
          event="clickToolbar"
          method="exportData"
          pluginId="table3"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="3ba85ab9"
          event="clickToolbar"
          method="refresh"
          pluginId="table3"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Table
      id="table4"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ filteredArtwork.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="97c31"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ConstituentID"
        label="Constituent id"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="70a4c"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Title"
        label="Title"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f66ed"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Date"
        label="Date"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="22781"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Medium"
        label="Medium"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="50385"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Dimensions"
        label="Dimensions"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a0765"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="CreditLine"
        label="Credit line"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="4dc57"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="AccessionNumber"
        label="Accession number"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="31788"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Classification"
        label="Classification"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="2e452"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Department"
        label="Department"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="527c8"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="DateAcquired"
        label="Date acquired"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c2a14"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Cataloged"
        label="Cataloged"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="8e47a"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ObjectID"
        label="Object id"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="bd4fb"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="URL"
        label="Url"
        position="center"
        size={100}
        summaryAggregationMode="none"
      >
        <Event
          id="4fed3ff3"
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="ef967"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="ImageURL"
        label="Image url"
        position="center"
        size={100}
        summaryAggregationMode="none"
      >
        <Event
          id="fd0ccbd7"
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="5f1e7"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="OnView"
        label="On view"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c2e66"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Circumference (cm)"
        label="Circumference cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="09d34"
        alignment="left"
        format="json"
        groupAggregationMode="none"
        key="Depth (cm)"
        label="Depth cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="af626"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Diameter (cm)"
        label="Diameter cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c4890"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="Height (cm)"
        label="Height cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="04c50"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Length (cm)"
        label="Length cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="991ce"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Weight (kg)"
        label="Weight kg"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c251e"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="Width (cm)"
        label="Width cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f45a3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Seat Height (cm)"
        label="Seat height cm"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d9787"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Duration (sec.)"
        label="Duration sec"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          id="c02101a1"
          event="clickToolbar"
          method="exportData"
          pluginId="table4"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="e4fe169a"
          event="clickToolbar"
          method="refresh"
          pluginId="table4"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Select
      id="select1"
      data="{{ artistsWithArtwork.value }}"
      emptyMessage="No options"
      label="Select an artist to view their artwork below
"
      labelPosition="top"
      labels="{{ item.name }}"
      overlayMaxHeight={375}
      placeholder="Select an artist"
      showSelectionIndicator={true}
      values="{{ item.id }}"
    >
      <Event
        id="d3b84853"
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="setArtToDisplay"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <ListViewBeta
      id="listView2"
      _primaryKeys="{{ item }}"
      data="{{ artToDisplay.value }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container2"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="12px"
        showBody={true}
        showHeader={true}
      >
        <Header>
          <Text
            id="containerTitle2"
            value="Title: {{ item.Title }}"
            verticalAlign="center"
          />
        </Header>
        <View id="ee6db" viewKey="View 1">
          <Image
            id="image2"
            heightType="fixed"
            horizontalAlign="center"
            src="{{item.ImageURL||'https://placehold.co/300x200/cccccc/ffffff?text=No+Image+Available'}}"
          />
        </View>
      </Container>
    </ListViewBeta>
  </Frame>
</App>
