//  TableAuditInfo.clearFilterStack();
let data = txtboxSearchAuditInfo2.value.trim();
let tempObj = {};
loadingPopUp.show();
if (radioAudit2.value === 'Ticket Number') {
  tempObj = {
    ...tempObj,
   "ticket_id": data
  }
} else if (radioAudit2.value === 'User Email') {
  let changeFormate = data.toLowerCase().replace(/[@.]/g, '-');
  //  console.log('changeFormate', changeFormate);
  tempObj = {
    ...tempObj,
   "user_id": changeFormate
  }
} else if (radioAudit2.value === 'UCI') {
  console.log('UCI Search');
  tempObj = {
    ...tempObj,
   "entity_id": data
  }
  VarAuditTrailData.setValue([]);
} else {
  if (/[a-zA-Z]/.test(data)) {
    tempObj = {
    ...tempObj,
     "bvd_id": data
    }
  } if (!/[a-zA-Z]/.test(data)) {
     tempObj = {
    ...tempObj,
     "orbis_id": data
    }
  }
  VarAuditTrailData.setValue([]);
}

// Date range convert.
readAuditParams.setValue({
  ...tempObj,
  "from": moment(from_date2.formattedValue, "MM-DD-YYYY").format("YYYY-MM-DD"),
  "to": moment(to_date2.formattedValue, "MM-DD-YYYY").format("YYYY-MM-DD"),
})
readAuditTrail.trigger();