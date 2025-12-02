var temp = EducationsDeleteFlags.value;

temp[i] = true;
console.log('EducationsDeleteFlags',temp);
console.log(EducationsDeleteFlags.value)

EducationsDeleteFlags.setValue(temp);