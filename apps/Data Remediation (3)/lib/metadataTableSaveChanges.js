let changes = Object.entries(entityMetadataTable.changesetObject);
let data = entityMetadataList.value;

//  console.log("changes: ", changes)
//  console.log("data: ", data)

changes.forEach(change => {
  data[change[0]]["link"] = change[1]['links'];

  //add validation logic for making sure each category is tied to one document.
})

//CHECK FOR DUPLICATE LINKS
const allCategories = data.flatMap(obj => obj.link);

const categoryCount = {};
allCategories.forEach(cat => {
  categoryCount[cat] = (categoryCount[cat] || 0) + 1;
});

const duplicates = Object.keys(categoryCount).filter(cat => categoryCount[cat] > 1);

//  console.log("DUPS: ", duplicates);

if (duplicates.length != 0 ){

  console.log("DUPLICATE CATEGORIES FOUND ACROSS ONE OR MORE DOCS")
  
  utils.showNotification({
  title : "Error",
  description: `Duplicate Categories Across One or more Docs Found In Links`,
  notificationType: "error",
  duration: 3,
  });
} else {
  //  console.log("Updated data: ", data)

  entityMetadataList.setValue(data)
  entityMetadataTable.refresh()
  documentManagement.hide()
}

