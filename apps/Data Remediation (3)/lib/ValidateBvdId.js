var curCountries = CountriesList.value.map((obj) => obj.a2);


var curBvdId = selectedCompany.value.header.bvdID.trim();

console.log('curBvdId',curBvdId);

if(curBvdId === ''|| !curBvdId) {
  return true;
} else {
  var curBvdIdCode = curBvdId.slice(0, 2);
  if (!curCountries.includes(curBvdIdCode)) {
    return true;
  } else {
    return false;
  }
}