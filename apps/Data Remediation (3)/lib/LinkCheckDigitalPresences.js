var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.digitalPresences = []

i = 0;
for (let website_item of Websites.value){
  var actual_website_item;
  try{
    actual_website_item = website_item.item.value.trim()
  } catch (e) {
    actual_website_item = website_item.trim()
  }
  //  console.log("website_item: ", actual_website_item)
  //  console.log("master record website_item: ", masterRecordAllAttributeHashDict.value.website[i][2].trim())
try{
  if ( actual_website_item == masterRecordAllAttributeHashDict.value.website[i][2].trim() ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Digital Presences')
    unlinked_attributes.digitalPresences.push({"iteration":i,"new_value":actual_website_item,"attribute_flag":"website","ItemObjectHash":masterRecordAllAttributeHashDict.value.website[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.website[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.website[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Digital Presences')
  unlinked_attributes.digitalPresences.push({"iteration":i,"new_value":actual_website_item,"attribute_flag":"website","ItemObjectHash":masterRecordAllAttributeHashDict.value.website[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.website[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.website[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
}

i=0
for (let new_website_item of NewWebsites.value){
try{
    
  if ((new_website_item.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Digital Presences')
    unlinked_attributes.digitalPresences.push({"type":"1","iteration":"new","new_value":new_website_item.trim(),"attribute_flag":"website","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Digital Presences')
  unlinked_attributes.digitalPresences.push({"type":"1","iteration":"new","new_value":new_website_item.trim(),"attribute_flag":"website","remediation_action":"create"})
}
  i+=1
}
//--------------------------------------------------------------

i = 0;
for (let email_item of Emails.value){
//  console.log("email: ", email_item)
try{
  //  console.log("email_item: ", email_item)
  //  console.log("iconHiddenFlag email_item: ", iconHiddenFlag.value.email[i])
  //  console.log("i: ", i)
  
  if ( email_item.trim() == masterRecordAllAttributeHashDict.value.email[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //  unlinked_attributes_msg.push('Digital Presences')
    unlinked_attributes.digitalPresences.push({"iteration":i,"new_value":email_item.trim(),"attribute_flag":"email","ItemObjectHash":masterRecordAllAttributeHashDict.value.email[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.email[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.email[i][3] == 'RECREATE' ? "recreate" : "update"})
    //flag = true
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Digital Presences')
  unlinked_attributes.digitalPresences.push({"iteration":i,"new_value":email_item.trim(),"attribute_flag":"email","ItemObjectHash":masterRecordAllAttributeHashDict.value.email[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.email[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.email[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
}
i=0
for (let new_email_item of NewEmails.value){
try{
    
  if ((new_email_item.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Digital Presences')
    unlinked_attributes.digitalPresences.push({"type":"2","iteration":"new","new_value":new_email_item.trim(),"attribute_flag":"email","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Digital Presences')
  unlinked_attributes.digitalPresences.push({"type":"2","iteration":"new","new_value":new_email_item.trim(),"attribute_flag":"email","remediation_action":"create"})
}
  i+=1
}
//  console.log("B4 ADDR DISABLE FLAG: ", flag)

unlinkedAttributesToLink.setValue(unlinked_attributes)