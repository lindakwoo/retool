var hisStatus = 0;
if (curRecord && curRecord.function && curRecord.function.item && curRecord.function.item.historizationStatus) {
  hisStatus = curRecord.function.item.historizationStatus;
} else {
  hisStatus = CurrentSelectedRole.value.function.item.historizationStatus;
}

GetCurrentRolesByFunctionCode.trigger({
  additionalScope: {
    function_codes: CurrentSelectedRole.value.functionCodes ? CurrentSelectedRole.value.functionCodes.join(',') : '',
    target_id: CurrentSelectedRole.value.entityId.match(/_(\d+)_/)[1],
    historization_status: hisStatus
  }
})

// Taking historization status from put response - this fails if data isnt pushed to mastering from premastering.