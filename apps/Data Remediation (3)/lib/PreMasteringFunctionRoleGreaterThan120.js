console.log("Before PreFunctionRolesGreaterThan120", PreFunctionRolesGreaterThan120.value); 

if (PreviousPreRoleTotalElements.value > 120 || CurrentPreRoleTotalElements.value > 120) { 
  let request = {
    header: {
      state: "active",
      recordId: search_box.value,
      source: "REMEDIATED",
      lineageId: "REMEDIATED" + search_box.value,
      entityId: search_box.value,
    }
  };

  // Setting the value of PreFunctionRolesGreaterThan120 to the request object
  PreFunctionRolesGreaterThan120.setValue([request]);
  
  console.log("PreFunctionRolesGreaterThan120", PreFunctionRolesGreaterThan120.value); 
}
