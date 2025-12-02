var temp = prevLocalNames.value;

var oldValue = temp[i]; // Optionally store the old value if needed

temp[i] = ''; // Clearing the value in the array element

eachPrevLocalName.setValue(''); // Assuming you want to clear some corresponding input or variable

prevLocalNames.setValue(temp); // Update the prevLocalNames array
GlobalListOfPrevLocalName.setValue({
    "change": true,
    "value": temp
  })
