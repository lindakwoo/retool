const curBirthYear = Number(birthYear.value); 
const curBirthMonth = Number(birthMonth.value);
const curBirthDay = Number(birthDay.value); 

var maxMonth = 12;
const selectedYear = Number(deathYear.value);

// Calculate the 18+ date
const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(birthDate);
minimumNominationDate.setFullYear(birthDate.getFullYear());
const minNominationYear = minimumNominationDate.getFullYear();
const  maxDate = new Date();
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
