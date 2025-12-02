SearchedValue.setValue(null);
kompanySearchPayload.setValue({});
kompanyInputState.setValue(null);
const searchBy = searchByRadio.value;
const searchVal = searchInput.value;
let enabledObj = {};

loadingPopUp.show();
switch (searchBy) {
    case 'registrationNumber':
        kompanyLiveSearchDataForRegistration.trigger();
        break;
    case 'orbisId':

        SearchedValue.setValue(searchVal);
        // Get Orbis ID Data to check for Country from BVDID
        GetMasteringByOrbisIdForKompany.trigger().then((response) => {
            const curRecord = response;
            let curCountryCode = response?.header?.bvdID?.substring(0, 2);
            let curStateCode = '';
            if (curCountryCode === 'US') {
                if (curRecord && curRecord.addresses.length > 0) {
                    const types = ["1", "4", "2"];
                    for (const type of types) {
                        const address = curRecord?.addresses.find(addr => addr.item?.types.some(typeValue => typeValue === type))

                        if (address) {
                            curStateCode = address.item?.geoClassifications.find(item => item.type === '1')?.code.substring(1, 3) ?? null;
                            console.log("usstatecode ::", curStateCode);
                            break;
                        }
                    }
                }
            }

            if (curCountryCode === 'US') {
                console.log(curStateCode);
                enabledObj = kompanyApiRecordData.value.find((eachCountry) => eachCountry.country_iso === curCountryCode && curStateCode === eachCountry.state_code)
            } else {
                enabledObj = kompanyApiRecordData.value.find((eachCountry) => eachCountry.country_iso === curCountryCode)
            }
            const isKompanyEnabled = enabledObj?.kompany_api;

            if (isKompanyEnabled === 'enable') {
                kompanySearchPayload.setValue({
                    searchValue: searchVal
                });
                //Trigger ID Search for Actual Kompany Data
                idSearch.trigger({
                    additionalScope: {
                        showDrawer: false
                    }
                });
            } else {
                loadingPopUp.hide();
                // Show error notification for LiveSearch
                utils.showNotification({
                    title: "Error",
                    description: "The corresponding Orbis ID could not be found in Kompany or appears to be disabled.",
                    notificationType: "error",
                    duration: 3 // Duration in milliseconds
                });
            }
        }, (error) => {
            loadingPopUp.hide();
            // Show error notification for LiveSearch
            loadingPopUp.hide();
            utils.showNotification({
                title: "Warning",
                description: "Search could not be completed. There was an issue while searching on the Kompany API.",
                notificationType: "warning",
                duration: 3 // Duration in milliseconds
            });
        });
        break;
    case 'bvdId':
        SearchedValue.setValue(searchVal.toUpperCase().trim());
        enabledObj = {}
        GetMasteringByBvDIDForKompany.trigger().then((response) => {
            console.log(response);
            const curRecord = response;
            let curCountryCode = response?.header?.bvdID?.substring(0, 2);
            let curStateCode = '';
            if (curCountryCode === 'US') {
                if (curRecord && curRecord.addresses.length > 0) {
                    const types = ["1", "4", "2"];
                    for (const type of types) {
                        const address = curRecord?.addresses.find(addr => addr.item?.types.some(typeValue => typeValue === type))
                        if (address) {
                            curStateCode = address.item?.geoClassifications.find(item => item.type === '1')?.code.substring(1, 3) ?? null;
                            console.log("usstatecode ::", curStateCode);
                            break;
                        }
                    }
                }
            }

            //console.log('Country Code', curCountryCode);
          //console.log('kompanyApiRecordData', kompanyApiRecordData);

            if (curCountryCode === 'US') {
                console.log(curStateCode);
                enabledObj = kompanyApiRecordData.value.find((eachCountry) => eachCountry.country_iso === curCountryCode && curStateCode === eachCountry.state_code)
            } else {
                enabledObj = kompanyApiRecordData.value.find((eachCountry) => eachCountry.country_iso === curCountryCode)
            }
            console.log('Enable Object', enabledObj);
            const isKompanyEnabled = enabledObj?.kompany_api;

            if (isKompanyEnabled === 'enable') {
                kompanySearchPayload.setValue({
                    searchValue: searchVal
                });
                idSearch.trigger({
                    additionalScope: {
                        showDrawer: false
                    }
                });
            } else {
                loadingPopUp.hide();
                // Show error notification for LiveSearch
                utils.showNotification({
                    title: "Error",
                  //BVDID not found in Kompany or the country is disabled. 
                    description: "The corresponding BVDID could not be found in Kompany or appears to be disabled",
                    notificationType: "error",
                    duration: 3 // Duration in milliseconds
                });
            }
        }, (error) => {
            loadingPopUp.hide();
            utils.showNotification({
                title: "Warning",
                //BVDID not found in Kompany
                description: "Search could not be completed. There was an issue while searching on the Kompany API.",
                notificationType: "warning",
                duration: 3 // Duration in milliseconds
            });
        });

        break;
    default:

        break;

}
