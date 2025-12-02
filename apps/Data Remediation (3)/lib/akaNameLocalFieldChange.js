var temp = akaLocalNames.value;

var oldValue = temp[i]; // Optionally store the old value if needed

temp[i] = ''; // Clearing the value in the array element

eachAkaLocalName.setValue(''); // Assuming you want to clear some corresponding input or variable

akaLocalNames.setValue(temp); // Update the akaLocalNames array
 GlobalListOfAkaNameLocal.setValue({
    "change": true,
    "value": temp
  })
