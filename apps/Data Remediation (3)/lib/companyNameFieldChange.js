var temp = CompanyNames.value;

var oldValue = temp[i]; // Optionally store the old value if needed

console.log(i);

temp[i] = ''; // Clearing the value in the array element

eachCompanyName.setValue(''); // Assuming you want to clear some corresponding input or variable

CompanyNames.setValue(temp); // Update the CompanyNames array

 GlobalListOfCompanyName.setValue({
    "change": true,
    "value": temp
  })

