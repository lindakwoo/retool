const datalakeChannels = {{get_channel_counts.data.channel}}
const configChannels = {{discover_config.value.filter_by_channels}}
const channelSet = new Set()
datalakeChannels.forEach((v) => channelSet.add(v))
if(configChannels) {
    configChannels.forEach((v) => channelSet.add(v))
  }
return Array.from(channelSet)