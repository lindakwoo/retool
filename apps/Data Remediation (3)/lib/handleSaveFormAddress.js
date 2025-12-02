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

    //Address
    var addressArray = [];
    const result = [];
    const seenHashes = new Set();
    let newAddressArrayAddReq = [];
    var auditAddrMapping = {};

    AddressesListEdited.value.forEach(function (item, i) {


        var geocodeObj = selectedCompany.value.addresses[i].item.geoClassifications ? selectedCompany.value.addresses[i].item.geoClassifications : [];

        //caputure itemObjectHash and remediatedItemHash values more than localizedAddresses greaterthan 1

        const geoCode1Exists = geocodeObj.some(obj => obj.type === '1');

        var originalGeoCode = geocodeObj.filter((obj) => obj.type === "1").length > 0 ? geocodeObj.filter((obj) => obj.type === "1")[0].code.trim() : '';

        var itemEdited = false;
        var curPhNum = selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.phoneNumbers ? selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.phoneNumbers.join(", ") : '';
        var curFaxNum = selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.faxNumbers ? selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.faxNumbers.join(", ") : '';

        var audit_phone = curPhNum
        var audit_fax = curFaxNum
        if (item.phoneNumber != curPhNum) {
            itemEdited = true;
            curPhNum = item.phoneNumber;
        }
        if (item.faxNumber != curFaxNum) {
            itemEdited = true;
            curFaxNum = item.faxNumber;
        }
        // console.log('edit - f');
        if (item.regionGeoCode != originalGeoCode) {
            itemEdited = true;
            // console.log('edit - geocode');

            if (geoCode1Exists) {
                geocodeObj.forEach((obj) => {
                    if (obj.type === "1") {
                        obj.code = item.regionGeoCode.trim();
                    }
                })
            } else {
                geocodeObj.push({ type: '1', code: item.regionGeoCode.trim() })
            }

        }
        if (!selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox) {
            selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox = '';
            // console.log('pobox - updated');
        }
        console.log('item - updated', item);
        const originalReportedAddress = selectedCompany.value.addresses[i].item?.localizedAddresses?.[0]?.reportedAddress || {};
        const hasMinorTown = originalReportedAddress.hasOwnProperty("minorTown");
        const hasStreet = originalReportedAddress.hasOwnProperty("street");

        const reportedAddress = {
            addressLines: item.addressLine.trim().split(", "),
            postCode: item.postCode ? item.postCode.trim() : "",
            poBox: item.poBox ? item.poBox.trim() : "",
            city: item.city ? item.city.trim() : "",
            phoneNumbers: curPhNum.trim().split(", "),
            faxNumbers: curFaxNum.trim().split(", "),
            language: item.addressLanguage.trim(),
            county: item.county ? item.county.trim() : ""
        };

        if (hasMinorTown) {
            console.log('hasMinorTown', hasMinorTown);
            reportedAddress.minorTown = item?.minorTown ? item.minorTown.trim() : "";
        }
        if (hasStreet) {
            console.log('hasStreet', hasStreet);
            reportedAddress.street = item?.street ? item.street.trim() : "";
        }
        addReq = {
            "item": {
                "types": [item.addressType],
                "flags": selectedCompany.value.addresses[i].item.flags,
                "countryISO2": item.countryISO.trim(),
                "geoClassifications": geocodeObj,
                "localizedAddresses": [{
                    "language": item.addressLanguage.trim(),
                    "alphabet": "",
                    "reportedAddress": reportedAddress
                }],
            },
            "itemObjectHash": selectedCompany.value.addresses[i].remediationAction === "NEW" || selectedCompany.value.addresses[i].remediationAction === "RECREATE" ? selectedCompany.value.addresses[i].itemObjectHash : "",
            "remediatedItemHash": selectedCompany.value.addresses[i].remediatedItemHash ? selectedCompany.value.addresses[i].remediatedItemHash : selectedCompany.value.addresses[i].itemObjectHash,
            "remediationAction": AddressDeleteFlags.value[i] ? "DELETE" : selectedCompany.value.addresses[i].remediationAction === "NEW" || selectedCompany.value.addresses[i].remediationAction === "RECREATE" ? "RECREATE" : "OVERWRITE",
            "lineageId": selectedCompany.value.addresses[i].lineageId.includes("REMEDIATED_") ? selectedCompany.value.addresses[i].lineageId : "REMEDIATED_" + selectedCompany.value.addresses[i].lineageId,
            "source": "REMEDIATED",
            "itemStatus": (selectedCompany.value.addresses[i].remediationAction === "NEW" && AddressDeleteFlags.value[i]) || selectedCompany.value.addresses[i].remediationAction === "RECREATE" ? "ARCHIVED" : "ACTIVE",
        }
        //  console.log('selectedCompany.value.addresses[i].remediationAction =', selectedCompany.value.addresses[i].remediationAction, i)

        // console.log('addReq - addReq', addReq);
        newAddressArrayAddReq.push(addReq);
        //ADUIT TRAIL

        var fieldsChanged = []

        var new_value = ""
        var field_path = "addresses/item/localizedAddresses/reportedAddress"
        // var remediation_action = ""
        // var new_value = addReq.item;

        var tempAddresses = structuredClone(selectedCompany.value.addresses);
        var prev_value = ""
        const searchHash = addReq.remediatedItemHash ? addReq.remediatedItemHash : addReq.itemObjectHash
        for (var address of tempAddresses) {
            const tempHash = address.remediatedItemHash ? address.remediatedItemHash : address.itemObjectHash
            if (tempHash == searchHash) {
                if (prev_value == "") {
                    prev_value = address.item;
                } else {
                    prev_value.localizedAddresses.push(...address.item.localizedAddresses)
                }
            }
        }
        // console.log('prev_value: ', prev_value)
        prev_value = prev_value;



        if (AddressDeleteFlags.value[i]) {
            itemEdited = true;
            deleteFields.push('Address');
            // console.log('edit - delete');

            // console.log("LocalizedAddr: ", selectedCompany.value.addresses[i].item.localizedAddresses[0])

        } else {

            //  console.log('prev_value', prev_value, " | ", selectedCompany.value.addresses[i].item);

            if (item.addressType != selectedCompany.value.addresses[i].item.types[0]) {
                itemEdited = true;
                fieldsChanged.push("types")
                // console.log('edit - type');

            }

            if (item.addressLanguage.toLocaleLowerCase() != selectedCompany.value.addresses[i].item.localizedAddresses[0].language.toLocaleLowerCase()) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/language')
                // console.log('edit - language');

            }

            if (item.addressLine != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ')) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/addressLines')
                // console.log('edit - addressline');


            }

            if (selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode && item.postCode != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode ||
                (!selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode && item.postCode)
            ) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/postCode')
                // console.log('edit - postCode');
            }

            // if (selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode && item.postCode != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.postCode) {
            //     itemEdited = true;
            //     fieldsChanged.push('localizedAddresses/reportedAddress/postCode')
            //     // console.log('edit - postcode');

            // }

            if (item.city != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.city) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/city')
                // console.log('edit - city');

            }

            if (item.poBox != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.poBox) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/poBox')
                // console.log('edit - pobox');

            }
            if (item.phoneNumber != audit_phone) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/phoneNumbers')
                // console.log('edit - phone');

            }

            if (item.faxNumber != audit_fax) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/faxNumbers')
                // console.log('edit - fax');

            }

            if (item.countryISO != selectedCompany.value.addresses[i].item.countryISO2) {
                fieldsChanged.push('countryISO2')
                itemEdited = true;
                // console.log('edit - country');
            }
            // console.log('edit - f');
            if (item.regionGeoCode != originalGeoCode) {
                itemEdited = true;
                fieldsChanged.push('geoClassifications')
                // console.log('edit - geocode');

            }

            if (selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county && item.county != selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county ||
                (!selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.county && item.county)
            ) {
                itemEdited = true;
                fieldsChanged.push('localizedAddresses/reportedAddress/county')
                // console.log('edit - county');
            }
        }
        if (itemEdited) {
            console.log("itemEdited addressArray", itemEdited);
            addressArray.push(addReq);





        }
        // console.log('addReq', addReq);

        //Save changes and prev values for audit trail based on hash
        if (auditAddrMapping[searchHash]) {
            // Already exists -> merge fields
            auditAddrMapping[searchHash].changedFields = [
                ...auditAddrMapping[searchHash].changedFields,
                ...fieldsChanged
            ];

        } else {
            // Doesn't exist -> create new entry
            auditAddrMapping[searchHash] = {
                "prev_value": prev_value,
                "changedFields": fieldsChanged
            };
        }

    });
    console.log('addressArray before new', addressArray);
    if (!newAddressForm.hidden) {

        var new_addr_item = {
            'types': [newAddressType.value.trim()],
            'flags': [],
            'countryISO2': countryISO2.value.trim(),
            'geoClassifications': [{
                type: "1",
                code: regionGeoCode2.value.trim()
            }],
            "localizedAddresses": [{
                'language': language2.value.trim(),
                "alphabet": "",
                "reportedAddress": {
                    'addressLines': addressLine2.value.trim().split(', '),
                    'postCode': postCode2.value.trim() || '',
                    'poBox': poBox2.value.trim() || '',
                    'city': city2.value.trim() || '',
                    'phoneNumbers': phoneNumber2.value.trim().split(', '),
                    'faxNumbers': faxNumber2.value.trim().split(', '),
                    'language': language2.value.trim(),
                    "county": county3.value ? county3.value.trim() : ""
                }
            }],
        }


        var newAdd = {
            item: new_addr_item,
            'itemObjectHash': '',
            'remediatedItemHash': '',
            'remediationAction': 'NEW',
            'lineageId': 'REMEDIATED_' + selectedCompany.value.header.entityID,
            'source': 'REMEDIATED',
            'itemStatus': 'ACTIVE'
        }
        // console.log('new address', newAdd);
        addressArray.push(newAdd);

        //ADUIT TRAIL
        audit_trail_items.push({
            "remediation_action": "new",
            "field_path": "addresses/item",
            "item_hash": "",
            "new_value": new_addr_item,
            "prev_value": "",
            "label": "address"
        })


    }
    // console.log('ADDRES PUT')]


    //console.log('newAddressArrayAddReq - addReq:', JSON.stringify(newAddressArrayAddReq, null, 2));

    // Step 0: Remove DELETE entries if OVERWRITE exists for the same hash
    const overwriteHashes = new Set(
        newAddressArrayAddReq
            .filter(req => req.remediationAction?.toUpperCase() === 'OVERWRITE')
            .map(req => req.remediatedItemHash || req.itemObjectHash || '')
    );

    const filteredAddReq = newAddressArrayAddReq.filter(req => {
        const hash = req.remediatedItemHash || req.itemObjectHash || '';
        // Skip DELETE if overwrite exists for same hash
        if (overwriteHashes.has(hash) && req.remediationAction?.toUpperCase() === 'DELETE') {
            return false;
        }
        return true;
    });

    // Group requests by combined hash key (remediatedItemHash + itemObjectHash)
    const requestsByHash = filteredAddReq.reduce((acc, req) => {
        const key = (req.remediatedItemHash || '') + '|' + (req.itemObjectHash || '');
        if (!acc[key]) acc[key] = [];
        acc[key].push(req);
        return acc;
    }, {});

    // Process each hash group against addressArray
    for (const [hashKey, reqGroup] of Object.entries(requestsByHash)) {
        const [remediatedHash, objectHash] = hashKey.split('|');

        // Find matching address in addressArray
        const matchedAddr = addressArray.find(addr => {
            return (addr.remediatedItemHash || '') === remediatedHash &&
                (addr.itemObjectHash || '') === objectHash;
        });

        if (!matchedAddr) continue;

        // Extract remediation actions from request group
        const actions = reqGroup.map(r => r.remediationAction?.toUpperCase());

        // --------- Scenario 2: all DELETE ---------
        if (actions.every(a => a === 'DELETE')) {
            // Combine all localizedAddresses from DELETE requests
            matchedAddr.item.localizedAddresses = reqGroup.flatMap(r => r.item.localizedAddresses || []);
            // No remediationAction update needed
            continue;
        }

        // --------- Scenario 3: mixed DELETE + OVERWRITE ---------
        if (actions.includes('DELETE') && actions.includes('OVERWRITE')) {
            const overwriteReq = reqGroup.find(r => r.remediationAction?.toUpperCase() === 'OVERWRITE');
            if (overwriteReq) {
                matchedAddr.item.localizedAddresses = [...(overwriteReq.item.localizedAddresses || [])];
                matchedAddr.remediationAction = 'OVERWRITE';
            }
            continue;
        }

        // --------- Scenario 1 & 4: all OVERWRITE ---------
        if (actions.every(a => a === 'OVERWRITE')) {
            // Combine all localizedAddresses from OVERWRITE requests without duplicates by language
            const combinedLocalized = [];
            reqGroup.forEach(r => {
                (r.item.localizedAddresses || []).forEach(loc => {
                    if (!combinedLocalized.some(cl => cl.language === loc.language)) {
                        combinedLocalized.push(loc);
                    }
                });
            });
            matchedAddr.item.localizedAddresses = combinedLocalized;
            matchedAddr.remediationAction = 'OVERWRITE';
        }

        // If other scenarios appear, you can handle here
    }

    // Deduplicate addressArray by hashes, preferring entries with more localizedAddresses
    addressArray = Object.values(
        addressArray.reduce((acc, item) => {
            const key = item.itemObjectHash || item.remediatedItemHash || '';
            if (
                !acc[key] ||
                (item.item.localizedAddresses?.length || 0) >
                (acc[key].item.localizedAddresses?.length || 0)
            ) {
                acc[key] = item;
            }
            return acc;
        }, {})
    );

    console.log('addressArray: ', addressArray)
    console.log('auditAddrMapping: ', auditAddrMapping)

    for (var addrPutItem of addressArray) {
        if (addrPutItem.remediationAction != 'NEW'){
            console.log('Processing addrPutItem: ', addrPutItem);
            // Process each addrPutItem as needed
            var itemHash = addrPutItem.remediatedItemHash ? addrPutItem.remediatedItemHash : addrPutItem.itemObjectHash;

            const auditItem = auditAddrMapping[itemHash];

            // Remove standardizedAddress from each localizedAddress
            if (Array.isArray(auditItem.prev_value.localizedAddresses)) {
                auditItem.prev_value.localizedAddresses.forEach(addr => {
                    delete addr.standardizedAddress;
                });
            } 

            if (addrPutItem.remediationAction == "DELETE") {
                audit_trail_items.push({
                    "remediation_action": addrPutItem.remediationAction,
                    "field_path": 'addresses/item',
                    "item_hash": itemHash,
                    "new_value": "",
                    "prev_value": auditItem.prev_value
                })
            } else {

                for (var field of auditItem.changedFields) {

                    audit_trail_items.push({
                            "remediation_action": addrPutItem.remediationAction,
                            "field_path": 'addresses/item/' + field,
                            "item_hash": itemHash,
                            "new_value": addrPutItem.item,
                            "prev_value": auditItem.prev_value
                        });
                }
                // console.log('auditItem.prev_value.localizedAddresses.length: ', auditItem.prev_value.localizedAddresses.length)
                // console.log('addrPutItem.item.localizedAddresses.length: ', addrPutItem.item.localizedAddresses.length)

                if (auditItem.prev_value.localizedAddresses.length != addrPutItem.item.localizedAddresses.length) {
                    
                    var tempItemLen = auditItem.prev_value.localizedAddresses.length - addrPutItem.item.localizedAddresses.length
                    // console.log('tempItemLen: ', tempItemLen)
                    for (var i = 0; i < tempItemLen; i++) {
                        audit_trail_items.push({
                            "remediation_action": addrPutItem.remediationAction,
                            "field_path": 'addresses/item/localizedAddresses',
                            "item_hash": itemHash,
                            "new_value": addrPutItem.item,
                            "prev_value": auditItem.prev_value
                        });
                    }
                }
            
            }
        }
    }

    console.log('Address Audit Items: ', audit_trail_items)

    //console.log('addressArray', addressArray);
    AddressPutArray.setValue(addressArray);
    saveAddressPutArray.setValue(addressArray);
    // console.log('disable_save2');

    LinkCheckAddresses.trigger()



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
    if (savePutFlag.value === true) {
        PUTMasteringRecordAddress.trigger();
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
    /// }
}
