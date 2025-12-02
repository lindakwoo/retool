loadingPopUp.setHidden(false)
directorsIdInputState.setValue({})
var temp = directorIdsAddForm.data;
temp.last_modified_by = current_user.email;
temp.action = "create"
console.log("directorIdsAddForm ::", temp);

// Ensure temp is an array of objects
directorsIdInputState.setValue(temp);

// Log the updated kompanyInputState
console.log("updated directorsIdInputState :: ", directorsIdInputState.value);

directorsIdsManagerApi.trigger();