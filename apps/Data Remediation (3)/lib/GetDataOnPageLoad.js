
console.log('Get Data on Page load 1');
console.log(CurrentUserObj.value);
loadingPopUp.show();

if (CurrentUserObj.value.product === 'uci') {
  if (('uci' in url.searchParams) && ('ticket' in url.searchParams)) {
    const uci = url.searchParams.uci;
    const ticket = url.searchParams.ticket;
    MainSearchBy.setValue('uci');
    SearchedBy.setValue('uci');
    console.log('JiraTicketNumber value = ', JiraTicketNumber.value);
    JiraTicketNumber.setValue(ticket);
    console.log(url.searchParams);
    if (uci) {
      search_box.setValue(uci);
      SearchedEntity.setValue(uci);
      //  UserDetailsModal.show();
      GetContactInfoByUCI.trigger();
      GetContactInfoByUCIPreMastering.trigger();
    }
  } else {
    console.log('Missing uci Params');
    loadingPopUp.hide();
  }
} else if (CurrentUserObj.value.product === 'firmographics' || CurrentUserObj.value.product === 'all') {
  let data = search_box.value.trim();
  MainSearchBy.setValue('orbis-bvdid');
  if (data) {
    if ((/[a-zA-Z]/.test(data))) {
      console.log("BVDID");
      GetPremasteringByBVDID.trigger();
    } else if (!(/[a-zA-Z]/.test(data))) {
      console.log("orbisID")
      GetPremasteringbyORBISID.trigger();
    }
  } else {
    loadingPopUp.hide();
  }
} else {
  console.log('No Product Found');
  loadingPopUp.hide();
}
