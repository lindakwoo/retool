let data = search_box_firmo.value.trim();
loadingPopUp.show();
GlobalEntityId.setValue(null)

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


  

