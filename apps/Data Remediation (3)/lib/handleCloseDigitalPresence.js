
var epochDate = moment.utc(new Date('1970-01-01'));

var isEditedFlag = false;


//digitalPresences 
var networkArr = [];
var websitesFromAPI = [];
if (selectedCompany.value.digitalPresences) {
  websitesFromAPI = selectedCompany.value.digitalPresences.filter(item => item.item.type === '1');
}

// Website Adding
ListOfWebsites.data.forEach(function (item, i) {
  var curWebSite = Websites.value[i];
  if (selectedCompany.value.digitalPresences && websitesFromAPI[i].item.value != curWebSite) {
    isEditedFlag = true;
  }
})
//new Websites
if (NewWebsites.value.length > 0) {
  NewWebsitesList.data.forEach((eachWebsite, i) => {
    if (NewWebsites.value[i] != "") {
      isEditedFlag = true;
    }
  })
}
// Emails Adding
var curEmails = [];
if (selectedCompany.value.digitalPresences) {
  curEmails = selectedCompany.value.digitalPresences.filter(function (item) {
    return item.item.type === '2'
  });
}

console.log('curEmails', curEmails);

emailList.data.forEach(function (item, i) {

  var curEmailVal = Emails.value[i];
  if (curEmailVal !== curEmails[i].item.value) {
    isEditedFlag = true;
  }

});
//new Email
if (NewEmails.value.length > 0) {
  NewEmailsList.data.forEach((eachMail, i) => {
    if (NewEmails.value[i].trim() !== '') {
      isEditedFlag = true;
    }
  })
}

// Call to open confirmation dialog

if (isEditedFlag) {
  ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('firmohome', { newTab: false });
}
