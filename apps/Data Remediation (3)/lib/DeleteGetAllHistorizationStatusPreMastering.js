// Clear previous values before making the API calls
console.log("Resetting CurrentPreRoles and PreviousPreRoles");
// Reset to null
CurrentPreRoles.value = [];
PreviousPreRoles.value = [];
CurrentPreRoleTotalElements.value = 1;
PreviousPreRoleTotalElements.value = 1;
PreviousPreRoleTotalElements.setValue(1);
CurrentPreRoleTotalElements.setValue(1);
CurrentPreRoles.setValue([]);
PreviousPreRoles.setValue([]);
// Check if reset was successful
console.log("CurrentPreRoles after reset:", CurrentPreRoles.value);  // Should be []
console.log("PreviousPreRoles after reset:", PreviousPreRoles.value); // Should be []
console.log("CurrentPreRoleTotalElements after reset:", CurrentPreRoleTotalElements.value);
console.log("PreviousPreRoleTotalElements after reset:", PreviousPreRoleTotalElements.value);


// Trigger GetCurrentFunctionsPreMastering first
GetAllFunctionsRolesPreMastering.trigger()
    .then(currentResponse => {
        let finalParsedNonFunctionsData = [];
        let filteredCurrentParsedData = [];
        // console.log("currentResponse, API calls.", GetAllFunctionsRolesPreMastering.data);

        if (currentResponse?.content?.length > 0) {
            //console.log("currentResponse, API calls.", currentResponse);
            console.log("currentResponse?.content?.length.", currentResponse?.content?.length);
            // Check if the current response is valid and the total elements are <= 120
            if (currentResponse.totalElements <= 120) {
                console.log("GetCurrentFunctionsPreMastering API response processed successfully. Total elements:", currentResponse.totalElements);
                //console.log("GetCurrentFunctionsPreMastering API response processed successfully. Total elements:", currentResponse.content);


                // Step 1:ParseRolesWithNoFunctions

                finalParsedNonFunctionsData = parseForSuppressedStatusWithNoFunctions(currentResponse.content)
                //console.log("finalParsedNonFunctionsData:", finalParsedNonFunctionsData);

                filteredCurrentParsedData = finalParsedNonFunctionsData.filter(item => {
                    return item.header.source.toUpperCase() === "REMEDIATED" && item.header.state.toUpperCase() === "SUPPRESSED" && item.functions.length === 0;
                });
                //console.log("filteredCurrentParsedData Pre Roles Length:", filteredCurrentParsedData);


                //Step 2: ParseRoleWithFunctions
                const finalParsedData = parseRolesData(currentResponse.content); // Ensure it gets defined here
                //console.log("finalParsedData.", finalParsedData);
                const filteredHistorizationStatusData = finalParsedData.filter(item =>
                    [1, 2, 3, 4, 5].includes(item.function.item.historizationStatus) && item.state.toUpperCase() !== "DELETED"
                );

                //console.log("Filtered Data (with historizationStatus 1, 2, 3, 5):", filteredHistorizationStatusData);


                //Step 3: ParseRoleWithFunctions

                if (filteredCurrentParsedData.length > 0) {

                    // Step 4: Prepare data with only necessary fields for the filtered results
                    filteredCurrentParsedData = filteredCurrentParsedData.map(item => {
                        return {
                            entityId: item.entityId,
                            functionCodes: item.header.functionCodes,
                            function: {
                                source: "REMEDIATED",
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

                    //console.log("filteredCurrentParsedData Processed:", filteredCurrentParsedData);

                    // Step 5: Match data based on entityId and copy necessary fields
                    const processedEntityIds = new Set(); // Track processed entityIds

                    // Step 5: Match data based on entityId and copy necessary fields
                    filteredCurrentParsedData.forEach(item => {
                        // Skip if this entityId has already been processed
                        if (processedEntityIds.has(item.entityId)) {
                            return; // Skip this iteration if the entityId is already processed
                        }

                        // Find the first match in filteredHistorizationStatusData for the current entityId
                        const matchedPreRole = filteredHistorizationStatusData.find(preItem => preItem.entityId === item.entityId);

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
                            processedEntityIds.add(item.entityId);
                        }
                    });


                    //exsitng filteredCurrentParsedData and filteredHistorizationStatusData
                }

                //console.log("filteredHistorizationStatusData", filteredHistorizationStatusData);
                //console.log("filteredCurrentParsedData", filteredCurrentParsedData);
                // Apply filtering logic for Current Pre Roles (with currentPrevious === 1 and historizationStatus 1, 3, 5)

                const filterCurrentRoles = filteredHistorizationStatusData.filter(item => 
                  [1, 5].includes(item.function.item.historizationStatus) || // historizationStatus 1 or 5
                  (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 1)||
                  (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 1)
                );

                //console.log("Filtered filterCurrentRole Pre Roles. Length  1,3,5:", filterCurrentRoles);
                // Apply filtering logic for filteredCurrentParsedData Pre Roles (with currentPrevious === 1 and historizationStatus 1, 3, 5)
                const filterTotalListCurrentRolesParsedData = filteredCurrentParsedData.filter(item => 
                  [1, 5].includes(item.function.item.historizationStatus) || // historizationStatus 1 or 5
                  (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 1) ||
                  (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 1)
                );
              

                //console.log("filterTotalListCurrentRolesParsedData Pre Roles. Length:", filterTotalListCurrentRolesParsedData);


                console.log("CurrentPreRoles before finalist. Length:", CurrentPreRoles.value.length);
                CurrentPreRoles.setValue([
                    ...filterCurrentRoles,
                    ...filterTotalListCurrentRolesParsedData
                ]);
                console.log("CurrentPreRoles after finalist. Length:", CurrentPreRoles.value.length);

                // Apply filtering logic for Previous No Update Pre Roles
                //console.log("Filtered Data (with historizationStatus 1, 2, 3, 5):", filteredHistorizationStatusData);
                const filterPreviousRoles = filteredHistorizationStatusData.filter(item =>
                    item.function.item.historizationStatus === 2 ||
                    (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 2) ||
                    (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 2)
                );

                //console.log("Filtered filterPreviousRoles. Length:", filterPreviousRoles);
                // Apply filtering logic for filteredCurrentParsedData Pre Roles (with currentPrevious === 1 and historizationStatus 1, 3, 5)
                const filterTotalListPreviousRolesParsedData = filteredCurrentParsedData.filter(item =>
                    item.function.item.historizationStatus === 2 ||
                    (item.function.item.historizationStatus === 3 && item.function.item.currentPrevious === 2) ||
                    (item.function.item.historizationStatus === 4 && item.function.item.currentPrevious === 2)
                );

                //console.log("filterTotalListPreviousRolesParsedData:", filterTotalListPreviousRolesParsedData);
                console.log("Updated Previous Pre Roles. Total count:", PreviousPreRoles.value.length);
                PreviousPreRoles.setValue([
                    ...filterPreviousRoles,
                    ...filterTotalListPreviousRolesParsedData
                ]);
                console.log("Updated Previous Pre Roles. Total count:", PreviousPreRoles.value.length);

                // Final handling based on the filtered roles
                if (NoFilterForPreCheck.value === false) {
                    console.log("NoFilterForPreCheck is False for Current. Triggering filteredRemRoles.");
                    filteredRemRoles.trigger();
                } else {
                    console.log("NoFilterForPreCheck is True for Current. Triggering preMasteringFilterOnClear.");
                    preMasteringFilterOnClear.trigger();
                }
                console.log("Before RemCurrentRolePreMasteringList.", RemCurrentRolePreMasteringList.value.length);
                console.log("Before RemPreviousRolePreMasteringList.", RemPreviousRolePreMasteringList.value.length);
              
                PreMasteringFunctionRoleGreaterThan120.trigger();
                console.log("After RemCurrentRolePreMasteringList.", RemCurrentRolePreMasteringList.value.length);
                console.log("After RemPreviousRolePreMasteringList.", RemPreviousRolePreMasteringList.value.length);
                //loadingPopUp.setHidden(true);
            } else {
                PreviousPreRoleTotalElements.setValue(121);
                CurrentPreRoleTotalElements.setValue(121);
                if (NoFilterForPreCheck.value === false) {
                    console.log("NoFilterForPreCheck is False for Current. Triggering filteredRemRoles.");
                    filteredRemRoles.trigger();
                } else {
                    console.log("NoFilterForPreCheck is True for Current. Triggering preMasteringFilterOnClear.");
                    preMasteringFilterOnClear.trigger();
                }
                console.log("Record total elements exceed 120, skipping parallel API calls.");
                PreMasteringFunctionRoleGreaterThan120.trigger();
                //loadingPopUp.setHidden(true);
            }
        } else {
            CurrentPreRoles.setValue([]);
            PreviousPreRoles.setValue([]);
            PreviousPreRoleTotalElements.setValue(1);
            PreviousPreRoleTotalElements.setValue(1);
            loadingPopUp.setHidden(true);
        }
    }
    ).catch(error => {
        console.error("Error triggering GetCurrentFunctionsPreMastering API:", error);
        CurrentPreRoles.setValue([]);
        PreviousPreRoles.setValue([]);
        PreviousPreRoleTotalElements.setValue(1);
        PreviousPreRoleTotalElements.setValue(1);
        loadingPopUp.setHidden(true);
    });

// Helper function to parse role data (for both current and previous roles)
function parseRolesData(rolesContent) {
    return rolesContent.flatMap(eachRole => {
        try {
            const curPreRole = JSON.parse(eachRole);
            return curPreRole.functions.map(eachFun => ({
                entityId: curPreRole.entityId,
                functionCodes: curPreRole.header?.functionCodes,
                function: eachFun,
                state: curPreRole.header.state === "active"
                    ? "Not Suppressed"
                    : curPreRole.header.state.replace(/^./, c => c.toUpperCase())
            }));
        } catch (error) {
            console.error("Error parsing role:", eachRole, error);
            return [];
        }
    });
}

function parseForSuppressedStatusWithNoFunctions(rolesOrbisContent) {
    return rolesOrbisContent.flatMap(eachOrbisRole => {
        try {
            return JSON.parse(eachOrbisRole);

        } catch (error) {
            console.error("Error parsing role in parseForSuppressedStatusWithNoFunctions:", eachOrbisRole, error);
            return [];
        }
    });
}
