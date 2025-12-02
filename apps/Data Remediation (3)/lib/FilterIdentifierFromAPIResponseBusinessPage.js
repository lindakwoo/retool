//console.log("Before filtering, response data:", GetMasteringByOrbisId?.data);
let data = SearchedEntity.value.trim(); 
let response = {};
//  if((/[a-zA-Z]/.test(data))){
//      response = GetMasteringByBvDID.data;
//    }
  if(!(/[a-zA-Z]/.test(data))){
    response = GetMasteringByOrbisIdBusiness?.data;
  }

let country = response.header.bvdID.substring(0, 2).toLowerCase();  // Get the 2-letter country code and make it lowercase

// Define exclusion criteria (country + type)
const exclusionCriteria = IdentifierExclusionCriteriaData.value;
//console.log("exclusionCriteria", exclusionCriteria);

// Filter identifiers based on exclusion criteria
response.identifiers = response.identifiers.filter(identifier => {
  const countryLower = country.toLowerCase();  // Get the lowercase country code
  const identifierType = identifier.item.type;  // `type` is already a string

  // Exclude if identifierType is 989 or 990
  if (identifierType === "989" || identifierType === "990") {
    return false;
  }

  // Exclude identifier if it matches the exclusion criteria for the country
  if (exclusionCriteria[countryLower] && identifierType === exclusionCriteria[countryLower]) {
    return false;  // Exclude this identifier
  }
  
  return true;  // Include this identifier
});

// Log the modified identifiers
//console.log("After filtering, modified response:", response.identifiers);

// Return the modified response
return response;
