const ticketSegments = discover_config.value?.content_generation?.ticket_segmentations || {};
const sources = Object.values(get_article_sources.data || {})[0];

const result = [];

let index = 1
sources.forEach(source => {
  Object.entries(ticketSegments).forEach(([segmentName, segmentValue]) => {
    Object.values(segmentValue).forEach(fieldValue => {
      result.push({
        "idx": index,
        "integration": source,
        "ticket segment": `${segmentName}|${fieldValue}`,
        "api_data_json field name": ""
      });
      index++;
    });
  });
});

article_segment_map_table_data.setValue(result)
return result