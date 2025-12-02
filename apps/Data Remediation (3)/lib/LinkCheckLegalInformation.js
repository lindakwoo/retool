var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.entityInfo = []

try{
  // standardized legal form
  
  if ( (legalFormSelect.value == null || legalFormSelect.value == masterRecordAllAttributeHashDict.value.entity_info.standard[2])  ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Legal Information')
    unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
      "iteration" : "standard",
      "new_value" : legalFormSelect.value,
      "attribute_flag" : "entity_info",
      "remediation_action" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Legal Information')
  unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
    "iteration" : "standard",
    "new_value" : legalFormSelect.value,
    "attribute_flag" : "entity_info",
    "remediation_action" : "update"})
  }

try{
    // national legal form

  if ( (nationalLegalFormValue.value == null || nationalLegalFormValue.value == masterRecordAllAttributeHashDict.value.entity_info.national[2]) ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Legal Information')
    unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
      "iteration" : "national",
      "new_value" : nationalLegalFormValue.value,
      "attribute_flag" : "entity_info",
      "remediation_action" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Legal Information')
  unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
    "iteration" : "national",
    "new_value" : nationalLegalFormValue.value,
    "attribute_flag" : "entity_info",
    "remediation_action" : "update"})
  }

  
  try{
    // state of incorporation

  if ( (stateOfIncorporationValue.value == null || stateOfIncorporationValue.value == masterRecordAllAttributeHashDict.value.entity_info.state_incorp[2]) ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Legal Information')
    unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
      "iteration" : "state_incorp",
      "new_value" : stateOfIncorporationValue.value,
      "attribute_flag" : "entity_info",
      "remediation_action" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Legal Information')
  unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
    "iteration" : "state_incorp",
    "new_value" : stateOfIncorporationValue.value,
    "attribute_flag" : "entity_info",
    "remediation_action" : "update"})
  }



  try{
    // incorporation date

  if ( (incopYear.value == null == masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2] || (String(incopYear.value) == masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2].split('-')[0] &&  (masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2].split('-')[1] ? ((incopMonth.value != '' || incopMonth.value != null) ? String(incopMonth.value) == masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2].split('-')[1] : true) : true) &&             (masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2].split('-')[2] ? ((incopDay.value != '' || incopDay.value != null) ? String(incopDay.value).padStart(2, '0') == masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2].split('-')[2] : true) : true)))  
   ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Legal Information')
    unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
      "iteration" : "incorp_date",
      "new_value" : (incopYear.value? (incopMonth.value? (incopDay.value? String(incopYear.value)+"-"+String(incopMonth.value)+"-"+String(incopDay.value).padStart(2, '0') : String(incopYear.value)+"-"+String(incopMonth.value)) : String(incopYear.value)) : null),
      "attribute_flag" : "entity_info",
      "remediation_action" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Legal Information')
  unlinked_attributes.entityInfo.push({"type" : selectedCompany.value.entityInfo.item.type,
    "iteration" : "incorp_date",
    "new_value" : (incopYear.value? (incopMonth.value? (incopDay.value? String(incopYear.value)+"-"+String(incopMonth.value)+"-"+String(incopDay.value).padStart(2, '0') : String(incopYear.value)+"-"+String(incopMonth.value)) : String(incopYear.value)) : null),
    "attribute_flag" : "entity_info",
    "remediation_action" : "update"})
  }

unlinkedAttributesToLink.setValue(unlinked_attributes)