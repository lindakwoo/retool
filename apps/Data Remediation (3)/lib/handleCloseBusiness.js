
var epochDate = moment.utc(new Date('1970-01-01'));

var isEditedFlag = false;

// BusinessDescriptions Checking 
var businessDescriptionArray = selectedCompany.value.activityDescriptions;
// console.log('11', "businessDescriptionArray");
// console.log("businessDescriptionArray", businessDescriptionArray);

// Initial setup
var businessDescPutArray = [];

// Sample structure for newBusinessDescriptionDataList
var newBusinessDescriptionDataList = newBusinessDescriptionDataList.value;
// console.log("newBusinessDescriptionDataList.value", newBusinessDescriptionDataList.value)
var transformedNewBusinessDescriptions = newBusinessDescriptionDataList
  .filter(function (newDesc) {
    return newDesc.language && newDesc.value; // Ensure both language and value are available
  });

if (transformedNewBusinessDescriptions.length > 0) {
  isEditedFlag = true;
}

// Process BusinessDescriptionList to create update requests
BusinessDescriptionList.data.forEach(function (item, i) {
  // console.log("BusinessDescriptionList", item);
  var currentBusinessDescriptionVal = BusinessDescriptionsVariableList.value[i];
  // console.log("currentBusinessDescriptionVal", currentBusinessDescriptionVal);

  if (currentBusinessDescriptionVal.value !== businessDescriptionArray[i].item.value ||
    currentBusinessDescriptionVal.language !== businessDescriptionArray[i].item.language ||
    currentBusinessDescriptionVal.deleteFlag) {
    isEditedFlag = true;

  }
});

// Call to open confirmation dialog

if (isEditedFlag) {
  ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('firmohome', { newTab: false });
}
