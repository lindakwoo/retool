const rolesData = GetPreviousFunctions.data;

console.log(rolesData)
const rolesContent = rolesData.content;
console.log(rolesContent);
const prevRolesList = [];

if (rolesData.totalElements <= 120) {
  rolesContent.forEach((eachRole) => {
  const curRole = JSON.parse(eachRole);
  curRole.functions.forEach((eachFun) => {
      console.log(curRole);
      var obj = {
        entityId: curRole.entityId,
        function: eachFun,
        state: curRole.header.state
      }
      prevRolesList.push(obj);
    });
});


console.log("prevRolesList", prevRolesList);
PreviousRoles.setValue(prevRolesList);
}

PreviousRolesTotalPages.setValue(rolesData.totalPages);
PreviousRoleTotalElements.setValue(rolesData.totalElements);
