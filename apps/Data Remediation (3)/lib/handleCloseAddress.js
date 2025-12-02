
var epochDate = moment.utc(new Date('1970-01-01'));

var isEditedFlag = false;

//Address
AddressesListEdited.value.forEach(function (item, i) {
  //  // console.log('addressListView each item ', item);
  var geocodeObj = selectedCompany.value.addresses[i].item.geoClassifications ? selectedCompany.value.addresses[i].item.geoClassifications : [];

  const geoCode1Exists = geocodeObj.some(obj => obj.type === '1');

  var originalGeoCode = geocodeObj.filter((obj) => obj.type === "1").length > 0 ? geocodeObj.filter((obj) => obj.type === "1")[0].code.trim() : '';

  var itemEdited = false;
  var curPhNum = selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.phoneNumbers ? selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.phoneNumbers.join(", ") : '';
  var curFaxNum = selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.faxNumbers ? selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.faxNumbers.join(", ") : '';


  if (AddressDeleteFlags.value[i]) {
    itemEdited = true;

  } else {
    if (item.addressType != selectedCompany.value.addresses[i].item.types[0]) {
      itemEdited = true;

    }

    if (item.addressLanguage.toLocaleLowerCase() != selectedCompany.value.addresses[i].item.localizedAddresses[0].language.toLocaleLowerCase()) {
      itemEdited = true;

    }

    if (item.addressLine != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ')) {
      itemEdited = true;

    }
    if (selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode && item.postCode != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode) {
      itemEdited = true;

    }

    if (item.city != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.city) {
      itemEdited = true;

    }
    if (!selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox) {
      selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox = '';
      // console.log('pobox - updated');
    }
    if (item.poBox != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox) {
      itemEdited = true;
    }
    if (item.phoneNumber != curPhNum) {
      itemEdited = true;
    }

    if (item.faxNumber != curFaxNum) {
      itemEdited = true;

    }

    if (item.countryISO != selectedCompany.value.addresses[i].item.countryISO2) {
      itemEdited = true;

    }
    // console.log('edit - f');
    if (item.regionGeoCode != originalGeoCode) {
      itemEdited = true;

      if (geoCode1Exists) {
        geocodeObj.forEach((obj) => {
          if (obj.type === "1") {
            obj.code = item.regionGeoCode.trim();
          }
        })
      } else {
        geocodeObj.push({ type: '1', code: item.regionGeoCode.trim() })
      }

    }

    if (selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county && item.county != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county ||
      (!selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county && item.county)
    ) {
      itemEdited = true;

    }
  }

  if (itemEdited) {
    isEditedFlag = true;
  }
  // console.log('addReq', addReq);

});

if (!newAddressForm.hidden) {
  isEditedFlag = true;
}

// Call to open confirmation dialog

if (isEditedFlag) {
  ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('firmohome', { newTab: false });
}
