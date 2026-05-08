const currentConfig = {{discover_config.value}}
if(!currentConfig.content_generation?.status || currentConfig.content_generation.status === 'disabled'){
  return false
}
return true