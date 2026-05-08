let currentConfig = {{discover_config.value}}
      
// product status
const currentStatus = {{discover_status_picker.value}}
currentConfig.status = currentStatus

// viewable tier
const currentViewableTier = {{discover_viewable_tier.value}}
currentConfig.discover_viewable_tier = currentViewableTier

// multilingual
let currentMultilingual = {}
const currentMultilingualCheckbox = {{enable_multilingual.value}} ? "enabled" : "disabled"
if(currentConfig.hasOwnProperty('multi_language_support')) {
  currentMultilingual = currentConfig.multi_language_support
}
currentMultilingual.status = currentMultilingualCheckbox
currentConfig.multi_language_support = currentMultilingual

// content generation
let currentGeneration = {}
const currentGenerateContentCheckbox = {{enable_content_generation.value}} ? "enabled" : "disabled"
if(currentConfig.hasOwnProperty('content_generation')) {
  currentGeneration = currentConfig.content_generation
}
currentGeneration.status = currentGenerateContentCheckbox
currentConfig.content_generation = currentGeneration

// channels
const pickedChannels = {{ channel_select.value }}
if(pickedChannels.length > 0) {
  currentConfig.filter_by_channels = pickedChannels        
}

// discover for chat
const currentDiscoverForChatCheckbox = {{enable_discover_for_chat.value}}
currentConfig.discover_for_chats = currentDiscoverForChatCheckbox

// discover for voice
const currentDiscoverForVoiceCheckbox = {{enable_discover_for_voice.value}}
currentConfig.discover_for_voice = currentDiscoverForVoiceCheckbox

// trial end date
const currentTrialEndDate = {{trial_end_date.value}}
const unixEndDate = Math.floor(new Date(currentTrialEndDate).getTime() / 1000);
currentConfig.trial_end_date_timestamp = unixEndDate

// segmentations
const newSegmentations = {{segmentations_editor2.value}}
if(newSegmentations) {
  currentConfig.content_generation.article_segmentations = newSegmentations
}

return {...currentConfig}