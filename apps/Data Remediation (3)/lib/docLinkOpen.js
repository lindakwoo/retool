documentPageTitle.setValue("### Select Linked Document")
clearLinkButton.setHidden(false)

documentManagement.show()
  
//  var kompany_flag = false
//  if (entityMetadataList.value.length > 0){
//    for (var item of entityMetadataList.value){
//      //  console.log("Item: ", item)
//      if (item.remediation_verification_source == 'kompany_api'){
//        //  console.log("kompany_api found")
//        kompany_flag = true
//      }
//    }
//  }
//  linkKompanyAPIButton.setHidden(kompany_flag)

setTimeout(() => {
  console.log("Delay doc highlight for 100 ms.");
  var idx
  var icon_list = linkingIconLinkDict.value
    
    for (var item_hash in icon_list[linkAttributeItem.value.attribute_flag]){
      var item_2 = icon_list[linkAttributeItem.value.attribute_flag][item_hash]
      //  console.log("Item: ", item_2);
      if (item_2.ItemObjectHash == linkAttributeItem.value.ItemObjectHash){
        console.log("MATCH")
        if (item_2.doc_id != 'kompany_api'){
          idx = entityMetadataTable.data.findIndex(ele => ele.doc_id === item_2.doc_id)
        } else {
          idx = entityMetadataTable.data.findIndex(ele => ele.remediation_verification_source === item_2.doc_id)
        }
        continue
      }
    }
  
  if (idx != undefined){
    //  console.log("Idx: ", idx)
    //  entityTableIndex.setValue(idx)
    entityMetadataTable.selectRow({mode: 'index', indexType: 'data', index: idx})
  } else {
    entityMetadataTable.clearSelection()
  }
}, 300);

