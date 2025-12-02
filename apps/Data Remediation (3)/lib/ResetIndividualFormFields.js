CurrentSelectedContact.setValue({});

deleteIntNameFlag.setValue(false);
deletePersonalInfoFlag.setValue(false);
addressDeleteFlag1.setValue(false);
deleteDisqualificationFlag.setValue(false);
contactDeleteFlag.setValue(false);
licenseDeleteFlag.setValue(false);
console.log('RESET Contact Fields');

EducationsDeleteFlags.setValue([]);
BiographyDeleteFlags.setValue([]);
BiographyValuesList.setValue([]);
EducationValuesList.setValue([]);

ContactNamePutArray.setValue([]);
EducationPutArr.setValue([]);
AddressesPutArr.setValue([]);
BiographyPutArr.setValue([]);
DisqualificationPutArr.setValue([]);
MiscellaneousPutReq.setValue({});
ContactPutArr.setValue([]);
IdentifierPutReq.setValue([]);
PersonalInfoPutObj.setValue({});

suppressFlag.clearValue();
suppressFlag.setValue(false);
activeFlag.clearValue();
activeFlag.setValue(false);

OriginalDisplayDirectorIds.setValue([]);
DisplayDirectorIds.setValue([]);
NonDisplayDirectorIds.setValue([]);
GetDisplayDirectorIds.trigger();

CurrentRoles.setValue([]);
PreviousRoles.setValue([]);
searchOrbisId.setValue('');
searchOrbisId2.setValue('');
//CurrentPreRoles.setValue([]);
//PreviousPreRoles.setValue([]);


if (gradYear && Object.keys(gradYear).length > 0) {gradYear.setValue([]);}
if (gradMonth && Object.keys(gradMonth).length > 0) {gradMonth.setValue([]);}
if (gradDate && Object.keys(gradDate).length > 0) {gradDate.setValue([]);}
