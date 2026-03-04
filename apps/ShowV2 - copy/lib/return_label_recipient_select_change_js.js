const FR_EZI_ADDRESS = {
  id: "fr_ezi",
  street1: "70 Avenue Jean Jaurès",
  street2: "",
  city: "Bagnères de Luchon",
  state: "",
  country: "FR",
  zip: "31110",
  company: "EZI RETURNS - Whatnot",
  fullName: "EZI RETURNS - Whatnot",
  email: "",
  phone: "+33960083346",
};

const FR_EZI_WAREHOUSE_ADDRESS = {
  id: "fr_ezi_warehouse",
  street1: "70 Avenue Jean Jaurès",
  street2: "",
  city: "Bagnères de Luchon",
  state: "",
  country: "FR",
  zip: "31110",
  company: "EZI RETURNS - WN RETURNS EUROPE",
  fullName: "EZI RETURNS - WN RETURNS EUROPE",
  email: "",
  phone: "+33960083346",
};

const DE_EZI_ADDRESS = {
  id: "de_ezi",
  street1: "Industriestraße 30",
  street2: "",
  city: "Kirchgellersen",
  state: "",
  country: "DE",
  zip: "21394",
  company: "Whatnot - C/o Ezi Returns",
  fullName: "Whatnot - C/o Ezi Returns",
  email: "sellersupport@whatnot.com",
  phone: "+4941319271057",
};

const DE_EZI_WAREHOUSE_ADDRESS = {
  id: "de_ezi_warehouse",
  street1: "Industriestraße 30",
  street2: "",
  city: "Kirchgellersen",
  state: "",
  country: "DE",
  zip: "21394",
  company: "WN RETURNS EUROPE - C/o Ezi Returns",
  fullName: "WN RETURNS EUROPE - C/o Ezi Returns",
  email: "sellersupport@whatnot.com",
  phone: "+4941319271057",
};

const US_WAREHOUSE_ADDRESS = {
  id: "us_warehouse",
  street1: "8175 E Evans Rd, Unit 13330",
  street2: "",
  city: "Scottsdale",
  state: "AZ",
  country: "US",
  zip: "85267",
  company: "Whatnot Inc",
  fullName: "Whatnot Inc",
  email: "tony@whatnot.com",
  phone: "5629910364",
};

if (return_label_receipient_select.value == 'seller') {
  address_to_street_one_crl.setValue(orderSeller.value.home_address.line1)  
  address_to_street_two_crl.setValue(orderSeller.value.home_address.line2)
  address_to_city_crl.setValue(orderSeller.value.home_address.city)
  address_to_state_crl.setValue(orderSeller.value.home_address.state)
  address_to_country_crl.setValue(orderSeller.value.home_address.country_code)
  address_to_zip_crl.setValue(orderSeller.value.home_address.postal_code)
  
  address_to_company_crl.setValue(getShippingLabelInfo.data.address_from.company)
  address_to_full_name_crl.setValue(getShippingLabelInfo.isImported ? getShippingLabelInfo.data.address_from.name : orderSeller.value.home_address.full_name)
  address_to_email_crl.setValue(getShippingLabelInfo.isImported ? getShippingLabelInfo.data.address_from.email : orderSeller.value.email)
  address_to_phone_crl.setValue(getShippingLabelInfo.isImported ?  getShippingLabelInfo.data.address_from.phone : orderSeller.value.phone_number)

  return_label_covers_cost_select.setValue('seller')
} else {
  // This logic follows this doc:
  // https://docs.google.com/document/d/1GBB_oCcyHJY08z9VvEL7IBonr2ipJM7Z1vGhhIn_zmg/edit?usp=sharing

  const LIMIT_FOR_3PL_RETURNS = 50000;
  const LIMIT_FOR_GB_RETURNS = 20000;

  let addressToUse = US_WAREHOUSE_ADDRESS;

  const buyerCountry = queryShipment.data.shippo_data?.to_address.country ?? queryRecord.data.shipping_address?.country_code;
  const orderTotalAmountCents = orderTransformer_ShipmentDataPage.value.total_cents;

  if (buyerCountry === undefined) {
     console.warn("Not able to determine return address because buyer country is undefined"); 
  }

  if (buyerCountry === "GB" &&
    orderTotalAmountCents > LIMIT_FOR_GB_RETURNS) {
    addressToUse = US_WAREHOUSE_ADDRESS;
  } else if (buyerCountry === "FR" &&
    orderTotalAmountCents > LIMIT_FOR_3PL_RETURNS) {
    addressToUse = FR_EZI_WAREHOUSE_ADDRESS;
  } else if (["AT", "BE", "DE", "NL"].includes(buyerCountry) &&
    orderTotalAmountCents > LIMIT_FOR_3PL_RETURNS) {
    addressToUse = DE_EZI_WAREHOUSE_ADDRESS;
  } else {
    switch (buyerCountry) {
      case "FR":
        addressToUse = FR_EZI_ADDRESS;
        break;
      case "AT":
      case "BE":
      case "DE":
      case "NL":
        addressToUse = DE_EZI_ADDRESS;
        break;
      // GB_EZI_ADDRESS is not defined because we don't have a return address
      // in the UK yet
      // case "GB":
      //   addressToUse = GB_EZI_ADDRESS;
      //   break;
    }
  }

  address_to_street_one_crl.setValue(addressToUse.street1);
  address_to_street_two_crl.setValue(addressToUse.street2);
  address_to_city_crl.setValue(addressToUse.city);
  address_to_state_crl.setValue(addressToUse.state);
  address_to_country_crl.setValue(addressToUse.country);
  address_to_zip_crl.setValue(addressToUse.zip);
  address_to_company_crl.setValue(addressToUse.company);
  address_to_full_name_crl.setValue(addressToUse.fullName);
  address_to_email_crl.setValue(addressToUse.email);
  address_to_phone_crl.setValue(addressToUse.phone);

  radioGroupReturnAddress.setValue(addressToUse.id);
  
  return_label_covers_cost_select.setValue('whatnot')
}