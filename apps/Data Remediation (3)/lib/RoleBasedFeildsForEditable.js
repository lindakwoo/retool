//   comment  
if(CurrentUserObj.value.user_role?.includes('uci_analyst')) {
     
     if(CurrentUserObj.value.level === "level1") {
        fromDate.setDisabled(true);
        toDate.setDisabled(true);
        actField.setDisabled(true);
        biographyContainer.setDisabled(true);
        //eachBiography.setDisabled(true);
        identifiersForm.setDisabled(true);
        mailMarker.setDisabled(true);
        exemptionFromDate.setDisabled(true);
        exemptionToDate.setDisabled(true);
        activeFlag.setDisabled(true);
        suppressFlag.setDisabled(true);
       IdentifierContainer.setDisabled(true);
       suppressRoleFlag.setDisabled(true);
       suppressRoleFlag.setDisabled(true);
      // Update rolesModalOptions by setting the readOnly to true
    rolesModalOptions.setValue({
        readOnly: false,  // Set readOnly to true
        title: rolesModalOptions.value.title,  // Preserve the title property
    });
       RoleBiographies.setDisabled(true);
       roleStatus.setDisabled(true);      
     
console.log("rolesModalOptions", rolesModalOptions);

     }
    
DisableForLevelZeroUser.trigger();
}

if(CurrentUserObj.value.product === "firmographics"){
   activeFlag.setDisabled(true);
   suppressFlag.setDisabled(true);
   suppressRoleFlag.setDisabled(true);
   EditsContainer.setDisabled(true);
  //GoldenContainerRemRecord.setDisabled(true);
  preAndRemFunctionsContainer.setDisabled(true);
  preAndRemPreviouscontainer.setDisabled(true);
}

