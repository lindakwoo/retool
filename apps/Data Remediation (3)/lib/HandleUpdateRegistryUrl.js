var temp = editRegistryUrlForm.data;

temp = {
  ...temp,
  registry_url: temp.registry_url.includes('http') ? temp.registry_url : 'https://' + temp.registry_url, 
  registry_identifier: temp.registry_identifier ? temp.registry_identifier: '',
official : temp.official ? temp.official: '',
  english_version : temp.english_version ? temp.english_version: '',
  email: current_user.email,
  status: 'Active',
  country_code: temp.country_code.split(' - ')[0],
  country: temp.country_code.split(' - ')[1],
  state_name: editRegistrysSatesList?.value?.length > 0 ? editRegistrysSatesList.value : "",
  state_code: editRegistrysSatesList?.value?.length > 0
    ? editRegistrysSatesList.value.map(
        l => statesListCreate.data.find(i => i.label === l)?.value?.split("-")[0]
      ).filter(Boolean)
    : ""
}
delete temp.statesListEdit;

UpdateRegistryUrlPutReq.setValue([temp]);
loadingPopUp.setHidden(false);
UpdateRegistryUrl.trigger();
