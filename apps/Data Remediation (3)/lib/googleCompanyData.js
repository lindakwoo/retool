const companies = CompanyNamesList.value && CompanyNamesList.value.length > 0 ? CompanyNamesList.value: [];
//  [companySearchData.value]

const openTabsSequentially = async (companyList) => {
  for (const company of companyList) {
    const url = `https://www.google.com/search?q=${encodeURIComponent(company)}`;
    //  console.log(`Opening URL: ${url}`);
    const shouldOpen = true; 
    if (shouldOpen) {
      utils.openUrl(url, { newTab: true, forceReload: false });
      //  console.log(`Opened URL: ${url}`);
      await new Promise(resolve => setTimeout(resolve, 50)); 
    } else {
      //  console.log(`Skipped URL: ${url}`);
    }
  }
};
// Run the function
openTabsSequentially(companies);