//AUDIT TRAIL
function addMissingKeys(prev_value, new_value) {
    // // console.log("prev_value: ", prev_value);
    // // console.log("new_value: ", new_value);
    for (let key in new_value) {
        //   // console.log("key: ", key, " | type: ", (typeof new_value[key]), " | value: ", new_value[key]);
        if (Array.isArray(new_value[key])) {
            if (!(key in prev_value)) {
                prev_value[key] = [];
            }
        } else if (typeof new_value[key] === 'object' && new_value[key] !== null) {
            if (!(key in prev_value)) {
                prev_value[key] = {};
            }
            addMissingKeys(prev_value[key], new_value[key]);
        } else if (new_value[key] === undefined) {
            prev_value[key] = "";
        } else {
            if (!(key in prev_value)) {
                prev_value[key] = "";
            }
        }
    }
    return prev_value;
}


//AUDIT TRAIL
var new_value = ""
var prev_value = ""
var field_path = ""
var remediation_action = ''
var audit_trail_items = []
var audit_helper = []
if (suppressFlag.value || activeFlag.value) {

    //AUDIT TRAIL
    if (suppressFlag.value) {
        new_value = 'SUPPRESSED'
    } else {
        new_value = 'ACTIVE'
    }

    audit_trail_items.push({
        "field_path": 'header/state',
        "new_value": new_value,
        "prev_value": CurrentSelectedContact.value.header.state,
        "remediation_action": "OVERWRITE",
        "item_hash": ""
    })

    loadingPopUp.show();
    PUTContactMasteringRecord.trigger();

    //AUDIT TRAIL List Creation
    // console.log("Audit Trail Item: ", audit_trail_items)
    var audit_trail = {}
    audit_trail.entity_id = CurrentSelectedContact.value.entityID
    audit_trail.orbis_id = ""
    audit_trail.bvd_id = ""
    audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
    audit_trail.items = audit_trail_items
    audit_trail.ticket_id = urlparams.ticket
    audit_trail.object_type = "uci"
    audit_trail.source = "REMEDIATED"


    AuditTrailList.setValue(audit_trail)
    //  updateLinkedAttributes.trigger()
    //  createAuditTrail.trigger()

} else {
    var epochDate = moment.utc(new Date('1970-01-01'));
    var namesArr = [];
    var curOriginalName = CurrentSelectedContact.value.names.find((o) => o.item.languageType === "1");

    var curNamePutReq = {
        "item": {
            "flags": [],
            "title": curOriginalName.item.title ? curOriginalName.item.title : '',
            "first": curOriginalName.item.first ? curOriginalName.item.first : '',
            "middle": curOriginalName.item.middle ? curOriginalName.item.middle : '',
            "last": curOriginalName.item.last ? curOriginalName.item.last : '',
            "suffix": curOriginalName.item.suffix ? curOriginalName.item.suffix : '',
            "salutation": curOriginalName.item.salutation ? curOriginalName.item.salutation : '',
            "languageType": curOriginalName.item.languageType,
        },
        "itemObjectHash": "",
        "remediatedItemHash": curOriginalName.remediatedItemHash ? curOriginalName.remediatedItemHash : curOriginalName.itemObjectHash,
        "remediationAction": "OVERWRITE",
        "lineageId": curOriginalName.lineageId.includes('REMEDIATED') ? curOriginalName.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
        "source": "REMEDIATED",
        "itemStatus": "ACTIVE"
    };

    // console.log(curNamePutReq);
    // console.log(curNamePutReq.item.first !== firstName.value);
    // console.log(curNamePutReq.item.last !== lastName.value);
    // console.log(curNamePutReq.item.middle !== middleName.value);
    // console.log(curNamePutReq.item.salutation !== salutation.value);
    // console.log(curNamePutReq.item.title !== titleField.value);
    // console.log(curNamePutReq.item.suffix !== suffix.value);


    if (curNamePutReq.item.first !== firstName.value || curNamePutReq.item.last !== lastName.value || curNamePutReq.item.middle !== middleName.value || curNamePutReq.item.salutation !== salutation.value ||
        curNamePutReq.item.title !== titleField.value || curNamePutReq.item.suffix !== suffix.value) {

        //AUDIT TRAIL
        prev_value = curNamePutReq.item
        field_path = "names/item"

        curNamePutReq = {
            "item": {
                "flags": [],
                "title": titleField.value.trim(),
                "first": firstName.value.trim(),
                "middle": middleName.value.trim(),
                "last": lastName.value.trim(),
                "suffix": suffix.value.trim(),
                "salutation": salutation.value,
                "languageType": curOriginalName.item.languageType,
            },
            "itemObjectHash": "",
            "remediatedItemHash": curOriginalName.remediatedItemHash ? curOriginalName.remediatedItemHash : curOriginalName.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curOriginalName.lineageId.includes('REMEDIATED') ? curOriginalName.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }
        // console.log('Name Edited')
        namesArr.push(curNamePutReq);
        ContactNamePutArray.setValue(namesArr);

        //AUDIT TRAIL
        prev_value = addMissingKeys(prev_value, curNamePutReq.item)

        //AUDIT TRAIL
        if (prev_value.first !== firstName.value) {
            temp_field_path = field_path + "/first"
            new_value = firstName.value
            temp_prev_value = prev_value.first
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })

        }
        if (prev_value.last !== lastName.value) {
            temp_field_path = field_path + "/last"
            new_value = lastName.value
            temp_prev_value = prev_value.last
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })

        }
        if (prev_value.middle !== middleName.value) {
            temp_field_path = field_path + "/middle"
            new_value = middleName.value
            temp_prev_value = prev_value.middle
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })

        }
        if (prev_value.salutation !== salutation.value) {
            temp_field_path = field_path + "/salutation"
            new_value = salutation.value
            temp_prev_value = prev_value.salutation
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })

        }
        if (prev_value.title !== titleField.value) {
            temp_field_path = field_path + "/title"
            new_value = titleField.value
            temp_prev_value = prev_value.title
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })

        }
        if (prev_value.suffix !== suffix.value) {
            temp_field_path = field_path + "/suffix"
            new_value = suffix.value
            temp_prev_value = prev_value.suffix
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": "OVERWRITE",
                "item_hash": curNamePutReq.remediatedItemHash
            })
        }

    }


    var curIntName = CurrentSelectedContact.value.names.find((o) => o.item.languageType !== "1");
    if ((curIntName && Object.keys(curIntName).length > 0)) {
        curNamePutReq = {
            "item": {
                "flags": [],
                "title": curIntName.item.title ? curIntName.item.title : '',
                "first": curIntName.item.first ? curIntName.item.first : '',
                "middle": curIntName.item.middle ? curIntName.item.middle : '',
                "last": curIntName.item.last ? curIntName.item.last : '',
                "suffix": curIntName.item.suffix ? curIntName.item.suffix : '',
                "salutation": curIntName.item.salutation ? curIntName.item.salutation : '',
                "languageISO3": curIntName.item.languageISO3 ? curIntName.item.languageISO3 : '',
                "languageType": curIntName.item.languageType,
            },
            "itemObjectHash": "",
            "remediatedItemHash": curIntName.remediatedItemHash ? curIntName.remediatedItemHash : curIntName.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curIntName.lineageId.includes('REMEDIATED') ? curIntName.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        };
    } else {
        curNamePutReq = {
            "item": {
                "flags": [],
                "title": '',
                "first": '',
                "middle": '',
                "last": '',
                "suffix": '',
                "salutation": '',
                "languageISO3": '',
                "languageType": ''
            },
            "itemObjectHash": "",
            "remediatedItemHash": curOriginalName.remediatedItemHash ? curOriginalName.remediatedItemHash : curOriginalName.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curOriginalName.lineageId.includes('REMEDIATED') ? curOriginalName.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        };
    }

    if ((curNamePutReq.item.first !== firstName1.value || curNamePutReq.item.last !== lastName1.value || 
        curNamePutReq.item.middle !== middleName1.value || curNamePutReq.item.salutation !== salutation1.value || 
        (!curNamePutReq.item.languageISO3 && curNamePutReq.item.languageISO3.toLowerCase() !== nameLanguageLocal.value) || (!nameLanguageLocal.value && curNamePutReq.item.languageISO3.toLowerCase() !== nameLanguageLocal.value) || 
        deleteIntNameFlag.value || curNamePutReq.item.title !== titleField1.value || curNamePutReq.item.suffix !== suffix1.value)) {

        //AUDIT TRAIL
        prev_value = curNamePutReq.item
        field_path = 'names/item'

        curNamePutReq = {
            "item": {
                "flags": [],
                "title": titleField1.value.trim(),
                "first": firstName1.value.trim(),
                "middle": middleName1.value.trim(),
                "last": lastName1.value.trim(),
                "suffix": suffix1.value.trim(),
                "salutation": salutation1.value,
                "languageType": curIntName.item.languageType,
                "languageISO3": nameLanguageLocal.value,

            },
            "itemObjectHash": "",
            "remediatedItemHash": curIntName.remediatedItemHash ? curIntName.remediatedItemHash : curIntName.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curIntName.lineageId.includes('REMEDIATED') ? curIntName.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        //AUDIT TRAIL
        prev_value = addMissingKeys(prev_value, curNamePutReq.item)
        //  console.log("Filled Previous Value For curNamePutReq: ", prev_value)

        if (deleteIntNameFlag.value) {
            if (curIntName.source === 'REMEDIATED') {
                curNamePutReq.remediationAction = 'DELETE'
                curNamePutReq.itemStatus = 'ACTIVE';
                curNamePutReq.item = null;
                curNamePutReq.itemObjectHash = curIntName.itemObjectHash;
            } else {
                curNamePutReq.remediationAction = 'DELETE'
            }
            //AUDIT TRAIL
            temp_field_path = field_path
            new_value = ""
            temp_prev_value = prev_value
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": curNamePutReq.remediationAction,
                "item_hash": curNamePutReq.remediatedItemHash
            })
            //AUDIT TRAIL
        } else {
            if (prev_value.first !== firstName1.value) {
                temp_field_path = field_path + "/first"
                new_value = firstName1.value
                temp_prev_value = prev_value.first
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
            if (prev_value.last !== lastName1.value) {
                temp_field_path = field_path + "/last"
                new_value = lastName1.value
                temp_prev_value = prev_value.last
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
            if (prev_value.middle !== middleName1.value) {
                temp_field_path = field_path + "/middle"
                new_value = middleName1.value
                temp_prev_value = prev_value.middle
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
            if (prev_value.salutation !== salutation1.value) {
                temp_field_path = field_path + "/salutation"
                new_value = salutation1.value
                temp_prev_value = prev_value.salutation
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }

            if (prev_value.languageISO3.toLowerCase() !== nameLanguageLocal.value) {
                temp_field_path = field_path + "/languageISO3"
                new_value = nameLanguageLocal.value
                temp_prev_value = prev_value.languageISO3
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
            if (prev_value.title !== titleField1.value) {
                temp_field_path = field_path + "/title"
                new_value = titleField1.value
                temp_prev_value = prev_value.title
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
            if (prev_value.suffix !== suffix1.value) {
                temp_field_path = field_path + "/suffix"
                new_value = suffix1.value
                temp_prev_value = prev_value.suffix
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": curNamePutReq.remediatedItemHash
                })
            }
        }
        // console.log('Int Name changed')
        namesArr.push(curNamePutReq);
        ContactNamePutArray.setValue(namesArr);
    }
    // console.log('original - names');
    // console.log(curIntName)
    // console.log(curNamePutReq);

    // Personal Info
    var curPersonalInfo = CurrentSelectedContact.value.personalInfo;
    var isPersonalInfoModified = false;
    var isBirthDateModified = false;
    var isDeathDateModified = false;
    var userBirthDay = '';
    var rawUserBirthday = '';

    if (birthYear.value) {
        userBirthDay = birthYear.value + '-01-01';
        rawUserBirthday = birthYear.value + '0000';
        if (birthMonth.value && birthMonth.value !== '00') {
            userBirthDay = birthYear.value + '-' + birthMonth.value + '-01';
            rawUserBirthday = birthYear.value + birthMonth.value + '00';
            if (birthDay.value && birthDay.value !== '00') {
                userBirthDay = birthYear.value + '-' + birthMonth.value + '-' + birthDay.value;
                rawUserBirthday = birthYear.value + birthMonth.value + birthDay.value;
            }
        }
    }
    // console.log('user birthday', userBirthDay);
    // console.log('raw user birthday', rawUserBirthday)
    var modifiedBDate = moment.utc(new Date(userBirthDay));
    // console.log('modifiedBdate', modifiedBDate);

    var userDeathDay = '';
    var rawUserDeathDay = '';

    if (deathYear.value) {
        userDeathDay = deathYear.value + '-01-01';
        rawUserDeathDay = deathYear.value + '0000';
        if (deathMonth.value && deathMonth.value !== '00') {
            userDeathDay = deathYear.value + '-' + deathMonth.value + '-01';
            rawUserDeathDay = deathYear.value + deathMonth.value + '00';
            if (deathDay.value && deathDay.value !== '00') {
                userDeathDay = deathYear.value + '-' + deathMonth.value + '-' + deathDay.value;
                rawUserDeathDay = deathYear.value + deathMonth.value + deathDay.value;
            }
        }
    }

    var modifiedDDate = moment.utc(new Date(userDeathDay));
    // console.log('modifiedDDate', modifiedDDate);

    var personalInfoReq = {};
    if ((curPersonalInfo && Object.keys(curPersonalInfo))) {
        // console.log('Inside Personal Info');
        // console.log(curPersonalInfo);
        personalInfoReq = {
            "item": {
                "flags": [],
                "gender": curPersonalInfo.item.gender ? curPersonalInfo.item.gender : '',
                "cleanedGender": curPersonalInfo.item.cleanedGender ? curPersonalInfo.item.cleanedGender : '',
                "birth": {
                    "date": curPersonalInfo.item.birth.date ? moment(new Date(curPersonalInfo.item.birth.date)) : '',
                    "countryISO2": curPersonalInfo.item.birth.countryISO2 ? curPersonalInfo.item.birth.countryISO2 : undefined,
                    "regionOrCounty": curPersonalInfo.item.birth.regionOrCounty ? curPersonalInfo.item.birth.regionOrCounty : '',
                    "city": curPersonalInfo.item.birth.city ? curPersonalInfo.item.birth.city : '',
                },
                "nationalities": curPersonalInfo.item.nationalities ? curPersonalInfo.item.nationalities : [],
                "death": {
                    "isDeceased": curPersonalInfo.item.death.isDeceased ? curPersonalInfo.item.death.isDeceased : false,
                    "date": curPersonalInfo.item.death.date ? moment(new Date(curPersonalInfo.item.death.date)) ? moment(new Date(curPersonalInfo.item.death.date)) : null : null,
                }
            },
            "itemObjectHash": "",
            "remediatedItemHash": curPersonalInfo.remediatedItemHash ? curPersonalInfo.remediatedItemHash : curPersonalInfo.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curPersonalInfo.lineageId.includes('REMEDIATED') ? curPersonalInfo.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        };
        var originalBDate = moment(new Date(curPersonalInfo.item.birth.date));
        var originalDDate = moment(new Date(curPersonalInfo.item.death.date));
        if (userBirthDay !== '') {
            if (curPersonalInfo.item.birth.date) {
                if (!originalBDate.isSame(modifiedBDate)) {
                    isBirthDateModified = true;
                    // console.log('isBirthDateModified 1')
                }
            } else {
                if ((CurrentSelectedContact.value.miscellaneous
                    && CurrentSelectedContact.value.miscellaneous.item.rawBirthDate
                    && CurrentSelectedContact.value.miscellaneous.item.rawBirthDate !== rawUserBirthday) || (
                        CurrentSelectedContact.value.miscellaneous && !CurrentSelectedContact.value.miscellaneous.item.rawBirthDate)) {
                    isBirthDateModified = true;
                    // console.log(CurrentSelectedContact.value.miscellaneous.item.rawBirthDate);
                    // console.log('rawBirthDate 2', rawUserBirthday);
                    // console.log('isBirthDateModified 2')
                }
            }
        } else {
            if ((curPersonalInfo.item.birth.date && curPersonalInfo.item.birth.date !== userBirthDay) ||
                (CurrentSelectedContact.value.miscellaneous.item.rawBirthDate && CurrentSelectedContact.value.miscellaneous.item.rawBirthDate !== rawUserBirthday)) {
                isBirthDateModified = true;
                // console.log('isBirthDateModified removed 4')
            }

        }

        if (userDeathDay !== '') {
            if (curPersonalInfo.item.death.date) {
                if (!originalDDate.isSame(modifiedDDate) || (personalInfoReq.item.death.isDeceased !== isDeceased.value)) {
                    isDeathDateModified = true;
                    // console.log('isDeathDateModified 1')
                }
            } else {
                if ((CurrentSelectedContact.value.miscellaneous
                    && CurrentSelectedContact.value.miscellaneous.item.rawDeathDate !== rawUserDeathDay) || (personalInfoReq.item.death.isDeceased !== isDeceased.value)) {
                    isDeathDateModified = true;
                    // console.log('isDeathDateModified 2')
                }
            }
        } else {
            if (curPersonalInfo.item.death.date && curPersonalInfo.item.death.date !== userDeathDay
                || (personalInfoReq.item.death.isDeceased !== isDeceased.value)
                || (CurrentSelectedContact.value.miscellaneous.item.rawDeathDate && CurrentSelectedContact.value.miscellaneous.item.rawDeathDate !== rawUserDeathDay)
            ) {
                isDeathDateModified = true;
                // console.log('isDeathDateModified removed 4')
            }

        }
    } else {
        personalInfoReq = {
            "item": {
                "flags": [],
                "gender": '',
                "cleanedGender": '',
                "birth": {
                    "date": '',
                    "countryISO2": undefined,
                    "regionOrCounty": '',
                    "city": '',
                },
                "nationalities": [],
                "death": {
                    "isDeceased": false,
                    "date": null,
                }
            },
        };
    }

    // // console.log('Personal Info Req');
    // // console.log(personalInfoReq);
    //  // console.log('Personal Info Validations');
    //   // console.log(curPersonalInfo.item.birth.date && isBirthDateModified);
    //  // console.log(personalInfoReq.item.birth.city !== placeOfBirth.value);
    //  // console.log(personalInfoReq.item.birth.countryISO2 !== birthCountry.value);
    //  // console.log(personalInfoReq.item.death.isDeceased && personalInfoReq.item.death.isDeceased !== isDeceased.value);
    //  // console.log(curPersonalInfo.item.death.date && isDeathDateModified);
    //  // console.log('personalInfoReq.item.cleanedGender', personalInfoReq.item.cleanedGender, '-', 'gender.value', gender.value);
    //  // console.log(personalInfoReq.item.cleanedGender !== gender.value);
    //  // // console.log(deletePersonalInfoFlag.value);
    //  // console.log('curPersonalInfo', curPersonalInfo)
    //  // console.log('userBirthDay', userBirthDay);
    //  // console.log('rawUserBirthday', rawUserBirthday);
    //  // console.log(!curPersonalInfo.item.birth.date && isBirthDateModified && userBirthDay.replace(/-/g, '') === rawUserBirthday);
    // // console.log('DEATHDATE', rawUserDeathDay, userDeathDay, isDeathDateModified)
    // // console.log((!curPersonalInfo.item.death.date && isDeathDateModified && rawUserDeathDay !== '' && userDeathDay.replace(/-/g, '') === rawUserDeathDay));
    if (curPersonalInfo && (((curPersonalInfo.item.birth.date && isBirthDateModified)
        || (!curPersonalInfo.item.birth.date && isBirthDateModified && rawUserBirthday !== '' && userBirthDay.replace(/-/g, '') === rawUserBirthday))
        || personalInfoReq.item.birth.city !== placeOfBirth.value ||
        personalInfoReq.item.nationalities.join() !== nationalities.value.join() ||
        personalInfoReq.item.birth.countryISO2 !== birthCountry.value ||
        personalInfoReq.item.birth.regionOrCounty !== regionOrCounty.value ||
        (personalInfoReq.item.death.isDeceased !== isDeceased.value) ||
        ((curPersonalInfo.item.death.date && isDeathDateModified) ||
            (!curPersonalInfo.item.death.date && isDeathDateModified && rawUserDeathDay !== '' && userDeathDay.replace(/-/g, '') === rawUserDeathDay)) ||
        personalInfoReq.item.cleanedGender !== gender.value || deletePersonalInfoFlag.value)) {

        //AUDIT TRAIL
        prev_value = curPersonalInfo.item
        // console.log("PREV PRESONAL ITEM: ", prev_value)
        field_path = "personalInfo/item"

        personalInfoReq = {
            "item": {
                "flags": [],
                "gender": gender.value,
                "cleanedGender": gender.value,
                "birth": {
                    "date": (userBirthDay.replace(/-/g, '') === rawUserBirthday) ? (modifiedBDate.diff(epochDate, 'days') ? modifiedBDate.diff(epochDate, 'days') : null) : null,
                    "countryISO2": birthCountry.value,
                    "regionOrCounty": regionOrCounty.value,
                    "city": placeOfBirth.value.trim()
                },
                "nationalities": nationalities.value,
                "death": {
                    "isDeceased": isDeceased.value,
                    "date": isDeceased.value && (userDeathDay.replace(/-/g, '') === rawUserDeathDay) ? (modifiedDDate.diff(epochDate, 'days') ? modifiedDDate.diff(epochDate, 'days') : null) : null,
                }
            },
            "itemObjectHash": "",
            "remediatedItemHash": curPersonalInfo.remediatedItemHash ? curPersonalInfo.remediatedItemHash : curPersonalInfo.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curPersonalInfo.lineageId.includes('REMEDIATED') ? curPersonalInfo.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        };

        //AUDIT TRAIL
        prev_value = addMissingKeys(prev_value, personalInfoReq.item)
        //  // console.log("Filled Previous Value For personalInfoReq: ", prev_value)

        if (deletePersonalInfoFlag.value) {
            if (curPersonalInfo.source === 'REMEDIATED') {
                personalInfoReq.remediationAction = 'DELETE'
                personalInfoReq.itemStatus = 'ACTIVE';
                personalInfoReq.item = null;
                personalInfoReq.itemObjectHash = curPersonalInfo.itemObjectHash;
            } else {
                personalInfoReq.remediationAction = 'DELETE'
            }

            //AUDIT TRAIL
            temp_field_path = field_path
            new_value = ""
            temp_prev_value = prev_value
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": personalInfoReq.remediationAction,
                "item_hash": personalInfoReq.remediatedItemHash
            })
            //AUDIT TRAIL
        } else {
            if (isBirthDateModified) {
                temp_field_path = field_path + "/birth/date"
                temp_prev_value = prev_value.birth.date
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": personalInfoReq.item.birth.date,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if (prev_value.birth.city !== placeOfBirth.value) {
                temp_field_path = field_path + "/birth/city"
                new_value = personalInfoReq.item.birth.city
                temp_prev_value = prev_value.birth.city
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if ( ((typeof (birthCountry.value) != 'undefined' || birthCountry.value == null) && (prev_value.birth.countryISO2 != null || prev_value.birth.countryISO2 != "")) || prev_value.birth.countryISO2.toLowerCase() !== birthCountry.value.toLowerCase()) {
                temp_field_path = field_path + "/birth/countryISO2"
                new_value = personalInfoReq.item.birth.countryISO2
                temp_prev_value = prev_value.birth.countryISO2
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if (prev_value.birth.regionOrCounty.toLowerCase() !== regionOrCounty.value.toLowerCase()) {
                temp_field_path = field_path + "/birth/regionOrCounty"
                new_value = personalInfoReq.item.birth.regionOrCounty
                temp_prev_value = prev_value.birth.regionOrCounty
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if (prev_value.nationalities.join() !== nationalities.value.join()) {
                temp_field_path = field_path + "/nationalities"
                new_value = personalInfoReq.item.nationalities
                temp_prev_value = prev_value.nationalities
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if (prev_value.death.isDeceased && personalInfoReq.item.death.isDeceased !== isDeceased.value) {
                temp_field_path = field_path + "/death"
                new_value = personalInfoReq.item.death
                temp_prev_value = prev_value.death
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            } if (isDeathDateModified) {
                temp_field_path = field_path + "/death/date"
                new_value = personalInfoReq.item.death.date
                temp_prev_value = prev_value.death.date
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
            if (prev_value.gender !== gender.value) {
                temp_field_path = field_path + "/gender"
                new_value = personalInfoReq.item.gender
                temp_prev_value = prev_value.gender
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })

                temp_field_path = field_path + "/cleanedGender"
                new_value = personalInfoReq.item.gender
                temp_prev_value = prev_value.cleanedGender
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": "OVERWRITE",
                    "item_hash": personalInfoReq.remediatedItemHash
                })
            }
           if (curPersonalInfo.item.birth.date && curPersonalInfo.item.birth.date.split('T')[0] !== userBirthDay) {
            isBirthDateModified = true;
            // console.log('isBirthDateModified 3')
        }

      //  console.log(personalInfoReq);
      //  console.log(curPersonalInfo);

        if (curPersonalInfo.item.death && curPersonalInfo.item.death.date && curPersonalInfo.item.death.date.split('T')[0] !== userDeathDay || ( curPersonalInfo.item.death && !curPersonalInfo.item.death.date && userDeathDay !== '') || (personalInfoReq.item.death.isDeceased !== isDeceased.value)) {
            // console.log('death checks', curPersonalInfo.item.death.date, userDeathDay)
            isDeathDateModified = true;
        }
        }

       

        isPersonalInfoModified = true;
        PersonalInfoPutObj.setValue(personalInfoReq);
        // console.log('Personal Info changed')
        // console.log('original personal info');
        // console.log(curPersonalInfo)
        // console.log('modified personal info')
        // console.log(personalInfoReq);
    }

    // Address PUT 

    var addressArr = [];
    var curAddress = CurrentSelectedContact.value.addresses ? CurrentSelectedContact.value.addresses[0] : undefined;
    var curAddressPutReq = {}

    // console.log('original address');
    // console.log(curAddress);
    if ((curAddress && Object.keys(curAddress).length > 0)) {
        curAddressPutReq = {
            "item": {
                "flags": [],
                "reported": {
                    "addressLines": curAddress.item.reported.addressLines ? curAddress.item.reported.addressLines : [''],
                    "postCode": curAddress.item.reported.postCode ? curAddress.item.reported.postCode : '',
                    "city": curAddress.item.reported.city ? curAddress.item.reported.city : '',
                    "state": curAddress.item.reported.state ? curAddress.item.reported.state : '',
                    "provinceOrState": curAddress.item.reported.provinceOrState ? curAddress.item.reported.provinceOrState : '',
                    "countryISO2": curAddress.item.reported.countryISO2 ? curAddress.item.reported.countryISO2 : null,
                    // "country": CountriesList.value.filter((o) => o.a2.toLowerCase() === country1.value).length > 0 ? CountriesList.value.filter((o) => o.a2.toLowerCase() === country1.value)[0].labels.en : '',
                    "mailMarker": curAddress.item.reported.mailMarker ? curAddress.item.reported.mailMarker : (curAddress.item.reported.mailMarker === false) ? false : null
                }
            },
            "itemObjectHash": "",
            "remediatedItemHash": curAddress.remediatedItemHash ? curAddress.remediatedItemHash : curAddress.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": curAddress.lineageId.includes('REMEDIATED') ? curAddress.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        // console.log('Address checks')
        // console.log(curAddressPutReq.item.reported.mailMarker !== mailMarker.value);
        if ((curAddressPutReq.item.reported.addressLines.filter(str => str.trim() !== "").join('; ') !== addressLine1.value ||
            curAddressPutReq.item.reported.city !== city1.value || curAddressPutReq.item.reported.postCode !== postCode1.value ||
            curAddressPutReq.item.reported.provinceOrState !== state1.value || curAddressPutReq.item.reported.countryISO2 != country1.value ||
            curAddressPutReq.item.reported.mailMarker !== mailMarker.value || addressDeleteFlag1.value)) {

            //AUDIT TRAIL
            prev_value = curAddressPutReq.item
            field_path = "addresses/item"


            // console.log('Address Edited, put req');
            curAddressPutReq = {
                "item": {
                    "flags": [],
                    "reported": {
                        "addressLines": addressLine1.value.trim().split('; '),
                        "postCode": postCode1.value.trim(),
                        "city": city1.value.trim(),
                        "state": curAddressPutReq.state,
                        "provinceOrState": state1.value.trim(),
                        "countryISO2": country1.value,
                        "country": CountriesList.value.filter((o) => o.a2.toLowerCase() === country1.value).length > 0 ? CountriesList.value.filter((o) => o.a2.toLowerCase() === country1.value)[0].labels.en : '',
                        "mailMarker": mailMarker.value
                    }
                },
                "itemObjectHash": "",
                "remediatedItemHash": curAddress.remediatedItemHash ? curAddress.remediatedItemHash : curAddress.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": curAddress.lineageId.includes('REMEDIATED') ? curAddress.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            prev_value = addMissingKeys(prev_value, curAddressPutReq.item)
            // console.log("Filled Previous Value For curAddressPutReq: ", prev_value)

            if (addressDeleteFlag1.value) {
                if (curAddress.source === 'REMEDIATED') {
                    curAddressPutReq.remediationAction = 'DELETE';
                    curAddressPutReq.itemStatus = 'ACTIVE';
                    curAddressPutReq.item = null;
                    curAddressPutReq.itemObjectHash = curAddress.itemObjectHash;
                } else {
                    curAddressPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = prev_value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curAddressPutReq.remediationAction,
                    "item_hash": curAddressPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                var temp_addr_lines = prev_value.reported.addressLines.filter(x => x !== '').join(', ');
                if (temp_addr_lines !== addressLine1.value) {
                    temp_field_path = field_path + "/reported/addressLines"
                    new_value = curAddressPutReq.item.reported.addressLines
                    temp_prev_value = prev_value.reported.addressLines
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
                if (prev_value.reported.city !== city1.value) {
                    temp_field_path = field_path + "/reported/city"
                    new_value = curAddressPutReq.item.reported.city
                    temp_prev_value = prev_value.reported.city
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
                if (prev_value.reported.postCode !== postCode1.value) {
                    temp_field_path = field_path + "/reported/postCode"
                    new_value = curAddressPutReq.item.reported.postCode
                    temp_prev_value = prev_value.reported.postCode
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
                if (prev_value.reported.state !== state1.value) {
                    temp_field_path = field_path + "/reported/provinceOrState"
                    new_value = curAddressPutReq.item.reported.provinceOrState
                    temp_prev_value = prev_value.reported.provinceOrState
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
                if (((country1.value == null || typeof (country1.value) != 'undefined') && (prev_value.reported.countryISO2 != null || prev_value.reported.countryISO2 != "")) || ((country1.value == null || typeof (country1.value) != 'undefined') && (prev_value.reported.countryISO2 == null || prev_value.reported.countryISO2 == "")) || prev_value.reported.countryISO2.toLowerCase() !== country1.value.toLowerCase()) {
                    temp_field_path = field_path + "/reported/countryISO2"
                    new_value = curAddressPutReq.item.reported.countryISO2
                    temp_prev_value = prev_value.reported.countryISO2
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
                if (prev_value.reported.mailMarker !== mailMarker.value) {
                    temp_field_path = field_path + "/reported/mailMarker"
                    new_value = curAddressPutReq.item.reported.mailMarker
                    temp_prev_value = prev_value.reported.mailMarker
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curAddressPutReq.remediatedItemHash
                    })
                }
            }

            addressArr.push(curAddressPutReq);
            // console.log('Address Edited, put req');
            // console.log(curAddressPutReq);
        }

        AddressesPutArr.setValue(addressArr);
    }

    // Contact PUT
    var contactArr = [];
    if (CurrentSelectedContact.value.contactInformations) {
        var curContactPutReq = {};
        var curOriginalPhone = CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === "1");
        var curOriginalEmail = CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === "2");
        var curOriginalFax = CurrentSelectedContact.value.contactInformations.find((o) => o.item.type === "3");

        //AUDIT TRAIL
        field_path = "contactInformations/item"


        if (curOriginalPhone && Object.keys(curOriginalPhone).length > 0 && (curOriginalPhone.item.value !== phoneNumber1.value || contactDeleteFlag.value)) {
            curContactPutReq = {
                "item": {
                    "flags": [],
                    "type": curOriginalPhone.item.type,
                    "value": phoneNumber1.value,
                },
                "itemObjectHash": "",
                "remediatedItemHash": curOriginalPhone.remediatedItemHash ? curOriginalPhone.remediatedItemHash : curOriginalPhone.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": curOriginalPhone.lineageId.includes('REMEDIATED') ? curOriginalPhone.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            //  prev_value = curOriginalPhone
            //  prev_value = addMissingKeys(prev_value, curContactPutReq.item)
            //  // console.log("Filled Previous Value For : curContactPutReq", prev_value)

            if (contactDeleteFlag.value) {
                if (curOriginalPhone.source === 'REMEDIATED') {
                    curContactPutReq.remediationAction = 'DELETE';
                    curContactPutReq.itemStatus = 'ACTIVE';
                    curContactPutReq.item = null;
                    curContactPutReq.itemObjectHash = curOriginalPhone.itemObjectHash;
                } else {
                    curContactPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = curOriginalPhone
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curContactPutReq.remediationAction,
                    "item_hash": curContactPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                temp_field_path = field_path
                new_value = curContactPutReq.item.value
                temp_prev_value = curOriginalPhone.item.value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curContactPutReq.remediationAction,
                    "item_hash": curContactPutReq.remediatedItemHash
                })
            }
            contactArr.push(curContactPutReq);
        }

        if (curOriginalEmail && Object.keys(curOriginalEmail).length > 0 && (curOriginalEmail.item.value !== email1.value || contactDeleteFlag.value)) {
            curContactPutReq = {
                "item": {
                    "flags": [],
                    "type": curOriginalEmail.item.type,
                    "value": email1.value,
                },
                "itemObjectHash": "",
                "remediatedItemHash": curOriginalEmail.remediatedItemHash ? curOriginalEmail.remediatedItemHash : curOriginalEmail.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": curOriginalEmail.lineageId.includes('REMEDIATED') ? curOriginalEmail.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            //  prev_value = curOriginalEmail
            //  prev_value = addMissingKeys(prev_value, curContactPutReq.item)
            //// console.log("Filled Previous Value For : curContactPutReq", prev_value)

            if (contactDeleteFlag.value) {
                if (curOriginalEmail.source === 'REMEDIATED') {
                    curContactPutReq.remediationAction = 'DELETE';
                    curContactPutReq.itemStatus = 'ACTIVE';
                    curContactPutReq.item = null;
                    curContactPutReq.itemObjectHash = curOriginalEmail.itemObjectHash;
                } else {
                    curContactPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
            } else {
                temp_field_path = field_path
                new_value = curContactPutReq.item.value
                temp_prev_value = curOriginalEmail.item.value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curContactPutReq.remediationAction,
                    "item_hash": curContactPutReq.remediatedItemHash
                })
            }
            contactArr.push(curContactPutReq);
        }

        if (curOriginalFax && Object.keys(curOriginalFax).length > 0 && (curOriginalFax.item.value !== faxNumber1.value || contactDeleteFlag.value)) {
            curContactPutReq = {
                "item": {
                    "flags": [],
                    "type": curOriginalFax.item.type,
                    "value": faxNumber1.value,
                },
                "itemObjectHash": "",
                "remediatedItemHash": curOriginalFax.remediatedItemHash ? curOriginalFax.remediatedItemHash : curOriginalFax.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": curOriginalFax.lineageId.includes('REMEDIATED') ? curOriginalFax.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            //  prev_value = curOriginalFax
            //  prev_value = addMissingKeys(prev_value, curContactPutReq.item)
            //// console.log("Filled Previous Value For curContactPutReq: ", prev_value)

            if (contactDeleteFlag.value) {
                if (curOriginalFax.source === 'REMEDIATED') {
                    curContactPutReq.remediationAction = 'DELETE';
                    curContactPutReq.itemStatus = 'ACTIVE';
                    curContactPutReq.item = null;
                    curContactPutReq.itemObjectHash = curOriginalFax.itemObjectHash;
                } else {
                    curContactPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = curOriginalFax
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curContactPutReq.remediationAction,
                    "item_hash": curContactPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                temp_field_path = field_path
                new_value = curContactPutReq.item.value
                temp_prev_value = curOriginalFax.item.value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curContactPutReq.remediationAction,
                    "item_hash": curContactPutReq.remediatedItemHash
                })
            }

            contactArr.push(curContactPutReq);
        }

        ContactPutArr.setValue(contactArr);

    }

    // Education Put
    var educationArr = [];
    var originalEducationList = CurrentSelectedContact.value.educations;
    var educationDeleteFlag = false;
    var gradDateModified = false;

    var gradDates = [];

    EducationList.data.forEach((o, i) => {
        var originalGDate = moment.utc(new Date(originalEducationList[i].item.graduationDate));
        var modifiedGDate = moment.utc(new Date(EducationValuesList.value[i].graduationDate));
        // console.log('originalGDate', originalEducationList[i].item.graduationDate);
        // console.log('updatedmodifiedGDate', EducationValuesList.value[i]);
        // console.log('Moment modifiedGDate', modifiedGDate);
        var currentGradDateModified = false;
        if (EducationValuesList.value[i].graduationDate && EducationValuesList.value[i].graduationDate !== '') {
            if (originalEducationList[i].item.graduationDate) {
                if (modifiedGDate) {
                    if (!originalGDate.isSame(modifiedGDate)) {
                        gradDateModified = true;
                        currentGradDateModified = true;
                    }
                } else {
                    gradDateModified = true;
                    currentGradDateModified = true;
                }

            } else {
                gradDateModified = true;
                currentGradDateModified = true;
            }
        } else {
            if (originalGDate !== null &&
                originalEducationList[i].item.graduationDate !== undefined) {
                gradDateModified = true;
                currentGradDateModified = true;
            }
        }

        if (gradDateModified) {
            gradDates.push(EducationValuesList.value[i].graduationDate);
        }

        if (originalEducationList[i].item.college !== EducationValuesList.value[i].college ||
            originalEducationList[i].item.degreeCode !== EducationValuesList.value[i].degreeCode ||
            originalEducationList[i].item.major !== EducationValuesList.value[i].major ||
            currentGradDateModified || EducationsDeleteFlags.value[i]) {

            //AUDIT TRAIL
            field_path = "educations/item"
            prev_value = originalEducationList[i].item


            var educationPutReq = {
                "item": {
                    "flags": [],
                    "college": EducationValuesList.value[i].college.trim() ? EducationValuesList.value[i].college.trim() : '',
                    "degreeCode": EducationValuesList.value[i].degreeCode ? EducationValuesList.value[i].degreeCode.trim() : '',
                    "major": EducationValuesList.value[i].major ? EducationValuesList.value[i].major.trim() : '',
                    "graduationDate": modifiedGDate.diff(epochDate, 'days'),
                    "graduationDatePrecision": EducationValuesList.value[i].graduationDatePrecision
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalEducationList[i].remediatedItemHash ? originalEducationList[i].remediatedItemHash : originalEducationList[i].itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalEducationList[i].lineageId.includes('REMEDIATED') ? originalEducationList[i].lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            prev_value = addMissingKeys(prev_value, educationPutReq.item)
            //// console.log("Filled Previous Value For educationPutReq: ", prev_value)

            if (EducationsDeleteFlags.value[i]) {
                if (originalEducationList[i].source === 'REMEDIATED') {
                    educationPutReq.remediationAction = 'DELETE';
                    educationPutReq.itemStatus = 'ACTIVE';
                    educationPutReq.itemObjectHash = originalEducationList[i].itemObjectHash;
                    educationDeleteFlag = true;
                    // console.log('educationPutReq finaal', educationPutReq);
                } else {
                    educationPutReq.remediationAction = 'DELETE'
                    educationDeleteFlag = true;
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = prev_value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": educationPutReq.remediationAction,
                    "item_hash": educationPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                if (originalEducationList[i].item.college !== EducationValuesList.value[i].college) {
                    temp_field_path = field_path + "/college"
                    new_value = educationPutReq.item.college
                    temp_prev_value = prev_value.college
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": educationPutReq.remediatedItemHash
                    })
                }
                if (originalEducationList[i].item.degreeCode !== EducationValuesList.value[i].degreeCode) {
                    temp_field_path = field_path + "/degreeCode"
                    new_value = educationPutReq.item.degreeCode
                    temp_prev_value = prev_value.degreeCode
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": educationPutReq.remediatedItemHash
                    })
                }
                if (originalEducationList[i].item.major !== EducationValuesList.value[i].major) {
                    temp_field_path = field_path + "/major"
                    new_value = educationPutReq.item.major
                    temp_prev_value = prev_value.major
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": educationPutReq.remediatedItemHash
                    })
                }
                if (gradDateModified) {
                    temp_field_path = field_path + "/graduationDate"
                    new_value = educationPutReq.item.graduationDate
                    temp_prev_value = prev_value.graduationDate
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": educationPutReq.remediatedItemHash
                    })

                    temp_field_path = field_path + "/graduationDatePrecision"
                    new_value = educationPutReq.item.graduationDatePrecision
                    temp_prev_value = prev_value.graduationDatePrecision
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": educationPutReq.remediatedItemHash
                    })
                }
            }
            // console.log('Education changed', i);
            educationArr.push(educationPutReq)
        }

    });
    // console.log('educationArr', educationArr)
    //if action is 'delete'then item is null
    var updatedEducationArr = educationDeleteFlag ?
        educationArr.map(item => ({ ...item, item: item.remediationAction === "DELETE" ? null : item.item })) : educationArr;

    // console.log('updatedEducationArr', updatedEducationArr)

    EducationPutArr.setValue(updatedEducationArr);

    // Biogrpahies Put
    var biographyArr = [];
    var originalBiographyList = CurrentSelectedContact.value.biographies;
    BiographiesList.data.forEach((o, i) => {

        if (originalBiographyList[i].item.value !== BiographyValuesList.value[i].value || BiographyDeleteFlags.value[i]) {

            //AUDIT TRAIL
            prev_value = originalBiographyList[i].item
            field_path = "biographies/item"


            var biographyPutReq = {
                "item": {
                    "flags": [],
                    "value": BiographyValuesList.value[i].value,
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalBiographyList[i].remediatedItemHash ? originalBiographyList[i].remediatedItemHash : originalBiographyList[i].itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalBiographyList[i].lineageId.includes('REMEDIATED') ? originalBiographyList[i].lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            prev_value = addMissingKeys(prev_value, biographyPutReq.item)
            //// console.log("Filled Previous Value For biographyPutReq: ", prev_value)

            if (BiographyDeleteFlags.value[i]) {
                if (originalBiographyList[i].source === 'REMEDIATED') {
                    biographyPutReq.remediationAction = 'DELETE';
                    biographyPutReq.itemStatus = 'ACTIVE';
                    biographyPutReq.item = null;
                    biographyPutReq.itemObjectHash = originalBiographyList[i].itemObjectHash;
                } else {
                    biographyPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = prev_value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": biographyPutReq.remediationAction,
                    "item_hash": biographyPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                if (originalBiographyList[i].item.value !== BiographyValuesList.value[i].value) {
                    temp_field_path = field_path + "/value"
                    new_value = biographyPutReq.item.value
                    temp_prev_value = prev_value.value
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": biographyPutReq.remediatedItemHash
                    })
                }
            }

            biographyArr.push(biographyPutReq)
        }

    });
    // console.log(biographyArr)
    BiographyPutArr.setValue(biographyArr);

    // Disqualifications PUT
    var disQualificationArr = [];
    if (CurrentSelectedContact.value.disqualifications) {

        var originalDisObj = CurrentSelectedContact.value.disqualifications ? CurrentSelectedContact.value.disqualifications[0] : undefined;
        var curDisPutReq = {};
        var disQualificationDateModified = false;
        var originalFDate = moment.utc(new Date(originalDisObj.item.date.from));
        var modifiedFDate = moment.utc(new Date(fromDate.value));
        var originalTDate = moment.utc(new Date(originalDisObj.item.date.to));
        var modifiedTDate = moment.utc(new Date(toDate.value));
        var isFromDateModified = false;
        var isToDateModified = false;

        // console.log('originalFDate', originalFDate);
        // console.log('modifiedFDate', modifiedFDate);
        // console.log('originalTDate', originalTDate);
        // console.log('modifiedTDate', modifiedTDate);
        // console.log(originalTDate.isSame(modifiedTDate));
        // console.log(originalFDate.isSame(modifiedFDate));

        if (fromDate.value !== '') {
            if (originalDisObj.item.date.from) {
                if (!originalFDate.isSame(modifiedFDate)) {
                    isFromDateModified = true;
                }
            } else {
                // console.log('from date modified', originalDisObj.item.date.from);
                isFromDateModified = true;
            }

        }

        if (toDate.value !== '') {
            if (originalDisObj.item.date.to) {
                if (!originalTDate.isSame(modifiedTDate)) {
                    isToDateModified = true;
                }
            } else {
                // console.log('to date modified', originalDisObj.item.date.to);
                isToDateModified = true;
            }
        }

        var curDisPutReq = {};

        if (originalDisObj && Object.keys(originalDisObj).length > 0) {
            curDisPutReq = {
                "item": {
                    "flags": [],
                    "date": {
                        "from": originalDisObj.item.date.from ? moment(new Date(originalDisObj.item.date.from)) : '',
                        "to": originalDisObj.item.date.to ? moment(new Date(originalDisObj.item.date.to)) : '',
                    },
                    "act": originalDisObj.item.act ? originalDisObj.item.act : ''
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalDisObj.remediatedItemHash ? originalDisObj.remediatedItemHash : originalDisObj.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalDisObj.lineageId.includes('REMEDIATED') ? originalDisObj.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }
        } else {
            curDisPutReq = {
                "item": {
                    "flags": [],
                    "date": {
                        "from": '',
                        "to": '',
                    },
                    "act": {
                        "value": ''
                    }
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalDisObj.remediatedItemHash ? originalDisObj.remediatedItemHash : originalDisObj.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalDisObj.lineageId.includes('REMEDIATED') ? originalDisObj.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }
        }

        if (isFromDateModified || isToDateModified ||
            actField.value !== curDisPutReq.item.act || deleteDisqualificationFlag.value) {

            //AUDIT TRAIL
            prev_value = originalDisObj.item
            field_path = "disqualifications/item"

            curDisPutReq = {
                "item": {
                    "flags": [],
                    "date": {
                        "from": modifiedFDate.diff(epochDate, 'days'),
                        "to": modifiedTDate.diff(epochDate, 'days'),
                    },
                    "act": actField.value.trim()
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalDisObj.remediatedItemHash ? originalDisObj.remediatedItemHash : originalDisObj.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalDisObj.lineageId.includes('REMEDIATED') ? originalDisObj.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            prev_value = addMissingKeys(prev_value, curDisPutReq.item)
            //// console.log("Filled Previous Value For curDisPutReq: ", prev_value)


            if (deleteDisqualificationFlag.value) {
                disQualificationDateModified = true;
                if (originalDisObj.source === 'REMEDIATED') {
                    curDisPutReq.remediationAction = 'DELETE';
                    curDisPutReq.itemStatus = 'ACTIVE';
                    curDisPutReq.item = null;
                    curDisPutReq.itemObjectHash = originalDisObj.itemObjectHash;
                } else {
                    curDisPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = prev_value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curDisPutReq.remediationAction,
                    "item_hash": curDisPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                if (isFromDateModified) {
                    temp_field_path = field_path + "/date/from"
                    new_value = curDisPutReq.item.date.from
                    temp_prev_value = prev_value.date.to.from
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curDisPutReq.remediatedItemHash
                    })
                }
                if (isToDateModified) {
                    temp_field_path = field_path + "/date/to"
                    new_value = curDisPutReq.item.date.to
                    temp_prev_value = prev_value.date.to
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curDisPutReq.remediatedItemHash
                    })
                }
                if (actField.value !== prev_value.act) {
                    temp_field_path = field_path + "/act"
                    new_value = curDisPutReq.item.act
                    temp_prev_value = prev_value.act
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curDisPutReq.remediatedItemHash
                    })
                }
            }

            // console.log('curDisPutReq.item', curDisPutReq.item)
            if (curDisPutReq.item != null) {
                if ((curDisPutReq.item.date.from && !originalFDate.isSame(modifiedFDate)) ||
                    (curDisPutReq.item.date.to && !originalTDate.isSame(modifiedTDate))) {
                    disQualificationDateModified = true;
                }
            }


            // console.log('Disqualification changed');
            disQualificationArr.push(curDisPutReq);
            DisqualificationPutArr.setValue(disQualificationArr);
            // console.log(curDisPutReq);
        }
    }

    var isMisRequired = false;
    var miscellaneousPutReq = {};
    var originalMiscellaneousObj = CurrentSelectedContact.value.miscellaneous ? CurrentSelectedContact.value.miscellaneous : undefined;

    if (originalMiscellaneousObj && Object.keys(originalMiscellaneousObj).length > 0) {

        //AUDIT TRAIL
        field_path = "miscellaneous/item"
        prev_value = originalMiscellaneousObj.item

        miscellaneousPutReq = {
            item: {
                ...originalMiscellaneousObj.item,
            },
            "itemObjectHash": "",
            "remediatedItemHash": originalMiscellaneousObj.remediatedItemHash ? originalMiscellaneousObj.remediatedItemHash : originalMiscellaneousObj.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageId": originalMiscellaneousObj.lineageId.includes('REMEDIATED') ? originalMiscellaneousObj.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }

        //AUDIT TRAIL
        prev_value = addMissingKeys(prev_value, miscellaneousPutReq.item)
        //// console.log("Filled Previous Value For miscellaneousPutReq: ", prev_value)

        const curDispIds = DisplayDirectorIds.value.map((o) => o.value !== '' ? o.source + '_' + o.value : '').filter((o) => o !== '');
        // console.log('curDispIds', curDispIds);

        const isDirectorIdModified = _.isEqual(_.sortBy(OriginalDisplayDirectorIds.value), _.sortBy(curDispIds));
        if (isBirthDateModified) {
            // console.log('Raw Bday, modified')
            miscellaneousPutReq.item.rawBirthDate = rawUserBirthday;
            if (moment().diff(moment(userBirthDay), 'years')) {
                //miscellaneousPutReq.item.age.value = moment().diff(moment(userBirthDay), 'years');
                miscellaneousPutReq.item.age =
                    miscellaneousPutReq.item.age ?
                        { ...miscellaneousPutReq.item.age, value: moment().diff(moment(userBirthDay), 'years') } :
                        { value: moment().diff(moment(userBirthDay), 'years') };

                if (!deletePersonalInfoFlag.value) {
                    //AUDIT TRAIL
                    temp_field_path = field_path + '/rawBirthDate'
                    new_value = miscellaneousPutReq.item.rawBirthDate
                    temp_prev_value = prev_value.rawBirthDate
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": miscellaneousPutReq.remediationAction,
                        "item_hash": miscellaneousPutReq.remediatedItemHash
                    })

                    temp_field_path = field_path + '/age/value'
                    audit_trail_items.push({
                        "field_path": miscellaneousPutReq.item.age == null ? field_path + '/age' : field_path + '/age/value',
                        "new_value": miscellaneousPutReq.item.age == null ? miscellaneousPutReq.item.age : miscellaneousPutReq.item.age.value,
                        "prev_value": prev_value.age == null ? prev_value.age : prev_value.age.value,
                        "remediation_action": miscellaneousPutReq.remediationAction,
                        "item_hash": miscellaneousPutReq.remediatedItemHash
                    })
                }

            } else {
                miscellaneousPutReq.item.age = null;


                //AUDIT TRAIL
                audit_trail_items.push({
                    "field_path": miscellaneousPutReq.item.age == null ? field_path + '/age' : field_path + '/age/value',
                    "new_value": miscellaneousPutReq.item.age,
                    "prev_value": prev_value.age == null ? prev_value.age : prev_value.age.value,
                    "remediation_action": miscellaneousPutReq.remediationAction,
                    "item_hash": miscellaneousPutReq.remediatedItemHash
                })
            }

            isMisRequired = true;
            // console.log('Misc for birth')
        }

        if (isDeathDateModified) {
            miscellaneousPutReq.item.rawDeathDate = isDeceased.value ? rawUserDeathDay : '';
            isMisRequired = true;
            // console.log('Misc for death')

            if (!deletePersonalInfoFlag.value) {
                //AUDIT TRAIL
                if (prev_value.rawDeathDate) {
                    temp_prev_value = prev_value.rawDeathDate
                } else {
                    temp_prev_value = ""
                }
                temp_field_path = field_path + '/rawDeathDate'
                new_value = miscellaneousPutReq.item.rawDeathDate
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": miscellaneousPutReq.remediationAction,
                    "item_hash": miscellaneousPutReq.remediatedItemHash
                })
            }

        }

        if (personalInfoReq?.remediationAction === 'DELETE') {
            // console.log("Delete action triggered misc", personalInfoReq.remediationAction);
            miscellaneousPutReq.item.rawBirthDate = null;
            miscellaneousPutReq.item.age = null;
            miscellaneousPutReq.item.rawDeathDate = null;

            isMisRequired = true;

            //AUDIT TRAIL
            audit_trail_items.push({
                "field_path": field_path + "/rawBirthDate",
                "new_value": miscellaneousPutReq.item.rawBirthDate,
                "prev_value": prev_value.rawBirthDate,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })

            audit_trail_items.push({
                "field_path": field_path + "/age",
                "new_value": miscellaneousPutReq.item.age,
                "prev_value": prev_value.age && prev_value.age.value ? prev_value.age.value : prev_value.age,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })

            if (isDeathDateModified) {
                //AUDIT TRAIL
                if (prev_value.rawDeathDate) {
                    temp_prev_value = prev_value.rawDeathDate
                } else {
                    temp_prev_value = null
                }

                audit_trail_items.push({
                    "field_path": field_path + "/rawDeathDate",
                    "new_value": miscellaneousPutReq.item.rawDeathDate,
                    "prev_value": temp_prev_value,
                    "remediation_action": miscellaneousPutReq.remediationAction,
                    "item_hash": miscellaneousPutReq.remediatedItemHash
                })
            }


        }

        if (isFromDateModified) {
            miscellaneousPutReq.item.rawDisqFrom = fromDate.formattedValue.replace(/-/g, '');
            isMisRequired = true;
            // console.log('isFromDateModified changed for misc')

            //AUDIT TRAIL
            temp_field_path = field_path + '/rawDisqFrom'
            new_value = miscellaneousPutReq.item.rawDisqFrom
            temp_prev_value = prev_value.rawDisqFrom
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }

        if (isToDateModified) {
            miscellaneousPutReq.item.rawDisqTo = toDate.formattedValue.replace(/-/g, '');
            isMisRequired = true;
            // console.log('isToDateModified changed for misc')

            //AUDIT TRAIL
            temp_field_path = field_path + '/rawDisqTo'
            new_value = miscellaneousPutReq.item.rawDisqTo
            temp_prev_value = prev_value.rawDisqTo
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }
        if (curDisPutReq?.remediationAction === 'DELETE') {
            miscellaneousPutReq.item.rawDisqFrom = null;
            miscellaneousPutReq.item.rawDisqTo = null;
            isMisRequired = true;
            // console.log('delete changed for misc')

            //AUDIT TRAIL ADD BOTH
            audit_trail_items.push({
                "field_path": field_path + "/rawDisqFrom",
                "new_value": miscellaneousPutReq.item.rawDisqFrom,
                "prev_value": prev_value.rawDisqFrom,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })

            audit_trail_items.push({
                "field_path": field_path + "/rawDisqTo",
                "new_value": miscellaneousPutReq.item.rawDisqTo,
                "prev_value": prev_value.rawDisqTo,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }

        if (!isDirectorIdModified) {
            miscellaneousPutReq.item.directorIds = [...curDispIds, ...NonDisplayDirectorIds.value];
            isMisRequired = true;
            // console.log('director ids changed for misc')

            //AUDIT TRAIL
            temp_field_path = field_path + '/directorIds'
            new_value = miscellaneousPutReq.item.directorIds
            temp_prev_value = prev_value.directorIds
            audit_trail_items.push({
                "field_path": temp_field_path,
                "new_value": new_value,
                "prev_value": temp_prev_value,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }


        // console.log('miscellaneousPutReq.item.directorIds', miscellaneousPutReq.item.directorIds);
        // console.log("EducationValuesList", EducationValuesList);

        if (gradDateModified && EducationValuesList?.value?.length > 0) {
            miscellaneousPutReq.item.rawGraduationDate = EducationValuesList.value
                .map(o => {
                    const [year, month, day] = o?.graduationDate?.split("T")[0]?.split('-') || [];
                    const precision = o?.graduationDatePrecision;

                    return precision === 11 ? `${year}${month}${day}` // Full precision
                        : precision === 10 ? `${year}${month}00` // Month precision
                            : precision === 9 ? `${year}0000` // Year precision
                                : null;
                }).filter(Boolean) // Remove null or undefined values
                .join(';');

            isMisRequired = true;
            // console.log('Grad Date changed for misc')

            //AUDIT TRAIL
            var temp_prev_value = prev_value.rawGraduationDate
            audit_trail_items.push({
                "field_path": field_path + '/rawGraduationDate',
                "new_value": miscellaneousPutReq.item.rawGraduationDate,
                "prev_value": temp_prev_value,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }



        // console.log("originalMiscellaneousObj", originalMiscellaneousObj?.item?.rawGraduationDate)
        // Delete scenario for GradDates set to null
        if (educationDeleteFlag === true && originalMiscellaneousObj?.item?.hasOwnProperty('rawGraduationDate')) {
            var rawGraduationDate = miscellaneousPutReq.item?.rawGraduationDate;
            const eduactionWithDelete = educationArr.filter(item => item?.remediationAction === "DELETE");
            // console.log("eduactionWithDelete:", eduactionWithDelete);
            // console.log("rawGraduationDate initial:", rawGraduationDate);
            // console.log("originalEducationList:", originalEducationList);

            // Step 1: Filter the original list based on matching conditions
            // Filter logic to find matches and apply DELETE remediation action
            const originalfinalList = originalEducationList?.filter(original => {
                return eduactionWithDelete.some(education => {
                    const isCollegeMatch = education.item?.college === original?.item.college;
                    const isDegreeMatch = education.item?.degreeCode === original?.item.degreeCode;
                    const isMajorMatch = education.item?.major === original?.item.major;
                    const isRemediationActionValid = ["DELETE", "ARCHIVED"].includes(education.remediationAction);

                    // If degreeCode or major are empty or null, only check college
                    if ((education.item?.degreeCode === undefined || education.item?.degreeCode === null || education.item?.degreeCode === "") &&
                        (education.item?.major === undefined || education.item?.major === null || education.item?.major === "")) {
                        return isCollegeMatch && isRemediationActionValid;
                    }

                    // Otherwise, check college, degreeCode, and major
                    return isCollegeMatch && isDegreeMatch && isMajorMatch && isRemediationActionValid;
                }) && original.item.graduationDate && original.item.graduationDatePrecision;
            });


            // console.log("originalfinalList :", originalfinalList);

            // Step 2: Function to format the graduation date based on precision
            const formatGraduationDate = (date, precision) => {
                const dateParts = date?.split("T")[0]?.split("-");
                if (!dateParts) return ''; // Return empty if date is not valid

                switch (precision) {
                    case 11: // Full date (yyyy-mm-dd)
                        return dateParts.join('');
                    case 10: // Year and month (yyyy-mm)
                        return dateParts.slice(0, 2).join('');
                    case 9: // Year only (yyyy)
                        return dateParts[0];
                    default:
                        return dateParts.join(''); // Default to full date format if no match
                }
            };

            // console.log("formatGraduationDate :", formatGraduationDate);

            // Step 3: Update the original list with formatted graduation dates
            const updatedOriginalfinalList = originalfinalList?.map(original => {
                const { graduationDate, graduationDatePrecision } = original?.item || {};
                const formattedGraduationDate = graduationDate ? formatGraduationDate(graduationDate, graduationDatePrecision) : '';
                return {
                    item: {
                        graduationDate: formattedGraduationDate,
                        graduationDatePrecision: graduationDatePrecision
                    }
                };
            });

            // console.log("updatedOriginalfinalList :", updatedOriginalfinalList);


            // Step4 :Process each graduation date item
            rawGraduationDate = rawGraduationDate.split(";");
            updatedOriginalfinalList.forEach(item => {
                const graduationDate = item?.item?.graduationDate;
                const precision = item?.item?.graduationDatePrecision;

                if (!graduationDate || !precision) return; // Skip if data is invalid

                // Determine match length based on precision
                let matchLength;
                if (precision === 9) matchLength = 4; // Year-only precision
                else if (precision === 10) matchLength = 6; // Year + month precision
                else if (precision === 11) matchLength = 8; // Full date precision
                else return; // Unsupported precision

                // Process the raw graduation dates
                rawGraduationDate = rawGraduationDate.map(dateGroup => {
                    // Skip empty strings, preserve delimiters
                    if (dateGroup.trim() === "") return dateGroup;

                    // Split group by `;` and process each part
                    return dateGroup
                        .split(";")
                        .map(date => {
                            const trimmedDate = date.trim(); // Clean the date part

                            // If the date is empty (like spaces) or just a delimiter, leave it as is
                            if (!trimmedDate || trimmedDate === "") return date;

                            // Otherwise, match the date based on the precision
                            return trimmedDate.startsWith(graduationDate.slice(0, matchLength)) ? "" : date;
                        })
                        .join(";"); // Rejoin the processed parts to maintain the structure
                });
            });

            // Log the updated result
            // console.log("Updated Graduation Dates:", rawGraduationDate);



            // Step 6: Join the updated rawGraduationDateArray to get the final result
            //const updatedRawGraduationDate = updatedGraduationDates?.join(";");
            miscellaneousPutReq.item.rawGraduationDate = rawGraduationDate.join(";"); // ;
            isMisRequired = true;
            educationDeleteFlag = false;

            var temp_prev_value = prev_value.rawGraduationDate

            //AUDIT TRAIL
            audit_trail_items.push({
                "field_path": field_path + '/rawGraduationDate',
                "new_value": miscellaneousPutReq.item.rawGraduationDate,
                "prev_value": temp_prev_value,
                "remediation_action": miscellaneousPutReq.remediationAction,
                "item_hash": miscellaneousPutReq.remediatedItemHash
            })
        }

        // console.log('original misc');
        // console.log(originalMiscellaneousObj);
        // console.log('modified misc');
        // console.log(miscellaneousPutReq);
        if (isMisRequired) {
            MiscellaneousPutReq.setValue(miscellaneousPutReq);
        }
    }

    var originalIdentifiers = CurrentSelectedContact.value.identifiers.find((o) => o.item.type === "2");

    var identifiersPutArr = [];
    if (originalIdentifiers && Object.keys(originalIdentifiers).length > 0) {
        var curIdPutReq = {
            "item": {
                "type": "2",
                "flags": [],
                "id": originalIdentifiers.item.id ? originalIdentifiers.item.id : '',
            }
        };

        if (curIdPutReq.item.id !== licenseField.value || licenseDeleteFlag.value) {

            //AUDIT TRAIL
            field_path = 'identifiers/item'
            prev_value = originalIdentifiers.item


            curIdPutReq = {
                "item": {
                    "type": "2",
                    "flags": [],
                    "id": licenseField.value.trim()
                },
                "itemObjectHash": "",
                "remediatedItemHash": originalIdentifiers.remediatedItemHash ? originalIdentifiers.remediatedItemHash : originalIdentifiers.itemObjectHash,
                "remediationAction": "OVERWRITE",
                "lineageId": originalIdentifiers.lineageId.includes('REMEDIATED') ? originalIdentifiers.lineageId : "REMEDIATED_" + CurrentSelectedContact.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": "ACTIVE"
            }

            //AUDIT TRAIL
            prev_value = addMissingKeys(prev_value, curIdPutReq.item)
            //// console.log("Filled Previous Value For curIdPutReq: ", prev_value)

            if (licenseDeleteFlag.value) {
                if (originalIdentifiers.source === 'REMEDIATED') {
                    curIdPutReq.remediationAction = 'DELETE';
                    curIdPutReq.itemStatus = 'ACTIVE';
                    curIdPutReq.item = null;
                    curIdPutReq.itemObjectHash = originalIdentifiers.itemObjectHash;
                } else {
                    curIdPutReq.remediationAction = 'DELETE'
                }
                //AUDIT TRAIL
                temp_field_path = field_path
                new_value = ""
                temp_prev_value = prev_value
                audit_trail_items.push({
                    "field_path": temp_field_path,
                    "new_value": new_value,
                    "prev_value": temp_prev_value,
                    "remediation_action": curIdPutReq.remediationAction,
                    "item_hash": curIdPutReq.remediatedItemHash
                })
                //AUDIT TRAIL
            } else {
                if (prev_value.id !== licenseField.value) {
                    temp_field_path = field_path + "/id"
                    new_value = curIdPutReq.item.id
                    temp_prev_value = prev_value.id
                    audit_trail_items.push({
                        "field_path": temp_field_path,
                        "new_value": new_value,
                        "prev_value": temp_prev_value,
                        "remediation_action": "OVERWRITE",
                        "item_hash": curIdPutReq.remediatedItemHash
                    })
                }
            }
            // console.log('Identifier changed')
            // console.log(curIdPutReq)
            identifiersPutArr.push(curIdPutReq);
            IdentifierPutReq.setValue(identifiersPutArr);
        }
    }
    // console.log('namesArr', namesArr);
    // console.log('addressArr', addressArr);
    // console.log('personalInfoReq', personalInfoReq);
    // console.log('educationArr', educationArr);
    // console.log('biographyArr', biographyArr);
    // console.log('contactArr', contactArr);
    // console.log('disQualificationArr', disQualificationArr);
    // console.log('miscellaneousPutReq', miscellaneousPutReq);
    // console.log('identifiersPutArr', identifiersPutArr);


    if (namesArr.length === 0 && addressArr.length === 0 && !isPersonalInfoModified &&
        educationArr.length === 0 && biographyArr.length === 0 && contactArr.length === 0 &&
        disQualificationArr.length === 0 && !isMisRequired && identifiersPutArr.length === 0) {
        utils.showNotification({
            title: 'No Changes',
            description: 'No updates were made to the contact. Save action not required.',
            duration: 5000,
            notificationType: 'warning'

        });
    } else {
        loadingPopUp.show();
        PUTContactMasteringRecord.trigger();

        //AUDIT TRAIL List Creation
        // console.log("Audit Trail Item: ", audit_trail_items)
        var audit_trail = {}
        audit_trail.entity_id = CurrentSelectedContact.value.entityID
        audit_trail.orbis_id = ""
        audit_trail.bvd_id = ""
        audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
        audit_trail.items = audit_trail_items
        audit_trail.ticket_id = urlparams.ticket
        audit_trail.object_type = "uci"
        audit_trail.source = "REMEDIATED"


        AuditTrailList.setValue(audit_trail)
        //  updateLinkedAttributes.trigger()
        //  createAuditTrail.trigger()
    }
}
