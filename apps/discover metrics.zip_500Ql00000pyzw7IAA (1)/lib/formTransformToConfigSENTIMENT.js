// Transforms training form into proper config for dagster run training
const localOrgId = {{urlparams.hash.org_id}}

let targetConfig = {
  "resources": {
    "sentiment_config": {
      "config": {
        "org_id": 0,
        "taxonomy_id": "",
        "backfill_start_date": ""
      }
    }
  }
}
// pull org config
targetConfig.resources.sentiment_config.config.org_id = parseInt({{sentimentform.data.orginput_sentiment}} || localOrgId)

// pull taxonomy id
targetConfig.resources.sentiment_config.config.taxonomy_id = {{transform_active_taxonomy_id.value}}

targetConfig.resources.sentiment_config.config.backfill_start_date = {{sentimentform.data.startdateinputsentiment}}
  
return targetConfig
