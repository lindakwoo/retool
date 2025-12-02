var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.businessDescriptions = []

i = 0;
for (let busi_desc_item of BusinessDescriptionsVariableList.value){
  let busi_language = busi_desc_item.language
  let busi_value = busi_desc_item.value
  let busi_flag = busi_desc_item.deleteFlag
  //  console.log("Business Language: ", busi_language)
  //  console.log("Business Value: ", busi_value)
  //  console.log("Business Flag: ", busi_flag)
try{
  //  console.log("address_item: ", address_item)
  //  console.log("address_item 2: ", iconHiddenFlag.value.address[i][1]) 
  if ( masterRecordAllAttributeHashDict.value.business_description[i][2][0] == undefined || ( ( busi_language == masterRecordAllAttributeHashDict.value.business_description[i][2][0]) && busi_value == masterRecordAllAttributeHashDict.value.business_description[i][2][1] && busi_flag == false)) {
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Business Descriptions')
    if (deleteFlag2[i].value == false){
      unlinked_attributes.businessDescriptions.push({"iteration":i,"new_value":[busi_language,busi_value],"attribute_flag":"business_description","ItemObjectHash":masterRecordAllAttributeHashDict.value.business_description[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.business_description[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.business_description[i][3] == 'RECREATE' ? "recreate" : "update"})
    } else {
      unlinked_attributes.businessDescriptions.push({"iteration":i,"new_value":["",""],"attribute_flag":"business_description","ItemObjectHash":masterRecordAllAttributeHashDict.value.business_description[i][1],"remediation_action":"delete"})
    }
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Business Descriptions')
  if (busi_flag == false){
      unlinked_attributes.businessDescriptions.push({"iteration":i,"new_value":[busi_language,busi_value],"attribute_flag":"business_description","ItemObjectHash":masterRecordAllAttributeHashDict.value.business_description[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.business_description[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.business_description[i][3] == 'RECREATE' ? "recreate" : "update"})
    } else {
      unlinked_attributes.businessDescriptions.push({"iteration":i,"new_value":["",""],"attribute_flag":"business_description","ItemObjectHash":masterRecordAllAttributeHashDict.value.business_description[i][1],"remediation_action":"delete"})
    }
  }
  i+=1
} 

try{
    
  if ((newBusinessDescLanguageInputField.value == undefined || newBusinessDescInputField.value == "")  ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Business Descriptions')
    unlinked_attributes.businessDescriptions.push({"type":"","iteration":"new","new_value":[newBusinessDescLanguageInputField.value,newBusinessDescInputField.value],"attribute_flag":"business_description","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Business Descriptions')
  unlinked_attributes.businessDescriptions.push({"type":"","iteration":"new","new_value":[newBusinessDescLanguageInputField.value,newBusinessDescInputField.value],"attribute_flag":"business_description","remediation_action":"create"})
}

// console.log("DISABLE FLAG: ", flag)

unlinkedAttributesToLink.setValue(unlinked_attributes)