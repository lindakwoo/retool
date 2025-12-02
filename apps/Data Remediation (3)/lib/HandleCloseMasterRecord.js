
var epochDate = moment.utc(new Date('1970-01-01'));

var isEditedFlag = false;


// CompanyName Checking 
var curCompanyNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '1' && item.item.localizedNames[0].language.toLocaleLowerCase() === 'ii'
});

// console.log('curCompanyNames', curCompanyNames);

var curNamePutArr = [];

companyNamesList.data.forEach(function (item, i) {

    var curCompanyNameVal = CompanyNames.value[i];

    if (curCompanyNameVal !== curCompanyNames[i].item.localizedNames[0].name) {
       isEditedFlag = true;

    }

});

if (newCompanyName.value != null && newCompanyName.value != "") {
    isEditedFlag = true;
}

// CompanyLocalName Checking 
var curCompanyLocalNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '1' && item.item.localizedNames[0].language.toLocaleLowerCase() !== 'ii'
});
// console.log('11', "company local name ")
// console.log(curCompanyLocalNames);


companyLocalNamesList.data.forEach(function (item, i) {
    var curCompanyNameVal = CompanyLocalNames.value[i].name;
    var curCompanyLangVal = CompanyLocalNames.value[i].language;
    if (curCompanyNameVal !== curCompanyLocalNames[i]?.item.localizedNames[0].name || curCompanyLangVal !== curCompanyLocalNames[i]?.item.localizedNames[0].language) {
        isEditedFlag = true;
    }

});

if (newCompanyLocalName.value != null && newCompanyLocalName.value != "" && newCompanyLocalNameLanguage.value) {
    isEditedFlag = true;
}
// console.log(' 453', curNamePutArr);

// Company Prev Name Checking 
var curPrevNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '3' && item.item.localizedNames[0].language.toLocaleLowerCase() === 'ii'
}).sort((a, b) => {
    // Convert dates to moment objects upfront
    const dateA = a.item.dateUntil ? moment(a.item.dateUntil) : null;
    const dateB = b.item.dateUntil ? moment(b.item.dateUntil) : null;

    // Primary sort by dateUntil (descending)
    if (dateA && dateB) {
        return dateB.diff(dateA);
    }

    // Handle mixed cases where one record has dateUntil and other doesn't
    if (!dateA && dateB) {
        // Records without dateUntil go after records with dateUntil
        return 1;
    }
    if (dateA && !dateB) {
        // Records with dateUntil go before records without dateUntil
        return -1;
    }

    // Both records lack dateUntil - sort by dateSince (descending)
    if (!dateA && !dateB) {
        const sinceA = a.item.dateSince ? moment(a.item.dateSince) : null;
        const sinceB = b.item.dateSince ? moment(b.item.dateSince) : null;

        if (sinceA && sinceB) {
            return sinceB.diff(sinceA);
        }

        // Handle missing dateSince values
        if (!sinceA && sinceB) return 1;
        if (sinceA && !sinceB) return -1;
    }

    return 0;
});

console.log("company prev name ")
console.log(curPrevNames);


prevNamesList.data.forEach(function (item, i) {
    var curCompanyNameVal = prevNames.value[i].name;
    var curDateSince = prevNames.value[i].dateSince;
    var curDateUntil = prevNames.value[i].dateUntil;

    var isDateSinceModified = false;
    var isDateUntilModified = false;

    // console.log(curPrevNames[i].item.dateSince)
    // console.log(curDateSince);
    // console.log('prev names from list in ui')
    // console.log(prevNames.value[i]);
    // console.log('prev name from variable');
    // console.log(curPrevNames[i]);
    if (curPrevNames[i].item.dateSince) {
        var userDate = moment(moment.utc(curDateSince).format('MM-DD-YYYY'));
        var dateFromAPI = moment(moment.utc(curPrevNames[i].item.dateSince).format('MM-DD-YYYY'));
        console.log(i, userDate);
        console.log(i, dateFromAPI)
        if (!userDate.isSame(dateFromAPI, 'day')) {
            console.log('datesince modified 1', i)
            isDateSinceModified = true;
        }
    } else {
        if (curDateSince) {
            isDateSinceModified = true;
        }
    }
    // console.log(curPrevNames[i].item.dateUntil)
    // console.log(curDateUntil);
    if (curPrevNames[i].item.dateUntil) {
        var userDate = moment(moment.utc(curDateUntil).format('MM-DD-YYYY'));
        var dateFromAPI = moment(moment.utc(curPrevNames[i].item.dateUntil).format('MM-DD-YYYY'));
        // console.log(userDate);
        // console.log(dateFromAPI)
        if (!userDate.isSame(dateFromAPI, 'day')) {
            console.log('dateuntil modified 1', i)
            isDateUntilModified = true;
        }
    } else {
        if (curDateUntil) {
            isDateUntilModified = true;
        }
    }

    if (curCompanyNameVal !== curPrevNames[i].item.localizedNames[0].name || isDateSinceModified || isDateUntilModified) {
        isEditedFlag = true;
    }

});

if (newPrevName.value != null && newPrevName.value != "") {
   isEditedFlag = true;
}

// Prev Local Name Checking 
var curPrevLocalNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '3' && item.item.localizedNames[0].language.toLocaleLowerCase() !== 'ii'
});
// console.log("prev local name ", i)
// console.log(curPrevLocalNames);


prevLocalNamesList.data.forEach(function (item, i) {

    var curCompanyNameVal = prevLocalNames.value[i];
    if (curCompanyNameVal !== curPrevLocalNames[i]?.item.localizedNames[0].name) {
        isEditedFlag = true;
    }

});

if (newPrevLocalName.value != null && newPrevLocalName.value != "") {
    isEditedFlag = true;

}
// Company Aka Name Checking 
var curAkaNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '2' && item.item.localizedNames[0].language.toLocaleLowerCase() === 'ii'
});
// console.log('company aka name ', curAkaNames)
// console.log(curAkaNames);


akaNamesList.data.forEach(function (item, i) {

    var curCompanyNameVal = akaNames.value[i];
    if (curCompanyNameVal !== curAkaNames[i]?.item.localizedNames[0].name) {
        isEditedFlag = true;
    }

});

if (newAkaName.value != null && newAkaName.value != "") {
    isEditedFlag = true;
}
// AKA Local Name Checking 
var curAkaLocalNames = selectedCompany.value.names.filter(function (item) {
    return item.item.type === '2' && item.item.localizedNames[0].language.toLocaleLowerCase() !== 'ii'
});
// console.log('aka local name', curAkaLocalNames)
// console.log(curAkaLocalNames);


akaLocalNamesList.data.forEach(function (item, i) {

    var curCompanyNameVal = akaLocalNames.value[i];
    if (curCompanyNameVal !== curAkaLocalNames[i]?.item.localizedNames[0].name) {
        isEditedFlag = true;
    }

});

if (newAkaLocalName.value != null && newAkaLocalName.value != "") {
    isEditedFlag = true;
}


// Call to open confirmation dialog

if (isEditedFlag) {
 ConfirmationPopUp.show()
} else {
  //loadingPopUp.show();
  preMasteringCallsForFirmoHome.trigger();
  utils.openPage('firmohome', {newTab: false});
}
