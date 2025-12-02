kompanyApiRecordData.setValue(null);
  
let data = TableRecordsMastering.value[0];

 let bvId = data.header.bvdID.substring(0,2);

console.log("tableRecordData::", data.header.bvdID.substring(0,2));
  // Initialize the kompanyInput object
  const kompanyInput = {
    country_iso: "",
    state_code: "",
    kompany_api: "",
    last_modified_by: ""  // Update as needed
  };

  // Set country_iso2_code and state_code based on bvdID
  if (bvId === "US") {
    console.log("usa bvid in recordEnableCheck");

let usCode = null;
if (data && data.addresses.length > 0) {
  const types = ["1", "4", "2"];
  for (const type of types) {
    const address = data?.addresses.find(addr => addr.item?.types.some(typeValue => typeValue === type));
    if (address) {
        usCode = address.item?.geoClassifications.find(item => item.type === '1')?.code ?? null;
        break;
    }
}

console.log("US Code:", usCode);

}

console.log("usstatecode in recordEnableCheck ::", usCode);
kompanyInput.country_iso = "US";
    kompanyInput.state_code = usCode!==null ? usCode.substring(1, 3) :null;
  } else {
     console.log("non-usa bvid in recordEnableCheck");
    kompanyInput.country_iso = bvId;
  }

  // Update the temporary state kompanyInputState
  kompanyInputState.setValue(kompanyInput);
  console.log("kompanyInputState in recordEnableCheck", kompanyInputState.value);

  // Trigger kompanyApiRecord
  kompanyApiRecord.trigger();
