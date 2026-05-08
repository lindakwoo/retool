// Transforms training form into proper config for dagster run training
const localOrgId = {{urlparams.hash.org_id}}

let targetConfig = {
  "ops": {
    "training_discover_graph": {
      "ops": {
        "training_generate_ticket_data": {
          "config": {
            "additional_args": {
              "end_date_iso": "2023-07-07",
              "start_date_iso": "2021-07-07",
              "max_num_examples": 160000
            }
          }
        },
        "training_generate_chat_data": {
          "config": {
            "additional_args": {
              "end_date_iso": "2023-07-07",
              "start_date_iso": "2021-07-07",
              "max_num_examples": 160000
            }
          }
        },
        "training_generate_voice_data": {
          "config": {
            "additional_args": {
              "end_date_iso": "2023-07-07",
              "start_date_iso": "2021-07-07",
              "max_num_examples": 160000
            }
          }
        }
      },
    }
  },
  "resources": {
    "training_config": {
      "config": {
        "org_id": 0,
        "discover_for_voice": false,
        "discover_for_chats": false,
        "discover_for_tickets": true,
        "train_only": false
      }
    }
  }
}

// pull org config
targetConfig.resources.training_config.config.org_id = parseInt({{trainingform.data.orginput}} || localOrgId)

// pull sample size (tickets)
targetConfig.ops.training_discover_graph.ops.training_generate_ticket_data.config.additional_args.max_num_examples = parseInt({{trainingform.data.samplesizeinput}} || 160000)
// pull sample size (chat)
targetConfig.ops.training_discover_graph.ops.training_generate_chat_data.config.additional_args.max_num_examples = parseInt({{trainingform.data.samplesizeinput}} || 160000)
// pull sample size (voice)
targetConfig.ops.training_discover_graph.ops.training_generate_voice_data.config.additional_args.max_num_examples = parseInt({{trainingform.data.samplesizeinput}} || 160000)

// taxonomy version
targetConfig.resources.training_config.config.taxonomy_version = {{trainingform.data.versioninput}} === 'V2' ? "2404_trpl_openai_v2" : "2509_trpl_openai_v3"

// pull target dates (tickets)
targetConfig.ops.training_discover_graph.ops.training_generate_ticket_data.config.additional_args.end_date_iso = {{trainingform.data.enddateinput}}
targetConfig.ops.training_discover_graph.ops.training_generate_ticket_data.config.additional_args.start_date_iso = {{trainingform.data.startdateinput}}
// pull target dates (chat)
targetConfig.ops.training_discover_graph.ops.training_generate_chat_data.config.additional_args.end_date_iso = {{trainingform.data.enddateinput}}
targetConfig.ops.training_discover_graph.ops.training_generate_chat_data.config.additional_args.start_date_iso = {{trainingform.data.startdateinput}}
// pull target dates (voice)
targetConfig.ops.training_discover_graph.ops.training_generate_voice_data.config.additional_args.end_date_iso = {{trainingform.data.enddateinput}}
targetConfig.ops.training_discover_graph.ops.training_generate_voice_data.config.additional_args.start_date_iso = {{trainingform.data.startdateinput}}

// pull train only
targetConfig.resources.training_config.config.train_only = {{trainingform.data.trainonly}}
  
// pull training sources
const data_sources = {{trainingform.data.data_source}}
targetConfig.resources.training_config.config.discover_for_tickets = data_sources.includes('tickets')
targetConfig.resources.training_config.config.discover_for_chats = data_sources.includes('chats')
targetConfig.resources.training_config.config.discover_for_voice = data_sources.includes('voice')


return targetConfig