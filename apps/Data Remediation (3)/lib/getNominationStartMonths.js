const curBirthYear = Number(birthYear.value); 
const curBirthMonth = Number(birthMonth.value);
const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) : 1 ; 

var maxMonth = 12;
const selectedYear = Number(nominationYear.value);
if (nominationEndYear.value) {
  const endYear = Number(nominationEndYear.value); 
  const endMonth = Number(nominationEndMonth.value);
  const endDay = Number(nominationEndDay.value) ? Number(nominationEndDay.value) : 1; 
  const endDate = new Date(endYear, endMonth - 1, endDay); // curBirthMonth is 1-indexed
  console.log('endDate', endYear, endMonth, endDay)
const maxNominationDate = new Date(endDate);
const maxNominationYear = maxNominationDate.getFullYear();
  console.log('nomination maxNominationYear', maxNominationYear)
  maxMonth = selectedYear === maxNominationYear ? maxNominationDate.getMonth() + 1 : 12;
  console.log('maxMonth', maxMonth)
} else {
  maxMonth = 12;
}

// Calculate the 18+ date
const birthDate = new Date(curBirthYear, curBirthMonth -1, curBirthDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(birthDate);
minimumNominationDate.setFullYear(birthDate.getFullYear() + 18);
const minNominationYear = minimumNominationDate.getFullYear();
const  maxDate = new Date(
  curBirthYear + 100,
  curBirthMonth - 1,
  curBirthDay
);
const maxNominationYear = maxDate.getFullYear();
  console.log('nomination maxNominationYear', maxNominationYear)
  maxMonth = selectedYear === maxNominationYear ? maxDate.getMonth() + 1 : 12;

const minMonth = selectedYear === minNominationYear ? minimumNominationDate.getMonth() + 1 : 1;
 console.log('maxMonth', maxMonth);
const nominationMonths = [];
for (let month = minMonth; month <= maxMonth; month++) {
  console.log('month', month)
  nominationMonths.push(month.toString().padStart( 2, '0'));
}

console.log('minMonth', minMonth, 'nominationMonths',nominationMonths)
return nominationMonths;
