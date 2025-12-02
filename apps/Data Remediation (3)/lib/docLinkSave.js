//  try{
  var selectedDoc = entityMetadataTable.selectedRow;
  //  console.log("Selceted Document Row: ", selectedDoc);
  
  //  console.log("Attribute Being Saved: ", linkAttributeItem.value);
  var updated_attr = linkAttributeItem.value;
  
  var master_dict = masterRecordAllAttributeHashDict.value;

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

  if(curr_value == ""){
    if(updated_attr.attribute_flag != 'identifier'){
      if (rem_action != "NEW"){
      rem_action = 'DELETE'     
      }
    } else {
      rem_action = 'DELETE'     
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
      prev_value = ["","", ""]
    } else {
      prev_value = ""
    }
  } else {
    prev_value = master_dict[updated_attr.attribute_flag][updated_attr.iteration][2];
    hash = master_dict[updated_attr.attribute_flag][updated_attr.iteration][1];
    type = master_dict[updated_attr.attribute_flag][updated_attr.iteration][0];
  }


  if(!['business_description', 'company_name_local', 'address', 'entity_info', "prev_name"].includes(updated_attr.attribute_flag)){
    //  console.log("Single Value, Trimming")
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
  
  const doc_id = selectedDoc.doc_id;
  
  var id
  if (doc_id != ""){
    id = doc_id
  } else {
    id = "kompany_api"
  }
  //  console.log("ID: ", id);


  ///////////// Start Main List of Linked Docs //////////////
  
  var current_linked_attr = masterRecordLinkedRemFields.value;
  //  console.log("Curr Linked Docs Before: ", current_linked_attr)
  
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
    console.log('Inserting New Doc Link')
    var temp = current_linked_attr[id]
    temp.push(new_link_item)
    current_linked_attr[id] = temp
  }

  ///////////// End Main List of Linked Docs //////////////

  ///////////// Start Session List of Linked Docs //////////////


  var session_linked_attr = sessionLinkedFields.value;
  //  console.log("Session Linked Docs Before: ", session_linked_attr)
  
  var session_update_flag = false;
  for (var doc_list_id in session_linked_attr){
    var doc_data = session_linked_attr[doc_list_id]
    //  console.log("Doc Data: ", doc_data)
  
    var index = 0;
    for (var row_data of doc_data){
      //  console.log("Row Data: ", row_data)
      //  console.log("Hash: ", hash)
      
      if (row_data.ItemObjectHash === hash && hash != ""){
        if (new_link_item.label == 'entity_info' && row_data.iteration == new_link_item.iteration){
          if (doc_list_id == id){
            console.log('Link Found In Same Doc')
            session_update_flag = true;
            row_data.type = new_link_item.type
            row_data.curr_value = new_link_item.curr_value
            row_data.prev_value = new_link_item.prev_value
            row_data.iteration = new_link_item.iteration
            row_data.remediation_action = new_link_item.remediation_action
          } else {
            console.log('Link Found In Different Doc')
            //  console.log("Before Splice: ", doc_data)
            session_linked_attr[doc_list_id].splice(index, 1);
            //  console.log("After Splice: ", session_linked_attr[doc_list_id])
          }
        } else if (new_link_item.label != 'entity_info'){
          if (doc_list_id == id){
            console.log('Link Found In Same Doc')
            session_update_flag = true;
            row_data.type = new_link_item.type
            row_data.curr_value = new_link_item.curr_value
            row_data.prev_value = new_link_item.prev_value
            row_data.iteration = new_link_item.iteration
            row_data.remediation_action = new_link_item.remediation_action
          } else {
            console.log('Link Found In Different Doc')
            //  console.log("Before Splice: ", doc_data)
            session_linked_attr[doc_list_id].splice(index, 1);
            //  console.log("After Splice: ", session_linked_attr[doc_list_id])
          }
        }
      } else if ( String(row_data.iteration).toLowerCase() === "new" && ["company_name", "company_name_local", "prev_name", "prev_name_local", "aka_name", "aka_name_local", "business_description", "address"].includes(row_data.label.toLowerCase()) && row_data.label.toLowerCase() == new_link_item.label.toLowerCase() ){
        if (doc_list_id == id ){
          console.log('Link Found In Same Doc')
          session_update_flag = true;
          row_data.type = new_link_item.type
          row_data.curr_value = new_link_item.curr_value
          row_data.prev_value = new_link_item.prev_value
          row_data.iteration = new_link_item.iteration
          row_data.remediation_action = new_link_item.remediation_action
        } else {
          console.log('Link Found In Different Doc')
          //  console.log("Before Splice: ", doc_data)
          session_linked_attr[doc_list_id].splice(index, 1);
          //  console.log("After Splice: ", session_linked_attr[doc_list_id])
        }
      }
      index += 1
    }
  }
  if (session_update_flag == false){
    console.log('Inserting New Doc Link')
    let temp = session_linked_attr[id]
    if (typeof temp === 'undefined'){
      temp = [new_link_item]
    } else {
      temp.push(new_link_item)
    }
    session_linked_attr[id] = temp
  }

  

  ///////////// End Session List of Linked Docs //////////////

  //save latest doc used for linking
  latestDocSavedLink.setValue(id)
  
  console.log("New Master Linked List: ", current_linked_attr)
  console.log("New Session Linked List: ", session_linked_attr)
  
  
  masterRecordLinkedRemFields.setValue(current_linked_attr)
  sessionLinkedFields.setValue(session_linked_attr)
  //  console.log("Curr Linked Docs After: ", current_linked_attr)
  
  documentManagement.setHidden(true)
  
  var iconFlag = iconHiddenFlag.value
  var attribute_temp = iconFlag[updated_attr.attribute_flag]
  var icon_temp = {}

  
  icon_temp[updated_attr.iteration] = [true, new_link_item.curr_value, new_link_item.remediation_action, new_link_item.type]
  
  iconFlag[updated_attr.attribute_flag] = Object.assign({}, attribute_temp, icon_temp);
  iconHiddenFlag.setValue(iconFlag)
  console.log("Icon Flag Link: ", iconFlag)

  utils.showNotification({
  title : "Success",
  //  description: `Attribute Successfully Linked to ${id}`,
  description: "Document linked sucessfully as evidence",
  notificationType: "success",
  duration: 1,
  });

//  } catch (e) {
//    console.log("Error Linking : ", e)
  
//    utils.showNotification({
//    title : "Error",
//    description: `Attribute Failed To Link`,
//    notificationType: "error",
//    duration: 3,
//    });
//  }

linkAttributeItem.setValue({
"iteration" : "",
"new_value" : "",
"attribute_flag" : ""
})