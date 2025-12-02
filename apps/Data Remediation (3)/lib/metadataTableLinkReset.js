let data = entityMetadataList.value;

data.forEach(row => {
  row["link"] = [];
})

console.log("Link Data Reset")

entityMetadataList.setValue(data)
entityMetadataTable.refresh()


