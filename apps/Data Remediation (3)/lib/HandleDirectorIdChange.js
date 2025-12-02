// Handle Director Id change

var temp = DisplayDirectorIds.value;

var curValues = temp[i];

temp[i].value= eachId.value;
console.log(temp);
DisplayDirectorIds.setValue(temp);