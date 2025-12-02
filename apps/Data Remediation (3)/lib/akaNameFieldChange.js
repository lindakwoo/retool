var temp = akaNames.value;

//var oldValue = temp[i]; // Optionally store the old value if needed

temp[i] = ''; // Clearing the value in the array element

eachAkaName.setValue(''); // Assuming you want to clear some corresponding input or variable

akaNames.setValue(temp); // Update the akaNames array
 GlobalListOfAkaName.setValue({
    "change": true,
    "value": temp
  })
