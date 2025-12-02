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

    //Entity Infos - Legal Form and Incorporation Date

    var updateIncopDate = '';
    var incopPrecision = 0;

    if (incopYear.value) {
        updateIncopDate = incopYear.value + '-01-01';
        incopPrecision = 9;
        if (incopMonth.value && incopMonth.value !== '00') {
            updateIncopDate = incopYear.value + '-' + incopMonth.value + '-01';
            incopPrecision = 10;
            if (incopDay.value && incopDay.value !== '00') {
                updateIncopDate = incopYear.value + '-' + incopMonth.value + '-' + incopDay.value;
                incopPrecision = 11;
            }
        }
    }
    //  console.log('updateIncopDate', updateIncopDate)
    //ADUIT TRAIL
    var new_value = ""
    var prev_value = ""
    var field_path = "entityInfo/item"
    var remediation_action = 'overwrite'
    EntityInfoPutArray.setValue([]);
    var incopEdited = false;
    var entityInfoReq = {
        "item": {
            ...selectedCompany.value.entityInfo.item
        },
        "itemObjectHash": "",
        "remediatedItemHash": selectedCompany.value.entityInfo.remediatedItemHash ? selectedCompany.value.entityInfo.remediatedItemHash : selectedCompany.value.entityInfo.itemObjectHash,
        "remediationAction": "OVERWRITE",
        "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
        "source": "REMEDIATED",
        "itemStatus": "ACTIVE"
    }
    // console.log('entityInfoReq', entityInfoReq)
    var entityEdited = false;
    if (legalFormSelect.value !== selectedCompany.value.entityInfo.item.standardizedLegalForm) {
        entityEdited = true;
        entityInfoReq.item.standardizedLegalForm = legalFormSelect.value;

        //ADUIT TRAIL
        new_value = legalFormSelect.value
        prev_value = selectedCompany.value.entityInfo.item.standardizedLegalForm
        temp_field_path = field_path + "/standardizedLegalForm"

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": temp_field_path,
            "item_hash": selectedCompany.value.entityInfo.itemObjectHash,
            "new_value": new_value,
            "prev_value": prev_value
        })

    }
    // console.log('selectedCompany.value.entityInfo.item.incorporationDate', selectedCompany.value.entityInfo.item.incorporationDate);

    var originalIncorporationDate = moment.utc(new Date(selectedCompany.value.entityInfo.item.incorporationDate)).diff(epochDate, 'days');
    //  console.log('originalIncorporationDate', originalIncorporationDate);

    var modifiedIncorporationDate = updateIncopDate !== '' ? moment.utc(new Date(updateIncopDate)).diff(epochDate, 'days') : null;
    //  console.log('modifiedIncorporationDate', modifiedIncorporationDate);

    if (modifiedIncorporationDate !== originalIncorporationDate) {
        // console.log('incorporationDate Edited');
        entityEdited = true;
        incopEdited = true;
        entityInfoReq.item.incorporationDate = modifiedIncorporationDate;
        entityInfoReq.item.incorporationDatePrecision = incopPrecision;

        //ADUIT TRAIL
        new_value = modifiedIncorporationDate
        prev_value = selectedCompany.value.entityInfo.item.incorporationDate
        temp_field_path = field_path + "/incorporationDate"

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": temp_field_path,
            "item_hash": selectedCompany.value.entityInfo.itemObjectHash,
            "new_value": new_value,
            "prev_value": prev_value
        })

    }
    // console.log('nationalLegalFormValue orginal', selectedCompany.value.entityInfo.item.nationalLegalForm);
    // console.log('modified nationalLegalFormValue', nationalLegalFormValue.value);
    if (nationalLegalFormValue.value !== selectedCompany.value.entityInfo.item.nationalLegalForm) {
        // console.log('nationalLegalFormValue Edited');
        entityEdited = true;
        entityInfoReq.item.nationalLegalForm = nationalLegalFormValue.value;

        //ADUIT TRAIL
        new_value = nationalLegalFormValue.value
        prev_value = selectedCompany.value.entityInfo.item.nationalLegalForm
        temp_field_path = field_path + "/nationalLegalForm"

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": temp_field_path,
            "item_hash": selectedCompany.value.entityInfo.itemObjectHash,
            "new_value": new_value,
            "prev_value": prev_value
        })

    }
    // console.log('stateOfIncorporationValue.value ', stateOfIncorporationValue.value);
    // console.log('selectedCompany.value.entityInfo.item.stateOfIncorporationValue ', selectedCompany.value.entityInfo.item.stateOfIncorporation);
    if (stateOfIncorporationValue.value !== selectedCompany.value.entityInfo.item.stateOfIncorporation) {
        // console.log('stateOfIncorporationValue Edited');
        entityEdited = true;
        entityInfoReq.item.stateOfIncorporation = stateOfIncorporationValue.value;

        //ADUIT TRAIL
        new_value = stateOfIncorporationValue.value
        prev_value = selectedCompany.value.entityInfo.item.stateOfIncorporation
        temp_field_path = field_path + "/stateOfIncorporation"

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": remediation_action,
            "field_path": temp_field_path,
            "item_hash": selectedCompany.value.entityInfo.itemObjectHash,
            "new_value": new_value,
            "prev_value": prev_value
        })

    }
    if (entityEdited) {
        if (!incopEdited) {
            console.log('incorporationDate not edited ', incopEdited);
            entityInfoReq.item.incorporationDate = originalIncorporationDate;
            entityInfoReq.item.incorporationDatePrecision = selectedCompany.value.entityInfo.item.incorporationDatePrecision;
        }
        // console.log('entityEdited', entityEdited)
        EntityInfoPutArray.setValue(entityInfoReq);
        saveEntityPutArray.setValue(entityInfoReq);
        
    } else {
        EntityInfoPutArray.setValue([]);
    }

    LinkCheckLegalInformation.trigger()

    //  console.log('disable_save[1].length === 0', disable_save[1].replace(/\[|\]/g, "").length === 0);

    // Check any field change or not.
    //    if (disable_save[1].replace(/\[|\]/g, "").length === 0 && audit_trail_items.length === 0 && addressArray.length === 0 && curNamePutArr.length === 0) {
    //         utils.showNotification({
    //             title: 'No Changes',
    //             description: 'No updates found. Save action not required.',
    //             duration: 5000,
    //             notificationType: 'warning'

    //         });
    //      loadingPopUp.setHidden(true);
    //     } else {

    if(savePutFlag.value === true){
       PUTMasteringRecordLegalInfo.trigger();
    }
   


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
