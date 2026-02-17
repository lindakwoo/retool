const all_values_buckets = [];
const target_keys = key_selector_input.value;

for (let i = 0; i < target_keys.length; i++) {
  const value = target_keys[i];
  current_key_getter.setValue(value);

  const alreadyExists = all_values_buckets.find(buck => buck.fieldName === value);

  if (!alreadyExists) {
    const results = await get_ticket_api_values.trigger();

    if (results && results.length > 0) {
      for (let j = 0; j < results.length; j++) {
        const rowValue = results[j];
        all_values_buckets.push({
          fieldName: value,
          fieldValue: rowValue.key,
          renamedValue: rowValue.key,
          count: rowValue.doc_count,
          shouldConfig: true
        });
      }
    } else {
      // if no value found (custom field) then push example
      all_values_buckets.push({
        fieldName: value,
        fieldValue: 'ExampleValue',
        renamedValue: 'ExampleValue',
        count: 0,
        shouldConfig: true
      });
      has_incomplete_segmentations.setValue(true)
    }
  }
}

value_buckets.setValue(all_values_buckets);