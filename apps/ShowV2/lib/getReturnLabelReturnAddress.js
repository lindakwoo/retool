let isDomesticUS = {{queryShipment.data.shippo_data?.to_address?.country === 'US'}};
if (isDomesticUS === true) {
  return {
    'city': 'Scottsdale',
    'company': 'Whatnot Inc',
    'country': 'US',
    'email': 'tony@whatnot.com',
    'name': 'Whatnot Inc',
    'phone': '5629910364', 
    'state': 'AZ',
    'street1': '8175 E Evans Rd, Unit 13330',
    'street2': '',
    'zip': '85267'
  };
}

return {{
  queryShipment.data.shippo_data?.to_address || ({
    city: queryRecord.data.shipping_address.city,
    country: queryRecord.data.shipping_address.country_code,
    email: 'tony@whatnot.com',
    name: queryRecord.data.shipping_address.full_name,
    phone: '5629910364',
    state: queryRecord.data.shipping_address.state,
    street1: queryRecord.data.shipping_address.line1,
    street2: queryRecord.data.shipping_address.line2,
    zip: queryRecord.data.shipping_address.postal_code,
  })
}};
