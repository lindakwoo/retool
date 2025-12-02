//IDENTIFIERS
//console.log("GetAvailableNewIdentifiers");
if (selectedCompany.value.header) {
    const bvdId = selectedCompany.value.header && selectedCompany.value.header.bvdID || '';
    var currentCountry = bvdId.match(/[a-zA-Z]+/g).join('').substring(0, 2);
    const exclusions = IdentifierExclusionCriteriaData.value;

    // Filter the IdentifiersList based on the exclusions (ignoring case for isoCode)
    console.log("IdentifiersList length", IdentifiersList.value.length);
    const filteredIdentifiersList = IdentifiersList.value.filter(item => {
        // Convert both isoCode and exclusions keys to lowercase to ensure case-insensitive comparison
        const isoCodeLower = item.isoCode.toLowerCase();
        return !(exclusions[isoCodeLower] && exclusions[isoCodeLower] === item.code);
    });
    //console.log("filteredIdentifiersList length after TIN exclude except wrld TIN", filteredIdentifiersList.length);

    // console.log("currentCountry", currentCountry);
    // Extract IDs from both arrays

    const countryIdentifiers = _.uniq(filteredIdentifiersList.filter((e) => {
        // If isoCode is a semicolon-separated list, check if currentCountry exists in it
        const isoCodes = e.isoCode.split(';');

        return (isoCodes.includes(currentCountry) ||
            (e.isoCode === 'WRLD' && e.type !== '99' && e.type !== '6' && e.code !== '989' && e.code !== '990'&& e.code !== '992'));
    }));

    //console.log("countryidentifiers from IdentifiersList", countryIdentifiers);
    const globalIds = countryIdentifiers.map(obj => obj.code);
    const apiIds = selectedCompany.value.identifiers ? selectedCompany.value.identifiers.map(obj => obj.item.type) : [];

    //console.log("globalIds from countryIdentifiers", globalIds);
    //console.log("apiIds from selectedCompany value Identifiers", apiIds);

    // Find IDs present in global array but missing in API response array
    const missingIds = globalIds.filter(id => !apiIds.includes(id));

    //console.log("missingIds -present in global array but missing in API response", missingIds);

    // Generate list of objects corresponding to missing IDs
    const missingObjects = countryIdentifiers.filter(obj => missingIds.includes(obj.code));

    //console.log("missingObjects -list of objects corresponding to missing IDs", missingObjects);

    return missingObjects || [];
} else {
    return [];
}