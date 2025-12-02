var unlinked_attributes = unlinkedAttributesToLink.value
unlinked_attributes.addresses = []


i = 0;
for (let address_item of AddressesListEdited.value){
  //  console.log("i: ", i)

  //  address_item = address_item.data
  //  console.log("address_item: ", address_item)
  var item_county = ""
  if (address_item.county === undefined) {
    item_county = ""
  } else {
    item_county = address_item.county
  }

  var item_addressLine = ""
  if (address_item.addressLine === undefined) {
    item_addressLine = ""
  } else {
    item_addressLine = address_item.addressLine
  }

  var item_addressLanguage = ""
  if (address_item.addressLanguage === undefined) {
    item_addressLanguage = ""
  } else {
    item_addressLanguage = address_item.addressLanguage
  }

  var item_city = ""
  if (address_item.city === undefined) {
    item_city = ""
  } else {
    item_city = address_item.city
  }

  var item_countryISO = ""
  if (address_item.countryISO === undefined) {
    item_countryISO = ""
  } else {
    item_countryISO = address_item.countryISO
  }

  var item_faxNumber = ""
  if (address_item.faxNumber === undefined) {
    item_faxNumber = ""
  } else {
    item_faxNumber = address_item.faxNumber
  }

  var item_phoneNumber = ""
  if (address_item.phoneNumber === undefined) {
    item_phoneNumber = ""
  } else {
    item_phoneNumber = address_item.phoneNumber
  }

  var item_poBox = ""
  if (address_item.poBox === undefined) {
    item_poBox = ""
  } else {
    item_poBox = address_item.poBox
  }

  var item_postCode = ""
  if (address_item.postCode === undefined) {
    item_postCode = ""
  } else {
    item_postCode = address_item.postCode
  }

  var item_regionGeoCode = ""
  if (address_item.regionGeoCode === undefined) {
    item_regionGeoCode = ""
  } else {
    item_regionGeoCode = address_item.regionGeoCode
  }

  var item_state = ""
  if (address_item.state === undefined) {
    item_state = ""
  } else {
    item_state = address_item.state
  }

  var item_county = ""
  if (address_item.county === undefined) {
    item_county = ""
  } else {
    item_county = address_item.county
  }
  
try{
  
  //  console.log("masterRecordAllAttributeHashDict.value.address[i]: ", masterRecordAllAttributeHashDict.value.address[i][2])
  //  console.log("address_item iconflag: ", iconHiddenFlag.value.address[i][1])
  
  if ( (((address_item.addressType == masterRecordAllAttributeHashDict.value.address[i][2][0] &&
  item_addressLine == masterRecordAllAttributeHashDict.value.address[i][2][1] &&
  item_city == masterRecordAllAttributeHashDict.value.address[i][2][2] &&
  item_countryISO == masterRecordAllAttributeHashDict.value.address[i][2][3] &&
  item_phoneNumber == masterRecordAllAttributeHashDict.value.address[i][2][4] &&
  item_addressLanguage == masterRecordAllAttributeHashDict.value.address[i][2][5] &&
  item_poBox == masterRecordAllAttributeHashDict.value.address[i][2][6] && 
  item_postCode == masterRecordAllAttributeHashDict.value.address[i][2][7] &&
  item_faxNumber == masterRecordAllAttributeHashDict.value.address[i][2][8] &&
  item_regionGeoCode == masterRecordAllAttributeHashDict.value.address[i][2][9] && 
  item_county == masterRecordAllAttributeHashDict.value.address[i][2][10]) 
  
  ||
  
  (address_item.addressType == masterRecordAllAttributeHashDict.value.address[i][2][0] &&
  item_addressLine == "" &&
  item_city == "" &&
  item_countryISO == "" &&
  item_phoneNumber == "" &&
  item_addressLanguage == "" &&
  item_poBox == "" && 
  item_postCode == "" &&
  item_faxNumber == "" &&
  item_regionGeoCode == "" &&
  item_county == "")) && AddressDeleteFlags.value[i] == false) ) {
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Addresses')
    if (AddressDeleteFlags.value[i] == false){
      unlinked_attributes.addresses.push({"iteration":i,"new_value":[address_item.addressType, item_addressLine.trim(), item_city.trim(), item_countryISO, item_phoneNumber.trim(), item_addressLanguage, item_poBox.trim(), item_postCode.trim(), item_faxNumber.trim(), item_regionGeoCode.trim(), item_county.trim()], "attribute_flag":"address","ItemObjectHash":masterRecordAllAttributeHashDict.value.address[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.address[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.address[i][3] == 'RECREATE' ? "recreate" : "update"})
    } else {
      unlinked_attributes.addresses.push({"iteration":i,"new_value":["","","","","","","","","",""],"attribute_flag":"address","ItemObjectHash":masterRecordAllAttributeHashDict.value.address[i][1],"remediation_action":"delete"})
    }
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Addresses')
  if (AddressDeleteFlags.value[i] == false){
      unlinked_attributes.addresses.push({"iteration":i,"new_value":[address_item.addressType, item_addressLine.trim(), item_city.trim(), item_countryISO, item_phoneNumber.trim(), item_addressLanguage, item_poBox.trim(), item_postCode.trim(), item_faxNumber.trim(), item_regionGeoCode.trim(), item_county.trim()], "attribute_flag":"address","ItemObjectHash":masterRecordAllAttributeHashDict.value.address[i][1],"remediation_action":masterRecordAllAttributeHashDict.value.address[i][3] == 'NEW' || masterRecordAllAttributeHashDict.value.address[i][3] == 'RECREATE' ? "recreate" : "update"})
    } else {
      unlinked_attributes.addresses.push({"iteration":i,"new_value":["","","","","","","","","",""],"attribute_flag":"address","ItemObjectHash":masterRecordAllAttributeHashDict.value.address[i][1],"remediation_action":"delete"})
    }
  }
  i+=1
}

try{
    
  if ((newAddressType.value == null || language2.value == null || country2.value == null ) ){
    //  console.log("1")
  } else {
    //  console.log("1-2")
    //flag = true
    //  unlinked_attributes_msg.push('Addresses')
    unlinked_attributes.addresses.push({"type":newAddressType.value,"iteration":"new","new_value":[newAddressType.value,addressLine2.value.trim(),city2.value.trim(),countryISO2.value,phoneNumber2.value,language2.value,poBox2.value.trim(),postCode2.value.trim(),faxNumber2.value.trim(),regionGeoCode2.value, county3.value.trim()],"attribute_flag":"address","remediation_action":"create"})
  } 
} catch (e){
  //  console.log("2")
  //flag = true //Icon is visible
  //  unlinked_attributes_msg.push('Addresses')
  unlinked_attributes.addresses.push({"type":newAddressType.value,"iteration":"new","new_value":[newAddressType.value,addressLine2.value.trim(),city2.value.trim(),countryISO2.value,phoneNumber2.value,language2.value,poBox2.value.trim(),postCode2.value.trim(),faxNumber2.value.trim(),regionGeoCode2.value, county3.value.trim()],"attribute_flag":"address","remediation_action":"create"})
}

//  console.log("DISABLE FLAG: ", flag)


unlinkedAttributesToLink.setValue(unlinked_attributes)