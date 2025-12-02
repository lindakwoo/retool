//  loadingPopUp.hide();
//var disable_save = await linkDisableSave.trigger()
// Helper func to trim spaces in names
function cleanName(str) {
    return str ? str.replace(/\s{2,}/g, ' ').trim() : '';
}

function cleanLocalizedNames(item) {
    if (Array.isArray(item.localizedNames) && item.localizedNames.length > 1) {
        item.localizedNames = item.localizedNames.filter(entry => entry.name !== "");
    }

    if (Array.isArray(item.localizedNames)) {
        item.localizedNames.forEach(entry => {
            delete entry.alphabet;
        });
        delete item.flags;
    }

    return item;
}

// console.log('disable_save', disable_save)
if (false == true) {//(false){
    utils.showNotification({
        title: "Warning",
        //  description: `Atleast 1 Edited Attribute Needs to Be Linked Before Saving: \n ${disable_save[1]}`,
        //  "Upload or link the required document as evidence for the Updates as evidence. This is a required step for data transparerency."
        description: `Please upload or link the required sections ${disable_save[1]} …`,
        notificationType: "warning",
        duration: 3,
    });
    loadingPopUp.setHidden(true);
}
else {
    var epochDate = moment.utc(new Date('1970-01-01'));
    var audit_trail_items = []
    var temp_field_path = ""

    var deleteFields = [];


    //Company
    var curCompanyNames = selectedCompany.value.names
        .filter(i => i.item.type === '1')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() === 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length);

    var originalNames = selectedCompany.value.names.filter(function (item) {
        return item.item.type === '1'
    });

    console.log('curCompanyNames', curCompanyNames);
    console.log('originalNames', originalNames);

    var curNamePutArr = [];

    companyNamesList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "names/item"
        var remediation_action = ''

        var curCompanyNameVal = CompanyNames.value[i];

        if (curCompanyNameVal !== curCompanyNames[i].item.localizedNames[0].name) {
            var curNamePutReq = {
                "item": {
                    "type": curCompanyNames[i].item.type,
                    "flags": [],
                    "localizedNames": [{
                        "language": curCompanyNames[i].item.localizedNames[0].language.toLocaleLowerCase(),
                        "alphabet": "",
                        "name": cleanName(curCompanyNameVal).trim()
                    }]
                },
                "itemObjectHash": curCompanyNames[i].remediationAction === "NEW" || curCompanyNames[i].remediationAction === "RECREATE" ? curCompanyNames[i].itemObjectHash : "",
                "remediatedItemHash": curCompanyNames[i].remediatedItemHash ? curCompanyNames[i].remediatedItemHash : curCompanyNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curCompanyNames[i].remediationAction === "NEW" || curCompanyNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curCompanyNames[i].lineageId.includes('REMEDIATED') ? curCompanyNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curCompanyNameVal.trim() === '' && (curCompanyNames[i].remediationAction === "NEW" || curCompanyNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log('9', "company name curNamePutReq", i);
            console.log('curNamePutReq before', curNamePutReq);


            const matches = originalNames.filter(o =>
                o.itemObjectHash === curNamePutReq.itemObjectHash ||
                o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                o.remediatedItemHash === curNamePutReq.remediatedItemHash
            );

            const newLocals = matches.flatMap(o =>
                o.item.localizedNames.filter(ln => ln.language.toLowerCase() !== "ii")
            );

            curNamePutReq.item.localizedNames.push(...newLocals);


            console.log('curNamePutReq After updating ', curNamePutReq);

            curNamePutArr.push(curNamePutReq);
            // console.log('10', "company name  curNamePutArr", i)
            // console.log(curNamePutArr);



            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                remediation_action = 'delete'
                deleteFields.push('Company Name');
                //AUDIT TRAIL
                new_value = ""
                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item
            } else {
                if (curCompanyNames[i].item.remediationAction === "NEW" || curCompanyNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                new_value = {
                    "type": curCompanyNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                prev_value = {
                    "type": curCompanyNames[i].item.type,
                    "localizedNames": curCompanyNames[i].item.localizedNames
                }

                prev_value.localizedNames.push(...newLocals);

                prev_value = cleanLocalizedNames(prev_value);

                field_path = field_path + "/localizedNames/name"
            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curCompanyNames[i].remediatedItemHash ? curCompanyNames[i].remediatedItemHash : curCompanyNames[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })

        }

    });

    if (newCompanyName.value != null && newCompanyName.value != "") {

        var temp_item = {
            "type": '1',
            "flags": [],
            "localizedNames": [{
                "language": "II",
                "alphabet": "",
                "name": cleanName(newCompanyName.value).trim()
            }]
        }

        var curNamePutReq = {
            "item": temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": temp_item,
            "prev_value": "",
            "label": "company_name"
        })


    }
    // CompanyLocalName Checking 
    var curCompanyLocalNames = selectedCompany.value.names
        .filter(i => i.item.type === '1')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() !== 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length);


    // console.log('11', "company local name ")
    console.log('curCompanyLocalNames', curCompanyLocalNames);


    companyLocalNamesList.data.forEach(function (item, i) {
        var curCompanyNameVal = CompanyLocalNames.value[i].name;
        var curCompanyLangVal = CompanyLocalNames.value[i].language;
        if (curCompanyNameVal !== curCompanyLocalNames[i].item.localizedNames[0].name || curCompanyLangVal !== curCompanyLocalNames[i].item.localizedNames[0].language) {

            //ADUIT TRAIL
            var new_value = ""
            var prev_value = ""
            var field_path = "names/item/localizedNames"
            var remediation_action = ''


            var companyLocal_item = {
                "type": curCompanyLocalNames[i].item.type,
                "flags": [],
                "localizedNames": [{
                    "language": curCompanyLangVal.toLocaleLowerCase(),
                    "alphabet": "",
                    "name": cleanName(curCompanyNameVal).trim()
                }]
            }

            var curNamePutReq = {
                "item": companyLocal_item,
                "itemObjectHash": curCompanyLocalNames[i].remediationAction === "NEW" || curCompanyLocalNames[i].remediationAction === "RECREATE" ? curCompanyLocalNames[i].itemObjectHash : "",
                "remediatedItemHash": curCompanyLocalNames[i].remediatedItemHash ? curCompanyLocalNames[i].remediatedItemHash : curCompanyLocalNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curCompanyLocalNames[i].remediationAction === "NEW" || curCompanyLocalNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curCompanyLocalNames[i].lineageId.includes('REMEDIATED') ? curCompanyLocalNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curCompanyNameVal.trim() === '' && (curCompanyLocalNames[i].remediationAction === "NEW" || curCompanyLocalNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("company local name curNamePutReq", i);
            console.log('compnayLocalPut Before', curNamePutReq);

            const existingNames = curNamePutArr.filter(function (item) { return item.item.type === '1' }).filter(o1 =>
                o1?.itemObjectHash === curNamePutReq?.itemObjectHash ||
                o1?.remediatedItemHash === curNamePutReq?.remediatedItemHash
            );
            console.log('existingNames', existingNames);

            var newLocals = []
            if (existingNames.length === 0) {
                console.log('existingNames ', existingNames);
                console.log('originalNames ', existingNames);
                const matches = originalNames.filter(o =>
                    o.itemObjectHash === curNamePutReq.itemObjectHash ||
                    o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                    o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                    o.remediatedItemHash === curNamePutReq.remediatedItemHash
                );
                console.log('matches local', matches);
                newLocals = matches.flatMap(o =>
                    o.item.localizedNames.filter(ln => ln.language.toLowerCase() === "ii")
                );
                console.log('newLocals local', matches);
                curNamePutReq.item.localizedNames.unshift(...newLocals);
                console.log('compnayLocalPut AFter', curNamePutReq);
            } else {
                if (existingNames.length > 0 && existingNames[0].item.localizedNames.length > 0) {
                    curNamePutReq.item.localizedNames.unshift(existingNames[0].item.localizedNames[0]);
                    console.log('else compnayLocalPut AFter', curNamePutReq);
                }
            }

            curNamePutArr.push(curNamePutReq);
            // console.log("company local name curNamePutArr", i)


            console.log("company local name curNamePutReq: ", curNamePutReq)



            remediation_action = curNamePutReq.remediationAction

            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                deleteFields.push('Company Name Local');
                remediation_action = 'delete'

                //AUDIT TRAIL
                new_value = ""
                temp_field_path = "names/item"

                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item

                //ADUIT TRAIL
                audit_trail_items.push({
                    "remediation_action": remediation_action,
                    "field_path": temp_field_path,
                    "item_hash": curCompanyLocalNames[i].remediatedItemHash ? curCompanyLocalNames[i].remediatedItemHash : curCompanyLocalNames[i].itemObjectHash,
                    "new_value": new_value,
                    "prev_value": prev_value
                })

            } else {
                if (curCompanyLocalNames[i].item.remediationAction === "NEW" || curCompanyLocalNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                //AUDIT TRAIL
                new_value = {
                    "type": curCompanyLocalNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                var tempHash = curCompanyLocalNames[i].remediatedItemHash ? curCompanyLocalNames[i].remediatedItemHash : curCompanyLocalNames[i].itemObjectHash
                var tempLocalizedNames = selectedCompany.value.names.filter(i => i.itemObjectHash == tempHash || i.remediatedItemHash == tempHash)[0].item.localizedNames;

                prev_value = {
                    "type": curCompanyLocalNames[i].item.type,
                    "localizedNames": tempLocalizedNames
                }

                prev_value = cleanLocalizedNames(prev_value);

                // console.log('comp name local prev_value: ', prev_value);

                if (curCompanyNameVal !== curCompanyLocalNames[i].item.localizedNames[0].name) {
                    temp_field_path = field_path + "/name"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": temp_field_path,
                        "item_hash": curCompanyLocalNames[i].remediatedItemHash ? curCompanyLocalNames[i].remediatedItemHash : curCompanyLocalNames[i].itemObjectHash,
                        "new_value": new_value,
                        "prev_value": prev_value
                    })

                }
                if (curCompanyLangVal !== curCompanyLocalNames[i].item.localizedNames[0].language) {


                    temp_field_path = field_path + "/language"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": temp_field_path,
                        "item_hash": curCompanyLocalNames[i].remediatedItemHash ? curCompanyLocalNames[i].remediatedItemHash : curCompanyLocalNames[i].itemObjectHash,
                        "new_value": new_value,
                        "prev_value": prev_value
                    })

                }
            }

        }
    });

    console.log('audit_trail_items after comp local: ', audit_trail_items);

    if (newCompanyLocalName.value != null && newCompanyLocalName.value != "" && newCompanyLocalNameLanguage.value) {

        var new_temp_item = {
            "type": '1',
            "flags": [],
            "localizedNames": [{
                "language": newCompanyLocalNameLanguage.value,
                "alphabet": "",
                "name": cleanName(newCompanyLocalName.value).trim()
            }]
        }

        var curLocalNamePutReq = {
            "item": new_temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curLocalNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": new_temp_item,
            "prev_value": "",
            "label": "company_name_local"
        })
    }
    // console.log(' 453', curNamePutArr);

    // Company Prev Name Checking 
    var originalPrevNames = selectedCompany.value.names.filter(function (item) {
        return item.item.type === '3'
    });
    var curPrevNames = selectedCompany.value.names
        .filter(i => i.item.type === '3')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() === 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length)
        .sort((a, b) => {
            // Convert dates to moment objects upfront
            const dateA = a.item.dateUntil ? moment(a.item.dateUntil) : null;
            const dateB = b.item.dateUntil ? moment(b.item.dateUntil) : null;

            // Primary sort by dateUntil (descending)
            if (dateA && dateB) {
                return dateB.diff(dateA);
            }

            // Handle mixed cases where one record has dateUntil and other doesn't
            if (!dateA && dateB) {
                // Records without dateUntil go after records with dateUntil
                return 1;
            }
            if (dateA && !dateB) {
                // Records with dateUntil go before records without dateUntil
                return -1;
            }

            // Both records lack dateUntil - sort by dateSince (descending)
            if (!dateA && !dateB) {
                const sinceA = a.item.dateSince ? moment(a.item.dateSince) : null;
                const sinceB = b.item.dateSince ? moment(b.item.dateSince) : null;

                if (sinceA && sinceB) {
                    return sinceB.diff(sinceA);
                }

                // Handle missing dateSince values
                if (!sinceA && sinceB) return 1;
                if (sinceA && !sinceB) return -1;
            }

            return 0;
        });

    console.log("company prev name ")
    console.log(curPrevNames);


    prevNamesList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "names/item"
        var remediation_action = ''

        var curCompanyNameVal = prevNames.value[i].name;
        var curDateSince = prevNames.value[i].dateSince;
        var curDateUntil = prevNames.value[i].dateUntil;

        var isDateSinceModified = false;
        var isDateUntilModified = false;

        //  console.log(curPrevNames[i].item.dateSince)
        //  console.log(curDateSince);
        //  console.log('prev names from list in ui')
        //  console.log(prevNames.value[i]);
        //  console.log('prev name from variable');
        // console.log(curPrevNames[i]);
        //        console.log('is!NAN');
        // console.log(!isNaN(Date.parse(curPrevNames[i].item.dateSince)));
        if (!isNaN(Date.parse(curPrevNames[i].item.dateSince))) {
            if (curDateSince) {
                var userDate = moment(moment.utc(curDateSince).format('MM-DD-YYYY'));
                var dateFromAPI = moment(moment.utc(curPrevNames[i].item.dateSince).format('MM-DD-YYYY'));
                console.log(i, userDate);
                console.log(i, dateFromAPI)
                if (!userDate.isSame(dateFromAPI, 'day')) {
                    console.log('datesince modified 1', i)
                    isDateSinceModified = true;
                }
            } else {
                console.log('datesince modified cleared', i)
                isDateSinceModified = true;
            }

        } else {
            if (curDateSince) {
                isDateSinceModified = true;
            }
        }
        console.log('isDateSinceModified', isDateSinceModified)
        // console.log(curPrevNames[i].item.dateUntil)
        // console.log(curDateUntil);
        if (!isNaN(Date.parse(curPrevNames[i].item.dateUntil))) {
            if (curDateUntil) {
                var userDate = moment(moment.utc(curDateUntil).format('MM-DD-YYYY'));
                var dateFromAPI = moment(moment.utc(curPrevNames[i].item.dateUntil).format('MM-DD-YYYY'));
                // console.log(userDate);
                // console.log(dateFromAPI)
                if (!userDate.isSame(dateFromAPI, 'day')) {
                    console.log('dateuntil modified 1', i)
                    isDateUntilModified = true;
                }
            } else {
                console.log('dateuntil modified cleared', i)
                isDateUntilModified = true;
            }

        } else {
            if (curDateUntil) {
                isDateUntilModified = true;
            }
        }

        if (curCompanyNameVal !== curPrevNames[i].item.localizedNames[0].name || isDateSinceModified || isDateUntilModified) {
            var curNamePutReq = {
                "item": {
                    "type": curPrevNames[i].item.type,
                    "flags": [],
                    "dateSince": curDateSince ? moment.utc(moment.utc(curDateSince).format('MM-DD-YYYY'), 'MM-DD-YYYY').diff(epochDate, 'days') : null,
                    "dateUntil": curDateUntil ? moment.utc(moment.utc(curDateUntil).format('MM-DD-YYYY'), 'MM-DD-YYYY').diff(epochDate, 'days') : null,
                    "localizedNames": [{
                        "language": curPrevNames[i].item.localizedNames[0].language.toLocaleLowerCase(),
                        "alphabet": "",
                        "name": cleanName(curCompanyNameVal).trim()
                    }]
                },
                "itemObjectHash": curPrevNames[i].remediationAction === "NEW" || curPrevNames[i].remediationAction === "RECREATE" ? curPrevNames[i].itemObjectHash : "",
                "remediatedItemHash": curPrevNames[i].remediatedItemHash ? curPrevNames[i].remediatedItemHash : curPrevNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curPrevNames[i].remediationAction === "NEW" || curPrevNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curPrevNames[i].lineageId.includes('REMEDIATED') ? curPrevNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curPrevNames[i].remediationAction === "NEW" || curPrevNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "itemStatus": curCompanyNameVal.trim() === '' && (curPrevNames[i].remediationAction === "NEW" || curPrevNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("company prev name curNamePutReq", i);
            console.log('PrevNamePut before', curNamePutReq);


            const matchesPrev = originalPrevNames.filter(o =>
                o.itemObjectHash === curNamePutReq.itemObjectHash ||
                o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                o.remediatedItemHash === curNamePutReq.remediatedItemHash
            );

            const newPrevLocals = matchesPrev.flatMap(o =>
                o.item.localizedNames.filter(ln => ln.language.toLowerCase() !== "ii")
            );

            curNamePutReq.item.localizedNames.push(...newPrevLocals);


            console.log('curNamePutReq prev After updating ', curNamePutReq);

            curNamePutArr.push(curNamePutReq);
            // console.log("company prev name curNamePutArr", i)
            // console.log(curNamePutArr);

            //AUDIt TRAIL
            remediation_action = curNamePutReq.remediationAction

            console.log("prev name curNamePutReq: ", curNamePutReq)

            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                remediation_action = 'delete'
                new_value = ""
                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item

                //ADUIT TRAIL
                audit_trail_items.push({
                    "remediation_action": remediation_action,
                    "field_path": field_path,
                    "item_hash": curPrevNames[i].remediatedItemHash ? curPrevNames[i].remediatedItemHash : curPrevNames[i].itemObjectHash,
                    "new_value": new_value,
                    "prev_value": prev_value
                })

            } else {
                if (curPrevNames[i].item.remediationAction === "NEW" || curPrevNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                new_value = {
                    "type": curPrevNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                prev_value = {
                    "type": curPrevNames[i].item.type,
                    "localizedNames": curPrevNames[i].item.localizedNames
                }

                prev_value.localizedNames.push(...newPrevLocals);

                prev_value = cleanLocalizedNames(prev_value);

                if (curCompanyNameVal !== curPrevNames[i].item.localizedNames[0].name) {


                    temp_field_path = field_path + "/localizedNames/name"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": temp_field_path,
                        "item_hash": curPrevNames[i].remediatedItemHash ? curPrevNames[i].remediatedItemHash : curPrevNames[i].itemObjectHash,
                        "new_value": new_value,
                        "prev_value": prev_value
                    })
                }

                if (isDateSinceModified) {
                    var tempNewValue = structuredClone(new_value);
                    var tempPrevValue = structuredClone(prev_value);
                    tempNewValue.dateSince = curNamePutReq.item.dateSince;
                    tempPrevValue.dateSince = curPrevNames[i].item.dateSince;
                    temp_field_path = field_path + "/dateSince"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": temp_field_path,
                        "item_hash": curPrevNames[i].remediatedItemHash ? curPrevNames[i].remediatedItemHash : curPrevNames[i].itemObjectHash,
                        "new_value": tempNewValue,
                        "prev_value": tempPrevValue
                    })
                }

                if (isDateUntilModified) {
                    var tempNewValue = structuredClone(new_value);
                    var tempPrevValue = structuredClone(prev_value);
                    tempNewValue.dateUntil = curNamePutReq.item.dateUntil;
                    tempPrevValue.dateUntil = curPrevNames[i].item.dateUntil;
                    temp_field_path = field_path + "/dateUntil"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": temp_field_path,
                        "item_hash": curPrevNames[i].remediatedItemHash ? curPrevNames[i].remediatedItemHash : curPrevNames[i].itemObjectHash,
                        "new_value": tempNewValue,
                        "prev_value": tempPrevValue
                    })
                }
            }



        }

    });

    if (newPrevName.value != null && newPrevName.value != "") {
        var temp_item = {
            "type": '3',
            "flags": [],
            "dateSince": newDateSince.value ? moment.utc(new Date(newDateSince.value)).diff(epochDate, 'days') : null,
            "dateUntil": newDateUntil.value ? moment.utc(new Date(newDateUntil.value)).diff(epochDate, 'days') : null,
            "localizedNames": [{
                "language": "II",
                "alphabet": "",
                "name": cleanName(newPrevName.value).trim()
            }]

        }

        var curPrevNamePutReq = {
            "item": temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curPrevNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": temp_item,
            "prev_value": "",
            "label": "prev_name"
        })
    }

    // Prev Local Name Checking 
    // var curPrevLocalNames = selectedCompany.value.names.filter(function (item) {
    //     return item.item.type === '3' && item.item.localizedNames[0].language.toLocaleLowerCase() !== 'ii'
    // });

    var curPrevLocalNames = selectedCompany.value.names
        .filter(i => i.item.type === '3')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() !== 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length);

    // console.log("prev local name ", i)
    // console.log(curPrevLocalNames);


    prevLocalNamesList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "names/item/localizedNames/name"
        var remediation_action = ''

        var curCompanyNameVal = prevLocalNames.value[i];
        if (curCompanyNameVal !== curPrevLocalNames[i].item.localizedNames[0].name) {
            var curNamePutReq = {
                "item": {
                    "type": curPrevLocalNames[i].item.type,
                    "flags": curPrevLocalNames[i].item.flags,
                    "localizedNames": [{
                        "language": curPrevLocalNames[i].item.localizedNames[0].language.toLocaleLowerCase(),
                        "alphabet": "",
                        "name": cleanName(curCompanyNameVal).trim()
                    }]
                },
                "itemObjectHash": curPrevLocalNames[i].remediationAction === "NEW" || curPrevLocalNames[i].remediationAction === "RECREATE" ? curPrevLocalNames[i].itemObjectHash : "",
                "remediatedItemHash": curPrevLocalNames[i].remediatedItemHash ? curPrevLocalNames[i].remediatedItemHash : curPrevLocalNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curPrevLocalNames[i].remediationAction === "NEW" || curPrevLocalNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curPrevLocalNames[i].lineageId.includes('REMEDIATED') ? curPrevLocalNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curCompanyNameVal.trim() === '' && (curPrevLocalNames[i].remediationAction === "NEW" || curPrevLocalNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("company local name curNamePutReq", i);
            // console.log(curNamePutReq);

            console.log('compnayLocalPut Before', curNamePutReq);

            const existingPrevLocalNames = curNamePutArr.filter(function (item) { return item.item.type === '3' }).filter(o1 =>
                o1?.itemObjectHash === curNamePutReq?.itemObjectHash ||
                o1?.remediatedItemHash === curNamePutReq?.remediatedItemHash
            );
            console.log('existingPrevLocalNames', existingPrevLocalNames);

            var newPrevLocals = []
            if (existingPrevLocalNames.length === 0) {
                console.log('existingPrevLocalNames ', existingPrevLocalNames);
                const matchesPrevLocal = originalPrevNames.filter(o =>
                    o.itemObjectHash === curNamePutReq.itemObjectHash ||
                    o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                    o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                    o.remediatedItemHash === curNamePutReq.remediatedItemHash
                );

                newPrevLocals = matchesPrevLocal.flatMap(o =>
                    o.item.localizedNames.filter(ln => ln.language.toLowerCase() === "ii")
                );

                curNamePutReq.item.localizedNames.unshift(...newPrevLocals);




                //                 curNamePutReq.item.dateSince = curNamePutReq.item.dateSince = matchesPrevLocal[0].item.dateSince === null? null
                //   : moment(matchesPrevLocal[0].item.dateSince, 'MM-DD-YYYY', true).isValid()
                //     ? moment.utc(matchesPrevLocal[0].item.dateSince, 'MM-DD-YYYY').diff(epochDate, 'days')
                //     : matchesPrevLocal[0].item.dateSince;
                // ;
                //                 curNamePutReq.item.dateUntil = matchesPrevLocal[0].item.dateUntil === null? null: moment(matchesPrevLocal[0].item.dateUntil, 'MM-DD-YYYY', true).isValid()
                //     ? moment.utc(matchesPrevLocal[0].item.dateUntil, 'MM-DD-YYYY').diff(epochDate, 'days')
                //     : matchesPrevLocal[0].item.dateUntil;

                const prevItem = matchesPrevLocal[0].item;  // your object
                console.log("prevItem111:", prevItem);

                const dateUntilRaw = prevItem.dateUntil;
                const isNullOrUndefined = dateUntilRaw === null || dateUntilRaw === undefined;
                const isNumber = typeof dateUntilRaw === 'number';
                const isValidDate = moment.utc(dateUntilRaw).isValid();
                const convertedDays = isValidDate ? moment.utc(dateUntilRaw).diff(epochDate, 'days') : null;


                const dateSinceRaw = prevItem.dateSince;
                const isNullOrUndefinedSince = dateSinceRaw === null || dateSinceRaw === undefined;
                const isNumberSince = typeof dateSinceRaw === 'number';
                const isValidDateSince = moment.utc(dateSinceRaw).isValid();
                const convertedDaysSince = isValidDate ? moment.utc(dateSinceRaw).diff(epochDate, 'days') : null;


                // Final assignment to curNamePutReq
                curNamePutReq.item.dateUntil = isNullOrUndefined
                    ? null
                    : isNumber
                        ? dateUntilRaw
                        : isValidDate
                            ? convertedDays
                            : null;

                curNamePutReq.item.dateSince = isNullOrUndefinedSince
                    ? null
                    : isNumberSince
                        ? dateSinceRaw
                        : isValidDateSince
                            ? convertedDaysSince
                            : null;
                console.log('compnayLocalPut AFter ifff', curNamePutReq);
            } else {
                if (existingPrevLocalNames.length > 0 && existingPrevLocalNames[0].item.localizedNames.length > 0) {

                    curNamePutReq.item.localizedNames.unshift(existingPrevLocalNames[0].item.localizedNames[0]);
                    const epochDate = moment.utc("1970-01-01", "YYYY-MM-DD");
                    const prevItem = existingPrevLocalNames[0].item;  // your object
                    console.log("prevItem else:", prevItem);

                    const dateUntilRaw = prevItem.dateUntil;
                    const isNullOrUndefined = dateUntilRaw === null || dateUntilRaw === undefined;
                    const isNumber = typeof dateUntilRaw === 'number';
                    const isValidDate = moment.utc(dateUntilRaw).isValid();
                    const convertedDays = isValidDate ? moment.utc(dateUntilRaw).diff(epochDate, 'days') : null;


                    const dateSinceRaw = prevItem.dateSince;
                    const isNullOrUndefinedSince = dateSinceRaw === null || dateSinceRaw === undefined;
                    const isNumberSince = typeof dateSinceRaw === 'number';
                    const isValidDateSince = moment.utc(dateSinceRaw).isValid();
                    const convertedDaysSince = isValidDate ? moment.utc(dateSinceRaw).diff(epochDate, 'days') : null;

                    // Final assignment to curNamePutReq
                    curNamePutReq.item.dateUntil = isNullOrUndefined
                        ? null
                        : isNumber
                            ? dateUntilRaw
                            : isValidDate
                                ? convertedDays
                                : null;

                    curNamePutReq.item.dateSince = isNullOrUndefinedSince
                        ? null
                        : isNumberSince
                            ? dateSinceRaw
                            : isValidDateSince
                                ? convertedDaysSince
                                : null;

                    // Debug logs
                    console.log("Raw value:", dateUntilRaw);
                    console.log("isNullOrUndefined:", isNullOrUndefined);
                    console.log("isNumber:", isNumber);
                    console.log("isValidDate:", isValidDate);
                    console.log("convertedDays:", convertedDays);
                    console.log("Final curNamePutReq.item.dateUntil:", curNamePutReq.item.dateUntil);

                }
            }

            curNamePutArr.push(curNamePutReq);
            // console.log("company local name curNamePutArr", i)
            // console.log('curNamePutReq', curNamePutArr);

            //AUDIT TRAIL

            console.log("prev local name curNamePutReq: ", curNamePutReq)
            remediation_action = curNamePutReq.remediationAction

            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                // remediation_action.toLowerCase() = 'delete'
                new_value = ""
                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item
                field_path = "names/item"
            } else {
                if (curPrevLocalNames[i].item.remediationAction === "NEW" || curPrevLocalNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                new_value = {
                    "type": curPrevLocalNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                var tempHash = curPrevLocalNames[i].remediatedItemHash ? curPrevLocalNames[i].remediatedItemHash : curPrevLocalNames[i].itemObjectHash
                var tempLocalizedNames = selectedCompany.value.names.filter(i => i.itemObjectHash == tempHash || i.remediatedItemHash == tempHash)[0].item.localizedNames;

                prev_value = {
                    "type": curPrevLocalNames[i].item.type,
                    "localizedNames": tempLocalizedNames
                }

                prev_value = cleanLocalizedNames(prev_value);

                console.log('comp name local prev_value: ', prev_value);

            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curPrevLocalNames[i].remediatedItemHash ? curPrevLocalNames[i].remediatedItemHash : curPrevLocalNames[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })

        }

    });

    if (newPrevLocalName.value != null && newPrevLocalName.value != "") {
        var temp_item = {
            "type": '3',
            "flags": [],
            "localizedNames": [{
                "language": "XX",
                "alphabet": "",
                "name": cleanName(newPrevLocalName.value).trim()
            }]
        }

        var curPrevLocalNamePutReq = {
            "item": temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curPrevLocalNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": temp_item,
            "prev_value": "",
            "label": "prev_name_local"
        })

    }
    // Company Aka Name Checking 

    var curAkaNames = selectedCompany.value.names
        .filter(i => i.item.type === '2')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() === 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length);

    var originalAkaNames = selectedCompany.value.names.filter(function (item) {
        return item.item.type === '2'
    });


    // console.log('company aka name ', curAkaNames)
    // console.log(curAkaNames);


    akaNamesList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "names/item"
        var remediation_action = ''

        var curCompanyNameVal = akaNames.value[i];
        if (curCompanyNameVal !== curAkaNames[i].item.localizedNames[0].name) {
            var curNamePutReq = {
                "item": {
                    "type": curAkaNames[i].item.type,
                    "flags": curAkaNames[i].item.flags,
                    "localizedNames": [{
                        "language": curAkaNames[i].item.localizedNames[0].language.toLocaleLowerCase(),
                        "alphabet": "",
                        "name": cleanName(curCompanyNameVal).trim()
                    }]
                },
                "itemObjectHash": curAkaNames[i].remediationAction === "NEW" || curAkaNames[i].remediationAction === "RECREATE" ? curAkaNames[i].itemObjectHash : "",
                "remediatedItemHash": curAkaNames[i].remediatedItemHash ? curAkaNames[i].remediatedItemHash : curAkaNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curAkaNames[i].remediationAction === "NEW" || curAkaNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curAkaNames[i].lineageId.includes('REMEDIATED') ? curAkaNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curCompanyNameVal.trim() === '' && (curAkaNames[i].remediationAction === "NEW" || curAkaNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("company aka name curNamePutReq", i);
            // console.log(curNamePutReq);
            console.log('AkaNamePut before', curNamePutReq);


            const matchesAka = originalAkaNames.filter(o =>
                o.itemObjectHash === curNamePutReq.itemObjectHash ||
                o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                o.remediatedItemHash === curNamePutReq.remediatedItemHash
            );

            const newAkaLocals = matchesAka.flatMap(o =>
                o.item.localizedNames.filter(ln => ln.language.toLowerCase() !== "ii")
            );

            curNamePutReq.item.localizedNames.push(...newAkaLocals);


            console.log('curNamePutReq prev After updating ', curNamePutReq);


            curNamePutArr.push(curNamePutReq);
            // console.log("company aka name curNamePutArr", i)
            // console.log(curNamePutArr);

            //AUDIT TRAIL
            remediation_action = curNamePutReq.remediationAction

            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                remediation_action = 'delete'
                new_value = ""
                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item
            } else {
                if (curAkaNames[i].item.remediationAction === "NEW" || curAkaNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                new_value = {
                    "type": curAkaNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                prev_value = {
                    "type": curAkaNames[i].item.type,
                    "localizedNames": curAkaNames[i].item.localizedNames
                }

                prev_value.localizedNames.push(...newAkaLocals);

                prev_value = cleanLocalizedNames(prev_value);

                field_path = field_path + "/localizedNames/name"
            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curAkaNames[i].remediatedItemHash ? curAkaNames[i].remediatedItemHash : curAkaNames[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })

        }

    });

    if (newAkaName.value != null && newAkaName.value != "") {

        var temp_item = {
            "type": '2',
            "flags": [],
            "localizedNames": [{
                "language": "II",
                "alphabet": "",
                "name": cleanName(newAkaName.value).trim()
            }]
        }

        var curAkaNamePutReq = {
            "item": temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curAkaNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": temp_item,
            "prev_value": "",
            "label": "aka_name"
        })

    }
    // AKA Local Name Checking 
    // var curAkaLocalNames = selectedCompany.value.names.filter(function (item) {
    //     return item.item.type === '2' && item.item.localizedNames[0].language.toLocaleLowerCase() !== 'ii'
    // });
    var curAkaLocalNames = selectedCompany.value.names
        .filter(i => i.item.type === '2')
        .map(i => ({
            ...i,
            item: {
                ...i.item,
                localizedNames: i.item.localizedNames.filter(
                    l => l.language.toLowerCase() !== 'ii'
                )
            }
        }))
        .filter(i => i.item.localizedNames.length);
    // console.log('aka local name', curAkaLocalNames)
    // console.log(curAkaLocalNames);


    akaLocalNamesList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "names/item"
        var remediation_action = ''

        var curCompanyNameVal = akaLocalNames.value[i];
        if (curCompanyNameVal !== curAkaLocalNames[i].item.localizedNames[0].name) {
            var curNamePutReq = {
                "item": {
                    "type": curAkaLocalNames[i].item.type,
                    "flags": curAkaLocalNames[i].item.flags,
                    "localizedNames": [{
                        "language": curAkaLocalNames[i].item.localizedNames[0].language.toLocaleLowerCase(),
                        "name": cleanName(curCompanyNameVal).trim(),
                        "alphabet": "",
                    }],
                },
                "itemObjectHash": curAkaLocalNames[i].remediationAction === "NEW" || curAkaLocalNames[i].remediationAction === "RECREATE" ? curAkaLocalNames[i].itemObjectHash : "",
                "remediatedItemHash": curAkaLocalNames[i].remediatedItemHash ? curAkaLocalNames[i].remediatedItemHash : curAkaLocalNames[i].itemObjectHash,
                "remediationAction": curCompanyNameVal.trim() === '' ? "DELETE" : curAkaLocalNames[i].remediationAction === "NEW" || curAkaLocalNames[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curAkaLocalNames[i].lineageId.includes('REMEDIATED') ? curAkaLocalNames[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curCompanyNameVal.trim() === '' && (curAkaLocalNames[i].remediationAction === "NEW" || curAkaLocalNames[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("aka local name curNamePutReq", i);
            // console.log(curNamePutReq);
            console.log('compnayAkaLocalPut Before', curNamePutReq);

            const existingAkaLocalNames = curNamePutArr.filter(function (item) { return item.item.type === '2' }).filter(o1 =>
                o1?.itemObjectHash === curNamePutReq?.itemObjectHash ||
                o1?.remediatedItemHash === curNamePutReq?.remediatedItemHash
            );
            console.log('existingAkaLocalNames', existingAkaLocalNames);

            var newAKaNameLocalized = []
            if (existingAkaLocalNames.length === 0) {
                console.log('existingAkaLocalNames ', existingAkaLocalNames);
                const matchesAkaLocal = originalAkaNames.filter(o =>
                    o.itemObjectHash === curNamePutReq.itemObjectHash ||
                    o.remediatedItemHash === curNamePutReq.itemObjectHash ||
                    o.itemObjectHash === curNamePutReq.remediatedItemHash ||
                    o.remediatedItemHash === curNamePutReq.remediatedItemHash
                );

                newAKaNameLocalized = matchesAkaLocal.flatMap(o =>
                    o.item.localizedNames.filter(ln => ln.language.toLowerCase() === "ii")
                );

                curNamePutReq.item.localizedNames.unshift(...newAKaNameLocalized);
                console.log('compnayAkaLocalPut AFter', curNamePutReq);
            } else {
                if (existingAkaLocalNames.length > 0 && existingAkaLocalNames[0].item.localizedNames.length > 0) {
                    curNamePutReq.item.localizedNames.unshift(existingAkaLocalNames[0].item.localizedNames[0]);
                    console.log('else compnayAkaLocalPut AFter', curNamePutReq);
                }
            }

            curNamePutArr.push(curNamePutReq);
            // console.log("aka local name curNamePutArr", i)
            // console.log(curNamePutArr);

            //AUDIT TRAIL
            remediation_action = curNamePutReq.remediationAction

            if (curCompanyNameVal.trim() === '' && curNamePutReq.remediationAction.toLowerCase() == 'delete') {
                remediation_action = 'delete'
                new_value = ""
                const hash = curNamePutReq.remediatedItemHash ? curNamePutReq.remediatedItemHash : curNamePutReq.itemObjectHash
                prev_value = selectedCompany.value.names.find(i => (hash === i.itemObjectHash && i.remediatedItemHash == null) || hash === i.remediatedItemHash).item
            } else {
                if (curAkaLocalNames[i].item.remediationAction === "NEW" || curAkaLocalNames[i].item.remediationAction === "RECREATE") {
                    remediation_action = 'recreate'
                } else {
                    remediation_action = 'overwrite'
                }

                new_value = {
                    "type": curAkaLocalNames[i].item.type,
                    "localizedNames": curNamePutReq.item.localizedNames
                }
                new_value = structuredClone(cleanLocalizedNames(new_value));

                var tempHash = curAkaLocalNames[i].remediatedItemHash ? curAkaLocalNames[i].remediatedItemHash : curAkaLocalNames[i].itemObjectHash
                var tempLocalizedNames = selectedCompany.value.names.filter(i => i.itemObjectHash == tempHash || i.remediatedItemHash == tempHash)[0].item.localizedNames;

                prev_value = {
                    "type": curAkaLocalNames[i].item.type,
                    "localizedNames": tempLocalizedNames
                }

                prev_value = cleanLocalizedNames(prev_value);

                field_path = field_path + "/localizedNames/name"
            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curAkaLocalNames[i].remediatedItemHash ? curAkaLocalNames[i].remediatedItemHash : curAkaLocalNames[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })

        }

    });

    if (newAkaLocalName.value != null && newAkaLocalName.value != "") {

        var temp_item = {
            "type": '2',
            "flags": [],
            "localizedNames": [{
                "language": "XX",
                "alphabet": "",
                "name": cleanName(newAkaLocalName.value).trim()
            }]
        }

        var curAkaLocalNamePutReq = {
            "item": temp_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        curNamePutArr.push(curAkaLocalNamePutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "names/item",
            "item_hash": "",
            "new_value": temp_item,
            "prev_value": "",
            "label": "aka_name_local"
        })

    }
    console.log('curNamePutArr', curNamePutArr);
    console.log('Input curNamePutArr:', JSON.stringify(curNamePutArr, null, 2));



    const cleanedItems = [];

    const seen = new Set();
    const deduplicated = [...curNamePutArr]
        .reverse()
        .filter(item => {
            const key = item.itemObjectHash || item.remediatedItemHash;
            if (!key) return true;
            if (seen.has(key)) return false;
            seen.add(key);
            return true;
        })
        .reverse();

    console.warn("deduplicated", deduplicated);
    if (Array.isArray(deduplicated) && deduplicated.length > 0) {
        for (const itemObj of deduplicated) {
            const names = itemObj.item?.localizedNames || [];

            if (names.length > 1) {
                const cleanedNames = names.filter(n => n?.name?.trim());

                if (cleanedNames.length === names.length) {
                    console.log("if Some names were No blank names:");
                    // No blank names — keep as-is
                    cleanedItems.push(itemObj);
                } else {
                    console.log("else Some names were empty:");
                    // Some names were empty — clean and mark as remediated
                    cleanedItems.push({
                        ...itemObj,
                        source: "REMEDIATED",
                        remediationAction: "OVERWRITE",
                        itemStatus: "ACTIVE",
                        item: {
                            ...itemObj.item,
                            localizedNames: cleanedNames
                        }
                    });
                }
            } else {
                // localizedNames.length === 1 — keep as-is (even if blank)
                cleanedItems.push(itemObj);
            }
        }
        cleanedItems.forEach(item => {
            const localizedNames = item.item?.localizedNames;
            if (item.remediationAction === "OVERWRITE" &&
                (!localizedNames || localizedNames.length === 0)) {
                item.remediationAction = "DELETE";
            }
        });

        console.log("✅ Final cleanedItems:", JSON.stringify(cleanedItems, null, 2));
    } else {
        console.warn("⚠️ curNamePutArr is not a valid array.");
    }

    // console.log('audit_trail_items before: ', audit_trail_items);

    // Build a quick lookup from cleanedItems by hash
    // console.log('Building hashMap from cleanedItems: ', cleanedItems);
    var hashMap = new Map();
    cleanedItems.forEach(item => {
        // console.log('cleanedItems item: ', item);
        let hash = item.itemObjectHash;
        if (!hash || hash.trim() === "") {
            hash = item.remediatedItemHash;
        }

        if (hash) {
            hashMap.set(hash, item);
        }
    });
    // console.log('hashMap', [...hashMap.entries()]);

    // Replace items in audit_trail_items if hash matches
    audit_trail_items = audit_trail_items.map(item => {
        let hash = item.item_hash;

        if (item.field_path.includes('names') && item.remediation_action.toLowerCase() !== 'new') {
            // console.log("Checking audit item hash:", hash);
            // console.log("hashMap has?", hashMap.has(hash));

            if (hashMap.has(hash)) {
                // console.log('audit_trail_items item hash found: ', hashMap.get(hash), " | item: ", item);
                const temp_item = hashMap.get(hash).item;
                const temp_names = temp_item.localizedNames;
                const remAction = hashMap.get(hash).remediationAction;

                if (item.remediation_action.toLowerCase() === 'delete' && item.remediation_action.toLowerCase() !== remAction.toLowerCase()) {
                    item.new_value = structuredClone(temp_item);
                    item.remediation_action = remAction;

                } else {
                    item.new_value.localizedNames = structuredClone(temp_names);
                    item.remediation_action = remAction;
                }
            }
            if (item.remediation_action.toLowerCase() !== 'delete') {
                item.new_value.localizedNames.forEach(obj => {
                    delete obj.alphabet;
                });
                delete item.new_value.flags
            }
            item.prev_value.localizedNames.forEach(obj => {
                delete obj.alphabet;
            });
            delete item.prev_value.flags
        }


        return item;
    });

    // console.log('audit_trail_items after: ', audit_trail_items);



    NamePutArray.setValue(cleanedItems);
    console.log('NamePutArray', NamePutArray)
    saveNamePutArray.setValue(cleanedItems);
  console.log('saveNamePutArray', saveNamePutArray)

    LinkCheckNames.trigger()
   


    //  console.log('disable_save[1].length === 0', disable_save[1].replace(/\[|\]/g, "").length === 0);

    // Check any field change or not.
    //  if (disable_save[1].replace(/\[|\]/g, "").length === 0 && audit_trail_items.length === 0 && addressArray.length === 0 && curNamePutArr.length === 0) {
    //      utils.showNotification({
    //          title: 'No Changes',
    //          description: 'No updates found. Save action not required.',
    //          duration: 5000,
    //          notificationType: 'warning'

    //      });
    //      loadingPopUp.setHidden(true);
    //  } else {
       if(savePutFlag.value===true){
        PUTMasteringRecord.trigger();


        //Auit Trail List Creation
        // console.log("Audit Trail Item: ", audit_trail_items)
        var audit_trail = {}
        audit_trail.entity_id = selectedCompany.value.header.entityID
        audit_trail.orbis_id = selectedCompany.value.header.entityID
        audit_trail.bvd_id = selectedCompany.value.header.bvdID
        audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
        audit_trail.items = audit_trail_items
        audit_trail.ticket_id = urlparams.ticket
        audit_trail.object_type = "firmographics"
        audit_trail.source = "REMEDIATED"


        AuditTrailList.setValue(audit_trail)
        //  updateLinkedAttributes.trigger()
        //  createAuditTrail.trigger()
    //}
       }
}
