
//  var read_resp = await ReadMetadataRecord.trigger()
//  console.log("Response: ", read_resp)
var docList = entityMetadataList.value
//  console.log("Entity Documents: ", docList)

var linked_fields = {}
var key = ""

for (var record of docList){
  //  console.log("Doc Record: ", record)
  //  console.log("Linked Fields: ", JSON.parse(record.linked_remediated_fields))
  if (record.doc_id != ""){
    key = record.doc_id
  } else {
    key = "kompany_api"
  }
  linked_fields[key] = JSON.parse(record.linked_remediated_fields);
  
}
const flag = iconHiddenFlag.value
//  console.log("Hidden Value: ", )
//  console.log("Links Value: ", linked_fields)

var current_links = masterRecordLinkedRemFields.value
if (JSON.stringify(flag) == "{}" || current_links === {}){
  //  console.log("HERE")
  masterRecordLinkedRemFields.setValue(linked_fields)
} else {
  for (let key in linked_fields) {
    // Check if key is not already in dict1
    if (current_links.hasOwnProperty(key)) {
      // Add the key/value pair to dict1
      linked_fields[key] = current_links[key];
    }
  }
  //  linked_fields = current_links
}

masterRecordLinkedRemFields.setValue(linked_fields)
//  console.log(masterRecordTable.data[0].header.entityID, " Linked Fields: ", linked_fields)
sessionLinkedFields.setValue({})


var icon_link = {}
icon_link.company_name = {};
icon_link.company_name_local = {};
icon_link.prev_name = {};
icon_link.prev_name_local = {};
icon_link.aka_name = {};
icon_link.aka_name_local = {};
icon_link.email = {};
icon_link.entity_info = {};
icon_link.website = {};
icon_link.address = {};
icon_link.identifier = {};
icon_link.business_description = {};
icon_link.entity_info = {};

for (var item_key in linked_fields){
  var link_list = linked_fields[item_key]
  //  console.log("docs: ", item_key, " | rows: ", link_list)
  var temp = {};
  for (var link of link_list){
    //  console.log("Row: ", link)
    temp = icon_link[link.label]
    link.doc_id = item_key
    //  console.log("Link: ", link)
    //  temp.push(link)
    temp[link.ItemObjectHash] = link
    //  console.log("Item 2: ", temp)
    icon_link[link.label] = temp
    //  icon_link.push(link)
    //  console.log("Inside Icon Link: ", icon_link)
  }
  
}

//  console.log("Icon Link: ", icon_link)
linkingIconLinkDict.setValue(icon_link)

if (iconHiddenFlag.value === {}){
  iconHiddenFlag.setValue( {
  "address" : {},
  "aka_name" : {},
  "aka_name_local" : {},
  "company_name" : {},
  "company_name_local" : {},
  "email" : {},
  "entity_info" : {},
  "identifier" : {},
  "prev_name" : {},
  "prev_name_local" : {},
  "website" : {}
  } )
}