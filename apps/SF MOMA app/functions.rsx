<GlobalFunctions>
  <State id="artists" value="[]" />
  <State id="artwork" value="[]" />
  <JavascriptQuery
    id="filterData"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/filterData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="create_artists_with_art_db_table"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <State id="filteredArtwork" value="[]" />
  <State id="artistsMap" value="{}" />
  <State id="artistsWithArtwork" value="[]" />
  <State id="artToDisplay" value="[]" />
  <JavascriptQuery
    id="setArtToDisplay"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setArtToDisplay.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="attemptToLoadArt" value="false" />
  <SqlQueryUnified
    id="create_artists_with_art_db_table"
    isHidden={false}
    query={include("./lib/create_artists_with_art_db_table.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="insert_artists_with_art_data"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="insert_artists_with_art_data"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("./lib/insert_artists_with_art_data.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    runWhenModelUpdates={false}
    warningCodes={[]}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="query5"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="query5"
    isHidden={false}
    query={include("./lib/query5.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  />
  <State id="artistValues" value="''" />
  <SqlQueryUnified
    id="selectArtists"
    cacheKeyTtl="3600"
    enableCaching={true}
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("./lib/selectArtists.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="query7"
    isHidden={false}
    query={include("./lib/query7.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  />
  <connectResource id="query8" _componentId="listView3" />
  <State id="variable9" />
  <Function
    id="transformer1"
    funcBody={include("./lib/transformer1.js", "string")}
  />
  <RESTQuery
    id="query9"
    isHidden={false}
    resourceDisplayName="testData"
    resourceName="d8aae479-660b-4a20-bf6e-5b8fadeff308"
  />
  <SqlQueryUnified
    id="paginatedArtists"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("./lib/paginatedArtists.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="artistsCount"
    isHidden={false}
    query={include("./lib/artistsCount.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="024aecd9-837d-4859-b18f-949f99ea4a51"
    warningCodes={[]}
  />
  <JavascriptQuery
    id="query12"
    isHidden={false}
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="query13"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/query13.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="retoolAPI"
    headers={
      '[{"key":"Authorization","value":"Bearer: retool_01jgz150ty4sc4ngeamq97a3c0"}]'
    }
    isHidden={false}
    query="users"
    resourceDisplayName="retoolAPI"
    resourceName="fa05bc6e-ec32-4651-a6f7-49c1cd70c545"
  />
</GlobalFunctions>
