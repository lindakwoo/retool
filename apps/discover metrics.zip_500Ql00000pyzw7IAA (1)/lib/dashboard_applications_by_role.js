// Tip: assign your external references to variables instead of chaining off the curly brackets.
const currentConfigApps = {{get_dashboard_apps_by_role.data}}
if(!currentConfigApps || currentConfigApps.length === 0) {
  return {}
}
return currentConfigApps[0].org_feature_value