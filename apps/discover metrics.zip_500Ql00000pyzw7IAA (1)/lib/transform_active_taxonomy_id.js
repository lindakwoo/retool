const currentConfig = {{discover_config.value}}
if(!currentConfig.active_taxonomy_id){
  return ''
}
return currentConfig.active_taxonomy_id