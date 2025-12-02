var doc_category = ''
if (docUploadCategory.value == null){
  doc_category = ""
} else {
  doc_category = docUploadCategory.value.toLowerCase().toString()
}
var metadata_item = [{
  "doc_id" : documentID.value,    
  "user_id" : CurrentUserObj.value.user_id.toLowerCase(),
  "ticket_id" :  docUploadTicketID.value.toLowerCase() ,
  "doc_name" : docUploadDocName.value.toLowerCase(),
  "doc_category" :  doc_category ,
  "comments" :  docUploadComments.value.toLowerCase() ,    
  "remediated_action" : doc_remediated_action.value,
  "doc_language" :  docUploadLanguage.value.toLowerCase() ,             
  "product" :  docUploadProduct.value.toLowerCase() 
}]
updateMetadataItem.setValue(metadata_item)
console.log("Updating Doc Item: ", metadata_item)


var response = await UpdateMetadataRecord.trigger()

console.log("UpdateMetadataRecord RESPONSE : ", response)

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

console.log('Running ReadMetadataRecord')
ReadMetadataRecord.trigger()

loadingPopUp.hide(true)