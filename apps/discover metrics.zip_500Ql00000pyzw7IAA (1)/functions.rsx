<GlobalFunctions>
  <Folder id="get_database_data">
    <ElasticSearchQuery
      id="count_es_docs_with_aggs"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/count_es_docs_with_aggs.json5", "string")}
      queryDisabled="{{!urlparams.hash.org_id}}"
      resourceName="41f03c38-3dc4-482d-ab0a-bbbd23910926"
      transformer={
        "// type your code here\n// example: return formatDataAsArray(data).filter(row => row.quantity > 20)\nvar res = {}\nfor (const element of data.aggregations.clusters.buckets){\n  res[element[\"key\"]] = element[\"doc_count\"]\n}\nvar misc = res['Miscellaneous']\nvar has_cluster = res['Has Cluster']\nvar percent = 100 * has_cluster / (misc + has_cluster)\nres ['percent'] = percent.toFixed(2)\nreturn res"
      }
    />
    <NoSqlQuery
      id="count_mongo_discover_articles"
      collection="discover_article"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      method="count"
      query={include("./lib/count_mongo_discover_articles.query", "string")}
      queryDisabled="{{!urlparams.hash.org_id}}"
      resourceName="11f04b1d-1e91-4b21-b7db-8a20efdc05db"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      useRawCollectionName={true}
    />
    <AthenaQuery
      id="count_tickets_from_discover_pipeline"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include(
        "./lib/count_tickets_from_discover_pipeline.sql",
        "string"
      )}
      queryDisabled="{{ !urlparams.hash.org_id }}"
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <AthenaQuery
      id="count_tickets_in_metrics_table"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/count_tickets_in_metrics_table.sql", "string")}
      queryDisabled="{{!urlparams.hash.org_id}}"
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <ElasticSearchQuery
      id="count_total_es_docs"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/count_total_es_docs.json5", "string")}
      queryDisabled="{{!urlparams.hash.org_id}}"
      resourceName="41f03c38-3dc4-482d-ab0a-bbbd23910926"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <NoSqlQuery
      id="getHelpdesk"
      collection="org_feature"
      query={include("./lib/getHelpdesk.query", "string")}
      resourceName="11f04b1d-1e91-4b21-b7db-8a20efdc05db"
    />
    <OpenAPIQuery
      id="getTicketCount"
      enableTransformer={true}
      isMultiplayerEdited={false}
      method="post"
      operationId="post__admin_api_precheck_discover_run"
      parameterMetadata=""
      path="/admin/api/precheck-discover-run"
      queryDisabled="{{ enddateinput.invalid || startdateinput.invalid || !helpdesk.value || !urlparams.hash.org_id }}"
      requestBody={
        '{"query_args":{"table_name":"metrics__tickets_combined","database_name":"{{ database_name.value }}","end_date_iso":"{{ enddateinput.value}}","start_date_iso":"{{ startdateinput.value }}","org_id":"{{ urlparams.hash.org_id }}","helpdesk":"{{ helpdesk.value }}"},"threshold":"{{ samplesizeinput.value || 80000 }}"}'
      }
      requestBodyDynamicStates={'{"threshold":false,"query_args":false}'}
      requestBodyMetadata=""
      resourceName="eba15dd2-a343-41a3-8651-fface54f54f1"
      resourceTypeOverride=""
      runWhenPageLoads={true}
      runWhenPageLoadsDelay="5000"
      transformer="return { ...data, total: data.ticket_count };"
      watchedParams={[
        "enddateinput.invalid || startdateinput.invalid || !helpdesk.value || !urlparams.hash.org_id",
      ]}
    />
    <AthenaQuery
      id="get_channel_counts"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/get_channel_counts.sql", "string")}
      queryDisabled="{{!org_id_as_int.value || !dateQueries.data.startDate}}"
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <NoSqlQuery
      id="get_dashboard_apps_by_role"
      collection="org_feature"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/get_dashboard_apps_by_role.query", "string")}
      queryDisabled="{{ !urlparams.hash.org_id }}"
      resourceName="11f04b1d-1e91-4b21-b7db-8a20efdc05db"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <NoSqlQuery
      id="get_discover_org_config"
      collection="org_feature"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/get_discover_org_config.query", "string")}
      queryDisabled="{{ !urlparams.hash.org_id }}"
      resourceName="11f04b1d-1e91-4b21-b7db-8a20efdc05db"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    >
      <Event
        enabled="{{!taxonomySelect.value}}"
        event="success"
        method="setValue"
        params={{
          ordered: [
            { value: "{{transform_active_taxonomy_id.value}}" },
            { strict: true },
          ],
        }}
        pluginId="taxonomySelect"
        type="widget"
        waitMs="500"
        waitType="throttle"
      />
    </NoSqlQuery>
    <AthenaQuery
      id="get_taxonomy_ids"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/get_taxonomy_ids.sql", "string")}
      queryDisabled="{{ !urlparams.hash.org_id }}"
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
console.log(data)
return data"
    >
      <Event
        event="success"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { onSuccess: null },
                  { onFailure: null },
                  { additionalScope: null },
                ],
              },
            },
          ],
        }}
        pluginId="reset_state"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </AthenaQuery>
    <ElasticSearchQuery
      id="get_ticket_api_keys"
      enableTransformer={true}
      isMultiplayerEdited={false}
      method="indices.getMapping"
      query={include("./lib/get_ticket_api_keys.json5", "string")}
      resourceName="41f03c38-3dc4-482d-ab0a-bbbd23910926"
      runWhenModelUpdates={false}
      transformer="function alphanumericSort(list) {
  return [...list].sort((a, b) => {
    // Convert elements to strings to handle mixed types
    const strA = String(a).toLowerCase();
    const strB = String(b).toLowerCase();
    
    // Check if both are letters or both are numbers
    const aIsLetter = /^[a-z]/i.test(strA);
    const bIsLetter = /^[a-z]/i.test(strB);
    const aIsNumber = /^[0-9]/.test(strA);
    const bIsNumber = /^[0-9]/.test(strB);
    
    // Letters come before numbers
    if (aIsLetter && bIsNumber) return -1;
    if (aIsNumber && bIsLetter) return 1;
    
    // If same type, perform standard string comparison
    return strA.localeCompare(strB, undefined, { numeric: true });
  });
}
const badTypes = ['date', 'long', 'text'];
let badFields = ['id', 'assignedUser'];
if({{ helpdesk.value }} === 'zendesk') {
  badFields = ['id', 'assignedUser', 'brand_name', 'group_name', 'organization_name', 'ticket_form_name', 'collaborator_ids', 'assignee_id', 'follower_ids', 'requester_id', 'submitter_id', 'email_cc_ids']
}
const orgId = {{  org_id_as_int.value}}
return alphanumericSort(Object.entries(data[`${orgId}_tickets_metrics_v1`].mappings.properties.ticket.properties).filter(val => !badTypes.includes(val[1].type) && !badFields.includes(val[0])).map(val => val[0]))"
    />
    <ElasticSearchQuery
      id="get_ticket_api_values"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/get_ticket_api_values.json5", "string")}
      resourceName="41f03c38-3dc4-482d-ab0a-bbbd23910926"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="return data.aggregations.values.buckets"
    />
    <AthenaQuery
      id="get_article_api_keys"
      isMultiplayerEdited={false}
      query={include("./lib/get_article_api_keys.sql", "string")}
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
    />
    <AthenaQuery
      id="get_article_sources"
      isMultiplayerEdited={false}
      query={include("./lib/get_article_sources.sql", "string")}
      resourceName="7460484f-cce3-4a0e-a888-3106379d80b0"
      resourceTypeOverride=""
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="update_article_table"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </AthenaQuery>
    <State id="article_segment_map_table_data" />
  </Folder>
  <Folder id="page_utils">
    <Function
      id="admin_discover_role"
      funcBody={include("./lib/admin_discover_role.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="channel_configuration"
      funcBody={include("./lib/channel_configuration.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="combined_channels_default_and_retrieved"
      funcBody={include(
        "./lib/combined_channels_default_and_retrieved.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <State id="current_key_getter" />
    <Function
      id="dashboard_applications_by_role"
      funcBody={include("./lib/dashboard_applications_by_role.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="database_name"
      funcBody={include("./lib/database_name.js", "string")}
      runBehavior="debounced"
    />
    <JavascriptQuery
      id="dateQueries"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query={include("./lib/dateQueries.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    />
    <Function
      id="discover_config"
      funcBody={include("./lib/discover_config.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="helpdesk"
      funcBody={include("./lib/helpdesk.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="org_id_as_int"
      funcBody={include("./lib/org_id_as_int.js", "string")}
      runBehavior="debounced"
    />
    <JavascriptQuery
      id="reset_state"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/reset_state.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    >
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="discover_status_picker"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="channel_select"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="enable_content_generation"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="enable_multilingual"
        type="widget"
        waitMs=""
        waitType="debounce"
      />
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="enable_discover_for_chat"
        type="widget"
        waitMs=""
        waitType="debounce"
      />
      <Event
        event="success"
        method="resetValue"
        params={{ ordered: [] }}
        pluginId="trial_end_date"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="value_buckets"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "[]" }] }}
        pluginId="renamed_table_data"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <Function
      id="transform_active_taxonomy_id"
      funcBody={include("./lib/transform_active_taxonomy_id.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="transform_content_generation_segmentation"
      funcBody={include(
        "./lib/transform_content_generation_segmentation.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <Function
      id="transform_content_generation_status"
      funcBody={include(
        "./lib/transform_content_generation_status.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <Function
      id="transform_discover_for_chat_status"
      funcBody={include(
        "./lib/transform_discover_for_chat_status.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <Function
      id="transform_discover_product_status"
      funcBody={include("./lib/transform_discover_product_status.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="transform_multilingual_status"
      funcBody={include("./lib/transform_multilingual_status.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="transform_trial_end_date_timestamp"
      funcBody={include(
        "./lib/transform_trial_end_date_timestamp.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <Function
      id="transformer19helpdesk"
      funcBody={include("./lib/transformer19helpdesk.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="transform_discover_for_voice_status"
      funcBody={include(
        "./lib/transform_discover_for_voice_status.js",
        "string"
      )}
      runBehavior="debounced"
    />
  </Folder>
  <Folder id="transform_forms">
    <Function
      id="formTransformToConfigGEN"
      funcBody={include("./lib/formTransformToConfigGEN.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="formTransformToConfigINFERENCE"
      funcBody={include("./lib/formTransformToConfigINFERENCE.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="formTransformToConfigSENTIMENT"
      funcBody={include("./lib/formTransformToConfigSENTIMENT.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="formTransformToConfigTRAINING"
      funcBody={include("./lib/formTransformToConfigTRAINING.js", "string")}
      runBehavior="debounced"
    />
  </Folder>
  <Folder id="run_dagster">
    <GraphQLQuery
      id="dagster_run_gen"
      body={include("./lib/dagster_run_gen.gql", "string")}
      graphQLVariables={
        '[{"key":"repositoryLocationName","value":"ml-training"},{"key":"repositoryName","value":"discover"},{"key":"jobName","value":"generate_content_for_org_v2"},{"key":"runConfigData","value":"{{formTransformToConfigGEN.value}}"},{"key":"orgTag","value":"{{trainingform.data.orginput}}"},{"key":"userTag","value":"{{current_user.email}}"}]'
      }
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </GraphQLQuery>
    <GraphQLQuery
      id="dagster_run_inference"
      body={include("./lib/dagster_run_inference.gql", "string")}
      graphQLVariables={
        '[{"key":"repositoryLocationName","value":"ml-training"},{"key":"repositoryName","value":"discover"},{"key":"jobName","value":"inference_pipeline"},{"key":"runConfigData","value":"{{formTransformToConfigINFERENCE.value}}"},{"key":"orgTag","value":"{{inferenceform.data.orginput_inference}}"},{"key":"userTag","value":"{{current_user.email}}"}]'
      }
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </GraphQLQuery>
    <GraphQLQuery
      id="dagster_run_sentiment"
      body={include("./lib/dagster_run_sentiment.gql", "string")}
      graphQLVariables={
        '[{"key":"repositoryLocationName","value":"ml-training"},{"key":"repositoryName","value":"discover"},{"key":"jobName","value":"sentiment_pipeline"},{"key":"runConfigData","value":"{{formTransformToConfigSENTIMENT.value}}"},{"key":"orgTag","value":"{{sentimentform.data.orginput_sentiment}}"},{"key":"userTag","value":"{{current_user.email}}"}]'
      }
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </GraphQLQuery>
    <GraphQLQuery
      id="dagster_run_training"
      body={include("./lib/dagster_run_training.gql", "string")}
      graphQLVariables={
        '[{"key":"repositoryLocationName","value":"ml-training"},{"key":"repositoryName","value":"discover"},{"key":"jobName","value":"training_pipeline"},{"key":"runConfigData","value":"{{formTransformToConfigTRAINING.value}}"},{"key":"orgTag","value":"{{trainingform.data.orginput}}"},{"key":"userTag","value":"{{current_user.email}}"}]'
      }
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
    >
      <Event
        event="success"
        method="confetti"
        params={{ ordered: [] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </GraphQLQuery>
  </Folder>
  <Folder id="get_dagster">
    <GraphQLQuery
      id="dagster_get_inference_jobs"
      body={include("./lib/dagster_get_inference_jobs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={'[{"key":"pipelineName","value":"inference_pipeline"}]'}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      transformer="function msToTime(s) {
  var ms = s % 1000;
  s = (s - ms) / 1000;
  var secs = s % 60;
  s = (s - secs) / 60;
  var mins = s % 60;
  var hrs = (s - mins) / 60;

  return hrs.toString().padStart(2,0) + ':' + mins.toString().padStart(2,0) + ':' + secs.toString().padStart(2,0);
}
function getOrgFromConfig(run) {
  if(run.pipelineName === 'training_pipeline') {
    return run.runConfig.resources.training_config.config.org_id
  } else if(run.pipelineName === 'inference_pipeline') {
    return run.runConfig.resources.inference_config.config.org_id
  }
  return null
}

var runs = data.pipelineRunsOrError.results
runs = runs.map(run => {
  var org_id_tag = run.tags.find(tag => tag.key === 'org_id')
  var run_by_tag = run.tags.find(tag => tag.key === 'run_by')
  var org_in_config = getOrgFromConfig(run)
  run['org_id'] = org_in_config ? org_in_config : org_id_tag ? org_id_tag.value : null
  run['run_by'] = run_by_tag ? run_by_tag.value : null
  run['startTime'] = new Date(run.startTime * 1000)
  run['endTime'] = new Date(run.endTime * 1000)
  run['updateTime'] = new Date(run.updateTime * 1000)
  run['runTime'] = run.endTime ? msToTime(run.endTime - run.startTime) : msToTime(run.updateTime - run.startTime)
  run['link'] = `https://dagster-prod.forethought.tech/runs/${run.runId}`
  delete run.tags
  return run
})
// filter out runs from not this org
runs = runs.filter(run => run.org_id.toString() === {{ urlparams.hash.org_id }})
var numberRuns = data['pipelineRunsOrError']['count']
return runs"
    />
    <GraphQLQuery
      id="dagster_get_sentiment_jobs"
      body={include("./lib/dagster_get_sentiment_jobs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"pipelineName","value":"sentiment_pipeline"},{"key":"","value":""},{"key":"","value":""}]'
      }
      isMultiplayerEdited={false}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      transformer="function msToTime(s) {
  var ms = s % 1000;
  s = (s - ms) / 1000;
  var secs = s % 60;
  s = (s - secs) / 60;
  var mins = s % 60;
  var hrs = (s - mins) / 60;

  return hrs.toString().padStart(2,0) + ':' + mins.toString().padStart(2,0) + ':' + secs.toString().padStart(2,0);
}


function getOrgFromConfig(run) {
  if(run.pipelineName === 'training_pipeline') {
    return run.runConfig.resources.training_config.config.org_id
  } else if(run.pipelineName === 'inference_pipeline') {
    return run.runConfig.resources.inference_config.config.org_id
  }else if(run.pipelineName === 'sentiment_pipeline') {
    return run.runConfig.resources.sentiment_config.config.org_id
  }
  return null
}

var runs = data.pipelineRunsOrError.results
runs = runs.map(run => {
  var org_id_tag = run.tags.find(tag => tag.key === 'org_id')
  var run_by_tag = run.tags.find(tag => tag.key === 'run_by')
  var org_in_config = getOrgFromConfig(run)
  run['org_id'] = org_in_config ? org_in_config : org_id_tag ? org_id_tag.value : null
  run['run_by'] = run_by_tag ? run_by_tag.value : null
  run['startTime'] = new Date(run.startTime * 1000)
  run['endTime'] = new Date(run.endTime * 1000)
  run['updateTime'] = new Date(run.updateTime * 1000)
  run['runTime'] = run.endTime ? msToTime(run.endTime - run.startTime) : msToTime(run.updateTime - run.startTime)
  run['link'] = `https://dagster-prod.forethought.tech/runs/${run.runId}`
  delete run.tags
  return run
})
// filter out runs from not this org
runs = runs.filter(run => run.org_id.toString() === {{ urlparams.hash.org_id }})
var numberRuns = data['pipelineRunsOrError']['count']
return runs"
    />
    <GraphQLQuery
      id="dagster_get_training_jobs"
      body={include("./lib/dagster_get_training_jobs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={'[{"key":"pipelineName","value":"training_pipeline"}]'}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      transformer="function msToTime(s) {
  var ms = s % 1000;
  s = (s - ms) / 1000;
  var secs = s % 60;
  s = (s - secs) / 60;
  var mins = s % 60;
  var hrs = (s - mins) / 60;

  return hrs.toString().padStart(2,0) + ':' + mins.toString().padStart(2,0) + ':' + secs.toString().padStart(2,0);
}


function getOrgFromConfig(run) {
  if(run.pipelineName === 'training_pipeline') {
    return run.runConfig.resources.training_config.config.org_id
  } else if(run.pipelineName === 'inference_pipeline') {
    return run.runConfig.resources.inference_config.config.org_id
  }
  return null
}

var runs = data.pipelineRunsOrError.results
runs = runs.map(run => {
  var org_id_tag = run.tags.find(tag => tag.key === 'org_id')
  var run_by_tag = run.tags.find(tag => tag.key === 'run_by')
  var org_in_config = getOrgFromConfig(run)
  run['org_id'] = org_in_config ? org_in_config : org_id_tag ? org_id_tag.value : null
  run['run_by'] = run_by_tag ? run_by_tag.value : null
  run['startTime'] = new Date(run.startTime * 1000)
  run['endTime'] = new Date(run.endTime * 1000)
  run['updateTime'] = new Date(run.updateTime * 1000)
  run['runTime'] = run.endTime ? msToTime(run.endTime - run.startTime) : msToTime(run.updateTime - run.startTime)
  run['link'] = `https://dagster-prod.forethought.tech/runs/${run.runId}`
  delete run.tags
  return run
})
// filter out runs from not this org
runs = runs.filter(run => run.org_id.toString() === {{ urlparams.hash.org_id }})
var numberRuns = data['pipelineRunsOrError']['count']
return runs"
    />
    <GraphQLQuery
      id="get_respositories"
      body={include("./lib/get_respositories.gql", "string")}
      enableTransformer={true}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
    />
    <GraphQLQuery
      id="inference_logs"
      body={include("./lib/inference_logs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"runId","value":"{{inference_table?.selectedRow?.data?.runId}}"}]'
      }
      queryDisabled="{{!inference_table?.selectedRow?.data?.runId}}"
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      transformer={
        "var logs = data.logsForRun.events.filter(current => Boolean(current.message) && Boolean(current.timestamp) && Boolean(current.stepKey))\nlogs = logs.map(current => {\n  current['timestamp'] = new Date(eval(current['timestamp'])).toTimeString().substr(0,8)\n  return `**[${current['timestamp']}] ${current['stepKey']}** - ${current['message']}`\n})\nvar logString = logs.reduce((acc,cum) => acc.concat(\"\\n\").concat(cum), \"\")\nreturn logString"
      }
    />
    <GraphQLQuery
      id="sentiment_logs"
      body={include("./lib/sentiment_logs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"runId","value":"{{sentiment_table?.selectedRow?.data?.runId}}"}]'
      }
      queryDisabled="{{!training_table?.selectedRow?.data?.runId}}"
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      transformer={
        "var logs = data.logsForRun.events.filter(current => Boolean(current.message) && Boolean(current.timestamp) && Boolean(current.stepKey))\nlogs = logs.map(current => {\n  current['timestamp'] = new Date(eval(current['timestamp'])).toTimeString().substr(0,8)\n  return `**[${current['timestamp']}] ${current['stepKey']}** - ${current['message']}`\n})\nvar logString = logs.reduce((acc,cum) => acc.concat(\"\\n\").concat(cum), \"\")\nreturn logString"
      }
    />
    <GraphQLQuery
      id="training_logs"
      body={include("./lib/training_logs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"runId","value":"{{training_table?.selectedRow?.data?.runId}}"}]'
      }
      queryDisabled="{{!training_table?.selectedRow?.data?.runId}}"
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      transformer={
        "var logs = data.logsForRun.events.filter(current => Boolean(current.message) && Boolean(current.timestamp) && Boolean(current.stepKey))\nlogs = logs.map(current => {\n  current['timestamp'] = new Date(eval(current['timestamp'])).toTimeString().substr(0,8)\n  return `**[${current['timestamp']}] ${current['stepKey']}** - ${current['message']}`\n})\nvar logString = logs.reduce((acc,cum) => acc.concat(\"\\n\").concat(cum), \"\")\nreturn logString"
      }
    />
    <GraphQLQuery
      id="dagster_get_content_gen_jobs"
      body={include("./lib/dagster_get_content_gen_jobs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"pipelineName","value":"generate_content_for_org_v2"}]'
      }
      isMultiplayerEdited={false}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      resourceTypeOverride=""
      transformer="function msToTime(s) {
  var ms = s % 1000;
  s = (s - ms) / 1000;
  var secs = s % 60;
  s = (s - secs) / 60;
  var mins = s % 60;
  var hrs = (s - mins) / 60;

  return hrs.toString().padStart(2,0) + ':' + mins.toString().padStart(2,0) + ':' + secs.toString().padStart(2,0);
}


function getOrgFromConfig(run) {
  if(run.pipelineName === 'training_pipeline') {
    return run.runConfig.resources.training_config.config.org_id
  } else if(run.pipelineName === 'inference_pipeline') {
    return run.runConfig.resources.inference_config.config.org_id
  }else if(run.pipelineName === 'sentiment_pipeline') {
    return run.runConfig.resources.sentiment_config.config.org_id
  }
  else if (run.pipelineName === 'generate_content_for_org_v2') {
    return run.runConfig.ops.make_single_org_job.config.org_id
  }
  return null
}

var runs = data.pipelineRunsOrError.results
runs = runs.map(run => {
  var org_id_tag = run.tags.find(tag => tag.key === 'org_id')
  var run_by_tag = run.tags.find(tag => tag.key === 'run_by')
  var org_in_config = getOrgFromConfig(run)
  run['org_id'] = org_in_config ? org_in_config : org_id_tag ? org_id_tag.value : null
  run['run_by'] = run_by_tag ? run_by_tag.value : null
  run['startTime'] = new Date(run.startTime * 1000)
  run['endTime'] = new Date(run.endTime * 1000)
  run['updateTime'] = new Date(run.updateTime * 1000)
  run['runTime'] = run.endTime ? msToTime(run.endTime - run.startTime) : msToTime(run.updateTime - run.startTime)
  run['link'] = `https://dagster-prod.forethought.tech/runs/${run.runId}`
  delete run.tags
  return run
})
// filter out runs from not this org
runs = runs.filter(run => run.org_id.toString() === {{ urlparams.hash.org_id }})
var numberRuns = data['pipelineRunsOrError']['count']
return runs"
    />
    <GraphQLQuery
      id="content_generation_logs"
      body={include("./lib/content_generation_logs.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"runId","value":"{{content_generation_table?.selectedRow?.data?.runId}}"}]'
      }
      queryDisabled="{{!training_table?.selectedRow?.data?.runId}}"
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      transformer={
        "var logs = data.logsForRun.events.filter(current => Boolean(current.message) && Boolean(current.timestamp) && Boolean(current.stepKey))\nlogs = logs.map(current => {\n  current['timestamp'] = new Date(eval(current['timestamp'])).toTimeString().substr(0,8)\n  return `**[${current['timestamp']}] ${current['stepKey']}** - ${current['message']}`\n})\nvar logString = logs.reduce((acc,cum) => acc.concat(\"\\n\").concat(cum), \"\")\nreturn logString"
      }
    />
    <GraphQLQuery
      id="content_generation_failed_steps"
      body={include("./lib/content_generation_failed_steps.gql", "string")}
      enableTransformer={true}
      graphQLVariables={
        '[{"key":"runId","value":"{{content_generation_table?.selectedRow?.data?.runId}}"}]'
      }
      isMultiplayerEdited={false}
      queryDisabled="{{!training_table?.selectedRow?.data?.runId}}"
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
      transformer={
        'const events = data.logsForRun.events;\n  \n  let lastCapturedLogKey = null;\n  const stepToLogMap = {};\n  const failedSteps = [];\n\n  events.forEach((event) => {\n    // 1. Track the "Active" Log Key\n    // Even if stepKey is null, this event signals a new stdout stream started\n    if (event.__typename === "LogsCapturedEvent") {\n      lastCapturedLogKey = event.logKey;\n      \n      // If your API starts populating stepKey later, this handles it:\n      if (event.stepKey) {\n        stepToLogMap[event.stepKey] = event.logKey;\n      }\n    }\n\n    // 2. Associate the active log key with a starting step\n    if (event.__typename === "ExecutionStepStartEvent" && event.stepKey) {\n      // If we don\'t have a direct mapping from LogsCapturedEvent, \n      // use the most recently seen logKey.\n      if (!stepToLogMap[event.stepKey]) {\n        stepToLogMap[event.stepKey] = lastCapturedLogKey;\n      }\n    }\n\n    // 3. Collect Failed Steps\n    if (event.__typename === "ExecutionStepFailureEvent") {\n      failedSteps.push({\n        stepKey: event.stepKey,\n        message: event.error.message,\n      });\n    }\n  });\n\n  return failedSteps;\n'
      }
    />
    <GraphQLQuery
      id="content_generation_failed_stdout"
      body={include("./lib/content_generation_failed_stdout.gql", "string")}
      graphQLVariables={
        '[{"key":"runId","value":"{{content_generation_table?.selectedRow?.data?.runId}}"},{"key":"stepKey","value":"{{ currentStepKey }}"}]'
      }
      isMultiplayerEdited={false}
      resourceName="999f5355-b04c-4284-a562-bf886065a8ce"
    />
    <JavascriptQuery
      id="fetch_stdout_for_failed_dagster_steps"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include(
        "./lib/fetch_stdout_for_failed_dagster_steps.js",
        "string"
      )}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="fire_api">
    <OpenAPIQuery
      id="update_discover_admin_access"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      method="post"
      operationId="post__admin_organizations__org_id__api_update_org_feature_values"
      parameterDynamicStates={'{"org_id":false}'}
      parameters={'{"org_id":"{{urlparams.hash.org_id}}"}'}
      path="/admin/organizations/{org_id}/api/update-org-feature-values"
      requestBody={
        '{"org_feature_name":"dashboard_applications_by_role","comment":"Changing discover admin role access via retool Discover Metrics page","org_feature_values":"{{dashboard_applications_by_role_to_api.value}}"}'
      }
      requestBodyDynamicStates={
        '{"comment":false,"org_feature_name":false,"org_feature_values":false}'
      }
      resourceName="eba15dd2-a343-41a3-8651-fface54f54f1"
      server={null}
      serverVariables={null}
      specBasePath={null}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    >
      <Event
        event="success"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "success" },
                  { title: "Configuration updated" },
                  { duration: "" },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_dashboard_apps_by_role"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </OpenAPIQuery>
    <OpenAPIQuery
      id="update_discover_config_enabled_status"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      method="post"
      operationId="post__admin_organizations__org_id__api_update_org_feature_values"
      parameterDynamicStates={'{"org_id":false}'}
      parameters={'{"org_id":"{{urlparams.hash.org_id}}"}'}
      path="/admin/organizations/{org_id}/api/update-org-feature-values"
      requestBody={
        '{"org_feature_name":"discover_config","comment":"Changing config via retool Discover Metrics page","org_feature_values":"{{discover__config_to_api.value}}"}'
      }
      requestBodyDynamicStates={
        '{"comment":false,"org_feature_name":false,"org_feature_values":false}'
      }
      resourceName="eba15dd2-a343-41a3-8651-fface54f54f1"
      server={null}
      serverVariables={null}
      specBasePath={null}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    >
      <Event
        event="success"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "success" },
                  { title: "Configuration updated" },
                  { duration: "" },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_discover_org_config"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </OpenAPIQuery>
    <OpenAPIQuery
      id="update_discover_config_enabled_status2"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      method="post"
      operationId="post__admin_organizations__org_id__api_update_org_feature_values"
      parameterDynamicStates={'{"org_id":false}'}
      parameters={'{"org_id":"{{urlparams.hash.org_id}}"}'}
      path="/admin/organizations/{org_id}/api/update-org-feature-values"
      requestBody={
        '{"org_feature_name":"discover_config","comment":"Changing config via retool Discover Metrics page","org_feature_values":"{{discover__config_to_api.value}}"}'
      }
      requestBodyDynamicStates={
        '{"comment":false,"org_feature_name":false,"org_feature_values":false}'
      }
      resourceName="eba15dd2-a343-41a3-8651-fface54f54f1"
      server={null}
      serverVariables={null}
      specBasePath={null}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    >
      <Event
        event="success"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "success" },
                  { title: "Configuration updated" },
                  { duration: "" },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_discover_org_config"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </OpenAPIQuery>
  </Folder>
  <Folder id="transform_configs">
    <Function
      id="dashboard_applications_by_role_to_api"
      funcBody={include(
        "./lib/dashboard_applications_by_role_to_api.js",
        "string"
      )}
      runBehavior="debounced"
    />
    <Function
      id="discover__config_to_api"
      funcBody={include("./lib/discover__config_to_api.js", "string")}
      runBehavior="debounced"
    />
    <Function
      id="discover__article_config_to_api"
      funcBody={include("./lib/discover__article_config_to_api.js", "string")}
      runBehavior="debounced"
    />
  </Folder>
  <Folder id="segmentation_utils">
    <JavascriptQuery
      id="generate_segmentation_configuration"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/generate_segmentation_configuration.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="iterative_bucketer"
      cacheKeyTtl={300}
      enableCaching={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/iterative_bucketer.js", "string")}
      queryTriggerDelay="200"
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State id="renamed_table_data" value="[]" />
    <JavascriptQuery
      id="renaming_table_data"
      notificationDuration={4.5}
      query={include("./lib/renaming_table_data.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="save_renaming_table"
      notificationDuration={4.5}
      query={include("./lib/save_renaming_table.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="save_values_table"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/save_values_table.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <RESTQuery
      id="spinnaker_push_custom"
      body={
        '[{"key":"args","value":"update_json {{org_id_as_int.value}} False 180 0"},{"key":"environment","value":"{{ retoolContext.environment }}"},{"key":"service_account_name","value":"generic-job-default"},{"key":"script_path","value":"discover/push_duscom_indexing.py"}]'
      }
      bodyType="json"
      notificationDuration={4.5}
      query="/pipelines/server/Run%20Generic%20Job?"
      resourceName="c77b1529-1ba5-4a55-bb9a-7f67139c5f7c"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    />
    <State id="value_buckets" value="[]" />
    <State id="has_incomplete_segmentations" value="false" />
    <State id="has_custom_indexing_field" value="false" />
    <JavascriptQuery
      id="generate_article_segmentation"
      isMultiplayerEdited={false}
      query={include("./lib/generate_article_segmentation.js", "string")}
      resourceName="JavascriptQuery"
    />
    <JavascriptQuery
      id="update_article_table"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/update_article_table.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
</GlobalFunctions>
