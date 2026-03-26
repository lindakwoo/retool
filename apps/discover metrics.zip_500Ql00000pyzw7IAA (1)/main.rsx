<App>
  <Include src="./functions.rsx" />
  <Include src="./header.rsx" />
  <Include src="./src/articlesegmentationdrawer.rsx" />
  <Include src="./src/ticketsegmentationdrawer.rsx" />
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={false}
    type="main"
  >
    <Alert
      id="alert1"
      description="Select an organization and Taxonomy ID to view relevant Discover document counts"
      hidden={
        '{{(taxonomySelect.value && urlparams.hash.org_id) ||  retoolContext.environment == "staging" }}'
      }
      title="Pick an org + taxonomy!"
      type="warning"
    />
    <Text
      id="text3"
      _disclosedFields={{ array: [] }}
      hidden={'{{ retoolContext.environment == "production"}} '}
      style={{
        ordered: [{ color: "rgba(255, 0, 0, 1)" }, { background: "highlight" }],
      }}
      value="This page doesn't support staging right now!"
      verticalAlign="center"
    />
    <Select
      id="taxonomySelect"
      data="{{ get_taxonomy_ids.data }}"
      disabled={'{{ retoolContext.environment == "staging"}} '}
      emptyMessage="No options"
      hidden="{{!urlparams.hash.org_id}}"
      label="Taxonomy ID"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showInEditor={true}
      showSelectionIndicator={true}
      value="{{transform_active_taxonomy_id.value}}"
      values="{{ item.taxonomy_id }}"
    />
    <Container
      id="container11"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ !org_id_as_int.value }}"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle11"
          _disclosedFields={{ array: [] }}
          value="#### Current Discover Configuration"
          verticalAlign="center"
        />
      </Header>
      <View id="85226" viewKey="View 1">
        <JSONExplorer
          id="jsonExplorer1"
          hidden="{{!urlparams.hash.org_id}}"
          showInEditor={true}
          value={
            '{{get_discover_org_config?.data ? get_discover_org_config.data["0"]?.org_feature_value : {}}}'
          }
        />
      </View>
    </Container>
    <Include src="./src/container9.rsx" />
    <Container
      id="container2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{!taxonomySelect.value || !org_id_as_int.value}}"
      padding="12px"
      showBody={true}
      showHeader={true}
      showInEditor={true}
    >
      <Header>
        <Text
          id="containerTitle2"
          _disclosedFields={{ array: [] }}
          value="#### Document counts by location"
          verticalAlign="center"
        />
      </Header>
      <View id="d46c1" viewKey="View 1">
        <TableLegacy
          id="table1"
          _columnSummaryTypes={{ ordered: [{ Count: "sum" }] }}
          _columnSummaryValues={{ ordered: [{ Count: "" }] }}
          _compatibilityMode={false}
          columnAlignment={{ ordered: [{ Count: "right" }] }}
          columnColors={{
            Description: "",
            "Data source": "",
            Count: "",
            hi: "",
          }}
          columnFormats={{ ordered: [{ Count: "NumberDataCell" }] }}
          columnTypeProperties={{
            ordered: [
              {
                Count: {
                  ordered: [{ showSeparators: true }, { padDecimal: true }],
                },
              },
            ],
          }}
          columnWidths={[
            { object: { id: "Description", value: 336.828125 } },
            { object: { id: "Data source", value: 216 } },
            { object: { id: "Count", value: 148.328125 } },
          ]}
          data={
            '{\n    "Description": [\n        "Tickets used in the Discover pipeline for this taxonomy",\n        "Tickets used in training for this taxonomy",\n        "Tickets identified as templates for this taxonomy",\n        "Discover topics for this taxonomy",\n        "Total tickets in Elasticsearch for this taxonomy",\n        "Tickets with no topic for this taxonomy",\n        "Tickets with a topic for this taxonomy",\n        "Tickets in the miscellaneous topic for this taxonomy",\n        "Coverage percent (%)",\n        "Generated knowledge articles"\n    ],\n    "Data source": [\n        "Datalake - Tickets Metrics",\n        "Discover Pipeline",\n        "Discover Pipeline",\n        "Discover Pipeline",\n        "ES",\n        "ES",\n        "ES",\n        "ES",\n        "Tickets with Topic / All ES Tickets",\n        "Mongo"\n    ],\n    "Count": [\n        {{taxonomySelect.value ? count_tickets_from_discover_pipeline.data.total_ticket_count[0] : 0}},\n        {{taxonomySelect.value ? count_tickets_from_discover_pipeline.data.used_in_training_count[0] : 0}},\n        {{taxonomySelect.value ?count_tickets_from_discover_pipeline.data.is_template_count[0] : 0}},\n        {{taxonomySelect.value ?count_tickets_from_discover_pipeline.data.cluster_id_count[0] : 0}},\n        {{count_total_es_docs.data?.hits.total.value}},\n        {{count_es_docs_with_aggs.data ? count_es_docs_with_aggs.data[\'No Cluster\']:0}},\n        {{count_es_docs_with_aggs.data ?count_es_docs_with_aggs.data[\'Has Cluster\']:0}},\n        {{count_es_docs_with_aggs.data ?count_es_docs_with_aggs.data.Miscellaneous:0}},\n        {{count_es_docs_with_aggs.data ?count_es_docs_with_aggs.data.percent: 0}} ,\n        {{count_mongo_discover_articles?.data?.count}}\n    ]\n}'
          }
          disableRowSelectInteraction={true}
          disableSorting={{
            ordered: [{ "Data source": true }, { Description: true }],
          }}
          emptyMessage="Please select the taxonomy id"
          heightType="auto"
          hidden=""
          maintainSpaceWhenHidden={false}
          overflowType="scroll"
          showBoxShadow={false}
          showFilterButton={false}
        />
      </View>
    </Container>
    <Container
      id="container10"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ !org_id_as_int.value }}"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle10"
          _disclosedFields={{ array: [] }}
          value="#### Documents by channel"
          verticalAlign="center"
        />
      </Header>
      <View id="04d65" viewKey="View 1">
        <TableLegacy
          id="table2"
          _compatibilityMode={false}
          columnColors={{ channel: "", ticket_count: "" }}
          columnHeaderNames={{
            ordered: [{ channel: "Channel" }, { ticket_count: "Ticket Count" }],
          }}
          data="{{get_channel_counts.data}}"
          defaultSortByColumn={null}
          doubleClickToEdit={true}
          overflowType="scroll"
          showBoxShadow={false}
          showFilterButton={false}
          showRefreshButton={false}
        />
      </View>
    </Container>
    <Include src="./src/tabbedContainer1.rsx" />
    <Include src="./src/tabbedContainer2.rsx" />
  </Frame>
</App>
