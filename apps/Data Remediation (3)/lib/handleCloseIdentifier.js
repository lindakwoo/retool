var epochDate = moment.utc(new Date('1970-01-01'));
var isEditedFlag = false;
//Identifiers List Editing
// console.log('Identifiers List');
// console.log(CurrentIdentifiersList.data);

var identifiersFromAPI = selectedCompany.value.identifiers;
CurrentIdentifiersList.data.forEach(function (item, i) {
  var curIdType = item.item.type;
  var curObjHash = item.itemObjectHash;
  var curIdFromAPI = identifiersFromAPI.filter((obj) => obj.item.type === curIdType && obj.itemObjectHash === curObjHash)[0];
  //console.log('curObjHash', curObjHash);       
  //console.log('curIdFromAPI', curIdFromAPI);    
  var curIdentifierVal = CurIdentifiers.value.filter((obj) => obj.item.type === curIdType && obj.itemObjectHash === curObjHash)[0].item.id;
  //console.log('curObjHash', curObjHash); 
  //console.log('testttttt curIdFromAPI', curIdentifierVal);
  var curIdValFromAPI = curIdFromAPI.item.id;
  if (curIdentifierVal !== curIdValFromAPI) {
    isEditedFlag = true;
  }

});
Object.entries(NewIdentifiersValues.value).forEach(([key, value]) => {
  isEditedFlag = true;
});

// Call to open confirmation dialog

if (isEditedFlag) {
  ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('home', { newTab: false });
}
