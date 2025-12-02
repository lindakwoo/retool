// END OF CREATING LINKS FOR REST OF CHANGES
var master_dict = masterRecordAllAttributeHashDict.value;
var unlinked_attributes = unlinkedAttributesToLink.value;
var current_linked_attr = masterRecordLinkedRemFields.value;
//  var session_linked_attr = sessionLinkedFields.value;
//  const doc_id = latestDocSavedLink.value
//  console.log("Create Remainging Links for ", doc_id)
console.log("Remainging Links: ", unlinked_attributes)

var sessionLinks = {};
const masterDict = {};
var tableData = entityMetadataList.value

tableData.forEach(doc => {
  if (doc.link != []){
    if (!masterDict[doc.link]) {
      masterDict[doc.link] = [];
    }
    masterDict[doc.link].push(doc.doc_id);
  }
});

//  console.log("masterDict: ", masterDict)


for (var category_key in unlinked_attributes){
  var category_links = []
  const masterDictTemp = Object.entries(masterDict).find(([k]) => k.includes(category_key))?.[1];
  if (typeof (masterDictTemp) == 'undefined'){
    continue
  }
  console.log("TEMP: ", masterDictTemp)
  var doc_id = masterDictTemp[0]
  //  console.log("DOC_ID: ", doc_id)
  
  for (var item of unlinked_attributes[category_key]){
  
    console.log("Attribute Being Saved: ", item);
    var updated_attr = item;
  
    var rem_action
    if (updated_attr.remediation_action == 'create'){
      rem_action = 'NEW'
    } else if (updated_attr.remediation_action == 'update'){
      rem_action = 'OVERWRITE'
    } else if (updated_attr.remediation_action == 'recreate'){
      rem_action = 'RECREATE'
    } else if (updated_attr.remediation_action == 'delete'){
      rem_action = 'DELETE'
    }
    
    var curr_value = updated_attr.new_value;
  
    // Need to check for company_name_local and prev_name because both have more than one component for value
    // business desc and address have flags, which causes them to have pre built delete links
  
    if (['prev_name', 'company_name_local'].includes(updated_attr.attribute_flag)){
      if(curr_value[0] == ""){
          if (rem_action != "NEW"){
          rem_action = 'DELETE'     
          }
      }
    } else {
      if(curr_value == ""){
        if(updated_attr.attribute_flag != 'identifier'){
          if (rem_action != "NEW"){
          rem_action = 'DELETE'     
          }
        } else {
          rem_action = 'DELETE'     
        }
      }
    }
    
        
    var type
    var prev_value
    var hash
    if (rem_action == 'NEW'){
      hash = ""
      type = updated_attr.type
      if (updated_attr.attribute_flag == 'address'){
        prev_value = ["","","","","","","","","","", ""]
      } else if (['business_description', 'company_name_local'].includes(updated_attr.attribute_flag)){
        prev_value = ["",""]
      } else if (['prev_name'].includes(updated_attr.attribute_flag)){
        prev_value = ["","",""]
      } else {
        prev_value = ""
      }
    } else {
      prev_value = master_dict[updated_attr.attribute_flag][updated_attr.iteration][2];
      hash = master_dict[updated_attr.attribute_flag][updated_attr.iteration][1];
      type = master_dict[updated_attr.attribute_flag][updated_attr.iteration][0];
    }
    
    if(['name', 'identifier', 'website'].includes(updated_attr.attribute_flag)){
      prev_value = prev_value.trim()
      curr_value = curr_value.trim()
   }
    
    var new_link_item = {
      "type" : type,
      "curr_value": curr_value,
      "prev_value" : prev_value,
      "ItemObjectHash" : hash,
      "label" : updated_attr.attribute_flag,
      "iteration" : updated_attr.iteration,
      "remediation_action" : rem_action
    }
    //  console.log("New Link Being Saved: ", new_link_item);
    
    var id
    if (doc_id != ""){
      id = doc_id
    } else {
      id = "kompany_api"
    }

    //NEEDED FOR AUDIT TRAIL RECORDS, TO KEEP TRACK OF LINKS TIED TO DOCUMENTS
    if (!(doc_id in sessionLinks)){
      sessionLinks[doc_id] = [new_link_item]
    } else {
      sessionLinks[doc_id].push(new_link_item)
    }
    console.log("Curr Linked Docs Before: ", current_linked_attr)
  
    ///////////// Start Main List of Linked Docs //////////////

    
    
    var update_flag = false;
    for (var doc_list_id in current_linked_attr){
      var doc_data = current_linked_attr[doc_list_id]
      //  console.log("Doc Data: ", doc_data)
    
      var index = 0;
      for (var row_data of doc_data){
        //  console.log("Row Data: ", row_data)
        //  console.log("Hash: ", hash)
        
        if (row_data.ItemObjectHash === hash && hash != ""){
          if (new_link_item.label == 'entity_info' && row_data.iteration == new_link_item.iteration){
            if (doc_list_id == id){
              console.log('Entity Info Link Found In Same Doc')
              update_flag = true;
              row_data.type = new_link_item.type
              row_data.curr_value = new_link_item.curr_value
              row_data.prev_value = new_link_item.prev_value
              row_data.iteration = new_link_item.iteration
              row_data.remediation_action = new_link_item.remediation_action
            } else {
              console.log('Entity Info Link Found In Different Doc')
              //  console.log("Before Splice: ", doc_data)
              current_linked_attr[doc_list_id].splice(index, 1);
              //  console.log("After Splice: ", current_linked_attr[doc_list_id])
            }
          } else if (new_link_item.label != 'entity_info'){
            if (doc_list_id == id){
              console.log('Link Found In Same Doc')
              update_flag = true;
              row_data.type = new_link_item.type
              row_data.curr_value = new_link_item.curr_value
              row_data.prev_value = new_link_item.prev_value
              row_data.iteration = new_link_item.iteration
              row_data.remediation_action = new_link_item.remediation_action
            } else {
              console.log('Link Found In Different Doc')
              //  console.log("Before Splice: ", doc_data)
              current_linked_attr[doc_list_id].splice(index, 1);
              //  console.log("After Splice: ", current_linked_attr[doc_list_id])
            }
          }
        }
        index += 1
      }
    }
    if (update_flag == false){
      console.log('Inserting New Doc Link for ', id)

      //Add to list for catgory
      category_links.push(new_link_item)


      // let temp = current_linked_attr[id]
      // temp.push(new_link_item)
      // current_linked_attr[id] = temp
    }
  }
    console.log
    //  console.log("current_linked_attr[doc_id]: ", typeof(current_linked_attr[doc_id]))
    //  console.log("category_links: ", category_links)

    //Add array of new links to existing array for respective docs
    if (typeof(current_linked_attr[doc_id]) == 'undefined'){
      //  console.log("ADDING: undefined")
      current_linked_attr[doc_id] = category_links;
    } else {
      //  console.log("ADDING: concat")
      current_linked_attr[doc_id] = current_linked_attr[doc_id].concat(category_links);
    }
}
  ///////////// End Main List of Linked Docs //////////////
  
  


// REMOVE LINKS THAT ARE NEW AND ARE EMPTY STRINGS POST SAVE
for (var doc_list_id in current_linked_attr){
    var doc_data = current_linked_attr[doc_list_id]
    //  console.log("Doc Data: ", doc_data)
  
    var index = 0;
    for (var row_data of doc_data){
      //  console.log("Row_Data: ", row_data)
      if (row_data.remediation_action.toLowerCase().includes('new') && row_data.new_value == "" )
        current_linked_attr[doc_list_id].splice(index, 1);
    }
  }

  //  for (var doc_list_id in session_linked_attr){
  //    var doc_data = session_linked_attr[doc_list_id]
  //    console.log("SESSION Doc Data: ", doc_data)
  
  //    var index = 0;
  //    for (var row_data of doc_data){
  //      if (row_data.remediation_action.toLowerCase().includes('new') && row_data.new_value == "" )
  //        session_linked_attr[doc_list_id].splice(index, 1);
  //    }
  //  }

  console.log("New Master Linked List: ", current_linked_attr)
  //  console.log("New Session Linked List: ", session_linked_attr)

  //  sessionLinkedFields.setValue(session_linked_attr)
  masterRecordLinkedRemFields.setValue(current_linked_attr)
  sessionLinkedFields.setValue(sessionLinks)
  
  
//    var iconFlag = iconHiddenFlag.value
//    var attribute_temp = iconFlag[updated_attr.attribute_flag]
//    var icon_temp = {}
//    icon_temp[updated_attr.iteration] = [true, new_link_item.curr_value, new_link_item.remediation_action, new_link_item.type]
  
//    iconFlag[updated_attr.attribute_flag] = Object.assign({}, attribute_temp, icon_temp);
//    iconHiddenFlag.setValue(iconFlag)
//    console.log("Icon Flag Link: ", iconFlag)


// END OF CREATING LINKS FOR REST OF CHANGES

//  console.log("here")
// Create Payload for Updating Metadata Record
var masterValues = current_linked_attr

//  console.log("current_linked_attr: ", current_linked_attr)

var update_body = []
for (var item_key in current_linked_attr){
  // console.log("item")
  //  console.log("item_key: ", item_key)
  if (current_linked_attr[item_key].length > 0){
    var temp = {
      "linked_remediated_fields" : current_linked_attr[item_key]
    }

    const uniqueLabels = [...new Set(current_linked_attr[item_key].flatMap(obj => obj.label))];

    const uniqueCategories = new Set()

    uniqueLabels.forEach(label => {
      if (label.includes("name")){
        uniqueCategories.add('Names')
      } else if (label.includes("business_description")){
        uniqueCategories.add('Business Description')
      } else if (label.includes("website") || label.includes("email")){
        uniqueCategories.add('Digital Presences')
      } else if (label.includes("address")){
        uniqueCategories.add('Addresses')
      } else if (label.includes("identifier")){
        uniqueCategories.add('Identifiers')
      } else if (label.includes("entity_info")){
        uniqueCategories.add('Legal Information')
      }
    });

    // Convert Set to Array
    const uniqueCategoriesArr = Array.from(uniqueCategories);
    
    // Join the array elements
    const uniqueCategoriesStr = uniqueCategoriesArr.join(", ");

    console.log("Categorys for Doc ID: ", item_key, ' - ', uniqueCategoriesStr)
    
      
    if (item_key != 'kompany_api'){
      temp['doc_id'] = item_key
      temp['doc_category'] = uniqueCategoriesStr
    } else {
      temp['remediation_verification_source'] = item_key
      temp['orbis_id'] = SearchedEntity.value; //masterRecordTable.data[0].EntityInfo.Item.orbisID
    }
    //  console.log("Tem: " ,temp)
    update_body.push(temp)
  }
}

updateMetadataItem.setValue(update_body)
console.log("Updating Item: ", update_body)


var response = await UpdateMetadataRecord.trigger()

entityMetadataList.setValue([])

console.log("UpdateMetadataRecord RESPONSE : ", response)

//  console.log('Running ReadMetadataRecord')
//  ReadMetadataRecord.trigger()

createAuditTrail.trigger()


