const currentRolesFilterRemFunctionList = CurrentPreRoles?.value?.filter(item => item.function?.source === "REMEDIATED");
const previousRolesFilterFunctionRemList = PreviousPreRoles?.value?.filter(item => item.function?.source === "REMEDIATED");
// Log array lengths here
console.log('ContactRemediatedRecordsList length:', ContactRemediatedRecordsList.value?.length);
console.log('currentRolesFilterRemFunctionList length:', currentRolesFilterRemFunctionList.length);
console.log('previousRolesFilterFunctionRemList length:', previousRolesFilterFunctionRemList.length);
console.log('RemCurrentRolePreMasteringList length:', RemCurrentRolePreMasteringList.value.length);
console.log('RemPreviousRolePreMasteringList length:', RemPreviousRolePreMasteringList.value.length);

console.log('PreviousPreRoleTotalElements length:', PreviousPreRoleTotalElements.value);
console.log('CurrentPreRoleTotalElements length:', CurrentPreRoleTotalElements.value);
console.log('PreFunctionRolesGreaterThan120.value.length length:', PreFunctionRolesGreaterThan120.value.length);

if (ContactRemediatedRecordsList.value && ContactRemediatedRecordsList.value.length === 0 &&
    currentRolesFilterRemFunctionList.length === 0 && previousRolesFilterFunctionRemList.length === 0 &&
    PreviousPreRoleTotalElements.value < 120 && CurrentPreRoleTotalElements.value < 120 && PreFunctionRolesGreaterThan120.value.length === 0
) {
    console.log('ALl List is zero on refresh:');
    RemContactModal.setHidden(true);
    container3.setHidden(true);
}
