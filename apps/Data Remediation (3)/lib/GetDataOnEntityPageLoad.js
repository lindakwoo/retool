
console.log('Get Data on Entity Page load');
console.log(CurrentUserObj.value);
loadingPopUp.hide();
loadingPopUp.show();
if (CurrentUserObj.value.product === 'uci') {
  //  if (('uci' in urlparams) && ('ticket' in urlparams)) {
  //    const uci = urlparams.uci;
  //    const ticket = urlparams.ticket;
  //    MainSearchBy.setValue('uci');
  //    JiraTicketNumber.setValue(ticket);
  //    console.log(urlparams);
  //    if (uci) {
  //      search_box.setValue(uci);
  //      //  UserDetailsModal.show();
  //      GetContactInfoByUCI.trigger();
  //      GetContactInfoByUCIPreMastering.trigger();
  //    }
  //  } else {
  //    console.log('Missing uci Params');
  //  }
   utils.openPage("home", { newTab: false });
} else if (CurrentUserObj.value.product === 'firmographics' || CurrentUserObj.value.product === 'all') {
  if (('orbisId' in url.searchParams) && ('bvdId' in url.searchParams) && ('ticket' in url.searchParams)) {
    const orbisId = url.searchParams.orbisId;
    const bvdId = url.searchParams.bvdId;
    const ticket = url.searchParams.ticket;
    //  MainSearchBy.setValue('orbis-bvdid');
    SearchedBy.setValue('orbis-bvdid');
    //  console.log('jira ticket number = ', JiraTicketNumber.value);
    JiraTicketNumber.setValue(ticket);
    console.log('entity page url params');
    console.log(url.searchParams);
  let standerUserInclude = (CurrentUserObj?.value?.user_role?.filter((data) => data === 'standard_user').length === 0 ) ? false : true;
    //  console.log('standard_user',standerUserInclude)

    loadingPopUp.show();
    if(orbisId) {
      console.log('orbisId',orbisId)
      SearchedEntity.setValue(orbisId);
      //  pageLoadValidEntity.setValue(true);
      
      if (Object.keys(selectedCompany.value).length === 0) {
        GetMasteringByOrbisId.trigger();
      } else {
        loadingPopUp.hide();
      }
      //  
     // GetPremasteringbyORBISID.trigger();
      
      if (!standerUserInclude && (JiraTicketNumber.value.length === 0 && ticket.length !== 0)) {
        
        requestTypeLockUnlock.setValue('lock');
        setLockUnlockParams.trigger();
      } else {
         requestTypeLockUnlock.setValue('read');
        //setLockUnlockParams.trigger();
      }
      
    } else if(bvdId) {
      console.log('bvdId', bvdId)
      SearchedEntity.setValue(bvdId);
      //  pageLoadValidEntity.setValue(true);
      if (Object.keys(selectedCompany.value).length === 0) {
        GetMasteringByBvDID.trigger();
      }
     // GetPremasteringByBVDID.trigger();
      if (!standerUserInclude && (JiraTicketNumber.value.length === 0 && ticket.length !== 0)) {
        requestTypeLockUnlock.setValue('lock');
        setLockUnlockParams.trigger();
      } else {
         requestTypeLockUnlock.setValue('read');
       // setLockUnlockParams.trigger();
      }
    }
  } else {
    console.log('Missing firmo Params');
    utils.openPage("home", { newTab: false });
  }
} else {
  console.log('No Product Found');
  utils.openPage("home", { newTab: false });
} 




