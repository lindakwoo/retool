loadingPopUp.hide();
PreviousRolePreMasteringList.setValue([]);

const rolesPreviousOrbisData = GetPreviousRolesByOrbisIdPreMastering.data;
if (rolesPreviousOrbisData && rolesPreviousOrbisData.content) {
console.log("rolesPreviousOrbisData", rolesPreviousOrbisData);
const rolesPreviousOrbisContent = rolesPreviousOrbisData.content;
console.log("rolesPreviousOrbisContent", rolesPreviousOrbisContent);
const prevPreOrbisRolesList = [];

  rolesPreviousOrbisContent.forEach((eachRole) => {
  const curRole = JSON.parse(eachRole);
  curRole.functions.forEach((eachFun) => {
    var obj = {
        entityId: curRole.entityId,
        function: eachFun,
       state: curRole.header.state === "active" ? "Not Suppressed" : curRole.header.state = "suppressed".replace(/^./, c => c.toUpperCase())

      }
    prevPreOrbisRolesList.push(obj);
  });
});


console.log("prevPreOrbisRolesList", prevPreOrbisRolesList);


const filteredArrayOrbisPrevious = prevPreOrbisRolesList?.filter(item => 
  item.function?.source !== "REMEDIATED"
) || [];

console.log("filteredArrayOrbisPrevious array:", filteredArrayOrbisPrevious);
console.log("filteredArrayOrbisPrevious array length:", filteredArrayOrbisPrevious.length);

PreviousRolePreMasteringList.setValue(filteredArrayOrbisPrevious);
console.log("Final value of PreviousRolePreMasteringList in PreviousRolesByOrbisDataPreMastering:", PreviousRolePreMasteringList.value);

}
