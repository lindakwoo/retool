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



    //digitalPresences 
    var networkArr = [];
    var websitesFromAPI = [];
    if (selectedCompany.value.digitalPresences) {
        websitesFromAPI = selectedCompany.value.digitalPresences.filter(item => item.item.type === '1');
    }

    // Website Adding
    ListOfWebsites.data.forEach(function (item, i) {
        var curWebSite = Websites.value[i];

        if (selectedCompany.value.digitalPresences && websitesFromAPI[i].item.value != curWebSite) {
            var modifyNetwork = {};

            //ADUIT TRAIL
            var new_value = ""
            var prev_value = ""
            var field_path = "digitalPresences/item"
            var remediation_action = ''

            if (curWebSite == "") {
                deleteFields.push('Website');
                modifyNetwork = {

                    "item": {
                        "type": websitesFromAPI[i].item.type,
                        "flags": websitesFromAPI[i].item.flags,
                        "value": websitesFromAPI[i].item.value.trim()
                    },
                    "itemObjectHash": websitesFromAPI[i].remediationAction === "NEW" || websitesFromAPI[i].remediationAction === "RECREATE" ? websitesFromAPI[i].itemObjectHash : "",
                    "remediatedItemHash": websitesFromAPI[i].remediatedItemHash ? websitesFromAPI[i].remediatedItemHash : websitesFromAPI[i].itemObjectHash,
                    "remediationAction": "DELETE",
                    "lineageId": selectedCompany.value.digitalPresences[i].lineageId.includes("REMEDIATED") ? selectedCompany.value.digitalPresences[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                    "source": "REMEDIATED",
                    "itemStatus": websitesFromAPI[i].remediationAction === "NEW" || websitesFromAPI[i].remediationAction === "RECREATE" ? "ARCHIVED" : "ACTIVE",
                }

                //AUDIT TRAIL
                new_value = ""
                prev_value = modifyNetwork.item
                remediation_action = modifyNetwork.remediationAction
            }
            if (curWebSite != "") {
                modifyNetwork = {

                    "item": {
                        "type": websitesFromAPI[i].item.type,
                        "flags": websitesFromAPI[i].item.flags,
                        "value": curWebSite?.trim()
                    },
                    "itemObjectHash": websitesFromAPI[i].remediationAction === "NEW" || websitesFromAPI[i].remediationAction === "RECREATE" ? websitesFromAPI[i].itemObjectHash : "",
                    "remediatedItemHash": websitesFromAPI[i].remediatedItemHash ? websitesFromAPI[i].remediatedItemHash : websitesFromAPI[i].itemObjectHash,
                    "remediationAction": websitesFromAPI[i].remediationAction === "NEW" || websitesFromAPI[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                    "lineageId": selectedCompany.value.digitalPresences[i].lineageId.includes("REMEDIATED") ? selectedCompany.value.digitalPresences[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                    "source": "REMEDIATED",
                    "itemStatus": "ACTIVE"
                }

                //AUDIT TRAIL
                new_value = {
                    "type": websitesFromAPI[i].item.type,
                    "value": curWebSite?.trim()
                }
                prev_value = {
                    "type": websitesFromAPI[i].item.type,
                    "value": websitesFromAPI[i].item.value
                }
                remediation_action = modifyNetwork.remediationAction
                field_path = field_path + '/value'

            }

            networkArr.push(modifyNetwork)
            //NetworkArray.setValue(networkArr);

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": websitesFromAPI[i].remediatedItemHash ? websitesFromAPI[i].remediatedItemHash : websitesFromAPI[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })


        }
    })
    //new Websites
    if (NewWebsites.value.length > 0) {
        NewWebsitesList.data.forEach((eachWebsite, i) => {
            if (NewWebsites.value[i] != "") {
                var newNetworkArr = {
                    "item": {
                        "type": '1',
                        "flags": [],
                        "value": NewWebsites.value[i].trim()
                    },
                    "itemObjectHash": "",
                    "remediatedItemHash": "",
                    "remediationAction": "NEW",
                    "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
                    "source": "REMEDIATED",
                    "itemStatus": "ACTIVE"
                }
                networkArr.push(newNetworkArr);

                //ADUIT TRAIL
                audit_trail_items.push({
                    "remediation_action": "new",
                    "field_path": "digitalPresences/item",
                    "item_hash": "",
                    "new_value": newNetworkArr.item,
                    "prev_value": "",
                    "label": "website",
                    "iteration": String(i)
                })
            }
        })
    }
    // Emails Adding
    var curEmails = [];
    if (selectedCompany.value.digitalPresences) {
        curEmails = selectedCompany.value.digitalPresences.filter(function (item) {
            return item.item.type === '2'
        });
    }

    console.log('curEmails', curEmails);

    emailList.data.forEach(function (item, i) {

        //ADUIT TRAIL
        var new_value = ""
        var prev_value = ""
        var field_path = "digitalPresences/item"
        var remediation_action = ''

        var curEmailVal = Emails.value[i];
        if (curEmailVal !== curEmails[i].item.value) {
            var curEmailPutReq = {
                "item": {
                    "type": curEmails[i].item.type,
                    "flags": curEmails[i].item.flags,
                    "value": curEmailVal?.trim()
                },
                "itemObjectHash": curEmails[i].remediationAction === "NEW" || curEmails[i].remediationAction === "RECREATE" ? curEmails[i].itemObjectHash : "",
                "remediatedItemHash": curEmails[i].remediatedItemHash ? curEmails[i].remediatedItemHash : curEmails[i].itemObjectHash,
                "remediationAction": curEmailVal === '' ? "DELETE" : curEmails[i].remediationAction === "NEW" || curEmails[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
                "lineageId": curEmails[i].lineageId.includes('REMEDIATED') ? curEmails[i].lineageId : "REMEDIATED_" + selectedCompany.value.header.entityID,
                "source": "REMEDIATED",
                "itemStatus": curEmailVal === '' && (curEmails[i].remediationAction === "NEW" || curEmails[i].remediationAction === "RECREATE") ? "ARCHIVED" : "ACTIVE"
            }
            // console.log('4', "email curEmailPutReq", i);
            // console.log('5', curEmailPutReq);

            networkArr.push(curEmailPutReq);
            // console.log('6', "email  curEmailPutReq", i)
            // console.log('7', networkArr);


            remediation_action = curEmailPutReq.remediationAction


            if (curEmailVal === '') {
                deleteFields.push('Email');

                //AUDIT TRAIL
                new_value = ""
                prev_value = curEmailPutReq.item

            } else {

                //AUDIT TRAIL
                new_value = {
                    "type": curEmails[i].item.type,
                    "value": curEmailVal?.trim()
                }
                prev_value = {
                    "type": curEmails[i].item.type,
                    "value": curEmails[i].item.value
                }
                field_path = field_path + '/value'

            }

            //ADUIT TRAIL
            audit_trail_items.push({
                "remediation_action": remediation_action,
                "field_path": field_path,
                "item_hash": curEmails[i].itemObjectHash,
                "new_value": new_value,
                "prev_value": prev_value
            })


        }

    });
    //new Email
    if (NewEmails.value.length > 0) {
        NewEmailsList.data.forEach((eachMail, i) => {
            if (NewEmails.value[i].trim() !== '') {
                var curEmailPutReq = {
                    "item": {
                        "type": '2',
                        "flags": [],
                        "value": NewEmails.value[i].trim()
                    },
                    "itemObjectHash": "",
                    "remediatedItemHash": "",
                    "remediationAction": "NEW",
                    "lineageId": "REMEDIATED_" + selectedCompany.value.header.entityID,
                    "source": "REMEDIATED",
                    "itemStatus": "ACTIVE"
                }
                networkArr.push(curEmailPutReq);

                //ADUIT TRAIL
                audit_trail_items.push({
                    "remediation_action": "new",
                    "field_path": "digitalPresences/item",
                    "item_hash": "",
                    "new_value": curEmailPutReq.item,
                    "prev_value": "",
                    "label": "email",
                    "iteration": String(i)
                })
            }
        })
    }
    // console.log('New Emails Added', networkArr);
    NetworkArray.setValue(networkArr);
   saveDigitalPresencesPutArray.setValue(networkArr);
    // console.log('disable_save3');

    LinkCheckDigitalPresences.trigger()


  //  if (disable_save[1].replace(/\[|\]/g, "").length === 0 && audit_trail_items.length === 0 && addressArray.length === 0 && curNamePutArr.length === 0) {
  //       utils.showNotification({
  //           title: 'No Changes',
  //           description: 'No updates found. Save action not required.',
  //           duration: 5000,
  //           notificationType: 'warning'

  //       });
  //    loadingPopUp.setHidden(true);
  //   } else {
    if(savePutFlag.value === true){
    PUTMasteringRecordDigitalPresence.trigger();
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

