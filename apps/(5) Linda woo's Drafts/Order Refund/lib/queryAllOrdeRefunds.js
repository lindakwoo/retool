function to_pretty_text(text) {
  return text.toLowerCase()
    .replace (/^[-_]*(.)/, (_, c) => c.toUpperCase())
    .replace (/[-_]+(.)/g, (_, c) => ' ' + c.toUpperCase())
}

orderRefunds.setValue({})

let tempRefunds = [] 
let triggers = []
let errors = []
ordersInShipment.value.forEach((row) => {
  if (row.order_id) {
    triggers.push(
      queryOrderRefunds.trigger({
        additionalScope: {
          orderIdParam: row.order_id
        },
        onFailure: err => errors.push(err),
      })
    );    
  }
});


let responses = await Promise.all(triggers);
for (const i in responses) {
  let data = responses[i];
  if(data) {
    tempRefunds.push(...data);
  }
}

tempRefunds.forEach(refund => refund.refund_reason_pretty = to_pretty_text(refund.refund_reason));
orderRefunds.setValue(tempRefunds);

if (errors.length > 0) {
  errors.forEach(err => console.log(err));
  throw new Error("Could not get all order refunds. Check consoloe log.")
}
