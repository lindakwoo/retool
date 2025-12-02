
var temp = urlsList.data.filter((obj) => obj.Id === urlsList.selectedRow.Id)[0];


temp.status = "Inactive";
temp.registry_identifier = temp.registry_identifier ? temp.registry_identifier: "";
temp.orbis_identifier= temp.orbis_identifier ? temp.orbis_identifier: "";
temp.official =  temp.official ? temp.official: '',
temp.english_version =  temp.english_version ? temp.english_version: '',
console.log(temp);
UpdateRegistryUrlPutReq.setValue([temp]);
UpdateRegistryUrl.trigger();
