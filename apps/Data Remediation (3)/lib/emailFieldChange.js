var temp = Emails.value;

var oldValue = temp[i];
temp[i] = '';
eachEmail.setValue('');
Emails.setValue(temp);

GlobalEmailsList.setValue({ "change": true,
                              "value": temp, newKey:GlobalEmailsList.value.newKey ||""
})

