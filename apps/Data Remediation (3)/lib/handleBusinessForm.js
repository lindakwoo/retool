//  loadingPopUp.hide();
//  var disable_save = await linkDisableSave.trigger()
//  // Helper func to trim spaces in names
//  function cleanName(str) {
//      return str ? str.replace(/\s{2,}/g, ' ').trim() : '';
//  }

//  function cleanLocalizedNames(item) {
//    if (Array.isArray(item.localizedNames) && item.localizedNames.length > 1) {
//      item.localizedNames = item.localizedNames.filter(entry => entry.name !== "");
//    }

//    if (Array.isArray(item.localizedNames)){
//      item.localizedNames.forEach(entry => {
//        delete entry.alphabet;
//      });
//      delete item.flags;
//    }

//    return item;
//  }

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


    // console.log('EntityInfoPut', entityInfoReq)


    // BusinessDescriptions Checking 
    var businessDescriptionArray = selectedCompany.value.activityDescriptions;
    // console.log('11', "businessDescriptionArray");
    // console.log("businessDescriptionArray", businessDescriptionArray);

    // Initial setup
    var businessDescPutArray = [];

    // console.log("newBusinessDescriptionDataList.value", newBusinessDescriptionDataList.value)

    // Process BusinessDescriptionList to create update requests
    BusinessDescriptionList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "activityDescriptions/item"
        var remediation_action = ''

        // console.log("BusinessDescriptionList", item);
        var currentBusinessDescriptionVal = BusinessDescriptionsVariableList.value[i];
         console.log("currentBusinessDescriptionVal", currentBusinessDescriptionVal);

        if (currentBusinessDescriptionVal?.value !== businessDescriptionArray[i].item.value ||
            currentBusinessDescriptionVal?.language !== businessDescriptionArray[i].item.language ||
            currentBusinessDescriptionVal.deleteFlag) {

            var temp_businessDesc_item = {
                "type": businessDescriptionArray[i].item.type,
                "flags": businessDescriptionArray[i].item.flags || [],
                "language": currentBusinessDescriptionVal.language,
                "value": currentBusinessDescriptionVal.value
            }

            var businessDescriptionPutReq = {
                "item": temp_businessDesc_item,
                "itemObjectHash": businessDescriptionArray[i].remediationAction === "NEW" || businessDescriptionArray[i].remediationAction === "RECREATE" ? businessDescriptionArray[i].itemObjectHash : "",
                "remediatedItemHash": businessDescriptionArray[i].remediatedItemHash ? businessDescriptionArray[i].remediatedItemHash : businessDescriptionArray[i].itemObjectHash,
                "remediationAction": currentBusinessDescriptionVal.deleteFlag ? "DELETE" : businessDescriptionArray[i].remediationAction === "NEW" || businessDescriptionArray[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": businessDescriptionArray[i].lineageId.includes('REMEDIATED') ? businessDescriptionArray[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": currentBusinessDescriptionVal.deleteFlag && (businessDescriptionArray[i].remediationAction === "NEW" || businessDescriptionArray[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            };
            // console.log("businessDescription", i);
            // console.log("businessDescriptionPutReq", businessDescriptionPutReq);

            businessDescPutArray.push(businessDescriptionPutReq);


            remediation_action = businessDescriptionPutReq.remediationAction

            if (currentBusinessDescriptionVal.deleteFlag) {
                //AUDIT TRAIL
                new_value = ""
                prev_value = businessDescriptionArray[i].item
                temp_field_path = field_path

                //ADUIT TRAIL
                audit_trail_items.push({
                    "remediation_action": remediation_action,
                    "field_path": field_path,
                    "item_hash": businessDescriptionArray[i].remediatedItemHash ? businessDescriptionArray[i].remediatedItemHash : businessDescriptionArray[i].itemObjectHash,
                    "new_value": new_value,
                    "prev_value": prev_value
                })

            } else {

                //AUDIT TRAIL
                new_value = {
                    "language": currentBusinessDescriptionVal.language,
                    "value": currentBusinessDescriptionVal.value
                }
                prev_value = {
                    "language": businessDescriptionArray[i].item.language,
                    "value": businessDescriptionArray[i].item.value
                }


                if (currentBusinessDescriptionVal.value !== businessDescriptionArray[i].item.value) {
                    field_path = field_path + "/value"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": field_path,
                        "item_hash": businessDescriptionArray[i].remediatedItemHash ? businessDescriptionArray[i].remediatedItemHash : businessDescriptionArray[i].itemObjectHash,
                        "new_value": new_value,
                        "prev_value": prev_value
                    })

                } else if (currentBusinessDescriptionVal.language !== businessDescriptionArray[i].item.language) {
                    field_path = field_path + "/language"

                    //ADUIT TRAIL
                    audit_trail_items.push({
                        "remediation_action": remediation_action,
                        "field_path": field_path,
                        "item_hash": businessDescriptionArray[i].remediatedItemHash ? businessDescriptionArray[i].remediatedItemHash : businessDescriptionArray[i].itemObjectHash,
                        "new_value": new_value,
                        "prev_value": prev_value
                    })

                }
            }

        }
    });
     var newBusinnessValue = newBusinessDescInputField.value
  .trim()
  .replace(/ {2,}/g, ' ');
  console.log('newBusinnessValue', newBusinnessValue)
    if (newBusinessDescInputField.value !== '' && newBusinessDescLanguageInputField.value !== null) {
        var newBusinessDescriptionObj = {
            "item": {
                "type": "", // Adjust as needed
                "flags": [], // Example flag
                "language": newBusinessDescLanguageInputField.value,
                "value": newBusinnessValue
            },
            'itemObjectHash': '',
            'remediatedItemHash': '',
            'remediationAction': 'NEW',
            'lineageId': 'REMEDIATED_' + selectedCompany.value.header.entityID,
            'source': 'REMEDIATED',
            'itemStatus': 'ACTIVE'
        };
        // Add transformed new business descriptions to the array
        businessDescPutArray.push(newBusinessDescriptionObj);
        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "activityDescriptions/item",
            "item_hash": "",
            "new_value": newBusinessDescriptionObj.item,
            "prev_value": "",
            "label": "business_description"
        })
    }

    // console.log("businessDescPutArray", businessDescPutArray);
  
    
    BusinessDescPutArrayValue.setValue(businessDescPutArray);
    saveActivityDescriptions.setValue(businessDescPutArray);

    LinkCheckBusinesses.trigger()

    
  //  // Check any field change or not.
  //   if (disable_save[1].replace(/\[|\]/g, "").length === 0 && audit_trail_items.length === 0 && addressArray.length === 0 && curNamePutArr.length === 0) {
  //        utils.showNotification({
  //            title: 'No Changes',
  //            description: 'No updates found. Save action not required.',
  //            duration: 5000,
  //            notificationType: 'warning'

  //        });
  //     loadingPopUp.setHidden(true);
  //    } else {

  if(savePutFlag.value === true){
    PUTMasteringRecordBusiness.trigger();
  }

    //  //Auit Trail List Creation
    //  // console.log("Audit Trail Item: ", audit_trail_items)
    //  var audit_trail = {}
    //  audit_trail.entity_id = selectedCompany.value.header.entityID
    //  audit_trail.orbis_id = selectedCompany.value.header.entityID
    //  audit_trail.bvd_id = selectedCompany.value.header.bvdID
    //  audit_trail.user_id = CurrentUserObj.value.user_id.toLowerCase()
    //  audit_trail.items = audit_trail_items
    //  audit_trail.ticket_id = urlparams.ticket
    //  audit_trail.object_type = "firmographics"
    //  audit_trail.source = "REMEDIATED"


    //  AuditTrailList.setValue(audit_trail)
    //  updateLinkedAttributes.trigger()
    //  createAuditTrail.trigger()
   //}
}
