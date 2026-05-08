/*
https://retool.com/components/table
changeSet: An object representing changes to an editable table. Each key is a table index for changed rows, and each value is an object whose key is the changed column and value is the changed value.
*/
let changes = Object.entries(tableShipmentsRefund.changeSet);
let data = tableShipmentsRefund.data;

/*
Pasting here the columns to get a sense of what's what:
let subtotal_cents = items[i].amount_charged_cents;
let total_cents = items[i].amount_charged_cents + items[i].taxes_cents + items[i].shipping_price_cents;
    
    "subtotal_cents": subtotal_cents,
    "taxes_cents": items[i].taxes_cents,
    "shipping_price_cents": items[i].shipping_price_cents,
    "total_cents": total_cents,
    "user_refund_amount" : total_cents,                                              // Editable, default to total_cents
    "user_refund_subtotal_percentage" : total_cents / subtotal_cents,                // Editable
    "user_refund_total_percentage" : 1.00,                                           // Editable, default to 1 (100%)
*/

changes.forEach(change => {
  // Notes:
  // change[1].user_refund_subtotal_percentage and user_refund_total_percentage is b/w [0,1] (e.g. 0.25)
  // change[1].user_refund_amount is in USD (e.g. 34.52)
  if ('user_refund_amount' in change[1]) {  // REQ Refund Amount has changed
    data[change[0]].user_refund_amount = change[1].user_refund_amount * 100;
    data[change[0]].user_refund_subtotal_percentage = ((change[1].user_refund_amount * 100) / (data[change[0]].subtotal_cents * 100)) * 100;
    data[change[0]].user_refund_total_percentage = ((change[1].user_refund_amount * 100) / (data[change[0]].total_cents * 100)) * 100;
  }
  else if ('user_refund_subtotal_percentage' in change[1]) {   // REQ Subtotal Refund % has changed
    data[change[0]].user_refund_amount = ((data[change[0]].subtotal_cents * 100) * (change[1].user_refund_subtotal_percentage)) / 100;
    data[change[0]].user_refund_subtotal_percentage = change[1].user_refund_subtotal_percentage;
    data[change[0]].user_refund_total_percentage = ((data[change[0]].user_refund_amount * 100) / (data[change[0]].total_cents)) / 100;
  }
  else if ('user_refund_total_percentage' in change[1]) {   // REQ Total Refund % has changed
    data[change[0]].user_refund_amount = ((data[change[0]].total_cents * 100) * (change[1].user_refund_total_percentage)) / 100;
    data[change[0]].user_refund_subtotal_percentage = ((data[change[0]].user_refund_amount * 100) / (data[change[0]].subtotal_cents)) / 100;
    data[change[0]].user_refund_total_percentage = change[1].user_refund_total_percentage;
  }
});

tableShipmentsRefund.setData(data); // Commit changes
return data;
