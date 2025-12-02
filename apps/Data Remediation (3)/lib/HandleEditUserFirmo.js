var temp = editUserFormFirmo.data;
temp.user_role = [temp.user_role];
let userRole = temp.user_role;

let isCheck  = editUserFormFirmo.data.editCheckboxFirmo
console.log('userRole', userRole);


if(isCheck){
 temp.all_countries_selected="1" 
}else{
  temp.all_countries_selected="0"
}
if(temp.level === null){
  console.log("level is null in edit ")
  temp.level = " ";
}
delete editUserFormFirmo.data.editCheckboxFirmo;
EditUserReqObjFirmo.setValue(temp);

console.log(" final EditUserReqObjFirmo  in HandleEditUser", EditUserReqObjFirmo);

loadingPopUp.setHidden(false);
EditUserAPIFrimo.trigger();