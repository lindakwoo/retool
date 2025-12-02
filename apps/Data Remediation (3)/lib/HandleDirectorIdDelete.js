// Handle Director Id Delete

var temp = DisplayDirectorIds.value;

var curValues = temp[i];

temp[i].value= '';
console.log(temp);
DisplayDirectorIds.setValue(temp);