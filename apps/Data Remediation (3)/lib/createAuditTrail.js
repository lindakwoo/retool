var audit_item = AuditTrailList.value
var linked_fields = sessionLinkedFields.value
console.log("Links Before Audit Trail Creation: ", linked_fields)

console.log("Audit Item: ", audit_item)

var create_payload = []
var save_id = uuid.v4()

var temp_ticket_id = ""
if (typeof audit_item.ticket_id == 'undefined') {
  temp_ticket_id = ""
} else {
  temp_ticket_id = audit_item.ticket_id
}


for (var item of audit_item.items) {
  //  console.log("Item: ", item)
  var doc_id = ""

  if (item.remediation_action.toLowerCase() == 'new'){
    for (var doc in linked_fields) {
      //  console.log("Doc: ", doc)
      for (var doc_list_item of linked_fields[doc]) {
      //  console.log("doc_list_item: ", doc_list_item)
        if (item.label == doc_list_item.label && doc_list_item.remediation_action.toLowerCase() == 'new') {
            doc_id = doc
          }
        
        //  if (!['email','website','identifier'].includes(item.label)){
        //    if (item.label == doc_list_item.label && doc_list_item.remediation_action != 'DELETE') {
        //      doc_id = doc
        //    }
        //  } else {
        //    if (item.label == doc_list_item.label && ("new-"+item.iteration) == doc_list_item.iteration && doc_list_item.remediation_action != 'DELETE') {
        //      doc_id = doc
        //    }
        //  }
      }
    }


  } else {
    for (var doc in linked_fields) {
      //  console.log("Doc: ", doc)
      for (doc_list_item of linked_fields[doc]) {
      //  console.log("doc_list_item: ", doc_list_item)
        if (doc_list_item.ItemObjectHash == item.item_hash){
          doc_id = doc
        }
      }
    }
  }
  

    create_payload.push({
      "entity_id" : audit_item.entity_id,
      "orbis_id" : audit_item.orbis_id,
      "bvd_id" : audit_item.bvd_id,
      "ticket_id" : temp_ticket_id,
      "save_id" : save_id,
      "remediated_action" : item.remediation_action,
      "field_path" : item.field_path,
      "item_hash" : item.item_hash,
      "new_value" : item.new_value,
      "prev_value" : item.prev_value,
      "doc_id" : doc_id,
      "user_id" : audit_item.user_id,
      "object_type" : audit_item.object_type,
      "source" : audit_item.source
      })
    
  
}
auditItem.setValue(create_payload)
console.log("Create AuditTrail Payload: ", create_payload)


CreateAuditTrail.trigger()
//  AuditTrailList.setValue({})