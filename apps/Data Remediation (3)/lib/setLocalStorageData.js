//  console.log('localstorage', localStorage.values);
let data = localStorage.values;
if (data !== '') {
  
const givenDate = new Date(data.date);
const currentDate = new Date();
const timeDifference = currentDate - givenDate;
const hoursDifference = timeDifference / (1000 * 60 * 60);
let moreThan24Hours = false;
if (hoursDifference > 24) {
  localStorage.clear();
  moreThan24Hours = true;
  localStorage.setValue("date", currentDate);
} 

    if (data.languageData && data.languageData.length !== 0 && !moreThan24Hours) {
    LanguagesList.setValue(data.languageData);
  } else {
    getLanguages.trigger();
  } 

  // Source code
  if (data.sourceCode && data.sourceCode.length !== 0 && !moreThan24Hours) {
    sourceCodes.setValue(data.sourceCode);
  } else {
    getSourceCode.trigger();
  }

  // Legal form
  if (data.getLegalForm && data.getLegalForm.length !== 0 && !moreThan24Hours) {
    legalForms.setValue(data.getLegalForm);
  } else {
    getLegalForm.trigger();
  }

  // get countries
  if (data.CountriesList && data.CountriesList.length !== 0 && !moreThan24Hours) {
    CountriesList.setValue(data.CountriesList);
  } else {
    getCountries.trigger();
  }

  // get Addresslist
  if (data.AddressTypesList && data.AddressTypesList.length !== 0 && !moreThan24Hours) {
    AddressTypesList.setValue(data.AddressTypesList);
  } else {
    getAddressTypes.trigger();
  }

  //getIdentifiers
  if (data.IdentifiersList && data.IdentifiersList.length !== 0 && !moreThan24Hours) {
    IdentifiersList.setValue(data.IdentifiersList);
  } else {
    getIdentifiers.trigger();
  }

  // GetEntityTypes
  if (data.EntityTypes && data.EntityTypes.length !== 0 && !moreThan24Hours) {
    EntityTypes.setValue(data.EntityTypes);
  } else {
    GetEntityTypes.trigger();
  }

  // getNationalLegalForm
  if (data.nationalLegalForm && data.nationalLegalForm.length !== 0 && !moreThan24Hours) {
    nationalLegalForm.setValue(data.nationalLegalForm);
  } else {
    getNationalLegalForm.trigger();
  }
  
  // getNationalLegalCountry
  if (data.nationalLegalCountry && data.nationalLegalCountry.length !== 0 && !moreThan24Hours) {
  nationalLegalCountry.setValue(data.nationalLegalCountry);
  } else {
    getNationalLegalCountry.trigger();
  }

  // GetNationalities
  if (data.NationalitiesList && data.NationalitiesList.length !== 0 && !moreThan24Hours) {
  NationalitiesList.setValue(data.NationalitiesList);
  } else {
    GetNationalities.trigger();
  }

  // GetGenders
  if (data.GendersList && data.GendersList.length !== 0 && !moreThan24Hours) {
    GendersList.setValue(data.GendersList);
  } else {
    GetGenders.trigger();
  }

  // getIndividualIdentifiers
  if (data.IndividualIdentifiersList && data.IndividualIdentifiersList.length !== 0 && !moreThan24Hours) {
IndividualIdentifiersList.setValue(data.IndividualIdentifiersList);
  } else {
    getIndividualIdentifiers.trigger();
  }

  // Currencies
  if (data.Currencies && data.Currencies.length !== 0 && !moreThan24Hours) {
    Currencies.setValue(data.Currencies);
  } else {
    GetCurrencies.trigger();
  }

  // GetFunctionCodes
  if (data.FunctionCodesList && data.FunctionCodesList.length !== 0 && !moreThan24Hours) {
    FunctionCodesList.setValue(data.FunctionCodesList);
  } else {
    GetFunctionCodes.trigger();
  }

  // GetExecutivePowerList
  if (data.ExecutivePowerList && data.ExecutivePowerList.length !== 0 && !moreThan24Hours) {
    ExecutivePowerList.setValue(data.ExecutivePowerList);
  } else {
    GetExecutivePowerList.trigger();
  }

  // GetShareholderList
  if (data.ShareholderList && data.ShareholderList.length !== 0 && !moreThan24Hours) {
    ShareholderList.setValue(data.ShareholderList);
  } else {
    GetShareholderList.trigger();
  }

  // GetRoleStatusList
  if (data.RoleStatusList && data.RoleStatusList.length !== 0 && !moreThan24Hours) {
    RoleStatusList.setValue(data.RoleStatusList);
  } else {
    GetRoleStatusList.trigger();
  }

  // GetUserRoles
  //  if (data.CurrentUserObj && data.CurrentUserObj.length !== 0) {
  //    CurrentUserObj.setValue(data.CurrentUserObj);
  //     if(PageLoadCall.value === true) {
  //      console.log("GetDataOnPageLoad trigger")
  //     // setLocalStorageData.trigger();
  //     GetDataOnPageLoad.trigger();
  //   }
  //  } else {
  //    GetUserRoles.trigger();
  //  }

  // kompanyApiRecord
  //  if (data.kompanyApiRecordData && data.kompanyApiRecordData.length !== 0) {
  //  kompanyApiRecordData.setValue(data.kompanyApiRecordData);
  //    pageLoadKapiCall.setValue(false);
  //    //  kompanyEnableCheck.trigger();
  //  } else {
  //    console.log('data');
  //    kompanyApiRecord.trigger();
  //  }
  
}
