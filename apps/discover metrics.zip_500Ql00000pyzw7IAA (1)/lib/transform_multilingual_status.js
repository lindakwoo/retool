const currentConfig = {{discover_config.value}}
if(!currentConfig.multi_language_support?.status || currentConfig.multi_language_support.status === 'enabled'){
  return true
}
return false