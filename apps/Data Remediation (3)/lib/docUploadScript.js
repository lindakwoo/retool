  UploadPDF.reset()
  UploadPDFS3Doc.reset()
  //  console.log("UPLOADPDF BODY", UploadPDF.body)
  //  console.log("UploadPDFS3Doc BODY", UploadPDFS3Doc.body)

var resp
var doc_upload_flag = false
if (createMetadataItem.value.document_url != ""){
  resp = await ProcessingPDF.trigger()
  //  print("resp: ", resp)
    if (resp.statusCode != 200) {
      doc_upload_flag = true
    }
} else {
  await UploadPDF.trigger()
  //  console.log("URL: ", UploadPDFS3Doc)
  resp = await UploadPDFS3Doc.trigger()
  if (UploadPDFS3Doc.error != null) {
    //  console.log('Upload PDF')
    doc_upload_flag = true
  }
}

//  console.log("resp: ", resp)

if (doc_upload_flag == true) {
    utils.showNotification({
    title : "Error",
    description: "Error Occurred When Uploading PDF, If Error Persists please Upload Locally",
    notificationType: "error",
    duration: 3,
    });
} else {

  //  console.log("DOC ID: ", documentID.value)
  //  console.log("CREATE VALUE: ", createMetadataItem.value)
  var response = await CreateMetadataRecord.trigger()
  //  console.log("CreateMetadataRecord RESPONSE : ", response)
  
  // Notification Banner
  if (response.statusCode === 200){
    utils.showNotification({
      title : "Success",
      description: 'Document was uploaded successfully.',
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
  
  //  console.log('Running ReadMetadataRecord')
  ReadMetadataRecord.trigger()
  createMetadataItem.setValue({})
}

loadingPopUp.hide(true)