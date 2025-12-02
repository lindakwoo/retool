var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.identifiers = []

var i = 0;
for (let identifier_item of CurIdentifiers.value){

try{
  //  console.log("identifier_item type: ", identifier_item.item.type)
  //  console.log("identifier_item value: ", identifier_item.item.id)
  //  console.log("iconHiddenFlag identifier_item: ", iconHiddenFlag.value.identifier[i])
  //  console.log("i: ", i)
  
  if ( identifier_item.item.id.trim() == masterRecordAllAttributeHashDict.value.identifier[i][2] ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Identifiers')
    unlinked_attributes.identifiers.push({"iteration":i,"new_value":identifier_item.item.id.trim(),"attribute_flag":"identifier","ItemObjectHash":masterRecordAllAttributeHashDict.value.identifier[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.identifier[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.identifier[i][3] == 'RECREATE' ? "recreate" : "update"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Identifiers')
  unlinked_attributes.identifiers.push({"iteration":i,"new_value":identifier_item.item.id.trim(),"attribute_flag":"identifier","ItemObjectHash":masterRecordAllAttributeHashDict.value.identifier[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.identifier[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.identifier[i][3] == 'RECREATE' ? "recreate" : "update"})
  }
  i+=1
}

i = 0;
for (let identifier_item in NewIdentifiersValues.value){
  let iden_value = NewIdentifiersValues.value[identifier_item]
try{
  //  console.log("identifier_item: ", iden_value)
  
  if ( eachNewIdentifier.value == "" ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Identifiers')
    unlinked_attributes.identifiers.push({"type":newIdentifiersAdded.data[i].type,"iteration":"new-"+i,"new_value":eachNewIdentifier.value.trim(),"attribute_flag":"identifier","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Identifiers')
  unlinked_attributes.identifiers.push({"type":newIdentifiersAdded.data[i].type,"iteration":"new-"+i,"new_value":eachNewIdentifier.value.trim(),"attribute_flag":"identifier","remediation_action":"create"})
  }
  i+=1
}

//  console.log("LAST ATTR DISABLE FLAG: ", flag)

unlinkedAttributesToLink.setValue(unlinked_attributes)