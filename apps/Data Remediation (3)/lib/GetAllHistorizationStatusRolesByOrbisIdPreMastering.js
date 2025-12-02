// Clear previous values before making the API calls
console.log("Resetting CurrentPreRoles and PreviousPreRoles");

// Reset lists to empty arrays
CurrentRolePreMasteringList.value = [];
PreviousRolePreMasteringList.value = [];
RemCurrentRolePreMasteringList.value = [];
RemPreviousRolePreMasteringList.value = [];
CurrentRolePreMasteringList.setValue([]);
PreviousRolePreMasteringList.setValue([]);
RemCurrentRolePreMasteringList.setValue([]);
RemPreviousRolePreMasteringList.setValue([]);

CurrentPreRoleTotalElements.value = 1;
PreviousPreRoleTotalElements.value = 1;
CurrentPreRoleTotalElements.setValue(1);
PreviousPreRoleTotalElements.setValue(1);
// Ensure the lists are empty
console.log("CurrentRolePreMasteringList after reset:", CurrentRolePreMasteringList.value.length);
console.log("PreviousRolePreMasteringList after reset:", PreviousRolePreMasteringList.value.length);

console.log("CurrentPreRoleTotalElements after reset in orbis:", CurrentPreRoleTotalElements.value.length);
console.log("PreviousPreRoleTotalElements after reset in orbis:", PreviousPreRoleTotalElements.value.length);


console.log("RemCurrentRolePreMasteringList after reset in orbis:", RemCurrentRolePreMasteringList.value.length);
console.log("RemPreviousRolePreMasteringList after reset in orbis:", RemPreviousRolePreMasteringList.value.length);

// Trigger all API calls in parallel
Promise.allSettled([
    GetAllRolesByOrbisIdPreMastering.trigger(),
    //GetPreviousRolesByOrbisIdPreMastering.trigger(),
    //GetNoUpdateRolesByOrbisIdPreMastering.trigger(),
    //GetNoRecentRolesByOrbisIdPreMastering.trigger()
]).then(results => {

    let currentPreRolesOrbisData = [];

    let filteredCurrentPreRolesOrbisData = [];
    let parsedDataCurrentSuppressedStatusWithNoFunctions = [];
    let filteredCurrentParsedDataFullOrbisData = [];


    let [currentOrbisResponse] = results;

    if (GetAllRolesByOrbisIdPreMastering?.error?.includes('network timeout at')) {
        RolesApiTimeoutErrorFlagOrbisPreMastering.setValue(true);

        loadingPopUp.hide(true);
    } else {
        // Process Current API response
        console.log('PreAndRemFlagRefresh Value:', PreAndRemFlagRefresh.value);
        if (currentOrbisResponse.status === "fulfilled" && currentOrbisResponse.value?.content?.length) {
            // Step 1: Filter and process data with no functions
            parsedDataCurrentSuppressedStatusWithNoFunctions = parseRolesOrbisIdDataForSuppressedStatusWithNoFunctions(currentOrbisResponse.value.content);
            //console.log("parsedDataFull:", parsedDataCurrentSuppressedStatusWithNoFunctions);

            // Step 2: Filter for suppressed data with no functions
            if (PreAndRemFlagRefresh.value === false) {
                filteredCurrentParsedDataFullOrbisData = parsedDataCurrentSuppressedStatusWithNoFunctions.filter(item => {
                    return item.header.source.toUpperCase() === "REMEDIATED" && item.header.state.toUpperCase()  === "SUPPRESSED" && item.functions.length === 0;
                });
            }

            //console.log("filteredCurrentParsedDataFullOrbisData Pre Roles Length:", filteredCurrentParsedDataFullOrbisData);



            // Step 3: Process data with functions
            currentPreRolesOrbisData = parseRolesOrbisIdData(currentOrbisResponse.value.content);
            filteredCurrentPreRolesOrbisData = PreAndRemFlagRefresh.value === true
                ? currentPreRolesOrbisData.filter(item => item.function?.source.toUpperCase() !== "REMEDIATED" && item.state.toUpperCase() !== "DELETED")
                : currentPreRolesOrbisData.filter(item => item.function?.source.toUpperCase() === "REMEDIATED" && item.state.toUpperCase() !== "DELETED");

            console.log("filteredCurrentParsedDataFullOrbisData Length:", filteredCurrentParsedDataFullOrbisData);
          
            if (filteredCurrentParsedDataFullOrbisData.length > 0) {

                // Step 4: Prepare data with only necessary fields for the filtered results
                filteredCurrentParsedDataFullOrbisData = filteredCurrentParsedDataFullOrbisData.map(item => {
                    return {
                        entityId: item.entityId,
                        functionCodes: item.header.functionCodes,
                        function: {
                            item: {
                                currentPrevious: "", // Initially null
                                historizationStatus: "", // Initially 1
                                misc: {
                                    orbisID: 0,
                                    idCompany: 0,
                                    nameCompany: 0
                                }
                            },

                        }, // Empty object for now
                        historizationStatus: null, // Default to 1
                        state: "Suppressed", // Set to "Suppressed"
                        source: item.header.source,
                        lineageID: item.header.lineageID,

                    };
                });

                //console.log("filteredCurrentParsedDataFullOrbisData Processed:", filteredCurrentParsedDataFullOrbisData);

                // Step 5: Match data based on entityId and copy necessary fields
                const processedOrbisEntityIds = new Set();
                filteredCurrentParsedDataFullOrbisData.forEach(item => {
                    // Skip if this entityId has already been processed
                    if (processedOrbisEntityIds.has(item.entityId)) {
                        return; // Skip this iteration if the entityId is already processed
                    }

                    // Find the first match in currentPreRolesOrbisData for the current entityId
                    const matchedPreRole = currentPreRolesOrbisData.find(preItem => preItem.entityId === item.entityId);

                    if (matchedPreRole) {
                        console.log("Matching Entity IDs found!");

                        // Step 6: Copy data from the matched pre-role item to the current filtered item
                        item.function.item.currentPrevious = matchedPreRole.function?.item?.currentPrevious || null;
                        item.function.item.historizationStatus = matchedPreRole.function?.item?.historizationStatus || null;
                        item.function.item.misc.orbisID = matchedPreRole.entityId.split('_')[1] || null;
                        item.function.item.misc.idCompany = matchedPreRole.function?.item?.misc.idCompany || null;
                        item.function.item.misc.nameCompany = matchedPreRole.function?.item?.misc?.nameCompany || null;
                        item.function.item.misc.functionOriginals = matchedPreRole.function?.item?.misc?.functionOriginals || null;
                        item.state = "Suppressed"; // Mark the item as suppressed

                        // Mark this entityId as processed so subsequent duplicates are ignored
                        processedOrbisEntityIds.add(item.entityId);
                    }
                });
            }

            //console.log("Final filteredCurrentParsedDataFullOrbisData:", filteredCurrentParsedDataFullOrbisData);
            //console.log("Final filteredCurrentPreRolesOrbisData:", filteredCurrentPreRolesOrbisData);

        }

       const filterTotalListCurrentRoles = filteredCurrentPreRolesOrbisData.filter(item => 
                  [1, 5].includes(item.function.item.historizationStatus) || // historizationStatus 1 or 5
                  (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 1) ||
                  (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious ===1)
                );
 
        //console.log("filterTotalListCurrentRoles length after update:", filterTotalListCurrentRoles);

      const filterTotalListCurrentParsedDataFullOrbisData = filteredCurrentParsedDataFullOrbisData.filter(item => 
                  [1, 5].includes(item.function.item.historizationStatus) || // historizationStatus 1 or 5
                  (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 1) ||
                  (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 1)
                );

        //console.log("filterTotalListCurrentParsedDataFullOrbisData length after update:", filterTotalListCurrentParsedDataFullOrbisData);

        const filterTotalListPreviousRoles = filteredCurrentPreRolesOrbisData.filter(item =>
            item.function.item.historizationStatus === 2 ||
            (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 2) ||
            (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 2)
        );
        //console.log("filterTotalListPreviousRoles length after update:", filterTotalListPreviousRoles);

        const filterTotalListPreviousParsedDataFullOrbisData = filteredCurrentParsedDataFullOrbisData?.filter(item =>
            item.function.item.historizationStatus === 2 ||
            (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 2) ||
            (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 2)
        );
        //console.log("filterTotalListPreviousParsedDataFullOrbisData length after update:", filterTotalListPreviousParsedDataFullOrbisData);

        // Length before update
        console.log("CurrentRolePreMasteringList length before update:", CurrentRolePreMasteringList.value.length);
        // Update CurrentRolePreMasteringList
        let tempCurrentRoles = [
            ...filterTotalListCurrentRoles,
            ...filterTotalListCurrentParsedDataFullOrbisData
        ];

        // Length before update
        console.log("PreviousRolePreMasteringList length before update:", PreviousRolePreMasteringList.value.length);

        // Update PreviousRolePreMasteringList
        let tempPreviousRoles = [
            ...filterTotalListPreviousRoles,
            ...filterTotalListPreviousParsedDataFullOrbisData
        ];


        console.log("tempCurrentRoles length before pushing:", tempCurrentRoles.length);
        console.log("PreAndRemFlagRefresh value :", PreAndRemFlagRefresh.value);
        if (PreAndRemFlagRefresh.value === true) {
            tempCurrentRoles.forEach(item => CurrentRolePreMasteringList.value.push(item));
            CurrentRolePreMasteringList.setValue(CurrentRolePreMasteringList.value);
            console.log("CurrentRolePreMasteringList length after update:", CurrentRolePreMasteringList.value.length);
        } else {
            tempCurrentRoles.forEach(item => RemCurrentRolePreMasteringList.value.push(item));
            RemCurrentRolePreMasteringList.setValue(RemCurrentRolePreMasteringList.value);
            console.log("RemCurrentRolePreMasteringList length after update:", RemCurrentRolePreMasteringList.value);
        }


        console.log("tempPreviousRoles length before pushing:", tempPreviousRoles.length);
        if (PreAndRemFlagRefresh.value === true) {
            tempPreviousRoles.forEach(item => PreviousRolePreMasteringList.value.push(item));
            PreviousRolePreMasteringList.setValue(PreviousRolePreMasteringList.value);
            // Length after update
            console.log("PreviousRolePreMasteringList length after update:", PreviousRolePreMasteringList.value.length);
        } else {
            tempPreviousRoles.forEach(item => RemPreviousRolePreMasteringList.value.push(item));
            RemPreviousRolePreMasteringList.setValue(RemPreviousRolePreMasteringList.value);
            // Length after update
            console.log("RemPreviousRolePreMasteringList length after update:", RemPreviousRolePreMasteringList.value.length);
        }

        loadingPopUp.hide(true);

    }

}).catch(error => {
    console.error("Error triggering API calls:", error);

    // Reset on error
    CurrentRolePreMasteringList.setValue([]);
    PreviousRolePreMasteringList.setValue([]);
    RemCurrentRolePreMasteringList.setValue([]);
    RemPreviousRolePreMasteringList.setValue([]);


    loadingPopUp.hide(true);
});

// Helper function to parse role data (for both current and previous roles)
function parseRolesOrbisIdData(rolesOrbisContent) {
    return rolesOrbisContent.flatMap(eachOrbisRole => {
        try {
            const curPreRole = JSON.parse(eachOrbisRole);
            return curPreRole.functions.map(eachFun => ({
                entityId: curPreRole.entityId,
                functionCodes: curPreRole.header?.functionCodes,
                function: eachFun,
                historizationStatus: eachFun.item?.historizationStatus,
                state: curPreRole.header.state === "active"
                    ? "Not Suppressed"
                    : curPreRole.header.state.replace(/^./, c => c.toUpperCase())
            }));
        } catch (error) {
            console.error("Error parsing role:", eachOrbisRole, error);
            return [];
        }
    });
}

function parseRolesOrbisIdDataForSuppressedStatusWithNoFunctions(rolesOrbisContent) {
    return rolesOrbisContent.flatMap(eachOrbisRole => {
        try {
            return JSON.parse(eachOrbisRole);

        } catch (error) {
            console.error("Error parsing role in parseRolesOrbisIdDataForSuppressedStatusWithNoFunctions:", eachOrbisRole, error);
            return [];
        }
    });
}