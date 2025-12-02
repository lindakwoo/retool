loadingPopUp.hide();
const rolesData = GetCurrentRolesByOrbisId.data;
console.log('inside handle roles by orbis id');
if (rolesData && rolesData.content) {
  
  console.log(rolesData)
  const rolesContent = rolesData.content;
  console.log(rolesContent);
  const curRolesList = [];
  rolesContent.forEach((eachRole) => {
    const curRole = JSON.parse(eachRole);
    console.log(curRole);
    curRole.functions.forEach((eachFun) => {
      console.log(curRole);
      var obj = {
        entityId: curRole.entityId,
        function: eachFun,
        state: curRole.header.state
      }
     
      curRolesList.push(obj);
    });
  });
  
  console.log(curRolesList);
 
  CurrentRoles.setValue(curRolesList);
  CurrentRolesTotalPages.setValue(rolesData.totalPages);
  CurrentRoleTotalElements.setValue(rolesData.totalElements);
} else {
  CurrentRoles.setValue([]);
}