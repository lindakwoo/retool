
var epochDate = moment.utc(new Date('1970-01-01'));

var isEditedFlag = false;

//Entity Infos - Legal Form and Incorporation Date

var updateIncopDate = '';
var incopPrecision = 0;

if (incopYear.value) {
  updateIncopDate = incopYear.value + '-01-01';
  incopPrecision = 9;
  if (incopMonth.value && incopMonth.value !== '00') {
    updateIncopDate = incopYear.value + '-' + incopMonth.value + '-01';
    incopPrecision = 10;
    if (incopDay.value && incopDay.value !== '00') {
      updateIncopDate = incopYear.value + '-' + incopMonth.value + '-' + incopDay.value;
      incopPrecision = 11;
    }
  }
}

var incopEdited = false;
var entityInfoReq = {
  "item": {
    ...selectedCompany.value.entityInfo.item
  },
  "itemObjectHash": "",
  "remediatedItemHash": selectedCompany.value.entityInfo.remediatedItemHash ? selectedCompany.value.entityInfo.remediatedItemHash : selectedCompany.value.entityInfo.itemObjectHash,
  "remediationAction": "OVERWRITE",
  "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
  "source": "REMEDIATED",
  "itemStatus": "ACTIVE"
}
// console.log('entityInfoReq', entityInfoReq)
var entityEdited = false;
if (legalFormSelect.value !== selectedCompany.value.entityInfo.item.standardizedLegalForm) {
  entityEdited = true;

}
// console.log('selectedCompany.value.entityInfo.item.incorporationDate', selectedCompany.value.entityInfo.item.incorporationDate);

var originalIncorporationDate = moment.utc(new Date(selectedCompany.value.entityInfo.item.incorporationDate)).diff(epochDate, 'days');
// console.log('originalIncorporationDate', originalIncorporationDate);

var modifiedIncorporationDate = updateIncopDate !== '' ? moment.utc(new Date(updateIncopDate)).diff(epochDate, 'days') : null;
// console.log('modifiedIncorporationDate', modifiedIncorporationDate);

if (modifiedIncorporationDate !== originalIncorporationDate) {
  entityEdited = true;
  incopEdited = true;
}
if (nationalLegalFormValue.value !== selectedCompany.value.entityInfo.item.nationalLegalForm) {
  entityEdited = true;
}
if (stateOfIncorporationValue.value !== selectedCompany.value.entityInfo.item.stateOfIncorporation) {
  // console.log('stateOfIncorporationValue Edited');
  entityEdited = true;

}
if (entityEdited) {
  isEditedFlag = true;
  EntityInfoPutArray.setValue(entityInfoReq);
} else {
  EntityInfoPutArray.setValue([]);
}

// Call to open confirmation dialog

if (isEditedFlag) {
  ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('firmohome', { newTab: false });
}
