var temp = CompanyLocalNames.value;

var oldValue = temp[i]; // Optionally store the old value if needed

temp[i].name = ''; // Clearing the value in the array element

eachCompanyLocalName.setValue(''); // Assuming you want to clear some corresponding input or variable

CompanyLocalNames.setValue(temp); // Update the CompanyLocalNames array

GlobalListOfLocalCompanyName.setValue({
    "change": true,
    "value": temp
  })
