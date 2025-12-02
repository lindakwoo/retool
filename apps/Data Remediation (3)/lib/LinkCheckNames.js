var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.names = []

i = 0
for (let company_name_item of CompanyNames.value){
  try{
//   console.log("company_name_item: ", company_name_item)
  //  console.log("iconHiddenFlag company_name_item: ", iconHiddenFlag.value.company_name[i])
  //  console.log("i: ", i)
    
  if ( company_name_item.trim() == masterRecordAllAttributeHashDict.value.company_name[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names') 
    unlinked_attributes.names.push({"iteration":i, "new_value":company_name_item.trim(), "attribute_flag":"company_name", "ItemObjectHash":masterRecordAllAttributeHashDict.value.company_name[i][1], "remediation_action":masterRecordAllAttributeHashDict.value.company_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.company_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration":i, "new_value":company_name_item.trim(), "attribute_flag":"company_name", "itemObjectHash":masterRecordAllAttributeHashDict.value.company_name[i][1], "remediation_action":masterRecordAllAttributeHashDict.value.company_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.company_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
} 

try{
    
  if ((newCompanyName.value.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"1","iteration":"new","new_value":newCompanyName.value.trim(),"attribute_flag":"company_name","remediation_action":"create"})
  } 
} catch (e){
  // console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"1","iteration":"new","new_value":newCompanyName.value.trim(),"attribute_flag":"company_name","remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)

//--------------------------------------------------------------

i = 0;
for (let company_name_local_item of CompanyLocalNames.value){
   //  console.log("company_name_local_item: ", company_name_local_item)
  //  console.log("iconHiddenFlag company_name_local_item: ", iconHiddenFlag.value.company_name_local[i])
  //  console.log("i: ", i)
  var company_local_name = company_name_local_item.name.trim()
  var company_local_language = company_name_local_item.language.trim()
    
try{
  if ( (company_local_name == masterRecordAllAttributeHashDict.value.company_name_local[i][2][0] && company_local_language == masterRecordAllAttributeHashDict.value.company_name_local[i][2][1]) ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"iteration":i, "new_value":[company_local_name,company_local_language], "attribute_flag":"company_name_local", "ItemObjectHash":masterRecordAllAttributeHashDict.value.company_name_local[i][1], "remediation_action":masterRecordAllAttributeHashDict.value.company_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.company_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration":i, "new_value":[company_local_name,company_local_language], "attribute_flag":"company_name_local", "ItemObjectHash":masterRecordAllAttributeHashDict.value.company_name_local[i][1], "remediation_action":masterRecordAllAttributeHashDict.value.company_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.company_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
} 

try{
    
  if (newCompanyLocalName.value.trim() == "" ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"type":"1", "iteration":"new", "new_value":[newCompanyLocalName.value.trim(),newCompanyLocalNameLanguage.value], "attribute_flag":"company_name_local", "remediation_action":"create"})
  } 
} catch (e){
  // console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"1", "iteration":"new", "new_value":[newCompanyLocalName.value.trim(),newCompanyLocalNameLanguage.value], "attribute_flag":"company_name_local", "remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)

//--------------------------------------------------------------

i = 0;
for (let item of prevNames.value){
    let prev_name_item = item.name;
  var prevDateSince = ''
  try {
    prevDateSince = item.dateSince.split('T')[0];
    const [year, month, day] = prevDateSince.split("-");
    prevDateSince = `${day}-${month}-${year}`;
  } catch (e) {
    prevDateSince = "";
  }

  var prevDateUntil = ''
  try {
    prevDateUntil = item.dateUntil.split('T')[0];
    const [year, month, day] = prevDateUntil.split("-");
    prevDateUntil = `${day}-${month}-${year}`;
  } catch (e) {
    prevDateUntil = "";
  }
  //  console.log("prev_name_item: ", prev_name_item)
  //  console.log("prevDateSince: ", prevDateSince)
  //  console.log("prevDateUntil: ", prevDateUntil)
  //  console.log("iconHiddenFlag prev_name_item: ", iconHiddenFlag.value.prev_name[i])
  //  console.log("masterhash prev_name_item: ", masterRecordAllAttributeHashDict.value.prev_name[i])
  //  console.log("i: ", i)
try{
  if ( (prev_name_item.trim() == masterRecordAllAttributeHashDict.value.prev_name[i][2][0] && prevDateSince == masterRecordAllAttributeHashDict.value.prev_name[i][2][1] && prevDateUntil == masterRecordAllAttributeHashDict.value.prev_name[i][2][2]) ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"iteration" : i,
"new_value" : [eachPrevName.value.trim(), dateSince.formattedValue, dateUntil.formattedValue],
  "attribute_flag" : "prev_name",
"ItemObjectHash" : masterRecordAllAttributeHashDict.value.prev_name[i][1],
  "remediation_action" : masterRecordAllAttributeHashDict.value.prev_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.prev_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration" : i,
"new_value" : [eachPrevName.value.trim(), dateSince.formattedValue, dateUntil.formattedValue],
  "attribute_flag" : "prev_name",
"ItemObjectHash" : masterRecordAllAttributeHashDict.value.prev_name[i][1],
  "remediation_action" : masterRecordAllAttributeHashDict.value.prev_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.prev_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
}

try{
    
  if (newPrevName.value.trim() == ""){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"type":"3",
"iteration" : "new",
"new_value" : [newPrevName.value.trim(), newDateSince.formattedValue, newDateUntil.formattedValue],  "attribute_flag" : "prev_name",
  "remediation_action" : "create"})
  } 
} catch (e){
  // console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"3",
"iteration" : "new",
"new_value" : [newPrevName.value.trim(), newDateSince.formattedValue, newDateUntil.formattedValue],  "attribute_flag" : "prev_name",
  "remediation_action" : "create"})
}

//  console.log("DISABLE FLAG: ", flag)

//--------------------------------------------------------------

i = 0;
for (let prev_name_local_item of prevLocalNames.value){
  //  console.log("prev_name_local_item: ", prev_name_local_item)
  //  console.log("iconHiddenFlag prev_name_local_item: ", iconHiddenFlag.value.prev_name_local[i])
  //  console.log("i: ", i)
try{
  if ( prev_name_local_item.trim() == masterRecordAllAttributeHashDict.value.prev_name_local[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"iteration":i,"new_value":prev_name_local_item.trim(),"attribute_flag":"prev_name_local","ItemObjectHash":masterRecordAllAttributeHashDict.value.prev_name_local[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.prev_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.prev_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration":i,"new_value":prev_name_local_item.trim(),"attribute_flag":"prev_name_local","ItemObjectHash":masterRecordAllAttributeHashDict.value.prev_name_local[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.prev_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.prev_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
}

try{
    
  if ((newPrevLocalName.value.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"type":"3","iteration":"new","new_value":newPrevLocalName.value.trim(),"attribute_flag":"prev_name_local","remediation_action":"create"})
  } 
} catch (e){
  // console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"3","iteration":"new","new_value":newPrevLocalName.value.trim(),"attribute_flag":"prev_name_local","remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)

//--------------------------------------------------------------

i = 0;
for (let aka_name_item of akaNames.value){

try{
  //  console.log("aka_name_item: ", aka_name_item)
  //  console.log("iconHiddenFlag aka_name_item: ", iconHiddenFlag.value.aka_name[i])
  //  console.log("i: ", i)
  
  if ( aka_name_item.trim() == masterRecordAllAttributeHashDict.value.aka_name[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"iteration":i,"new_value":aka_name_item.trim(),"attribute_flag":"aka_name","ItemObjectHash":masterRecordAllAttributeHashDict.value.aka_name[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.aka_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.aka_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration":i,"new_value":aka_name_item.trim(),"attribute_flag":"aka_name","ItemObjectHash":masterRecordAllAttributeHashDict.value.aka_name[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.aka_name[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.aka_name[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
} 

try{
    
  if ((newAkaName.value.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"type":"2","iteration":"new","new_value":newAkaName.value.trim(),"attribute_flag":"aka_name","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"2","iteration":"new","new_value":newAkaName.value.trim(),"attribute_flag":"aka_name","remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)

//--------------------------------------------------------------
i = 0;
for (let aka_name_local_item of akaLocalNames.value){
  //  console.log("aka_name_local_item: ", aka_name_local_item)
  //  console.log("iconHiddenFlag aka_name_local_item: ", iconHiddenFlag.value.aka_name_local[i])
  //  console.log("i: ", i)
try{
  if ( aka_name_local_item.trim() == masterRecordAllAttributeHashDict.value.aka_name_local[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"iteration":i,"new_value":aka_name_local_item.trim(),"attribute_flag":"aka_name_local","ItemObjectHash":masterRecordAllAttributeHashDict.value.aka_name_local[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.aka_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.aka_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"iteration":i,"new_value":aka_name_local_item.trim(),"attribute_flag":"aka_name_local","ItemObjectHash":masterRecordAllAttributeHashDict.value.aka_name_local[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.aka_name_local[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.aka_name_local[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
} 

try{
    
  if ((newAkaLocalName.value.trim() == "")){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Names')
    unlinked_attributes.names.push({"type":"1","iteration":"new","new_value":newAkaLocalName.value.trim(),"attribute_flag":"aka_name_local","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Names')
  unlinked_attributes.names.push({"type":"1","iteration":"new","new_value":newAkaLocalName.value.trim(),"attribute_flag":"aka_name_local","remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)

unlinkedAttributesToLink.setValue(unlinked_attributes)