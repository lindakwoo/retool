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

  if (Array.isArray(item.localizedNames)){
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
        //description: `Please upload or link the required sections ${disable_save[1]} …`,
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

    //Address
    var addressArray = [];

   
    //Identifiers List Editing

    // console.log('Identifiers List');
    console.log(CurrentIdentifiersList.data);

    var curIdentifierPut = [];

    var identifiersFromAPI = selectedCompany.value.identifiers;
    CurrentIdentifiersList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = item.item
        var field_path = "identifiers/item"
        var remediation_action = ''

        var curIdType = item.item.type;
        var curObjHash = item.itemObjectHash;
        var curIdFromAPI = identifiersFromAPI.filter((obj) => obj.item.type === curIdType && obj.itemObjectHash === curObjHash)[0];
        //console.log('curObjHash', curObjHash);       
        //console.log('curIdFromAPI', curIdFromAPI);    
        var curIdentifierVal = CurIdentifiers.value.filter((obj) => obj.item.type === curIdType && obj.itemObjectHash === curObjHash)[0].item.id;
        //console.log('curObjHash', curObjHash); 
        //console.log('testttttt curIdFromAPI', curIdentifierVal);
        var curIdValFromAPI = curIdFromAPI.item.id;
        if (curIdentifierVal !== curIdValFromAPI) {
            var curIdentifierPutReq = {
                "item": {
                    "type": curIdFromAPI.item.type,
                    "flags": curIdFromAPI.item.flags,
                    "prefix": curIdFromAPI.item.prefix,
                    "suffix": curIdFromAPI.item.suffix,
                    "id": curIdentifierVal.trim()
                },
                "itemObjectHash": curIdFromAPI.remediationAction === "NEW" || curIdFromAPI.remediationAction === "RECREATE" ? curIdFromAPI.itemObjectHash : "",
                "remediatedItemHash": curIdFromAPI.remediatedItemHash ? curIdFromAPI.remediatedItemHash : curIdFromAPI.itemObjectHash,
                "remediationAction": curIdentifierVal.trim() === '' ? "DELETE" : curIdFromAPI.remediationAction === "NEW" || curIdFromAPI.remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curIdFromAPI.lineageId.includes('REMEDIATED') ? curIdFromAPI.lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curIdentifierVal.trim() === '' && (curIdFromAPI.remediationAction === "NEW" || curIdFromAPI.remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log("Identifier Put Req", i);
            // console.log(curIdentifierPutReq);

            curIdentifierPut.push(curIdentifierPutReq);
            console.log("Arr  curIdentifierPut", i)

            //AUDIT TRAIL
            remediation_action = curIdentifierPutReq.remediationAction


            if (curIdentifierVal.trim() === '') {
                new_value = ""
                prev_value = curIdFromAPI.item
            } else {
                new_value = {
                    "type": curIdFromAPI.item.type,
                    "id": curIdentifierVal.trim()
                }
                prev_value = {
                    "type": curIdFromAPI.item.type,
                    "id": curIdValFromAPI
                }
                field_path = field_path + "/id"
            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curIdFromAPI.remediatedItemHash ? curIdFromAPI.remediatedItemHash : curIdFromAPI.itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })

        }

    });
    Object.entries(NewIdentifiersValues.value).forEach(([key, value]) => {

        var new_identifier_item = {
            "type": key,
            "flags": [],
            "prefix": null,
            "suffix": null,
            "id": value.trim()
        }

        var curIdentifierPutReq = {
            "item": new_identifier_item,
            "itemObjectHash": "",
            "remediatedItemHash": "",
            "remediationAction": "NEW",
            "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
            "source": "REMEDIATED",
            "itemStatus": "ACTIVE"
        }
        // console.log('curIdentifierPutReq');
         console.log(curIdentifierPutReq);

        curIdentifierPut.push(curIdentifierPutReq);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "identifiers/item",
            "item_hash": "",
            "new_value": new_identifier_item,
            "prev_value": "",
            "label": "identifier",
            "iteration": String(i)
        })

    });

     console.log('Identifier PUT Request',curIdentifierPut);
    IdentifierPutArray.setValue(curIdentifierPut);
    saveIdentifiersPutArray.setValue(curIdentifierPut);

    LinkCheckIdentifiers.trigger()

    //  if(deleteFields.length > 0) {
    //    // console.log(deleteFields);
    //    DeleteFieldMesageObj.setValue(deleteFields);
    //    ConfirmationPopup.setHidden(false);
    //  } else {
    //    loadingPopUp.show(true);
    //    PUTMasteringRecord.trigger();
    //  }

//  console.log('disable_save[1] =', disable_save[1].replace(/\[|\]/g, "") );
//    console.log('audit_trail_items =', audit_trail_items);
//    console.log('addressArray =', addressArray);
//    console.log('curNamePutArr =', curNamePutArr);
   

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
   console.log()
    if(savePutFlag.value === true){
    PUTMasteringRecordIdentifiers.trigger();
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
