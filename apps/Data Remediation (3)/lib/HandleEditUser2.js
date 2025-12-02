var temp = editUserForm.data;
temp.user_role = [temp.user_role];
let userRole = temp.user_role;

let isCheck  = editUserForm.data.checkbox2
console.log('userRole', userRole);

if(userRole[0] === "uci_analyst"){
  isCheck = false
}

  console.log('isCheck', isCheck)

if(isCheck){
 temp.all_countries_selected="1" 
}else{
  temp.all_countries_selected="0"
}
if(temp.level === null){
  console.log("level is null in edit ")
  temp.level = " ";
}
delete editUserForm.data.checkbox2;
EditUserReqObj.setValue(temp);

console.log(" final EditUserReqObj  in HandleEditUser", EditUserReqObj);

loadingPopUp.setHidden(false);
EditUserAPI.trigger();