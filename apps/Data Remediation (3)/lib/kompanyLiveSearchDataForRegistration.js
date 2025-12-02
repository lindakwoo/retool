
//First check for this country is enable or disable in the db by calling kompanyApiRecord.trigger()
// if its enable then do livesearch 


kompanyDataSetSearchResponse.setValue({});
kompanyInputState.setValue({});
 const countryIso_code = kompanyCountry.value;
const stateCode = kompanyState.value ? kompanyState.value: '';
 //console.log("countryIso_code in kompanyliveSearchData", countryIso_code);
   const kompanyInput = {
    country_iso: countryIso_code,
    state_code: stateCode,
    kompany_api: "",
    last_modified_by: ""  // Update as needed
  };


  kompanyInputState.setValue(kompanyInput);
  console.log("kompanyInputState in kompanyLiveSearch", kompanyInputState.value);
  //  kompanyApiRecord.trigger();
  console.log("kompanyApiRecord triggered", kompanyApiRecord);
 console.log("kompanyApiRecordData response", kompanyApiRecordData.value);

let curCountryEnableObj = {};
 if (countryIso_code === "US") {
    curCountryEnableObj = kompanyApiRecordData.value.find((o)=> o.country_iso === countryIso_code && o.state_code === stateCode);
  } else {
    curCountryEnableObj = kompanyApiRecordData.value.find((o)=> o.country_iso === countryIso_code)
  }

 if(curCountryEnableObj?.kompany_api === 'disable') {
  utils.showNotification({
    title: "Warning",
    description: "Country & State is disable for Kompany search. Please use the Kompany search config to enable it.",
    notificationType: "success",
    duration: 3 // Duration in milliseconds
  });
   loadingPopUp.setHidden(true);

 } else{
   // Initialize the kompanyLiveInput object
  const kompanyLiveInput = {
   searchValue: searchInput.value,// from registration number
   countryCode: "",
   searchMethod: "number",
   alternativeSource: "",
   strictSearch: "true"
  };

  // Set country_iso2_code and state_code based on bvdID
  if (countryIso_code === "US") {
    kompanyLiveInput.countryCode = "US-" + stateCode;
   
  } else {
    kompanyLiveInput.countryCode = countryIso_code;
  }

  // Update the temporary state kompanyInputState
  liveSearchKompanyInput.setValue(kompanyLiveInput);
  console.log("liveSearchKompanyInput", liveSearchKompanyInput.value);


// Trigger the kompanyLiveSearch query
kompanyLiveSearch.trigger().then((response) => {
  // Log the response from the query
  console.log("kompanyLiveSearch response:", response);

  // Check if the response status is "COMPLETED"
  if (response.status === "COMPLETED") {
    let kompanyId = response.searchResults[0].kompanyId;
   console.log("kompanyId from kompanyLiveSearch:", kompanyId); 

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
      kompanyDataSetSearchResponse.setValue(liveSearchResponse);
      loadingPopUp.setHidden(true);

      // Show success notification for LiveSearch
      utils.showNotification({
        title: "Success",
        description: "Kompany Dataset Fetch Successful.",
        notificationType: "success",
        duration: 2 // Duration in milliseconds
      });
    }).catch((error) => {
       loadingPopUp.setHidden(true);
      // Handle errors if the LiveSearch query fails
      console.error("Kompany Dataset  query error:", error);

      // Show error notification for LiveSearch
      utils.showNotification({
        title: "Error",
        description: "Registration Number not found in Kompany",
        notificationType: "error",
        duration: 3 // Duration in milliseconds
      });
    });

  } else {
    // Log and optionally show a different notification for non-"COMPLETED" statuses
    console.error(`kompanyLiveSearch did not complete successfully. Status: ${response.status}`);
    utils.showNotification({
      title: "Warning",
      description: `The kompanyLive search did not complete successfully. Status: ${response.status}`,
      notificationType: "warning",
      duration: 3 // Duration in milliseconds
    });
  }
}).catch((error) => {
   loadingPopUp.setHidden(true);
  // Handle errors if the KompanyIDSearch query fails
  console.error("kompanyLiveSearch query error:", error);

  // Show error notification
  utils.showNotification({
    title: "Error",
    description: "Registration Number not found in kompanyLiveSearch.",
    notificationType: "error",
    duration: 3 // Duration in milliseconds
  });
});
 }


  
//}