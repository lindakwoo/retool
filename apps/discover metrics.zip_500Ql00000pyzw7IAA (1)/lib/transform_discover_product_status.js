const currentConfig = {{discover_config.value}}
if(!currentConfig.status || currentConfig.status === 'disabled'){
  return false
}
return true