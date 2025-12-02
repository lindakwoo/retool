loadingPopUp.show();
rolesApiTimeoutErrorFlag.setValue(false);
//  console.log('Loading Roles')
//   Promise.all([GetCurrentFunctions.trigger(), GetPreviousFunctions.trigger(), GetNoUpdateFunctions.trigger(), GetNoRecentFunctions.trigger()])
GetAllFunctionsAPI.trigger()
    .then((responses) => {
        //  console.log('responses');
        //  console.log(responses);
        if (responses) {
            console.log('inside promise then')
            const rolesData1 = responses;
            // const rolesData2 = responses[1];
            // const rolesData3 = responses[2];
            // const rolesData4 = responses[3];
            var curRoles = [];
            var prevRoles = [];
            //  var noUpdateRoles = [];
            //  var noRecentRoles = [];
            var rolesContent;
            var curRolesList = [];
            //  var currentRolesFromNoUpdate = [];
            //  var previousRolesFromNoUpdate = [];
            var curRolesTotalCount = 0;
            var prevRolesTotalCount = 0;

            if (rolesData1 && rolesData1.content && rolesData1.totalElements <= 120) {
                //  console.log('Cur Roles', rolesData1.totalElements)
                rolesContent = rolesData1.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);
                    //  console.log(curRole);
                  if (curRole.header.state.toLowerCase() !== 'deleted' ) {
                    curRole.functions.forEach((eachFun) => {
                        //console.log(curRole);
                        var obj = {
                            entityId: curRole.entityId,
                            functionCodes: curRole.header.functionCodes,
                            function: eachFun,
                            state: curRole.header.state
                        }

                        //  console.log('eachFun.item.historizationStatus', eachFun.item.historizationStatus)
                        //  console.log('eachFun.item.currentPrevious', eachFun.item.currentPrevious);
                        if (eachFun.item.historizationStatus === 1 || ((eachFun.item.historizationStatus === 3 || eachFun.item.historizationStatus === 4) && eachFun.item.currentPrevious === 1) || eachFun.item.historizationStatus === 5) {
                            curRoles.push(obj);
                        }
                        if (eachFun.item.historizationStatus === 2 || ((eachFun.item.historizationStatus === 3 || eachFun.item.historizationStatus === 4) && eachFun.item.currentPrevious === 2)) {
                            prevRoles.push(obj);
                        }

                    });
                  } else {
                    console.log('deleted roles');
                    console.log(curRole);
                  }
                    
                });

                //console.log("curRolesList", curRolesList);
                curRolesTotalCount += curRoles.length;
                prevRolesTotalCount += prevRoles.length;
            } else {
                curRolesTotalCount += rolesData1 && rolesData1.totalElements ? rolesData1.totalElements : 0;
                prevRolesTotalCount += rolesData1 && rolesData1.totalElements ? rolesData1.totalElements : 0;
            }


            // if (rolesData2 && rolesData2.content && rolesData2.totalElements <= 120) {
            //     console.log('Prev Roles', rolesData2.totalElements)
            //     rolesContent = rolesData2.content;
            //     // console.log(rolesContent);
            //     curRolesList = [];
            //     //  if (rolesData.totalElements <= 120) {
            //     rolesContent.forEach((eachRole) => {
            //         const curRole = JSON.parse(eachRole);
            //         //  console.log(curRole);
            //         curRole.functions.forEach((eachFun) => {
            //             //console.log(curRole);
            //             var obj = {
            //                 entityId: curRole.entityId,
            //                 functionCodes: curRole.header.functionCodes,
            //                 function: eachFun,
            //                 state: curRole.header.state
            //             }
            //             curRolesList.push(obj);
            //         });
            //     });

            //     //console.log("curRolesList", curRolesList);

            //     prevRoles = curRolesList;
            //     prevRolesTotalCount += rolesData2 ? rolesData2.totalElements : 0;
            // } else {
            //     prevRolesTotalCount += rolesData2 && rolesData2.totalElements ? rolesData2.totalElements : 0;
            // }
            // if (rolesData3 && rolesData3.content && rolesData3.totalElements <= 120) {
            //     console.log('NoUpdate Roles', rolesData3.totalElements)
            //     rolesContent = rolesData3.content;
            //     // console.log(rolesContent);
            //     curRolesList = [];
            //     //  if (rolesData.totalElements <= 120) {
            //     rolesContent.forEach((eachRole) => {
            //         const curRole = JSON.parse(eachRole);
            //         //  console.log(curRole);
            //         curRole.functions.forEach((eachFun) => {
            //             //  console.log(curRole);
            //             var obj = {
            //                 entityId: curRole.entityId,
            //                 functionCodes: curRole.header.functionCodes,
            //                 function: eachFun,
            //                 state: curRole.header.state
            //             }
            //             curRolesList.push(obj);
            //         });
            //     });

            //     //console.log("curRolesList", curRolesList);

            //     noUpdateRoles = curRolesList;

            // }
            // if (rolesData4 && rolesData4.content && rolesData4.totalElements <= 120) {
            //     console.log('NoRecent Roles', rolesData4.totalElements)
            //     rolesContent = rolesData4.content;
            //     // console.log(rolesContent);
            //     curRolesList = [];
            //     //  if (rolesData.totalElements <= 120) {
            //     rolesContent.forEach((eachRole) => {
            //         const curRole = JSON.parse(eachRole);
            //         //  console.log(curRole);
            //         curRole.functions.forEach((eachFun) => {
            //             //console.log(curRole);
            //             var obj = {
            //                 entityId: curRole.entityId,
            //                 functionCodes: curRole.header.functionCodes,
            //                 function: eachFun,
            //                 state: curRole.header.state
            //             }
            //             curRolesList.push(obj);
            //         });
            //     });

            //     //console.log("curRolesList", curRolesList);

            //     noRecentRoles = curRolesList;
            //     curRoles = curRoles.concat(noRecentRoles);
            //     curRolesTotalCount += rolesData4 ? rolesData4.totalElements : 0;
            // } else {
            //     curRolesTotalCount += rolesData4 && rolesData4.totalElements ? rolesData4.totalElements : 0;
            // }

            // if (noUpdateRoles.length > 0) {
            //     currentRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 1);
            //     previousRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 2);
            //     console.log('inside noupdate');
            //     console.log(currentRolesFromNoUpdate);
            //     console.log(previousRolesFromNoUpdate);
            //     curRoles = curRoles.concat(currentRolesFromNoUpdate);
            //     prevRoles = prevRoles.concat(previousRolesFromNoUpdate);
            //     curRolesTotalCount += currentRolesFromNoUpdate.length;
            //     prevRolesTotalCount += previousRolesFromNoUpdate.length;
            // }


            if (curRolesTotalCount <= 120) {
                console.log('Current Roles are setting')
                console.log(curRoles.length);
                CurrentRoles.setValue(curRoles);
                CurrentRoleTotalElements.setValue(curRoles.length);
            } else {
                CurrentRoles.setValue([]);
                CurrentRoleTotalElements.setValue(curRolesTotalCount);
            }

            if (prevRolesTotalCount <= 120) {
                console.log('Previous roles are setting');
                console.log(prevRoles.length);
                PreviousRoles.setValue(prevRoles);
                PreviousRoleTotalElements.setValue(prevRoles.length);
            } else {
                PreviousRoles.setValue([]);
                PreviousRoleTotalElements.setValue(prevRolesTotalCount);
            }
            console.log('Final Roles', curRolesTotalCount, prevRolesTotalCount);
            console.log(curRoles.length);
            console.log(prevRoles.length);

        } else {
          if (GetAllFunctionsAPI?.data?.message.includes('network timeout')) {
            var curError = GetAllFunctionsAPI.data;
            console.log('inside error 1')
            console.log(curError);
            rolesApiTimeoutErrorFlag.setValue(true);
          }
        }

        loadingPopUp.hide();

    }, (error) => {
        console.log('inside error');
        console.log(error);
                if (error.message.includes('network timeout at')) {
            var curError = GetAllFunctionsAPI.data;
            console.log('inside errorss')
            console.log(curError);
            rolesApiTimeoutErrorFlag.setValue(true);
          }
    })
    .catch((error) => {
        console.error('Error running queries:', error);
    });