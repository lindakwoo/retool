
if (kompanyCountryList.data.length>0) {
  // Retrieve the first record from TableRecordsMastering
  const countryIso_code = kompanyCountryList.value
  
  // Initialize the kompanyInput object
  const kompanyInput = {
    country_iso: "",
    state_code: "",
    kompany_api: "",
    last_modified_by: ""  // Update as needed
  };

  // Set country_iso2_code and state_code based on bvdID
  if (countryIso_code === "US") {
    // Assuming TableRecordsMastering is your main table and Addresses is a related table

let usCode = null;
let data = TableRecordsMastering.value[0];
if (data && data.addresses.length > 0) {
  const types = ["1", "4", "2"];
  for (const type of types) {
    const address = data?.addresses.find(addr => addr.item?.types.some(typeValue => typeValue === type));
    if (address) {
        usCode = address.item?.geoClassifications.find(item => item.type === '1')?.code ?? null;
        console.log("usstatecode ::", usCode);
        break;
    }
}}

console.log("usstatecode ::", usCode);
 console.log("stateCode", stateCode.value);
    
    kompanyInput.country_iso = "US";
    if (!stateCode.value) {
      kompanyInput.state_code = usCode!==null ? usCode.substring(1, 3) :null;
    } else{
      kompanyInput.state_code = null;
    }
  } else {
    kompanyInput.country_iso = countryIso_code;
  }

  // Update the temporary state kompanyInputState
  kompanyInputState.setValue(kompanyInput);
  console.log("kompanyInputState", kompanyInputState.value);

  // Trigger kompanyApiRecord
  kompanyApiRecord.trigger();
  console.log("kompanyApiRecord triggered", kompanyApiRecord);
} else {
 kompanyApiRecord.trigger();
}



