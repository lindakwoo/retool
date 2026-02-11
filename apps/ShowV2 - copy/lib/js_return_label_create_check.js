console.log(createWithShippoRate?.data)
if (createWithShippoRate?.data?.data?.detail?.startsWith("You cannot request return shipment with refund for order that already has return shipment") ?? false){
    utils.showNotification({
      title: "Some retund requests have already a return shipment",
      description: createWithShippoRate.data.data.detail,
      notificationType: "error",
      duration: 5000
    });
    c_override_existing_shipment.setHidden(false)
  }
else {
  console.log(createWithShippoRate?.data)
}