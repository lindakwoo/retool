let params = {}
if (SearchedEntity.value.length !== 0) {
  let data = SearchedEntity.value.trim();
  if((/[a-zA-Z]/.test(data))){
    params = {
        "bvd_id" : data.toUpperCase()
    };
  }
  if(!(/[a-zA-Z]/.test(data))){
    params = {
        "orbis_id" : data.toUpperCase()
    };
  }
}

params = {
  ...params,
  "ticket_id" : url.searchParams?.ticket ? url.searchParams?.ticket : '',
  "user_id" : CurrentUserObj?.value?.user_id ?  CurrentUserObj?.value?.user_id : '',
  "email" : CurrentUserObj?.value?.email ?  CurrentUserObj?.value?.email : '',
  "request_type" : requestTypeLockUnlock.value ? requestTypeLockUnlock.value : 'read'
}
lockUnlockParams.setValue(params);
entityLockOrUnlockAPI.trigger();