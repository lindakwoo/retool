select sp.weight_amount, sp.weight_scale from shipment_items si
join shipping_profiles sp on sp.id = si.shipping_profile_id
where 1=1
and si.shipment_id={{ queryShipment?.data?.id }}
limit 100