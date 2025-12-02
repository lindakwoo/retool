var temp = createRegistryUrlForm.data;

temp = {
  ...temp,
  registry_url: temp.registry_url.includes('http') ? temp.registry_url : 'https://' + temp.registry_url,
  registry_identifier: temp.registry_identifier ? temp.registry_identifier: '',
official : temp.official ? temp.official: '',
  english_version : temp.english_version ? temp.english_version: '',
  email: current_user.email,
  status: 'Active',
  country: CountriesList.value.filter((obj) => obj.a2 === temp.country_code)[0].labels.en,
  state_name: statesListCreate.value && statesListCreate.value.length > 0 
  ? statesListCreate.value.map(item => item.split('-')[1])
  : null,
  state_code: statesListCreate.value && statesListCreate.value.length > 0 
  ? statesListCreate.value.map(item => item.split('-')[0])
  : null,
}

CreateRegistryURLPutReq.setValue([temp]);
loadingPopUp.setHidden(false);
CreateRegistryUrl.trigger();