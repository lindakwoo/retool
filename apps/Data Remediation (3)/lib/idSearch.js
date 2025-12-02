
//if(kompanyApiRecordData.value[0].kompany_api !== "disable"){
// Fetch data from the searchId component or query result
kompanyDataSetSearchResponse.setValue({});
//  let data = TableRecordsMastering.value[0].EntityInfo.Item.bvdID;
//  console.log("Search Id ::", data);

// Trigger the kompanyIDSearch query
GetKompanyIDSearch.trigger().then((response) => {
  // Log the response from the query
  console.log("KompanyIDSearch response:", response);

  // Check if the response status is "COMPLETED"
  if (response.status === "COMPLETED") {
    let kompanyId = response.searchResult.kompanyId;
   console.log("kompanyId from Idsearch:", kompanyId); 

    let liveDataSetSearchInput = {
    "datasetName": "index",
    "datasetOptions": {
        "checkStockListing": "true"
    },
    "kompanyId": kompanyId
};

    console.log("kompanyDatasetSearchInput", liveDataSetSearchInput);
    kompanyDataSetSearchInput.setValue(liveDataSetSearchInput);

    // Trigger LiveSearch query with the processed data
    kompanyDataSetSearch.trigger().then((liveSearchResponse) => {
      // Handle LiveSearch response
      console.log("Kompany DataSetSearch response:", liveSearchResponse);
      loadingPopUp.setHidden(true);

      if(showDrawer) {
         kompanyLiveSearchdata.show();
      }

      if(liveSearchResponse.status === "COMPLETED") {
        kompanyDataSetSearchResponse.setValue(liveSearchResponse);
        // Show success notification for LiveSearch
      utils.showNotification({
        title: "Success",
        description: "Kompany Dataset Fetch Successful.",
        notificationType: "success",
        duration: 3 // Duration in milliseconds
      });
      } else {
        loadingPopUp.setHidden(true);
        //OrbisId not found in Kompany.
        utils.showNotification({
        title: "Warning",
         // OrbisId not found in Kompany.
        description: "Search could not be completed. There was an issue while searching on the Kompany API.",
        notificationType: "warning",
        duration: 3 // Duration in milliseconds
      });
      }
     
      
    }).catch((error) => {
       loadingPopUp.setHidden(true);
      // Handle errors if the LiveSearch query fails
      console.error("Kompany Dataset  query error:", error);

      // Show error notification for LiveSearch
      utils.showNotification({
        title: "Error",
        // OrbisId not found in Kompany
        description: "The corresponding Orbis ID not found in Kompany.",
        notificationType: "error",
        duration: 3 // Duration in milliseconds
      });
    });

  } else {
    // Log and optionally show a different notification for non-"COMPLETED" statuses
    loadingPopUp.setHidden(true);
    console.error(`KompanyIDSearch did not complete successfully. Status: ${response.status}`);
    utils.showNotification({
      title: "Warning",
      // `The KompanyID search did not complete successfully. Status: ${response.status}`
      description: 'Search could not be completed. There was an issue while searching on the Kompany API.',
      notificationType: "warning",
      duration: 3 // Duration in milliseconds
    });
  }
}).catch((error) => {
   loadingPopUp.setHidden(true);
  // Handle errors if the KompanyIDSearch query fails
  console.error("KompanyIDSearch query error:", error);

  // Show error notification
  utils.showNotification({
    title: "Error",
    // OrbisId not found in Kompany.
    description: "The corresponding Orbis ID not found in Kompany.",
    notificationType: "error",
    duration: 3 // Duration in milliseconds
  });
});
//}