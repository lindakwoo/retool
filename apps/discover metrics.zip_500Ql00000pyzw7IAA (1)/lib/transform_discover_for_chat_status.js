const currentConfig = {{discover_config.value}}
if(currentConfig?.discover_for_chats === undefined){
  return true
} else if (!currentConfig.discover_for_chats) { return false}
return true