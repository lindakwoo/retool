selectedCompany.setValue({});
newIdentifiersAdded.setValue([]);  NewIdentifiersFlag.setValue(newIdentifiersAdded?.data.filter((obj)=> newIdentifiersAdded?.value.includes(obj.code))?.map(() => {
     return { 
         isInvalid: false, 
         errorMessage: "" 
     };
 })); 
ExistingIdentifierFlag.setValue(IdentifiersFromAPIList?.value?.map(()=> { return {isInvalid :false , errorMessage : ""} })); 
NewIdentifiersValues.setValue({});
alertNewIdentifiers.setHidden(true);
saveEntityPutArray.setValue([]);
saveAddressPutArray.setValue([]);
saveDigitalPresencesPutArray.setValue([]);
saveEntityInfoPutArray.setValue([]);
saveIdentifiersPutArray.setValue([]);
saveActivityDescriptions.setValue([]);

