const renamed_data= key_selector_input.value.map(val => ({old: val, new: val.replace('_', ' ')}))
renamed_table_data.setValue(renamed_data)