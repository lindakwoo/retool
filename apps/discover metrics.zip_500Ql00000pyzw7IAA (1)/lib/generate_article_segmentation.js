const config = {};
const tableData = table3.data;
const ticketSegmentations = discover_config.value?.content_generation?.ticket_segmentations;

Object.values(ticketSegmentations).forEach(segmentValues => {
  Object.entries(segmentValues).forEach(([ticketQuery, segmentName]) => {
    const match = ticketQuery.match(/%([^%]+)%/);
    const fieldValue = match ? match[1] : null;
    const matchingRows = tableData.filter(row => {
      const rowSegmentValue = row['ticket segment']?.split('|')[1];
      return rowSegmentValue === segmentName && row['api_data_json field name'] != "";
    });

    const conditions = matchingRows.map(row => {
      const fieldName = row['api_data_json field name'];
      return `json_extract_scalar(api_data_json, '$.${fieldName}') LIKE '%${fieldValue}%'`;
    });

    if (conditions.length > 0) {
      config[ticketQuery.replace('-DOT-', '.')] = `(${conditions.join(' OR ')})`;
    } else {
      config[ticketQuery.replace('-DOT-', '.')] = ""; 
    }
  });
});

return config;