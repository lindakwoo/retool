var isCheck =createUserForm.data.checkbox3

var temp = createUserForm.data;
temp.user_role = [temp.user_role];
let userRole = temp.user_role;
temp.email = temp.email.toLocaleLowerCase();

console.log('userRole', userRole);

if(userRole[0] === "uci_analyst"){
  isCheck = false
}

console.log('isCheck', isCheck);

if(isCheck){
 temp.all_countries_selected="1" 
}else{
  temp.all_countries_selected="0"
}

if(temp.level === null){
  console.log("level is null in add ")
  temp.level = " ";
}
delete editUserForm.data.checkbox3;
CreateUserReqObj.setValue(temp);
console.log(" final CreateUserReqObj  in HandleCreateUser", CreateUserReqObj);

loadingPopUp.setHidden(false);
CreateNewUserAPI.trigger();
