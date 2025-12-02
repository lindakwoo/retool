rolesApiTimeoutErrorFlag.setValue(false);
loadingPopUp.show();

console.log('Loading Roles')
Promise.all([GetCurrentRolesByOrbisId.trigger(), GetPreviousRolesByOrbisId.trigger(), GetNoUpdateRolesByOrbisId.trigger(), GetNoRecentRolesByOrbisId.trigger(), GetCyRemovedRolesByOrbisId.trigger()])
    .then((responses) => {
        if (GetCurrentRolesByOrbisId?.data?.message?.includes('network timeout at') ||
            GetPreviousRolesByOrbisId?.data?.message?.includes('network timeout at') ||
            GetNoUpdateRolesByOrbisId?.data?.message?.includes('network timeout at') ||
            GetNoRecentRolesByOrbisId?.data?.message?.includes('network timeout at')) {
            rolesApiTimeoutErrorFlag.setValue(true);
        } else {

            console.log('responses');
            console.log(responses);
            console.log('inside promise then')
            const rolesData1 = responses[0];
            const rolesData2 = responses[1];
            const rolesData3 = responses[2];
            const rolesData4 = responses[3];
            const rolesData5 = responses[4];
            var curRoles = [];
            var prevRoles = [];
            var noUpdateRoles = [];
            var noRecentRoles = [];
            var cyRemovedRoles = [];
            var rolesContent;
            var curRolesList = [];
            var currentRolesFromNoUpdate = [];
            var previousRolesFromNoUpdate = [];
            var curRolesTotalCount = 0;
            var prevRolesTotalCount = 0;

            if (rolesData1 && rolesData1.content && rolesData1.totalElements <= 120) {
                console.log('Cur Roles', rolesData1.totalElements)
                rolesContent = rolesData1.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);
                    //  console.log(curRole);
                    if (curRole.header.state.toLowerCase() !== 'deleted') {
                        curRole.functions.forEach((eachFun) => {
                            //console.log(curRole);
                            var obj = {
                                entityId: curRole.entityId,
                                functionCodes: curRole.header.functionCodes,
                                function: eachFun,
                                state: curRole.header.state
                            }
                            curRolesList.push(obj);
                        });
                    }
                });

                //console.log("curRolesList", curRolesList);
                curRolesTotalCount += rolesData1 ? rolesData1.totalElements : 0;
                curRoles = curRolesList;
            } else {
                curRolesTotalCount += rolesData1 && rolesData1.totalElements ? rolesData1.totalElements : 0;
            }
            if (rolesData2 && rolesData2.content && rolesData2.totalElements <= 120) {
                console.log('Prev Roles', rolesData2.totalElements)
                rolesContent = rolesData2.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);
                    //  console.log(curRole);
                    if (curRole.header.state.toLowerCase() !== 'deleted') {
                        curRole.functions.forEach((eachFun) => {
                            //console.log(curRole);
                            var obj = {
                                entityId: curRole.entityId,
                                functionCodes: curRole.header.functionCodes,
                                function: eachFun,
                                state: curRole.header.state
                            }
                            curRolesList.push(obj);
                        });
                    }
                });

                //console.log("curRolesList", curRolesList);

                prevRoles = curRolesList;
                prevRolesTotalCount += rolesData2 ? rolesData2.totalElements : 0;
            } else {
                prevRolesTotalCount += rolesData2 && rolesData2.totalElements ? rolesData2.totalElements : 0;
            }
            if (rolesData3 && rolesData3.content && rolesData3.totalElements <= 120) {
                console.log('NoUpdate Roles', rolesData3.totalElements)
                rolesContent = rolesData3.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);
                    //  console.log(curRole);
                    if (curRole.header.state.toLowerCase() !== 'deleted') {
                        curRole.functions.forEach((eachFun) => {
                            //  console.log(curRole);
                            var obj = {
                                entityId: curRole.entityId,
                                functionCodes: curRole.header.functionCodes,
                                function: eachFun,
                                state: curRole.header.state
                            }
                            curRolesList.push(obj);
                        });
                    }
                });

                //console.log("curRolesList", curRolesList);

                noUpdateRoles = curRolesList;

            }
            if (rolesData4 && rolesData4.content && rolesData4.totalElements <= 120) {
                console.log('NoRecent Roles', rolesData4.totalElements)
                rolesContent = rolesData4.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);

                    //  console.log(curRole);
                    if (curRole.header.state.toLowerCase() !== 'deleted') {
                        curRole.functions.forEach((eachFun) => {
                            //console.log(curRole);
                            var obj = {
                                entityId: curRole.entityId,
                                functionCodes: curRole.header.functionCodes,
                                function: eachFun,
                                state: curRole.header.state
                            }
                            curRolesList.push(obj);
                        });
                    }
                });

                //console.log("curRolesList", curRolesList);

                noRecentRoles = curRolesList;
                curRoles = curRoles.concat(noRecentRoles);
                curRolesTotalCount += rolesData4 ? rolesData4.totalElements : 0;
            } else {
                curRolesTotalCount += rolesData4 && rolesData4.totalElements ? rolesData4.totalElements : 0;
            }

          if (rolesData5 && rolesData5.content && rolesData5.totalElements <= 120) {
                console.log('CyRemoved Roles', rolesData5.totalElements)
                rolesContent = rolesData5.content;
                // console.log(rolesContent);
                curRolesList = [];
                //  if (rolesData.totalElements <= 120) {
                rolesContent.forEach((eachRole) => {
                    const curRole = JSON.parse(eachRole);
                    //  console.log(curRole);
                    if (curRole.header.state.toLowerCase() !== 'deleted') {
                        curRole.functions.forEach((eachFun) => {
                            //  console.log(curRole);
                            var obj = {
                                entityId: curRole.entityId,
                                functionCodes: curRole.header.functionCodes,
                                function: eachFun,
                                state: curRole.header.state
                            }
                            curRolesList.push(obj);
                        });
                    }
                });

                //console.log("curRolesList", curRolesList);

                noUpdateRoles = noUpdateRoles.concat(curRolesList);

            }

            if (noUpdateRoles.length > 0) {
                currentRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 1);
                previousRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 2);
                console.log('inside noupdate & cyremoved');
                console.log(currentRolesFromNoUpdate);
                console.log(previousRolesFromNoUpdate);
                curRoles = curRoles.concat(currentRolesFromNoUpdate);
                prevRoles = prevRoles.concat(previousRolesFromNoUpdate);
                curRolesTotalCount += currentRolesFromNoUpdate.length;
                prevRolesTotalCount += previousRolesFromNoUpdate.length;
            }


            if (curRolesTotalCount <= 120) {
                console.log('Current Roles are setting')
                console.log(curRoles);
                CurrentRoles.setValue(curRoles);
                CurrentRoleTotalElements.setValue(curRoles.length);
            } else {
                CurrentRoles.setValue([]);
                CurrentRoleTotalElements.setValue(curRolesTotalCount);
            }

            if (prevRolesTotalCount <= 120) {
                console.log('Previous roles are setting');
                console.log(prevRoles);
                PreviousRoles.setValue(prevRoles);
                PreviousRoleTotalElements.setValue(prevRoles.length);
            } else {
                PreviousRoles.setValue([]);
                PreviousRoleTotalElements.setValue(prevRolesTotalCount);
            }
            console.log('Final Roles', curRolesTotalCount, prevRolesTotalCount);
            console.log(curRoles);
            console.log(prevRoles);
        }

        loadingPopUp.hide();

    })
    .catch((error) => {
        console.error('Error running queries:', error);
    });