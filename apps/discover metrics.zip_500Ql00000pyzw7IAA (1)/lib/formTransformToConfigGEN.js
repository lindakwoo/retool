// Transforms training form into proper config for dagster run training
const localOrgId = {{urlparams.hash.org_id}}

let targetConfig = {
  "ops": {
    "make_single_org_job": {
      "config": {
        "org_id": 0,
        "taxonomy_id": "abcdef"
      }
    }
  }
}

// pull org config
targetConfig.ops.make_single_org_job.config.org_id = parseInt({{genform.data.orginput_gen}} || localOrgId)

// pull taxonomy id
targetConfig.ops.make_single_org_job.config.taxonomy_id = {{genform.data.taxonomyinput_gen}} || {{ transform_active_taxonomy_id.value }}

return targetConfig