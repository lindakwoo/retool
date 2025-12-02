var masterDict = masterRecordAllAttributeHashDict.value

//------------------------------------------------------------
function address_helper(item) {
  var item_hash;
  var item_list = [];
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  for (let i = 0; i < item.item.localizedAddresses.length; i++) {

    var item_pobox;
    if (item.item.localizedAddresses[i].reportedAddress.poBox === undefined) {
      item_pobox = ""
    } else {
      item_pobox = item.item.localizedAddresses[i].reportedAddress.poBox
    }

    var item_geocode;
    try{
      item_geocode = item.item.geoClassifications.filter((obj) => obj.type === "1")[0].code
      
    } catch (e) {
      item_geocode = ""
    }

    var item_county;
    if (item.item.localizedAddresses[i].reportedAddress.county === undefined) {
      item_county = ""
    } else {
      item_county = item.item.localizedAddresses[i].reportedAddress.county
    }

    var item_phoneNumbers;
    if (item.item.localizedAddresses[i].reportedAddress.phoneNumbers === undefined) {
      item_phoneNumbers = ""
    } else {
      item_phoneNumbers = item.item.localizedAddresses[i].reportedAddress.phoneNumbers.join(', ')
    }

    var item_faxNumbers;
    if (item.item.localizedAddresses[i].reportedAddress.faxNumbers === undefined) {
      item_faxNumbers = ""
    } else {
      item_faxNumbers = item.item.localizedAddresses[i].reportedAddress.faxNumbers.join(', ')
    }

    var item_postCode;
    if (item.item.localizedAddresses[i].reportedAddress.postCode === undefined) {
      item_postCode = ""
    } else {
      item_postCode = item.item.localizedAddresses[i].reportedAddress.postCode
    }

    var item_city;
    if (item.item.localizedAddresses[i].reportedAddress.city === undefined) {
      item_city = ""
    } else {
      item_city = item.item.localizedAddresses[i].reportedAddress.city
    }

    var item_addressLines;
    if (item.item.localizedAddresses[i].reportedAddress.addressLines === undefined) {
      item_addressLines = ""
    } else {
      item_addressLines = item.item.localizedAddresses[i].reportedAddress.addressLines.join(', ')
    }

    var item_language;
    if (item.item.localizedAddresses[i].language === undefined) {
      item_language = ""
    } else {
      item_language = item.item.localizedAddresses[i].language
    }

    var item_countryISO2;
    if (item.item.countryISO2 === undefined) {
      item_countryISO2 = ""
    } else {
      item_countryISO2 = item.item.countryISO2
    }

    item_list.push([item.item.types[0], item_hash, [item.item.types[0], item_addressLines, item_city, item_countryISO2, item_phoneNumbers, item_language,
      item_pobox, item_postCode, item_faxNumbers, item_geocode, item_county], item.remediationAction]);
    
  }
  //  console.log('itemlist: ', item_list)
  return item_list;
}

let sortedAddresses = [...selectedCompany.value.addresses].sort((a, b) =>
  Number(a?.item?.types?.[0] ?? 0) - Number(b?.item?.types?.[0] ?? 0)
);

//  console.log('sortedAddresses: ', sortedAddresses)


//  let address_hash = addresses && selectedCompany.value.addresses.flatMap(address_helper)

let address_hash = sortedAddresses.flatMap(address_helper)

//  address_hash = address_hash.flat();

masterDict.address = address_hash;

//------------------------------------------------------------
function company_name_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() == "ii");

  if (typeof(localizedItem) != 'undefined'){
    var item_list = [item.item.type, item_hash, localizedItem.name, item.remediationAction]
    
    return item_list;
  }
}

let company_name = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "1" && item.item.localizedNames.some(loc => loc.language.toLowerCase() == "ii")).map(company_name_helper);

masterDict.company_name = company_name;

//------------------------------------------------------------
function company_name_local_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() != "ii");

  if (typeof(localizedItem) != 'undefined'){
    var item_list = [item.item.type, item_hash, [localizedItem.name, localizedItem.language], item.remediationAction]
    
    return item_list;
  }
}
let company_name_local = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "1" && item.item.localizedNames.some(loc => loc.language.toLowerCase() != "ii")).map(company_name_local_helper);

//  let company_name_local = (selectedCompany?.value?.names ?? [])
    //  .filter(item => item?.item?.type === "1" && item?.item?.localizedNames?.language?.toLowerCase() !== "ii").map(company_name_local_helper);

masterDict.company_name_local = company_name_local;

//------------------------------------------------------------
function prev_name_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() == "ii");

  if (typeof(localizedItem) != 'undefined'){

    var item_list = [item.item.type, item_hash, [localizedItem.name, item.item.dateSince ? moment.utc(item.item.dateSince, "YYYY-MM-DD").format('DD-MM-YYYY').toString() != 'Invalid date' ? moment.utc(item.item.dateSince, "YYYY-MM-DD").format('DD-MM-YYYY').toString() : '' : '', item.item.dateUntil ? moment.utc(item.item.dateUntil, "YYYY-MM-DD").format('DD-MM-YYYY').toString() != 'Invalid date' ? moment.utc(item.item.dateUntil, "YYYY-MM-DD").format('DD-MM-YYYY').toString() : '' : ''], item.remediationAction]
    return item_list;
  }
}


let prev_name = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "3" && item.item.localizedNames.some(loc => loc.language.toLowerCase() == "ii")).map(prev_name_helper).sort((a, b) => {
        // Convert dates to moment objects upfront
        const dateA = a[2][2] ? moment(a[2][2], "DD-MM-YYYY") : null;
        const dateB = b[2][2] ? moment(b[2][2], "DD-MM-YYYY") : null;

        //  console.log("A: ", dateA, " | B: ", dateB)
        //  console.log("Diff: ", dateB.diff(dateA))
        
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
            const sinceA = a[2][1] ? moment(a[2][1]) : null;
            const sinceB = b[2][1] ? moment(b[2][1]) : null;
            
            if (sinceA && sinceB) {
                return sinceB.diff(sinceA);
            }
            
            // Handle missing dateSince values
            if (!sinceA && sinceB) return 1;
            if (sinceA && !sinceB) return -1;
        }
        
        return 0;
    });

masterDict.prev_name = prev_name;

//------------------------------------------------------------
function prev_name_local_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  
  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() != "ii");

  if (typeof(localizedItem) != 'undefined'){
    var item_list = [item.item.type, item_hash, localizedItem.name, item.remediationAction]
    
    return item_list;
  }
}

let prev_name_local = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "3" && item.item.localizedNames.some(loc => loc.language.toLowerCase() != "ii")).map(prev_name_local_helper);

masterDict.prev_name_local = prev_name_local;

//------------------------------------------------------------
function aka_name_helper(item) {
  
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  
  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() == "ii");

  if (typeof(localizedItem) != 'undefined'){
    var item_list = [item.item.type, item_hash, localizedItem.name, item.remediationAction]
    
    return item_list;
  }
}


let aka_name = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() == "ii")).map(aka_name_helper);

masterDict.aka_name = aka_name;

//------------------------------------------------------------
function aka_name_local_helper(item) {
  console.log("item: ", item)
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  
  const localizedItem = item.item.localizedNames.find(localName => localName.language.toLowerCase() != "ii");

  if (typeof(localizedItem) != 'undefined'){
  
    var item_list = [item.item.type, item_hash, localizedItem.name, item.remediationAction]
    
    return item_list;
  }
}


let aka_name_local = selectedCompany.value.names && selectedCompany.value.names.filter(item => item.item.type === "2" && item.item.localizedNames.some(loc => loc.language.toLowerCase() != "ii")).map(aka_name_local_helper);

masterDict.aka_name_local = aka_name_local;

//------------------------------------------------------------
function website_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  var item_list = [item.item.type, item_hash, item.item.value, item.remediationAction]
  return item_list;
}

let Websites_hash = selectedCompany.value.digitalPresences && selectedCompany.value.digitalPresences.filter(item => item.item.type === '1').map(website_helper);

masterDict.website = Websites_hash;

//------------------------------------------------------------
function email_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  var item_list = [item.item.type, item_hash, item.item.value, item.remediationAction]
  return item_list;
}

let email_hash = selectedCompany.value.digitalPresences && selectedCompany.value.digitalPresences.filter(item => item.item.type === '2').map(email_helper);

masterDict.email = email_hash;

//------------------------------------------------------------
function identifier_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }
  var item_list = [item.item.type, item_hash, item.item.id, item.remediationAction]
  return item_list;
}

let identifier = selectedCompany.value.identifiers && selectedCompany.value.identifiers.filter(item => item.item.type != '115' && item.item.type !== '992').sort((a, b) => {
    // First, move REMEDIATED items to the end
    if (a.source === "REMEDIATED" && b.source !== "REMEDIATED") return 1;
    if (b.source === "REMEDIATED" && a.source !== "REMEDIATED") return -1;

    // Then sort by type in ascending order
    return parseInt(a.item.type) - parseInt(b.item.type);
}).map(identifier_helper);

//  console.log("Identifier: ", identifier)

//  identifier = identifier.sort((a, b) => {
//      // First, move REMEDIATED items to the end
//      if (a.source === "REMEDIATED" && b.source !== "REMEDIATED") return 1;
//      if (b.source === "REMEDIATED" && a.source !== "REMEDIATED") return -1;

//      // Then sort by type in ascending order
//      return parseInt(a.item.type) - parseInt(b.item.type);
//  })

masterDict.identifier = identifier;

//------------------------------------------------------------
function business_description_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  var item_list
  try {

    item_list = [item.item.type, item_hash, [(LanguagesList.value.filter((obj) => {
      return obj.Language_code_ISO_639_1.toLocaleLowerCase() === item.item.language.toLocaleLowerCase()
    })[0].Language_code_ISO_639_1), item.item.value], item.remediationAction]

  } catch (e) {

    item_list = [item.item.type, item_hash, [undefined, item.item.value], item.remediationAction]
  }

  return item_list;
}

let busi_desc = selectedCompany.value.activityDescriptions && selectedCompany.value.activityDescriptions.filter(item => item).map(business_description_helper);

masterDict.business_description = busi_desc;

//------------------------------------------------------------

function entity_info_helper(item) {
  var item_hash;
  if (item.remediatedItemHash === null) {
    item_hash = item.itemObjectHash
  } else {
    item_hash = item.remediatedItemHash
  }

  var item_value = {}
  var temp

  try {
    temp = [item.item.type, item_hash, item.item.standardizedLegalForm]
    item_value.standard = temp
  } catch {
    // No Standard Legal Form Found
  }
  try {
    temp = [item.item.type, item_hash, item.item.nationalLegalForm]
    item_value.national = temp
  } catch {
    // No nation Legal Form Found
  }
  try {
    temp = [item.item.type, item_hash, item.item.stateOfIncorporation]
    item_value.state_incorp = temp
  } catch {
    // No state of incorp Found
  }

  var incorp_day = ''
  var incorp_month = ''
  var incorp_year = ''
  
  try {
    incorp_day = String(selectedCompany.value.entityInfo.item.incorporationDatePrecision > 10 ? new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCDate() : '')
  } catch {
    // No Incorp Date - day  Found
  }
  try {
    incorp_month = String(selectedCompany.value.entityInfo.item.incorporationDatePrecision > 9 ? (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() < 9 ? '0' + (new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1) : new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCMonth() + 1 ) : '')
  } catch {
    // No Incorp Date - month  Found
  }

  try {
    incorp_year = new Date(selectedCompany.value.entityInfo.item.incorporationDate).getUTCFullYear()
  } catch {
    // No Incorp Date - year  Found
  }

  //  console.log("incorp_day: ", incorp_day)
  //  console.log("incorp_month: ", incorp_month)
  //  console.log("incorp_year: ", incorp_year)

  
  try {
    
    var incorp_date = (incorp_year? (incorp_month? (incorp_day? String(incorp_year)+"-"+String(incorp_month)+"-"+String(incorp_day).padStart(2, '0') : String(incorp_year)+"-"+String(incorp_month)) : String(incorp_year)) : null)

    temp = [item.item.type, item_hash, incorp_date];
    item_value.incorp_date = temp;
  } catch {
    // No Incorp Date -  Found
  }
  //  var item_list = [item.item.type, item_hash, item_value]
  return item_value;
}

let entity_info = entity_info_helper(selectedCompany.value.entityInfo);

masterDict.entity_info = entity_info;

//------------------------------------------------------------

masterRecordAllAttributeHashDict.setValue(masterDict);