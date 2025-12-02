//CurrentPreRoles
console.log("Before filtering CurrentPreRoles in preMasteringFilterOnClear:", CurrentPreRoles?.value);


const filteredArrayClearCurrent = CurrentPreRoles?.value?.filter(item => 
  item.function?.source !== "REMEDIATED"
) || [];

console.log("filteredArrayClearCurrent array:", filteredArrayClearCurrent);
console.log("filteredArrayClearCurrent array length:", filteredArrayClearCurrent.length);

CurrentRolePreMasteringList.setValue(filteredArrayClearCurrent);
console.log("Final value of CurrentRolePreMasteringList in preMasteringFilterOnClear:", CurrentRolePreMasteringList.value);




//PreviousPreRoles

console.log("Before filtering PreviousPreRoles:", PreviousPreRoles?.value);


const filteredArrayClearPrevious = PreviousPreRoles.value?.filter(item => 
  item.function?.source !== "REMEDIATED"
) || [];

console.log("filteredArrayPrevious array:", filteredArrayClearPrevious);
console.log("filteredArrayPrevious array length:", filteredArrayClearPrevious.length);

PreviousRolePreMasteringList.setValue(filteredArrayClearPrevious);
console.log("Final value of PreviousRolePreMasteringList in preMasteringFilterOnClear:", PreviousRolePreMasteringList.value);
