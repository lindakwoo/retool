if (CurrentUserObj?.value?.user_role?.some(role => ['admin', 'uci_analyst', 'super_admin'].includes(role))) {
   return false;
}else{
  return true;
}
