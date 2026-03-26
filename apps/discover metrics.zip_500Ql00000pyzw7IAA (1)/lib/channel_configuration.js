let channels = ["Email", "web", "api", "email", "chat", "form", "portal",]
const currentOrgConfigArray = {{get_discover_org_config.data}}
if(!currentOrgConfigArray || currentOrgConfigArray.length !== 0) {
  const currentConfig = currentOrgConfigArray[0].org_feature_value
  if(currentConfig.filter_by_channels){
    channels = currentConfig.filter_by_channels
  }
}
return "'" + channels.join("','") + "'"