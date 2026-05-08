// Ensure attributes is an array
let attributes = queryListingAttributes?.data?.data?.attributes;

// Check if attributes is actually an array, otherwise default to an empty array
if (!Array.isArray(attributes)) {
  console.error("Expected attributes to be an array but got:", attributes);
  attributes = []; // Default to an empty array to prevent crashes
}

let result = {};

// Helper function to extract attribute values safely
const getValue = (key) => {
  let attr = attributes.find(attr => attr.key === key);
  return attr?.value ? attr.value : null;
};

// Extract values
let shoeSize = getValue("sneakers.shoe_size");
let condition = getValue("sneakers.condition");
let brand = getValue("sneakers.brand");
let silhouette = getValue("sneakers.silhouette");
let colorway = getValue("sneakers.colorway");
let msrp = getValue("sneakers.msrp");

// Assign only non-empty values to result
if (shoeSize) result.shoe_size = shoeSize;
if (condition) result.condition = condition;
if (brand) result.brand = brand;
if (silhouette) result.silhouette = silhouette;
if (colorway) result.colorway = colorway;
if (msrp) result.msrp = msrp;

console.log(result);
return result;