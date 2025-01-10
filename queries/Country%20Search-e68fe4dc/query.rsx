<PlaygroundQuery
  id="Country Search"
  adhocResourceType="RESTQuery"
  data={null}
  resourceType={null}
>
  <RESTQuery
    importedQueryDefaults={{ country_name: "united" }}
    importedQueryInputs={{ country_name: "" }}
    playgroundQueryId={0}
    playgroundQuerySaveId={0}
    privateParams={[]}
    query="https://restcountries.com/v3.1/name/{{ country_name }}"
    queryTimeout="100000"
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    watchedParams={[]}
  />
</PlaygroundQuery>
