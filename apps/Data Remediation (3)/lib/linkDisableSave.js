var flag = false
let i;
//  var unlinked_attributes_msg = []
var unlinked_attributes = unlinkedAttributesToLink.value

var tableData = entityMetadataList.value

var uniqueCategoriesSet = [...new Set(tableData.flatMap(obj => obj.link))];
var uniqueCategories = [...uniqueCategoriesSet];

console.log("uniqueCategories: ", uniqueCategories)


// var unlinked_categories = []
//  console.log("uniqueCategories: ", uniqueCategories)
const str_uniqueCategories = uniqueCategories.toString()

//  console.log("str_uniqueCategories: ", str_uniqueCategories)
for (var category in unlinked_attributes){
  console.log(str_uniqueCategories.includes(category))
  
  if (unlinked_attributes[category].length != 0 && !str_uniqueCategories.includes(category)){
    //  console.log("INSIDE FLAG")
    // unlinked_categories.push(category) 
    flag = true
  }
}

//  const uniqueValues = [...new Set(unlinked_attributes_msg)];
//  const mySet = new Set(unlinked_attributes_msg);

const str_unlinked = Object.entries(unlinked_attributes)
  .filter(([_, value]) => Array.isArray(value) && value.length > 0) // keep only non-empty arrays
  .map(([key]) => {
    let spaced = key.replace(/([A-Z])/g, ' $1'); // add space before capitals
    return spaced.charAt(0).toUpperCase() + spaced.slice(1); // capitalize first letter
  })
  .join(', ');

console.log('str_unlinked: ', str_unlinked)


console.log("FINAL DISABLE FLAG: ", flag)
console.log("UNLINKED ATTRIBUTES: ", str_unlinked)
console.log("Links to be Created: ", unlinked_attributes)


//  if (CurrentUserObj.value.user_role[0] == 'super_admin'){
//    flag = false
//  }

return [flag, str_unlinked]