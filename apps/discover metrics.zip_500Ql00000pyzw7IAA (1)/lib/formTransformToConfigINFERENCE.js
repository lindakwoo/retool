// Transforms training form into proper config for dagster run training
const localOrgId = {{urlparams.hash.org_id}}

let targetConfig = {
  "ops": {
    "inference_discover_graph": {
      "ops":{
        "inference_generate_ticket_data": {
          "config": {
            "additional_args": {
              "end_date_iso": "2023-07-07",
              "start_date_iso": "2021-07-07",
              "max_num_examples": 160000
            }
          }
        }
      }
    }
  },
  "resources": {
    "inference_config": {
      "config": {
        "org_id": 0,
        "taxonomy_id": ""
      }
    }
  }
}
// pull org config
targetConfig.resources.inference_config.config.org_id = parseInt({{inferenceform.data.orginput_inference}} || localOrgId)

// pull taxonomy id
targetConfig.resources.inference_config.config.taxonomy_id = {{transform_active_taxonomy_id.value}}

// pull doc size
targetConfig.ops.inference_discover_graph.ops.inference_generate_ticket_data.config.additional_args.max_num_examples = parseInt({{inferenceform.data.docsizeinput_inference}} || 160000)

// pull target dates
targetConfig.ops.inference_discover_graph.ops.inference_generate_ticket_data.config.additional_args.end_date_iso = {{inferenceform.data.enddateinput_inference}}
targetConfig.ops.inference_discover_graph.ops.inference_generate_ticket_data.config.additional_args.start_date_iso = {{inferenceform.data.startdateinputinference}}

  
return targetConfig
