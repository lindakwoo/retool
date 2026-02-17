const currentConfig = {{dashboard_applications_by_role.value}}
const currentRole = currentConfig?.ADMIN
if(!currentRole?.discover){
  return false
}
return currentRole.discover