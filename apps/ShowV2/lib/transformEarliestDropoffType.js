// Reference external variables with curly brackets or using JS variables
const scanTraitsData = {{ queryShipmentScanTraits.data }};

let earliestDropoffType = "None";

const timestamps = [
  scanTraitsData.SELLER_PHOTO_TIMESTAMP[0],
  scanTraitsData.KIOSK_TIMESTAMP[0],
  scanTraitsData.MANIFEST_TIMESTAMP[0],
  scanTraitsData.ACCEPTANCE_TIMESTAMP[0],
  scanTraitsData.TRANSIT_GENERAL_TIMESTAMP[0]
].filter(Boolean);

const earliestDropoffTimestamp = timestamps.sort()[0];

switch (earliestDropoffTimestamp) {
  case scanTraitsData.SELLER_PHOTO_TIMESTAMP[0]:
    earliestDropoffType = 'Seller Photo';
    break;
  case scanTraitsData.KIOSK_TIMESTAMP[0]:
    earliestDropoffType = 'Kiosk';
    break;
  case scanTraitsData.MANIFEST_TIMESTAMP[0]:
    earliestDropoffType = 'Carrier Manifest';
    break;
  case scanTraitsData.ACCEPTANCE_TIMESTAMP[0]:
    earliestDropoffType = 'Carrier Acceptance';
    break;
  case scanTraitsData.TRANSIT_GENERAL_TIMESTAMP[0]:
    earliestDropoffType = 'Carrier Transit Scan';
    break;
}

return {
  dropoffType: earliestDropoffType,
  dropoffTimestamp: earliestDropoffTimestamp,
}