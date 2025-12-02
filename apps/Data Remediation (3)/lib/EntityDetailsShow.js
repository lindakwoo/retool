
//RunAllArray.trigger();
//contactListLength.setValue(CreateAddressArray.data.length);
 
 ValidateBvdId.trigger();
 ValidateOrbisId.trigger();
ReadMetadataRecord.trigger();
ValidateUserRole.trigger();
//  //searchRegistryUrl.trigger()
//kompanyRecordEnableCheck.trigger();
kompanyLiveSearchdata.setHidden(true);
GetAvailableNewIdentifiers.trigger();
masterRecordLinkedRemFields.setValue({})
unlinkedAttributesToLink.setValue({'names' : [],
                          'entityInfo' : [],
                          'businessDescriptions' : [],
                          'digitalPresences' : [],
                          'addresses' : [],
                          'identifiers' : []})
createMasterHashDict.trigger();
metadataTableLinkReset.trigger()
//bvdID.substring(0, 2);
console.log('TableRecordsMastering.value[0]: ', TableRecordsMastering.value[0]);
const countryCode = TableRecordsMastering.value[0].header.bvdID.substring(0, 2)
console.log('countryCode: ', countryCode);

console.log('nationalLegalCountry: ', nationalLegalCountry.value.length);
//console.log('nationalLegalCountry (JSON):', JSON.stringify(nationalLegalCountry.value, null, 2));

// Step 2: Ensure nationalLegalCountry is an array before applying the find method

const filteredCountryData = nationalLegalCountry.value.filter(country => country.countryISO2 === countryCode);

console.log('filtered nationalLegalCountryData: ', filteredCountryData.length);

  
// Check if filteredCountryData is a list with at least one element
if (filteredCountryData.length > 0) {
   let allMatchingForms = [];
  // Iterate over all matching countries if needed, or just use the first match
  filteredCountryData.forEach((countryData) => {
    const codeStandardized = countryData.codeStandardized;
    // Step 3: Filter nationalLegalForm to match with codeStandardized from the filtered country data
    const matchingForms = nationalLegalForm.value.filter(form => form.code === codeStandardized);
    

    //console.log("Matching Legal Forms for Country Code:", countryCode, matchingForms);
   allMatchingForms = allMatchingForms.concat(matchingForms);
    
  });
   updatedNationalLegalForm.setValue(allMatchingForms)
   console.log("updatedNationalLegalForm", updatedNationalLegalForm.value.length);
} else {
  console.log(`No matching country data found for country code: ${countryCode}`);
  updatedNationalLegalForm.setValue([]);
}

loadingPopUp.hide();
