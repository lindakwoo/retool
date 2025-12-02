const companiesData = searchRegistryData?.value;
//console.log('companiesData', companiesData);
let data = TableRecordsMastering?.value[0];

const searchedBVDID = selectedCompany?.value?.header?.bvdID?.substring(0, 2);
let urls = [];

if (searchedBVDID === "US" || searchedBVDID === "CA") {

    let stateCode = null;
    if (data && data?.addresses?.length > 0) {
        const types = ["1", "4", "2"];
        for (const type of types) {
            const address = data?.addresses.find(addr => addr.item?.types.some(typeValue => typeValue === type));
            if (address) {
                stateCode = address.item?.localizedAddresses[0]?.standardizedAddress.administrativeArea ?? null;
                break;
            }
        }
    }
    //console.log('stateCode', stateCode);
    if (stateCode !== null) {
        urls = stateCode !== null ? companiesData?.filter(item => { try { return JSON.parse(item.state_code).includes(stateCode); } catch { return false; } }).map(item => (item.registry_url ?? '').trim()) : [];

    }
} else {

    // Extract only the 'url' field from each object
    urls = companiesData?.map(item => item.registry_url);
}

//console.log('urls', urls);
const openTabsSequentially = async (urlList) => {
    for (const url of urlList) {
        console.log(`Opening URL: ${url}`);
        const shouldOpen = true; // This flag controls whether the URL is opened
        if (shouldOpen) {
            //utils.openUrl(url, '_blank');
            utils.openUrl(url, { newTab: true, forceReload: false });
            console.log(`Opened URL: ${url}`);
            await new Promise(resolve => setTimeout(resolve, 50)); // Delay between openings
        } else {
            console.log(`Skipped URL: ${url}`);
        }
    }
};

// check all urls are empty 
if (urls.every(str => str.trim() === '')) {
    utils.showNotification({
        title: "Info",
        description: "No registry website found for this country.",
        notificationType: "info",
        duration: 1.5,
    });
} else {
  
  if (urls.length > 10) {
        urls = urls.slice(0, 10);
    }
  
    // Run the function with extracted URLs
    openTabsSequentially(urls);
}

