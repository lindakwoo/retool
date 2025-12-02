
// ContactRemediatedRecordsList.setValue([]);
  RemCurrentRolePreMasteringList.setValue([]);
  RemPreviousRolePreMasteringList.setValue([]);
//CurrentPreRoles
//console.log("Before filtering CurrentPreRoles:", CurrentPreRoles?.value);

if(CurrentPreRoles.value && CurrentPreRoles.value.length >0){
    const filteredArrayCurrent = CurrentPreRoles?.value?.filter(item => 
      item.function?.source === "REMEDIATED"
    ) || [];
    
    //console.log("filteredArrayCurrent array:", filteredArrayCurrent);
    console.log("filteredArrayCurrent array length:", filteredArrayCurrent.length);
    
    RemCurrentRolePreMasteringList.setValue(filteredArrayCurrent);
    console.log("Final value of RemCurrentRolePreMasteringList:", RemCurrentRolePreMasteringList.value.length);

}


//PreviousPreRoles
if(PreviousPreRoles.value && PreviousPreRoles.value.length >0) {

    //console.log("Before filtering PreviousPreRoles:", PreviousPreRoles?.value);
    
    
    const filteredArrayPrevious = PreviousPreRoles?.value?.filter(item => 
      item.function?.source === "REMEDIATED"
    ) || [];
    
    //console.log("filteredArrayPrevious array:", filteredArrayPrevious);
    console.log("filteredArrayPrevious array length:", filteredArrayPrevious.length);
    
    RemPreviousRolePreMasteringList.setValue(filteredArrayPrevious);
    console.log("Final value of RemPreviousRolePreMasteringList:", RemPreviousRolePreMasteringList.value.length);
}
