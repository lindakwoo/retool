CurrentPreRoles.setValue([]);

const rolesPreData = GetCurrentFunctionsPreMastering.data;

if (rolesPreData && rolesPreData.content) {
  
  console.log(rolesPreData)
  const rolesPreContent = rolesPreData.content;
  console.log(rolesPreContent);
  const curPreRolesList = [];
  if (rolesPreData.totalElements <= 120) {
  rolesPreContent.forEach((eachRole) => {
    const curPreRole = JSON.parse(eachRole);
    console.log(curPreRole);
    curPreRole.functions.forEach((eachFun) => {
      console.log(curPreRole);
      var obj = {
        entityId: curPreRole.entityId,
        function: eachFun,
         state: curPreRole.header.state === "active"? "Not Suppressed" : curPreRole.header.state = "suppressed".replace(/^./, c => c.toUpperCase())

      }
      curPreRolesList.push(obj);
    });
  });
  
  console.log("curPreRolesList", curPreRolesList.length);
 
  CurrentPreRoles.setValue(curPreRolesList);
  //HandleNoUpdatePreMasteringRolesData.trigger();
  console.log("CurrentPreRoles111", CurrentPreRoles.length);
  
  }
  
  CurrentPreRolesTotalPages.setValue(rolesPreData.totalPages);
  CurrentPreRoleTotalElements.setValue(rolesPreData.totalElements);
  if(NoFilterForPreCheck.value === false){
     console.log("NoFilterForPreCheck is False for Current");
    filteredRemRoles.trigger();
  } else{
    preMasteringFilterOnClear.trigger();
  }
  
} else {
  CurrentPreRoles.setValue([]);
}