let data = search_box.value.trim();
loadingPopUp.show();

if(MainSearchBy.value === 'uci' && (CurrentUserObj.value.product === 'uci' || CurrentUserObj.value.product === 'all')) {
  //Incase of Super Admin
  TableRecordPremastering.setValue([]);
  TableRecordRemediated.setValue([]);
  TableRecordsMastering.setValue([]);
    //BulkStatus
  BulkProcessButtonEnabled.setValue(false);
  //Uci realted
  CheckUserRole.trigger();
  ContactRemediatedRecordsList.setValue([]);
  Search.setValue(false);
  console.log('UCI Search');
  ContactsList.setValue([]);
  ContactRemediatedRecordsList.setValue([]);
  PreFunctionRolesGreaterThan120.setValue([]);
  NoFilterForPreCheck.setValue(false);
  DeleteFunctionRoleFlag.setValue(false);
  await GetFunctionBulkProcess.trigger();
  GetContactInfoByUCI.trigger();
  GetContactInfoByUCIPreMastering.trigger();
  //  GetCurrentFunctions.trigger();
  //  GetPreviousFunctions.trigger();
  if(!BulkProcessButtonEnabled.value && GetFunctionBulkProcess.data?.metadata?.status !== 400 && GetFunctionBulkProcess.data?.metadata?.status !== 500) {
    GetAllRoles.trigger();
    GetAllHistorizationStatusPreMastering.trigger();
    filteredRemRoles.trigger();
  }

} else {
  //Incase of Super Admin
  ContactsList.setValue([]);
  ContactIPRecordsList.setValue([]);
  ContactRemediatedRecordsList.setValue([]);
  RemCurrentRolePreMasteringList.setValue([]);
  RemPreviousRolePreMasteringList.setValue([]);
  PreFunctionRolesGreaterThan120.setValue([]);
  //firmo
  ContactMasterTable5.setHidden(true);
  TableRecordPremastering.setValue([]);
  TableRecordRemediated.setValue([]);
  TableRecordsMastering.setValue([]);
  selectedCompany.setValue({});
  if((/[a-zA-Z]/.test(data))){
    // check status lock unlock
    if (data.length !== 0) {
      requestTypeLockUnlock.setValue('read');
    }
    //setLockUnlockParams.trigger();
    console.log("BVDID");
    // GetMasteringByBvDID.trigger()
    //GetPremasteringByBVDID.trigger();
    JiraTicketNumber.setValue('');
    utils.openPage("entityDetails", { queryParams: { bvdId: data, orbisId: '', ticket: '' }, newTab: false });

  }
  if(!(/[a-zA-Z]/.test(data))){
    console.log("orbisID")
    // check status lock unlock
    if (data.length !== 0) {
      requestTypeLockUnlock.setValue('read');
    }
    //setLockUnlockParams.trigger();
    // GetMasteringByOrbisId.trigger()
    //GetPremasteringbyORBISID.trigger();
    JiraTicketNumber.setValue('');
    utils.openPage("entityDetails", { queryParams: { orbisId: data, bvdId: '', ticket: '' }, newTab: false });
    
  }
}

  

