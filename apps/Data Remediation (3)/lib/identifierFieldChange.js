var temp = CurIdentifiers.value;

console.log(i);
console.log('temp before', temp[i]);
console.log(eachIdentifierVal)
var oldValue = temp[i].item.id;
temp[i].item.id = '';
//  temp[i].item.id = '';
//  console.log('temp after', temp[i]);
//  //eachIdentifierVal.setValue('');

//  console.log('temp', temp)
CurIdentifiers.setValue(temp);

