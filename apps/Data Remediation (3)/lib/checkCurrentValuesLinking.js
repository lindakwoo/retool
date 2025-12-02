var link_dict = masterRecordLinkedRemFields.value;
var icon_list = iconHiddenFlag.value;

var address_list = addressListView.data
var aka_name_list = akaNames.value
var aka_name_local_list = akaLocalNames.value
var company_name_list = CompanyNames.value
var company_name_local_list = CompanyLocalNames.value
var email_list = Emails.value
var new_email_list = NewEmails.value
var identifier_list = CurIdentifiers.value
var new_identifier_list = NewIdentifiersValues.value
var prev_name_list = prevNames.value
var prev_name_local_list = prevLocalNames.value
var website_list = Websites.value
var new_website_list = NewWebsites.value
var business_description_list = BusinessDescriptionsVariableList.value

for (var doc_id in link_dict){
  var doc_list = link_dict[doc_id]
  //  console.log("Key: ", doc_id)
  var i = 0
  for (var row of doc_list){
    var new_iter
    var temp_iter
    if ((row.iteration).toString().includes('-')){
      new_iter = row.iteration.split('-')[1]
      console.log("new-iter: ", new_iter)
    }
    console.log("Row: ", row)
    if (row.label == 'company_name'){
      if(row.iteration == 'new' && newCompanyName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.company_name['new']
        //  console.log(row.iteration, ' new company_name deleted')
      } else if (row.iteration != 'new' && row.prev_value == company_name_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' company_name changed back to original')
      }
    } else if (row.label == 'company_name_local'){
      if(row.iteration == 'new' && newCompanyLocalName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.company_name_local['new']
        //  console.log(row.iteration, ' new company_name_local deleted')
      } else if (row.iteration != 'new' && row.prev_value == company_name_local_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' company_name_local changed back to original')
      }
    } else if (row.label == 'prev_name'){
      if(row.iteration == 'new' && newPrevName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.prev_name['new']
        //  console.log(row.iteration, ' new prev_name deleted')
      } else if (row.iteration != 'new' && row.prev_value == prev_name_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' prev_name changed back to original')
      }
    } else if (row.label == 'prev_name_local'){
      if(row.iteration == 'new' && newPrevLocalName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.prev_name_local['new']
        //  console.log(row.iteration, ' new prev_name_local deleted')
      } else if (row.iteration != 'new' && row.prev_value == prev_name_local_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' prev_name_local changed back to original')
      }
    } else if (row.label == 'aka_name'){
      if(row.iteration == 'new' && newAkaName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.aka_name['new']
        //  console.log(row.iteration, ' new aka_name deleted')
      } else if (row.iteration != 'new' && row.prev_value == aka_name_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
      }
    } else if (row.label == 'aka_name_local'){
      if(row.iteration == 'new' && newAkaLocalName.value == ""){
        link_dict[doc_id].splice(i, 1);
        delete icon_list.aka_name_local['new']
        //  console.log(row.iteration, ' new aka_name_local deleted')
      } else if (row.iteration != 'new' && row.prev_value == aka_name_local_list[row.iteration].trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' aka_name_local changed back to original')
      }
    } else if (row.label == 'website'){
      //  console.log('existing: ', website_list)
      //  console.log('new: ', new_website_list)
      if(row.iteration.includes('new') && new_website_list[new_iter] == ""){
        link_dict[doc_id].splice(i, 1);
        temp_iter = 'new-'+new_iter
        delete icon_list.website[temp_iter]
        console.log(row.iteration, ' new website deleted')
      } else if (!row.iteration.includes('new') && row.prev_value == website_list[row.iteration].item.value.trim()){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' website changed back to original')
      }
    } else if (row.label == 'email'){
      if((row.iteration).toString().includes('new') && new_email_list[new_iter] == ""){
        link_dict[doc_id].splice(i, 1);
        temp_iter = 'new-'+new_iter
        delete icon_list.email[temp_iter]
        console.log(row.iteration, ' new email deleted')
      } else if (!(row.iteration).toString().includes('new') && row.prev_value == email_list[row.iteration]){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' email changed back to original')
      }
    } 
    else if (row.label == 'identifier'){
      //  console.log('existing: ', identifier_list)
      //  console.log('new: ', new_identifier_list)
      if(row.iteration.includes('new') && new_identifier_list[row.type] == ""){
        link_dict[doc_id].splice(i, 1);
        temp_iter = 'new-'+new_iter
        delete icon_list.identifier[temp_iter]
        console.log(row.iteration, ' new identifier deleted')
      } else if (!row.iteration.includes('new') && row.prev_value == identifier_list[row.iteration]){
        row.curr_value = row.prev_value;
        console.log(row.iteration, ' email identifier back to original')
      }
    //  else if (row.label == 'identifier' && row.remediation_action != 'NEW'){
    //    if (row.prev_value == identifier_list[row.iteration].item.id.trim()){
    //      row.curr_value = row.prev_value;
    //      console.log(row.iteration, ' identifier changed back to original')
    //    }
    } 
    else if (row.label == 'address'){
      //  console.log("Delete Flag: ", deleteFlag[row.iteration].value)
      //  console.log("Addr item: ", address_list[row.iteration])

      
      if (row.remediation_action == 'DELETE' && deleteFlag[row.iteration].value == false){
        row.remediation_action = 'OVERWRITE'
        row.curr_value = row.prev_value
        //  console.log(row.iteration, ' address un-deleted back to original')
      } else if (row.remediation_action != 'NEW' && deleteFlag[row.iteration].value == false && address_list[row.iteration].addressType == row.prev_value[0] &&
              address_list[row.iteration].addressLine.trim() == row.prev_value[1] &&
              address_list[row.iteration].city.trim() == row.prev_value[2] &&
              address_list[row.iteration].countryISO == row.prev_value[3] &&
              address_list[row.iteration].phoneNumber.trim() == row.prev_value[4] &&
              address_list[row.iteration].addressLanguage == row.prev_value[5] &&
              address_list[row.iteration].poBox.trim() == row.prev_value[6] && 
              address_list[row.iteration].postCode.trim() == row.prev_value[7] &&
              address_list[row.iteration].faxNumber.trim() == row.prev_value[8] ){
        row.curr_value = row.prev_value;
        //  console.log(row.iteration, ' address changed back to original')
      } 
    }
    else if (row.label == 'business_description'){
      //  console.log("Delete Flag: ", deleteFlag[row.iteration].value)
      //  console.log("Addr item: ", address_list[row.iteration])

      
      if (row.remediation_action == 'DELETE' && business_description_list[row.iteration].deleteFlag == false){
        row.remediation_action = 'OVERWRITE'
        row.curr_value = row.prev_value
        //  console.log(row.iteration, ' address un-deleted back to original')
      } else if (row.remediation_action != 'NEW' && business_description_list[row.iteration].deleteFlag == false && business_description_list[row.iteration].language == row.prev_value[0] &&
              business_description_list[row.iteration].value == row.prev_value[1] ){
        row.curr_value = row.prev_value;
        console.log(row.iteration, ' business description changed back to original')
      } 
    } else if (row.label = 'entity_info'){
      try{
        original_date = masterRecordAllAttributeHashDict.value.entity_info.incorp_date[2]
        } catch {
          //no original date
          if (IncorporationDate.value == ""){
            delete icon_list.entity_info.incorp_date
            console.log(row.iteration, ' new incorp date deleted')
          }
        }
      }
    }
    i +=1
  }


console.log('Original Value Check')
console.log('Post Check Master Link Dict: ', link_dict)
masterRecordLinkedRemFields.setValue(link_dict);
console.log('Post Check Icon Link Dict: ', icon_list)
iconHiddenFlag.setValue(icon_list);