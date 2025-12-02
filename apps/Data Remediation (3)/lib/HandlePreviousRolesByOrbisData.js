//roles

loadingPopUp.hide();
const rolesData = GetPreviousRolesByOrbisId.data;
console.log('inside handle roles by orbis id');
if (rolesData && rolesData.content) {
  console.log(rolesData)
  const rolesContent = rolesData.content;
  console.log(rolesContent);
  const prevRolesList = [];
  
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
      prevRolesList.push(obj);
    });
  });
  
  PreviousRoles.setValue(prevRolesList);
} else {
  PreviousRoles.setValue([])
}