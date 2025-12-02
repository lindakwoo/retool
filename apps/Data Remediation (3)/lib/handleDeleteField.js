
console.log(fieldName)
switch (fieldName) {
  case 'intName':
    deleteIntNameFlag.setValue(true);
    break;
  case 'personalInfo':
    deletePersonalInfoFlag.setValue(true);
    break;
  case 'address':
    addressDeleteFlag1.setValue(true);
    break;
  case 'disqualification' : 
    deleteDisqualificationFlag.setValue(true);
    break;
  case 'license' : 
    licenseDeleteFlag.setValue(true);
    break;
  case 'contact' : 
    contactDeleteFlag.setValue(true);
    break;
  default: 
    break;
}