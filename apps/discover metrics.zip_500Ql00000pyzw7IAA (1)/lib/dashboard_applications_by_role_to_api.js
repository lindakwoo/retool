const currentConfig = {{dashboard_applications_by_role.value}}
const currentADMIN = currentConfig?.ADMIN || {}
const currentCheckbox = {{!enabled_for_admins.value}}

const mergedConfig = {...currentConfig, "ADMIN": {...currentADMIN, "discover":currentCheckbox}}
return mergedConfig