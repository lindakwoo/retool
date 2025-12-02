var temp = kompanyEditForm.data;
console.log("kompanyEditForm ::", temp);
temp.last_modified_by= CurrentUserObj.value.email
// Ensure temp is an array of objects
kompanyInputState.setValue(temp);

// Log the updated kompanyInputState
console.log("updated kompanyInputState :: ", kompanyInputState.value);

kompanyApiRecord.trigger();