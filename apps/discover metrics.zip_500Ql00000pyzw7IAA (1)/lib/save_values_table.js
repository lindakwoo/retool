const changed = value_selector.changesetArray;
Object.entries(changed).forEach(change => {
   const index = [value_selector.data.findIndex(selects => selects.fieldValue === change[1].fieldValue)]
  const target = value_selector.data[index]
  const existing = Object.assign({}, target)
  const newTarget = change[1]
  if(newTarget.shouldConfig !== null && newTarget.shouldConfig !== undefined) {
    existing.shouldConfig = newTarget.shouldConfig
  }
  if(newTarget.renamedValue) {
    existing.renamedValue = newTarget.renamedValue
  }
  console.log(existing)
  value_buckets.setIn(index, existing)
 })
