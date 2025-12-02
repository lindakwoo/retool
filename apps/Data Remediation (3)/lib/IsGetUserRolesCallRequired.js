if (!CurrentUserObj.value || Object.keys(CurrentUserObj.value).length === 0) {
  console.log("CurrentUserObj.value is null, undefined, or empty:", CurrentUserObj.value);
  GetUserRoles.trigger();
} else {
  console.log('GetUserRoles call is not required due tp CurrentUserObj is not empty');
  GetDataOnEntityPageLoad.trigger();
}
