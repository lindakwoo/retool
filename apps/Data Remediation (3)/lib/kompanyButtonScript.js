var metadata_item = {   
  "user_id" : CurrentUserObj.value.user_id.toLowerCase(),
  "orbis_id" : selectedCompany.value.header.entityID,
  "bvd_id" : selectedCompany.value.header.bvdID,
  "entity_id" :  selectedCompany.value.header.entityID, 
  "ticket_id" :  "",
  "doc_category" :  "" ,   
  "doc_name" : "kompany api",
  "linked_remediated_fields" : [],
  "remediation_verification_source": "kompany_api",
  "comments" :  "" ,
  "document_url" :  "" ,     
  "remediated_action" : "",
  "doc_language" :  "" ,             
  "product" :  "firmographics"
}
createMetadataItem.setValue(metadata_item)

console.log("Kompany Doc Item: ", metadata_item)


var response = await CreateMetadataRecord.trigger()

// Notification Banner
if (response.statusCode === 200){
  utils.showNotification({
    title : "Success",
    description: response.body,
    notificationType: "success",
    duration: 3,
  });
} else {
  utils.showNotification({
  title : "Error",
  description: response.body,
  notificationType: "error",
  duration: 3,
  });
}

console.log("CreateMetadataRecord RESPONSE : ", response)
 ReadMetadataRecord.trigger().then(linkKompanyAPIButton.setHidden(true))

loadingPopUp.hide(true)