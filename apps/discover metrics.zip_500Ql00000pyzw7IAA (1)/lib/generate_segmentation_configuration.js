has_custom_indexing_field.setValue(false)
const formatKey = (fieldName, fieldValue) => {
const isZdCustomField = Boolean(Number(fieldName))
if(helpdesk.value === 'zendesk' && isZdCustomField && Number(fieldName) > 1000) {
    // Field is custom zd field
    has_custom_indexing_field.setValue(true)
    return `(json_extract_scalar(custom_indexing_field_json, '$.${fieldName}') LIKE '%${fieldValue}%')`
  }
 else {
   return `(json_extract_scalar(api_data_json, '$.${fieldName}') LIKE '%${fieldValue}%')`
 }
}
const renamed = renamed_table_data.value
const fieldValCombos = value_buckets.value
const config = {}
const renamingMap = {}
renamed.forEach(field => {
  const renamedValue = field.new
  const key = field.old
  config[renamedValue] = {}
  renamingMap[key] = renamedValue
})
fieldValCombos.forEach(combo => {
  if(!combo.shouldConfig) return
  const fn = combo.fieldName
  const fv = combo.fieldValue
  const renamedFv = combo.renamedValue
  const thisKey = formatKey(fn, fv);
  const renamedValue = renamingMap[fn]
  config[renamedValue][thisKey] = renamedFv
})
return config