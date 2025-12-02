var temp = Websites.value;

//var oldValue = temp[i];
temp[i] = '';
eachWebsite.setValue('');
Websites.setValue(temp);

 GlobalWebsitesList.setValue({ "change": true,
                              "value": temp, newKey:GlobalWebsitesList.value.newKey ||""
})

