var temp = prevNames.value;

var oldValue = temp[i]; // Optionally store the old value if needed

temp[i].name = ''; // Clearing the value in the array element
temp[i].dateSince = '';
temp[i].dateUntil = '';

eachPrevName.setValue(''); // Assuming you want to clear some corresponding input or variable
dateSince.setValue(null);
dateUntil.setValue(null);
prevNames.setValue(temp); // Update the prevNames array
 GlobalListOfPrevName.setValue({
    "change": true,
    "value": temp
  })
