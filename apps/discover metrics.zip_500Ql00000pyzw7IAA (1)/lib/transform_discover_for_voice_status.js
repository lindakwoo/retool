const currentConfig = {{discover_config.value}}
if(currentConfig?.discover_for_voice === undefined){
  return false
} else if (currentConfig.discover_for_voice) { return true}
return false