loadingPopUp.show();

Promise.all([GetCurrentFunctions.trigger(), GetPreviousFunctions.trigger(), GetNoUpdateFunctions.trigger(), GetNoRecentFunctions.trigger()])
    .then(() => {
        const rolesData1 = GetCurrentFunctions.data;
        const rolesData2 = GetPreviousFunctions.data;
        const rolesData3 = GetNoUpdateFunctions.data;
        const rolesData4 = GetNoRecentFunctions.data;
        var curRoles = [];
        var prevRoles = [];
        var noUpdateRoles = [];
        var noRecentRoles = [];
        var rolesContent;
        var curRolesList = [];
        var currentRolesFromNoUpdate = [];
        var previousRolesFromNoUpdate = [];
        var curRolesTotalCount = 0;
        var prevRolesTotalCount = 0;
        if (rolesData1.content && rolesData1.totalElements <= 120) {
            rolesContent = rolesData1.content;
            // console.log(rolesContent);
            curRolesList = [];
            //  if (rolesData.totalElements <= 120) {
            rolesContent.forEach((eachRole) => {
                const curRole = JSON.parse(eachRole);
                //  console.log(curRole);
                curRole.functions.forEach((eachFun) => {
                    console.log(curRole);
                    var obj = {
                        entityId: curRole.entityId,
                        functionCodes: curRole.header.functionCodes,
                        function: eachFun,
                        state: curRole.header.state
                    }
                    curRolesList.push(obj);
                });
            });

            console.log("curRolesList", curRolesList);
            curRolesTotalCount += rolesData1 ? rolesData1.totalElements : 0;
            curRoles = curRolesList;
        } else {
            curRolesTotalCount += rolesData1 ? rolesData1.totalElements : 0;
        }
        if (rolesData2.content && rolesData2.totalElements <= 120) {
            rolesContent = rolesData2.content;
            // console.log(rolesContent);
            curRolesList = [];
            //  if (rolesData.totalElements <= 120) {
            rolesContent.forEach((eachRole) => {
                const curRole = JSON.parse(eachRole);
                //  console.log(curRole);
                curRole.functions.forEach((eachFun) => {
                    console.log(curRole);
                    var obj = {
                        entityId: curRole.entityId,
                        functionCodes: curRole.header.functionCodes,
                        function: eachFun,
                        state: curRole.header.state
                    }
                    curRolesList.push(obj);
                });
            });

            console.log("curRolesList", curRolesList);

            prevRoles = curRolesList;
            prevRolesTotalCount += rolesData2 ? rolesData2.totalElements : 0;
        } else {
            prevRolesTotalCount += rolesData2 ? rolesData2.totalElements : 0;
        }
        if (rolesData3.content && rolesData3.totalElements <= 120) {

            rolesContent = rolesData3.content;
            // console.log(rolesContent);
            curRolesList = [];
            //  if (rolesData.totalElements <= 120) {
            rolesContent.forEach((eachRole) => {
                const curRole = JSON.parse(eachRole);
                //  console.log(curRole);
                curRole.functions.forEach((eachFun) => {
                    console.log(curRole);
                    var obj = {
                        entityId: curRole.entityId,
                        functionCodes: curRole.header.functionCodes,
                        function: eachFun,
                        state: curRole.header.state
                    }
                    curRolesList.push(obj);
                });
            });

            console.log("curRolesList", curRolesList);

            noUpdateRoles = curRolesList;

        }
        if (rolesData4.content && rolesData4.totalElements <= 120) {
            rolesContent = rolesData4.content;
            // console.log(rolesContent);
            curRolesList = [];
            //  if (rolesData.totalElements <= 120) {
            rolesContent.forEach((eachRole) => {
                const curRole = JSON.parse(eachRole);
                //  console.log(curRole);
                curRole.functions.forEach((eachFun) => {
                    console.log(curRole);
                    var obj = {
                        entityId: curRole.entityId,
                        functionCodes: curRole.header.functionCodes,
                        function: eachFun,
                        state: curRole.header.state
                    }
                    curRolesList.push(obj);
                });
            });

            console.log("curRolesList", curRolesList);

            noRecentRoles = curRolesList;
            curRoles = curRoles.concat(noRecentRoles);
            curRolesTotalCount += rolesData4 ? rolesData4.totalElements : 0;
        } else {
            curRolesTotalCount += rolesData4.totalElements ? rolesData4.totalElements : 0;
        }

        if (noUpdateRoles.length > 0) {
            currentRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 1);
            previousRolesFromNoUpdate = noUpdateRoles.filter((obj) => obj.function.item.currentPrevious === 2);
            console.log('inside noupdate');
            console.log(currentRolesFromNoUpdate);
            console.log(previousRolesFromNoUpdate);
            curRoles = curRoles.concat(currentRolesFromNoUpdate);
            prevRoles = prevRoles.concat(previousRolesFromNoUpdate);
            curRolesTotalCount += currentRolesFromNoUpdate.length;
            prevRolesTotalCount += previousRolesFromNoUpdate.length;
        }


        if (curRolesTotalCount < 120) {
            CurrentRoles.setValue(curRoles);
            CurrentRoleTotalElements.setValue(curRoles.length);
        } else {
            CurrentRoleTotalElements.setValue(curRolesTotalCount);
        }

        if (prevRolesTotalCount < 120) {
            PreviousRoles.setValue(prevRoles);
            PreviousRoleTotalElements.setValue(prevRoles.length);
        } else {
            PreviousRoleTotalElements.setValue(prevRolesTotalCount);
        }
        console.log('Final Roles', curRolesTotalCount, prevRolesTotalCount);
        console.log(curRoles);
        console.log(prevRoles);

        loadingPopUp.hide();
    })
    .catch((error) => {
        console.error('Error running queries:', error);
    });