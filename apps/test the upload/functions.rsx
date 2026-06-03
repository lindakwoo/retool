<GlobalFunctions>
  <State id="artists" value={'["hello", "hello2"]'} />
  <State id="artwork" value="[0,1,2,3]" />
  <JavascriptQuery
    id="filterArtwork"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/filterArtwork.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      id="f9a56bb4"
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="createMap"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      id="6de88164"
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId=""
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <State id="filteredArtwork" value="[]" />
  <State id="artistsMap" value="{}" />
  <JavascriptQuery
    id="createMap"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/createMap.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      id="79947cb1"
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="setArtistsWithArtwork"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <State id="artistsWithArtwork" value="[]" />
  <JavascriptQuery
    id="setArtistsWithArtwork"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setArtistsWithArtwork.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="artToDisplay" value="[]" />
  <JavascriptQuery
    id="setArtToDisplay"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setArtToDisplay.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
</GlobalFunctions>
