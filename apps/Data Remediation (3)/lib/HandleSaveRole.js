
console.log("Current Role Selection: ", CurrentSelectedRole.value);
var originalRoleObj = CurrentSelectedRole.value.function;
console.log("Current Selected Role: ", originalRoleObj);
var epochDate = moment(new Date('1970-01-01'));
// Initialize roleEdited as false
var roleEdited = false;


//ADUIT TRAIL
var prev_value = originalRoleObj.item
var field_path = "functions/item"
var audit_trail_items = []
var remediation_action = "OVERWRITE"
var item_hash = CurrentSelectedRole.value.function.remediatedItemHash ? originalRoleObj.remediatedItemHash : originalRoleObj.itemObjectHash

console.log("Role Prev Value: ", prev_value);

if (suppressRoleFlag.value || roleActiveFlag.value) {

    var rolePutReq = {
        entityId: CurrentSelectedRole.value.entityId,
        recordStatus: suppressRoleFlag.value ? 'SUPPRESSED' : 'ACTIVE'
    }

    audit_trail_items.push({
        "field_path": "header/state",
        "new_value": rolePutReq,
        "prev_value": CurrentSelectedRole.value.state,
        "remediation_action": "OVERWRITE",
        "item_hash": ""
    })

    FunctionPutReq.setValue(rolePutReq);
    loadingPopUp.show();
    PUTFunctionMastering.trigger();

    //AUDIT TRAIL List Creation
    console.log("Audit Trail Item: ", audit_trail_items)
    var audit_trail = {}
    audit_trail.entity_id = CurrentSelectedContact.value.entityID
    audit_trail.orbis_id = CurrentSelectedRole.value.function.item.misc.orbisID
    audit_trail.bvd_id = CurrentSelectedRole.value.function.item.misc.idCompany

    audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
    audit_trail.items = audit_trail_items
    audit_trail.ticket_id = urlparams.ticket
    audit_trail.object_type = "uci/role"
    audit_trail.source = "REMEDIATED"


    AuditTrailList.setValue(audit_trail)

    return;
}
console.log(CurrentSelectedRole.value);
var originalRoleObj = CurrentSelectedRole.value.function;
var epochDate = moment.utc(new Date('1970-01-01'));
// Initialize roleEdited as false
var roleEdited = false;

// Check and update each property in originalRoleObj.item

// nominationDate

var nominationEdited = false;
var nominationDate = '';
var rawNominationDate = '';
var curPrecision = 0;
var modifiedDate = '';
var originalDate = originalRoleObj.item.nominationDate && originalRoleObj.item.nominationDate.date ? moment(originalRoleObj.item.nominationDate.date) : '';
console.log(curPrecision);
console.log(nominationYear.value);
console.log(nominationMonth.value);
console.log(nominationDay.value);

if (nominationYear.value) {
    nominationDate = nominationYear.value + '-01-01';
    rawNominationDate = nominationYear.value + '0000';
    curPrecision = 9;
    if (nominationMonth.value && nominationMonth.value !== '00') {
        nominationDate = nominationYear.value + '-' + nominationMonth.value + '-01';
        rawNominationDate = nominationYear.value + nominationMonth.value + '00';
        curPrecision = 10;
        if (nominationDay.value && nominationDay.value !== '00') {
            nominationDate = nominationYear.value + '-' + nominationMonth.value + '-' + nominationDay.value;
            rawNominationDate = nominationYear.value + nominationMonth.value + nominationDay.value;
            curPrecision = 11;
        }
    }
}

console.log('nominationDate', nominationDate);

//AUDIT TRAIL
var nominationAuditFlag = false
var temp_prev_value1 = prev_value.nominationDate
var temp_prev_value2 = prev_value.misc.rawBeginningNominationDate

if (nominationDate !== '') {
    var modifiedDate = moment.utc(nominationDate);
    console.log(modifiedDate);
    originalRoleObj.item.nominationDate = {
        date: modifiedDate.diff(epochDate, 'days'),
        precision: curPrecision
    }
    originalRoleObj.item.misc.rawBeginningNominationDate = rawNominationDate;
    if (originalDate && modifiedDate) {
        if (!modifiedDate.isSame(originalDate, 'day')) {
            roleEdited = true;
            console.log('nomination date edited 1')

            //AUDIT TRAIL
            nominationAuditFlag = true
        }
    } else {
        roleEdited = true;
        console.log('nomination date edited 2')

        //AUDIT TRAIL
        nominationAuditFlag = true
    }

} else {
    if (originalRoleObj.item.nominationDate && originalRoleObj.item.nominationDate.date !== modifiedDate) {
        roleEdited = true;
        console.log('nomination date edited 3')

        //AUDIT TRAIL
        nominationAuditFlag = true
    }

    originalRoleObj.item.nominationDate = null;
    originalRoleObj.item.misc.rawBeginningNominationDate = '';
}

//AUDIT TRAIL
if (nominationAuditFlag == true) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/nominationDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.nominationDate,
        "prev_value": temp_prev_value1
    })

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/rawBeginningNominationDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.rawBeginningNominationDate,
        "prev_value": temp_prev_value2
    })
}

console.log('nominationDate', originalRoleObj.item.nominationDate);
console.log('misc nominationDate', originalRoleObj.item.misc.rawBeginningNominationDate)



// nominationEndDate

var nominationEndEdited = false;
var nominationEndDate = '';
var rawNominationEndDate = '';
var curPrecision = 0;
var originalPrecision = originalRoleObj.item.nominationEndDate && originalRoleObj.item.nominationEndDate.precision ? originalRoleObj.item.nominationEndDate.precision : 0;
var modifiedEndDate = '';
var originalEndDate = originalRoleObj.item.nominationEndDate && originalRoleObj.item.nominationEndDate.date ? moment(originalRoleObj.item.nominationEndDate.date) : '';
console.log(curPrecision);
console.log(nominationEndYear.value);
console.log(nominationEndMonth.value);
console.log(nominationEndDay.value);

if (originalPrecision) {

    var oYear = new Date(originalEndDate).getFullYear();
    var oMonth = (new Date(originalEndDate).getUTCMonth() + 1).toString().padStart(2, '0');
    var oDay = new Date(originalEndDate).getUTCDate().toString().padStart(2, '0');
    switch (originalPrecision) {
        case 9:
            originalEndDate = oYear + '-01-01';
            break;
        case 10:
            originalEndDate = oYear + '-' + oMonth + '-01';
            break;
        case 11:
            originalEndDate = oYear + '-' + oMonth + '-' + oDay;
            break;
        default: break;
    }
}

if (nominationEndYear.value) {
    nominationEndDate = nominationEndYear.value + '-01-01';
    rawNominationEndDate = nominationEndYear.value + '0000';
    curPrecision = 9;
    if (nominationEndMonth.value && nominationEndMonth.value !== '00') {
        nominationEndDate = nominationEndYear.value + '-' + nominationEndMonth.value + '-01';
        rawNominationEndDate = nominationEndYear.value + nominationEndMonth.value + '00';
        curPrecision = 10;
        if (nominationEndDay.value && (nominationEndDay.value !== '00' || nominationEndDay.value !== '')) {
            nominationEndDate = nominationEndYear.value + '-' + nominationEndMonth.value + '-' + nominationEndDay.value;
            rawNominationEndDate = nominationEndYear.value + nominationEndMonth.value + nominationEndDay.value;
            curPrecision = 11;
        }
    }
}

console.log('originalEndDate', originalEndDate)
console.log('nominationEndDate', nominationEndDate);

//AUDIT TRAIL
nominationAuditFlag = false
var temp_prev_value1 = prev_value.nominationEndDate
var temp_prev_value2 = prev_value.misc.rawEndExpirationDate

if (nominationEndDate !== '') {
    modifiedEndDate = moment.utc(nominationEndDate);
    console.log(modifiedEndDate);
    originalRoleObj.item.nominationEndDate = {
        date: modifiedEndDate.diff(epochDate, 'days'),
        precision: curPrecision
    }
    originalRoleObj.item.misc.rawEndExpirationDate = rawNominationEndDate;
    if (modifiedEndDate && originalEndDate) {
        console.log()
        if (!modifiedEndDate.isSame(originalEndDate, 'day')) {
            roleEdited = true;
            console.log()
            console.log('nomination end date edited 1')

            //AUDIT TRAIL
            nominationAuditFlag = true
        }
    } else {
        roleEdited = true;
        console.log('nomination end date edited 2')

        //AUDIT TRAIL
        nominationAuditFlag = true
    }

} else {
    if (originalRoleObj.item.nominationEndDate && originalRoleObj.item.nominationEndDate.date !== modifiedEndDate) {
        roleEdited = true;
        console.log('nomination end date edited 3')

        //AUDIT TRAIL
        nominationAuditFlag = true
    }

    originalRoleObj.item.nominationEndDate = null;
    originalRoleObj.item.misc.rawEndExpirationDate = '';
}

//AUDIT TRAIL
if (nominationAuditFlag == true) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/nominationEndDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.nominationEndDate,
        "prev_value": temp_prev_value1
    })

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/rawEndExpirationDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.rawEndExpirationDate,
        "prev_value": temp_prev_value2
    })

}

console.log('nominationEndDate', originalRoleObj.item.nominationEndDate);
console.log('misc nominationEndDate', originalRoleObj.item.misc.rawEndExpirationDate)



// roleStatus & // historizationStatus
if (((originalRoleObj.item.historizationStatus === 3 || originalRoleObj.item.historizationStatus === 4 || originalRoleObj.item.historizationStatus === 5) && originalRoleObj.item.currentPrevious !== roleStatus.value)
    || (originalRoleObj.item.historizationStatus !== 3 && originalRoleObj.item.historizationStatus !== 4 && originalRoleObj.item.historizationStatus !== 5 && originalRoleObj.item.historizationStatus !== roleStatus.value)) {

    var temp_prev_value = prev_value.historizationStatus

    // 1 & 2 - only historizationStatus needs to be changed
    //3 - only currentPrevious needs to be updated - no change to historizationStatus
    //4 - only currentPrevious needs to be updated - no change to historizationStatus
    //5 - change both currentPrevious & historizationStatus

    roleEdited = true;
    console.log('status edited');
    if (originalRoleObj.item.historizationStatus === 3
        || originalRoleObj.item.historizationStatus === 4
        || originalRoleObj.item.historizationStatus === 5) {
        originalRoleObj.item.currentPrevious = roleStatus.value;

        // ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/currentPrevious",
            "item_hash": item_hash,
            "new_value": roleStatus.value,
            "prev_value": prev_value.currentPrevious
        })
    }
    // 1 & 2 - only historizationStatus needs to be changed
    //5 - change both currentPrevious & historizationStatus
    if (originalRoleObj.item.historizationStatus === 1
        || originalRoleObj.item.historizationStatus === 2
        || originalRoleObj.item.historizationStatus === 5) {
        originalRoleObj.item.historizationStatus = roleStatus.value;
        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/historizationStatus",
            "item_hash": item_hash,
            "new_value": roleStatus.value,
            "prev_value": temp_prev_value
        })
    }

    //originalRoleObj.item.misc.status = roleStatus.value;



    //ADUIT TRAIL
    // audit_trail_items.push({"remediation_action" : remediation_action,
    //     "field_path" : field_path + "/misc/status",
    //     "item_hash" : item_hash,
    //     "new_value": roleStatus.value,
    //     "prev_value" : prev_value.misc.status})
}

// passToPreviousDate
// if (originalRoleObj.item.passToPreviousDate !== passToPreviousDate.value) {
//   roleEdited = true;
//   originalRoleObj.item.passToPreviousDate = passToPreviousDate.value;
// }

// permissions
if (originalRoleObj.item.permissions.executivePower !== executivePower.value) {

    var temp_prev_value = prev_value.permissions.executivePower

    roleEdited = true;
    console.log('executivePower edited')
    originalRoleObj.item.permissions.executivePower = executivePower.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/permissions/executivePower",
        "item_hash": item_hash,
        "new_value": executivePower.value,
        "prev_value": temp_prev_value
    })
}
if (originalRoleObj.item.permissions.signatoryRight !== signatoryRight.value) {

    var temp_prev_value = prev_value.permissions.signatoryRight

    roleEdited = true;
    console.log('signatoryRight edited')
    originalRoleObj.item.permissions.signatoryRight = signatoryRight.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/permissions/signatoryRight",
        "item_hash": item_hash,
        "new_value": signatoryRight.value,
        "prev_value": temp_prev_value
    })
}
if (originalRoleObj.item.permissions.attorneyPower !== attorneyPower.value) {

    var temp_prev_value = prev_value.permissions.attorneyPower

    roleEdited = true;
    console.log('attorneyPower edited')
    originalRoleObj.item.permissions.attorneyPower = attorneyPower.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/permissions/attorneyPower",
        "item_hash": item_hash,
        "new_value": attorneyPower.value,
        "prev_value": temp_prev_value
    })
}
if (originalRoleObj.item.permissions.shareholder !== shareholder.value) {

    var temp_prev_value = prev_value.permissions.shareholder

    roleEdited = true;
    console.log('shareholder edited')
    originalRoleObj.item.permissions.shareholder = shareholder.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/permissions/shareholder",
        "item_hash": item_hash,
        "new_value": shareholder.value,
        "prev_value": temp_prev_value
    })
}

// exemption
originalRoleObj.item.exemption = originalRoleObj.item.exemption ? originalRoleObj.item.exemption : {};
if ((originalRoleObj.item.exemption && originalRoleObj.item.exemption.fromDate && originalRoleObj.item.exemption.fromDate !== exemptionFromDate.value) || (!originalRoleObj.item.exemption.fromDate && exemptionFromDate.value !== '')) {

    var temp_prev_value1 = prev_value.exemption.fromDate
    var temp_prev_value2 = prev_value.misc.rawExemptionFromDate

    roleEdited = true;
    console.log('exemptionFromDate edited')
    originalRoleObj.item.exemption.fromDate = moment.utc(exemptionFromDate.value).diff(epochDate, 'days');
    originalRoleObj.item.misc.rawExemptionFromDate = exemptionFromDate.value !== '' ? moment(exemptionFromDate.value).format('YYYYMMDD') : '';

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/exemption/fromDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.exemption.fromDate,
        "prev_value": temp_prev_value1
    })

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/rawExemptionFromDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.rawExemptionFromDate,
        "prev_value": temp_prev_value2
    })

} else if (originalRoleObj.item.exemption.fromDate) {

    originalRoleObj.item.exemption.fromDate = moment.utc(originalRoleObj.item.exemption.fromDate).diff(epochDate, 'days');
}

if ((originalRoleObj.item.exemption && originalRoleObj.item.exemption.toDate && originalRoleObj.item.exemption.toDate !== exemptionToDate.value) || (!originalRoleObj.item.exemption.toDate && exemptionToDate.value !== '')) {

    var temp_prev_value1 = prev_value.exemption.toDate
    var temp_prev_value2 = prev_value.misc.rawExemptionToDate

    roleEdited = true;
    console.log('exemptionToDate edited')
    originalRoleObj.item.exemption.toDate = moment.utc(exemptionToDate.value).diff(epochDate, 'days');
    originalRoleObj.item.misc.rawExemptionToDate = exemptionToDate.value !== '' ? moment(exemptionToDate.value).format('YYYYMMDD') : '';

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/exemption/toDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.exemption.toDate,
        "prev_value": temp_prev_value1
    })

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/rawExemptionToDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.rawExemptionToDate,
        "prev_value": temp_prev_value2
    })


} else if (originalRoleObj.item.exemption.toDate) {
    originalRoleObj.item.exemption.toDate = moment.utc(originalRoleObj.item.exemption.toDate).diff(epochDate, 'days');
}

// relatedToAccounts
// if (originalRoleObj.item.relatedToAccounts !== relatedToAccounts.value) {
//   roleEdited = true;
//   originalRoleObj.item.relatedToAccounts = relatedToAccounts.value;
// }

// compensation
// if (originalRoleObj.item.compensation.unit !== unit.value) {
//   roleEdited = true;
//   originalRoleObj.item.compensation.unit = unit.value;

// }
// currency
originalRoleObj.item.compensation = originalRoleObj.item.compensation ? originalRoleObj.item.compensation : {};
if ((originalRoleObj.item.compensation && originalRoleObj.item.compensation.currency && originalRoleObj.item.compensation.currency !== currency.value) ||
    (!originalRoleObj.item.compensation.currency && currency.value)) {
    roleEdited = true;
    console.log('currency edited');
    originalRoleObj.item.compensation.currency = currency.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/currency",
        "item_hash": item_hash,
        "new_value": currency.value,
        "prev_value": prev_value.compensation.currency
    })
}

console.log("Role Prev Value: ", prev_value);

// salary
if ((originalRoleObj.item.compensation && originalRoleObj.item.compensation.salary !== null
    && originalRoleObj.item.compensation.salary !== undefined && originalRoleObj.item.compensation.salary !== salary.value) ||
    ((originalRoleObj.item.compensation.salary === null || originalRoleObj.item.compensation.salary === undefined) && salary.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/salary",
        "item_hash": item_hash,
        "new_value": salary.value,
        "prev_value": prev_value.compensation.salary
    })


    roleEdited = true;
    console.log('salary edited');
    originalRoleObj.item.compensation.salary = salary.value;
}

// bonus
if ((originalRoleObj.item.compensation.bonus !== null && originalRoleObj.item.compensation.bonus !== undefined && originalRoleObj.item.compensation.bonus !== bonus.value) ||
    ((originalRoleObj.item.compensation.bonus === null || originalRoleObj.item.compensation.bonus === undefined) && bonus.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/bonus",
        "item_hash": item_hash,
        "new_value": bonus.value,
        "prev_value": prev_value.compensation.bonus
    })

    roleEdited = true;
    console.log('bonus edited');
    originalRoleObj.item.compensation.bonus = bonus.value;


}

// otherShortTerm
if ((originalRoleObj.item.compensation.otherShortTerm !== null && originalRoleObj.item.compensation.otherShortTerm !== undefined && originalRoleObj.item.compensation.otherShortTerm !== otherShortTerm.value) ||
    ((originalRoleObj.item.compensation.otherShortTerm === null || originalRoleObj.item.compensation.otherShortTerm === undefined) && otherShortTerm.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/otherShortTerm",
        "item_hash": item_hash,
        "new_value": otherShortTerm.value,
        "prev_value": prev_value.compensation.otherShortTerm
    })

    roleEdited = true;
    console.log('otherShortTerm edited');
    originalRoleObj.item.compensation.otherShortTerm = otherShortTerm.value;
}

// totalShortTerm
if ((originalRoleObj.item.compensation.totalShortTerm !== null && originalRoleObj.item.compensation.totalShortTerm !== undefined && originalRoleObj.item.compensation.totalShortTerm !== totalShortTerm.value) ||
    ((originalRoleObj.item.compensation.totalShortTerm === null || originalRoleObj.item.compensation.totalShortTerm === undefined) && totalShortTerm.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/totalShortTerm",
        "item_hash": item_hash,
        "new_value": totalShortTerm.value,
        "prev_value": prev_value.compensation.totalShortTerm
    })

    roleEdited = true;
    console.log('totalShortTerm edited');
    originalRoleObj.item.compensation.totalShortTerm = totalShortTerm.value;


}

// longTermIncentivePayout
if ((originalRoleObj.item.compensation.longTermIncentivePayout !== null && originalRoleObj.item.compensation.longTermIncentivePayout !== undefined && originalRoleObj.item.compensation.longTermIncentivePayout !== longTermIncentivePayout.value) ||
    ((originalRoleObj.item.compensation.longTermIncentivePayout === null || originalRoleObj.item.compensation.longTermIncentivePayout === undefined) && longTermIncentivePayout.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/longTermIncentivePayout",
        "item_hash": item_hash,
        "new_value": longTermIncentivePayout.value,
        "prev_value": prev_value.compensation.longTermIncentivePayout
    })

    roleEdited = true;
    console.log('longTermIncentivePayout edited');
    originalRoleObj.item.compensation.longTermIncentivePayout = longTermIncentivePayout.value;


}

// otherLongTerm
if ((originalRoleObj.item.compensation.otherLongTerm !== null && originalRoleObj.item.compensation.otherLongTerm !== undefined && originalRoleObj.item.compensation.otherLongTerm !== otherLongTerm.value) ||
    ((originalRoleObj.item.compensation.otherLongTerm === null || originalRoleObj.item.compensation.otherLongTerm === undefined) && otherLongTerm.value !== null)) {

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/otherLongTerm",
        "item_hash": item_hash,
        "new_value": otherLongTerm.value,
        "prev_value": prev_value.compensation.otherLongTerm
    })

    roleEdited = true;
    console.log('otherLongTerm edited');
    originalRoleObj.item.compensation.otherLongTerm = otherLongTerm.value;


}

// total
if ((originalRoleObj.item.compensation.total !== null && originalRoleObj.item.compensation.total !== undefined && originalRoleObj.item.compensation.total !== total.value) ||
    ((originalRoleObj.item.compensation.total === null || originalRoleObj.item.compensation.total === undefined) && total.value !== null)) {



    roleEdited = true;
    console.log('total edited');
    originalRoleObj.item.compensation.total = total.value;


}

// compensationDate
if ((originalRoleObj.item.compensation.date && originalRoleObj.item.compensation.date !== compensationDate.value) ||
    (!originalRoleObj.item.compensation.date && compensationDate.value !== '')) {

    console.log('compensation date edited')

    var temp_prev_1 = prev_value.compensation.date
    var temp_prev_2 = prev_value.misc.rawCompensationDate

    roleEdited = true;
    console.log('compensationDate edited');
    originalRoleObj.item.compensation.date = compensationDate.value !== '' ? moment.utc(compensationDate.value).diff(epochDate, 'days') : null;
    originalRoleObj.item.misc.rawCompensationDate = compensationDate.value !== '' ? moment(compensationDate.value).format('YYYYMMDD') : null;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/compensation/date",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.compensation.date,
        "prev_value": temp_prev_1
    })

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/rawCompensationDate",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.rawCompensationDate,
        "prev_value": temp_prev_2
    })

} else if (originalRoleObj.item.compensation.date) {

    originalRoleObj.item.compensation.date = moment.utc(originalRoleObj.item.compensation.date).diff(epochDate, 'days');

}

//exercisedNumber

console.log('compensation excercise')
console.log(originalRoleObj.item.compensation.options);
originalRoleObj.item.compensation.options = originalRoleObj.item.compensation.options ? originalRoleObj.item.compensation.options : {};

console.log(originalRoleObj.item.compensation.options);
console.log(originalRoleObj.item.compensation.options.exercised);
console.log(originalRoleObj.item.compensation.options.unexercisedExercisable);
console.log(originalRoleObj.item.compensation.options.unexercisedUnexercisable);

if (originalRoleObj.item.compensation.options.exercised) {
    if (originalRoleObj.item.compensation.options.exercised.number !== exercisedNumber.value) {

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/exercised/number",
            "item_hash": item_hash,
            "new_value": exercisedNumber.value,
            "prev_value": prev_value.compensation.options.exercised.number
        })

        originalRoleObj.item.compensation.options.exercised.number = exercisedNumber.value;
        roleEdited = true;
        console.log('exercised num edited')


    }

    if (originalRoleObj.item.compensation.options.exercised.value !== exercisedValue.value) {

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/exercised/value",
            "item_hash": item_hash,
            "new_value": exercisedValue.value,
            "prev_value": prev_value.compensation.options.exercised.value
        })

        originalRoleObj.item.compensation.options.exercised.value = exercisedValue.value;
        roleEdited = true;
        console.log('exercised n edited')


    }
} else {
    if (exercisedNumber.value !== null || exercisedValue.value !== null) {

        var temp_prev_value1
        var temp_prev_value2
        if (prev_value.compensation.options.exercised == null) {
            temp_prev_value1 = null
            temp_prev_value2 = null
        } else {
            temp_prev_value1 = prev_value.compensation.options.exercised.number
            temp_prev_value2 = prev_value.compensation.options.exercised.value
        }


        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/exercised/number",
            "item_hash": item_hash,
            "new_value": exercisedNumber.value,
            "prev_value": temp_prev_value1
        })

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/exercised/value",
            "item_hash": item_hash,
            "new_value": exercisedValue.value,
            "prev_value": temp_prev_value2
        })

        roleEdited = true;
        console.log('exercised nv edited')
        originalRoleObj.item.compensation.options.exercised = {
            number: exercisedNumber.value,
            value: exercisedValue.value
        }


    }
}

if (originalRoleObj.item.compensation.options.unexercisedExercisable) {
    if (originalRoleObj.item.compensation.options.unexercisedExercisable.number !== unExercisedNumber.value) {

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedExercisable/number",
            "item_hash": item_hash,
            "new_value": unExercisedNumber.value,
            "prev_value": prev_value.compensation.options.unexercisedExercisable.number
        })

        originalRoleObj.item.compensation.options.unexercisedExercisable.number = unExercisedNumber.value;
        roleEdited = true;
        console.log('unexercisedExercisable n edited')


    }

    if (originalRoleObj.item.compensation.options.unexercisedExercisable.value !== unExercisedValue.value) {

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedExercisable/value",
            "item_hash": item_hash,
            "new_value": unExercisedValue.value,
            "prev_value": prev_value.compensation.options.unexercisedExercisable.value
        })

        originalRoleObj.item.compensation.options.unexercisedExercisable.value = unExercisedValue.value;
        roleEdited = true;
        console.log('unexercisedExercisable v edited')
    }
} else {
    if (unExercisedNumber.value !== null || unExercisedValue.value !== null) {
        var temp_prev_value2
        if (prev_value.compensation.options.unexercisedExercisable == null) {
            temp_prev_value1 = null
            temp_prev_value2 = null
        } else {
            temp_prev_value1 = prev_value.compensation.options.unexercisedExercisable.number
            temp_prev_value2 = prev_value.compensation.options.unexercisedExercisable.value
        }

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedExercisable/number",
            "item_hash": item_hash,
            "new_value": unExercisedNumber.value,
            "prev_value": temp_prev_value1
        })

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedExercisable/value",
            "item_hash": item_hash,
            "new_value": unExercisedValue.value,
            "prev_value": temp_prev_value2
        })

        roleEdited = true;
        console.log('unexercisedExercisable nv edited')
        originalRoleObj.item.compensation.options.unexercisedExercisable = {
            number: unExercisedNumber.value,
            value: unExercisedValue.value
        }


    }
}

if (originalRoleObj.item.compensation.options.unexercisedUnexercisable) {
    if (originalRoleObj.item.compensation.options.unexercisedUnexercisable.number !== unExercisedUnexNumber.value) {

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedUnexercisable/number",
            "item_hash": item_hash,
            "new_value": unExercisedUnexNumber.value,
            "prev_value": prev_value.compensation.options.unexercisedUnexercisable.number
        })

        originalRoleObj.item.compensation.options.unexercisedUnexercisable.number = unExercisedUnexNumber.value;
        roleEdited = true;
        console.log('unexercisedUnexercisable n edited')


    }

    if (originalRoleObj.item.compensation.options.unexercisedUnexercisable.value !== unExercisedUnexValue.value) {
        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedUnexercisable/value",
            "item_hash": item_hash,
            "new_value": unExercisedUnexValue.value,
            "prev_value": prev_value.compensation.options.unexercisedUnexercisable.value
        })

        originalRoleObj.item.compensation.options.unexercisedUnexercisable.value = unExercisedUnexValue.value;
        roleEdited = true;
        console.log('unexercisedUnexercisable v edited')


    }
} else {
    if (unExercisedUnexNumber.value !== null || unExercisedUnexValue.value !== null) {

        var temp_prev_value1
        var temp_prev_value2
        if (prev_value.compensation.options.unexercisedUnexercisable == null) {
            temp_prev_value1 = null
            temp_prev_value2 = null
        } else {
            temp_prev_value1 = prev_value.compensation.options.unexercisedUnexercisable.number
            temp_prev_value2 = prev_value.compensation.options.unexercisedUnexercisable.value
        }

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedUnexercisable/number",
            "item_hash": item_hash,
            "new_value": unExercisedUnexNumber.value,
            "prev_value": temp_prev_value1
        })


        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/compensation/options/unexercisedUnexercisable/value",
            "item_hash": item_hash,
            "new_value": unExercisedUnexValue.value,
            "prev_value": temp_prev_value2
        })

        roleEdited = true;
        console.log('unexercisedUnexercisable nv edited')
        originalRoleObj.item.compensation.options.unexercisedUnexercisable = {
            number: unExercisedUnexNumber.value,
            value: unExercisedUnexValue.value
        }


    }
}



// if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.exercised)
//     || ((exercisedNumber.value !== 0)) || (exercisedValue.value !== 0)) {
//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.exercised && originalRoleObj.item.compensation.options.exercised.number
//         && originalRoleObj.item.compensation.options.exercised.number !== exercisedNumber.value) || (exercisedNumber.value !== 0)) {
//         roleEdited = true;
//         console.log('exercised n edited')
//         originalRoleObj.item.compensation.options.exercised = {
//             ...originalRoleObj.item.compensation.options.exercised,
//             number: exercisedNumber.value
//         };
//     }

//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.exercised && originalRoleObj.item.compensation.options.exercised.value
//         && originalRoleObj.item.compensation.options.exercised.value !== exercisedValue.value)
//         || (exercisedValue.value !== 0)) {
//         originalRoleObj.item.compensation.options.exercised = {
//             ...originalRoleObj.item.compensation.options.exercised,
//             value: exercisedValue.value
//         };
//         roleEdited = true;
//         console.log('exercised v edited')
//     }
// }

// if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedExercisable)
//     || unExercisedNumber.value !== 0 || unExercisedValue.value !== 0) {
//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedExercisable && originalRoleObj.item.compensation.options.unexercisedExercisable.number
//         && originalRoleObj.item.compensation.options.unexercisedExercisable.number !== unExercisedNumber.value)
//         || (unExercisedNumber.value !== 0)) {
//         originalRoleObj.item.compensation.options.unexercisedExercisable = {
//             ...originalRoleObj.item.compensation.options.unexercisedExercisable,
//             number: unExercisedNumber.value
//         };
//         roleEdited = true;
//         console.log('unExercisedNumber n edited')
//     }

//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedExercisable
//         && originalRoleObj.item.compensation.options.unexercisedExercisable.value &&
//         originalRoleObj.item.compensation.options.unexercisedExercisable.value !== unExercisedValue.value)
//         || (unExercisedValue.value !== 0)) {
//         originalRoleObj.item.compensation.options.unexercisedExercisable = {
//             ...originalRoleObj.item.compensation.options.unexercisedExercisable,
//             value: unExercisedValue.value
//         };
//         roleEdited = true;
//         console.log('unExercisedNumber v edited')
//     }
// }

// if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedUnexercisable)
//     || unExercisedUnexNumber.value !== 0 || unExercisedUnexValue.value !== 0) {
//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedUnexercisable
//         && originalRoleObj.item.compensation.options.unexercisedUnexercisable.number
//         && originalRoleObj.item.compensation.options.unexercisedUnexercisable.number !== unExercisedUnexNumber.value)
//         || (unExercisedUnexNumber.value !== 0)) {
//         originalRoleObj.item.compensation.options.unexercisedUnexercisable = {
//             ...originalRoleObj.item.compensation.options.unexercisedUnexercisable,
//             number: unExercisedUnexNumber.value
//         };
//         roleEdited = true;
//         console.log('unExercisedUnexNumber n edited')
//     }

//     if ((originalRoleObj.item.compensation.options && originalRoleObj.item.compensation.options.unexercisedUnexercisable
//         && originalRoleObj.item.compensation.options.unexercisedUnexercisable.value &&
//         originalRoleObj.item.compensation.options.unexercisedUnexercisable.value !== unExercisedUnexValue.value)
//         || (unExercisedUnexValue.value !== 0)) {
//         originalRoleObj.item.compensation.options.unexercisedUnexercisable = {
//             ...originalRoleObj.item.compensation.options.unexercisedUnexercisable,
//             value: unExercisedUnexValue.value
//         };
//         roleEdited = true;
//         console.log('unExercisedUnexNumber v edited')
//     }
// }


// commentOriginalLanguage
// if (originalRoleObj.item.commentOriginalLanguage !== commentOriginalLanguage.value) {
//   roleEdited = true;
//   originalRoleObj.item.commentOriginalLanguage = commentOriginalLanguage.value;
// }

// comment
// if (originalRoleObj.item.comment !== comment.value) {
//   roleEdited = true;
//   originalRoleObj.item.comment = comment.value;
// }

// representingCompanies
// if (originalRoleObj.item.representingCompanies.toString() !== representingCompanies.value.toString()) {
//   roleEdited = true;
//   originalRoleObj.item.representingCompanies = representingCompanies.value;
// }

// misc (nested fields)


// if (originalRoleObj.item.misc.functionCodes2.toString() !== functionCodes2.value.toString()) {
//   roleEdited = true;
//   originalRoleObj.item.misc.functionCodes2 = functionCodes2.value;
// }

// if (originalRoleObj.item.misc.functionOriginals !== functionOriginals.value) {
//   roleEdited = true;
//   originalRoleObj.item.misc.functionOriginals = functionOriginals.value;
// }

// if (originalRoleObj.item.misc.membershipSourceLastAvailableYears !== membershipSourceLastAvailableYears.value) {
//   roleEdited = true;
//   originalRoleObj.item.misc.membershipSourceLastAvailableYears = membershipSourceLastAvailableYears.value;
// }
// if (originalRoleObj.item.misc.membershipSourceHistoricalRecord !== membershipSourceHistoricalRecord.value) {
//   roleEdited = true;
//   originalRoleObj.item.misc.membershipSourceHistoricalRecord = membershipSourceHistoricalRecord.value;
// }

// workAddress (nested inside misc)
originalRoleObj.item.misc.workAddress = originalRoleObj.item.misc.workAddress ? originalRoleObj.item.misc.workAddress : {};
if ((originalRoleObj.item.misc.workAddress.addressLines && originalRoleObj.item.misc.workAddress.addressLines.join('; ').toString() !== roleAddressLine.value.toString())
    || (!originalRoleObj.item.misc.workAddress.addressLines && roleAddressLine.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.addressLines

    roleEdited = true;
    console.log('addressLines edited')
    originalRoleObj.item.misc.workAddress.addressLines = roleAddressLine.value.split('; ');

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/addressLines",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.addressLines,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.postCode && originalRoleObj.item.misc.workAddress.postCode !== rolePostCode.value)
    || (!originalRoleObj.item.misc.workAddress.postCode && rolePostCode.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.postCode

    roleEdited = true;
    console.log('postCode edited')
    originalRoleObj.item.misc.workAddress.postCode = rolePostCode.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/postCode",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.postCode,
        "prev_value": temp_prev_value
    })
}

if ((originalRoleObj.item.misc.workAddress.city && originalRoleObj.item.misc.workAddress.city !== roleCity.value)
    || (!originalRoleObj.item.misc.workAddress.city && roleCity.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.city

    console.log(originalRoleObj.item.misc.workAddress.city);
    console.log(roleCity.value);
    roleEdited = true;
    console.log('city edited')
    originalRoleObj.item.misc.workAddress.city = roleCity.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/city",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.city,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.provinceOrState && originalRoleObj.item.misc.workAddress.provinceOrState !== roleState.value)
    || (!originalRoleObj.item.misc.workAddress.provinceOrState && roleState.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.provinceOrState

    roleEdited = true;
    console.log('state edited')
    //  originalRoleObj.item.misc.workAddress.state = roleState.value;
    originalRoleObj.item.misc.workAddress.provinceOrState = roleState.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/provinceOrState",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.provinceOrState,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.countryISO2 && originalRoleObj.item.misc.workAddress.countryISO2 !== roleCountry.value)
    || (!originalRoleObj.item.misc.workAddress.countryISO2 && roleCountry.value)) {

    var temp_prev_value = prev_value.misc.workAddress.countryISO2

    roleEdited = true;
    console.log('countryISO2 edited')
    originalRoleObj.item.misc.workAddress.countryISO2 = roleCountry.value ? roleCountry.value.toUpperCase() : roleCountry.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/countryISO2",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.countryISO2,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.phone && originalRoleObj.item.misc.workAddress.phone !== rolePhone.value)
    || (!originalRoleObj.item.misc.workAddress.phone && rolePhone.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.phone

    roleEdited = true;
    console.log('phone edited')
    originalRoleObj.item.misc.workAddress.phone = rolePhone.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/phone",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.phone,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.fax && originalRoleObj.item.misc.workAddress.fax !== roleFax.value)
    || (!originalRoleObj.item.misc.workAddress.fax && roleFax.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.fax

    roleEdited = true;
    console.log('fax edited')
    originalRoleObj.item.misc.workAddress.fax = roleFax.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/fax",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.fax,
        "prev_value": temp_prev_value
    })
}
if ((originalRoleObj.item.misc.workAddress.email && originalRoleObj.item.misc.workAddress.email !== roleEmail.value)
    || (!originalRoleObj.item.misc.workAddress.email && roleEmail.value !== '')) {

    var temp_prev_value = prev_value.misc.workAddress.email

    roleEdited = true;
    console.log('email edited')
    originalRoleObj.item.misc.workAddress.email = roleEmail.value;

    //ADUIT TRAIL
    audit_trail_items.push({
        "remediation_action": remediation_action,
        "field_path": field_path + "/misc/workAddress/email",
        "item_hash": item_hash,
        "new_value": originalRoleObj.item.misc.workAddress.email,
        "prev_value": temp_prev_value
    })
}

// Biogrpahy Edit

const originalBiographyList = originalRoleObj.item.biographies ? originalRoleObj.item.biographies : [];

console.log('originalBiographyList');
console.log(originalBiographyList);
console.log(eachRoleBiography);
originalBiographyList.forEach((eachB, i) => {

    if (eachB !== RoleBiographyListValues.value[i]) {
        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": field_path + "/biographies",
            "item_hash": item_hash,
            "new_value": RoleBiographyListValues.value[i],
            "prev_value": eachB
        })

        console.log('Biogrpahies Edited')
        console.log('original Bio', eachB);
        console.log('edited bio', RoleBiographyListValues.value[i])
        originalBiographyList[i] = RoleBiographyListValues.value[i];
        roleEdited = true;
    }
});
console.log('Biogrpahies Edited')
console.log(originalBiographyList);

originalRoleObj.item.biographies = originalBiographyList;
console.log("Role Edited:", roleEdited);

console.log(originalRoleObj);
console.log('original from get');
console.log(CurrentSelectedRole.value)
if (roleEdited) {
    console.log('role edited -----');
    // remove not required fields
    delete originalRoleObj.action;
    delete originalRoleObj.confirmDateTime;
    delete originalRoleObj.confirmLineageId;
    delete originalRoleObj.updateLineageId;
    delete originalRoleObj.updateDateTime;
    delete originalRoleObj.referenceHash;

    if (originalRoleObj.item.passToPreviousDate) {
        console.log('passToPreviousDate', originalRoleObj.item.passToPreviousDate);
        originalRoleObj.item.passToPreviousDate = moment.utc(originalRoleObj.item.passToPreviousDate).diff(epochDate, 'days');
    }

    var modifiedAcquiredDate = moment(originalRoleObj.acquiredDateTime);
    var rolePutReq = {
        entityId: CurrentSelectedRole.value.entityId,
        recordStatus: 'active',
        functions: [{
            ...originalRoleObj,
            "acquiredDateTime": Math.floor(((new Date(modifiedAcquiredDate)).getTime())),
            "itemObjectHash": "",
            "remediatedItemHash": originalRoleObj.remediatedItemHash ? originalRoleObj.remediatedItemHash : originalRoleObj.itemObjectHash,
            "remediationAction": "OVERWRITE",
            "lineageID": originalRoleObj.lineageID.includes('REMEDIATED') ? originalRoleObj.lineageID : "REMEDIATED_" + CurrentSelectedRole.value.entityId,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }]
    }

    console.log(rolePutReq);
    FunctionPutReq.setValue(rolePutReq);
    loadingPopUp.show();
    PUTFunctionMastering.trigger();

    //AUDIT TRAIL List Creation
    console.log("Audit Trail Item: ", audit_trail_items)
    var audit_trail = {}
    audit_trail.entity_id = CurrentSelectedRole.value.entityId
    audit_trail.orbis_id = CurrentSelectedRole.value.function.item.misc.orbisID
    audit_trail.bvd_id = CurrentSelectedRole.value.function.item.misc.idCompany

    audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
    audit_trail.items = audit_trail_items
    audit_trail.ticket_id = urlparams.ticket
    audit_trail.object_type = "uci/role"
    audit_trail.source = "REMEDIATED"


    AuditTrailList.setValue(audit_trail)
    //  updateLinkedAttributes.trigger()
    //  createAuditTrail.trigger()

} else {
    utils.showNotification({
        title: 'No Changes',
        description: 'No updates were made to the role. Save action not required.',
        duration: 5000,
        notificationType: 'warning'

    });
}