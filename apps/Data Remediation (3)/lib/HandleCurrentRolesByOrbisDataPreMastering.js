CurrentRolePreMasteringList.setValue([]);


const rolesPreOrbisData = GetAllRolesByOrbisIdPreMastering.data;

if (rolesPreOrbisData && rolesPreOrbisData.content) {
  
  console.log("rolesPreOrbisData", rolesPreOrbisData)
  const rolesPreCurrentOrbisContent = rolesPreOrbisData.content;
  console.log("rolesPreCurrentOrbisContent", rolesPreCurrentOrbisContent);
  const curPreOrbisRolesList = [];
 
  rolesPreCurrentOrbisContent.forEach((eachRole) => {
    const curPreRole = JSON.parse(eachRole);
    console.log(curPreRole);
    curPreRole.functions.forEach((eachFun) => {
      console.log(curPreRole);
      var obj = {
        entityId: curPreRole.entityId,
        function: eachFun,
         state: curPreRole.header.state === "active"? "Not Suppressed" : curPreRole.header.state = "suppressed".replace(/^./, c => c.toUpperCase())

      }
      curPreOrbisRolesList.push(obj);
    });
  });
  
  console.log("curPreOrbisRolesList", curPreOrbisRolesList);


  //CurrentPreRoles
console.log("Before filtering curPreOrbisRolesList:", curPreOrbisRolesList);


const filteredOrbisArrayCurrent = curPreOrbisRolesList?.filter(item => 
  item.function?.source !== "REMEDIATED"
) || [];

console.log("filteredArrayCurrent array in CurrentRolesByOrbisDataPreMastering:", filteredOrbisArrayCurrent);
console.log("filteredArrayCurrent array length in CurrentRolesByOrbisDataPreMastering:", filteredOrbisArrayCurrent.length);

CurrentRolePreMasteringList.setValue(filteredOrbisArrayCurrent);
console.log("Final value of CurrentRolePreMasteringList in CurrentRolesByOrbisDataPreMastering:", CurrentRolePreMasteringList.value);

} 