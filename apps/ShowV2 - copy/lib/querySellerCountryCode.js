const countryCode =  queryRecord.data.items[0].listing.owner.home_address.country_code

const lookupTable = {
  US: "US",
  CA: "CA",
  GB: "UK",
  UK: "UK",
}

return lookupTable[countryCode]