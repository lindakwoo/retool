// Tip: assign your external references to variables instead of chaining off the curly brackets.
const currentOrgConfigArray = {{get_discover_org_config.data}}
if(!currentOrgConfigArray || currentOrgConfigArray.length === 0) {
  return {}
}
const currentConfig = currentOrgConfigArray[0].org_feature_value
return currentConfig