 PreviousPreRoles.setValue([])
const rolesPreviousData = GetPreviousFunctionsPreMastering.data;
if (rolesPreviousData && rolesPreviousData.content) {
console.log("rolesPreviousData", rolesPreviousData);
const rolesContent = rolesPreviousData.content;
console.log(rolesContent);
const prevPreRolesList = [];
 if (rolesPreviousData.totalElements <= 120) {
  rolesContent.forEach((eachRole) => {
  const curRole = JSON.parse(eachRole);
  curRole.functions.forEach((eachFun) => {
    var obj = {
        entityId: curRole.entityId,
        function: eachFun,
       state: curRole.header.state === "active" ? "Not Suppressed" : curRole.header.state = "suppressed".replace(/^./, c => c.toUpperCase())

      }
    prevPreRolesList.push(obj);
  });
});


console.log("prevPreRolesList", prevPreRolesList);
PreviousPreRoles.setValue(prevPreRolesList);
 }
PreviousPreRolesTotalPages.setValue(rolesPreviousData.totalPages);
PreviousPreRoleTotalElements.setValue(rolesPreviousData.totalElements);
  if(NoFilterForPreCheck.value === false){
     console.log("NoFilterForPreCheck is False for Previous");
    filteredRemRoles.trigger();
  } else{
    preMasteringFilterOnClear.trigger();
  }
}else {
  PreviousPreRoles.setValue([]);
}
