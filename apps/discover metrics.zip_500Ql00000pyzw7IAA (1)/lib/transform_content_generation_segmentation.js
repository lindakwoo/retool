const currentConfig = {{discover_config.value}}
if(!currentConfig.content_generation?.is_segmentation_enabled || currentConfig.content_generation.is_segmentation_enabled === false){
  return false
}
return true