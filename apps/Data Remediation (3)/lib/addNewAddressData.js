var new_addr_item = {
    'types': [newAddressType.value],
    'flags': [],
    'countryISO2': countryISO2.value,
    'geoClassifications': [{
        type: "1",
        code: regionGeoCode2.value
    }],
    "localizedAddresses": [{
        'language': language2.value,
        "alphabet": "",
        "reportedAddress": {
            'addressLines': addressLine2.value.split(', '),
            'postCode': postCode2.value || '',
            'poBox': poBox2.value || '',
            'city': city2.value || '',
            'phoneNumbers': phoneNumber2.value.split(', '),
            'faxNumbers': faxNumber2.value.split(', '),
            'language': language2.value,
            "county": county3.value ? county3.value : ""
        }
    }],
};

// Push to the GlobalAddAddress array
GlobalAddAddress.setValue([new_addr_item]);
console.log("GlobalAddAddress",GlobalAddAddress)
