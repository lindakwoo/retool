var isCheck =createUserFormFrimo.data.checkboxCreate

var temp = createUserFormFrimo.data;
temp.user_role = [temp.user_role];
let userRole = temp.user_role;
temp.email = temp.email.toLocaleLowerCase();

console.log('userRole', userRole);


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
delete editUserFormFirmo.data.checkbox5;
CreateUserReqObjFirmo.setValue(temp);
console.log(" final CreateUserReqObjFirmo  in HandleCreateUser", CreateUserReqObjFirmo);

loadingPopUp.setHidden(false);
CreateNewUserAPIFirmo.trigger();
