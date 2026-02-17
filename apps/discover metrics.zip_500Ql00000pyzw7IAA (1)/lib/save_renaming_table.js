const changed = renaming_table.changesetArray;
Object.entries(changed).forEach(change => {
  const index = [change[0]]
  const targetNew = change[1]
  renamed_table_data.setIn(index, targetNew)
 })
