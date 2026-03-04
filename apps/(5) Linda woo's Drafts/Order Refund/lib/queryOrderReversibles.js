let errors = []
let orders = ordersInShipment.value;
let triggers = []

orders.forEach((order) => {
  triggers.push(
      queryReversibles.trigger({
        additionalScope: {
          orderIdParam: order.order_id
        },
        onFailure: (err) => {errors.push(err)},
        onSuccess: (reversibles) => {
          order.reversibles=reversibles;
        } 
      })
  )
});

await Promise.all(triggers);
ordersInShipment.setValue(orders);
return null