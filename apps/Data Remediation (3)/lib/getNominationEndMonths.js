
if (nominationYear.value) {
  const curNominationYear = Number(nominationYear.value); 
  const curNominationMonth = Number(nominationMonth.value);
  const curNominationDay = Number(nominationDay.value) ? Number(nominationDay.value) : 1; 

// Calculate the 18+ date
const nominationStartDate = new Date(curNominationYear, curNominationMonth - 1, curNominationDay); // curBirthMonth is 1-indexed
const minimumNominationEndDate = new Date(nominationStartDate);
minimumNominationEndDate.setFullYear(nominationStartDate.getFullYear());
const minNominationEndYear = minimumNominationEndDate.getFullYear();

const selectedYear = Number(nominationEndYear.value); // Replace with your dropdown variable
const minMonth = selectedYear === minNominationEndYear ? minimumNominationEndDate.getMonth() + 1 : 1;
let maxDate = new Date(curNominationYear + 100, curNominationMonth - 1, curNominationDay);
if (birthYear.value) {
  const curBirthYear = Number(birthYear.value); 
  const curBirthMonth = Number(birthMonth.value);
  const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) : 1; 

  console.log(curBirthDay);
  maxDate = new Date(
  curBirthYear + 100,
  curBirthMonth - 1,
  curBirthDay
);
}
  
const maxNominationYear = maxDate.getFullYear();
  console.log('nomination maxNominationYear', maxNominationYear)
 let maxMonth = selectedYear === maxNominationYear ? maxDate.getMonth() + 1 : 12;

const nominationMonths = [];
for (let month = minMonth; month <= maxMonth; month++) {
  nominationMonths.push(month.toString().padStart( 2, '0'));
}

return nominationMonths;
} else {
  console.log('inside nomination end months birht validation');
  const curBirthYear = Number(birthYear.value); 
const curBirthMonth = Number(birthMonth.value);
const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) : 1; 

// Calculate the 18+ date
const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(birthDate);
minimumNominationDate.setFullYear(birthDate.getFullYear() + 18);
const minNominationYear = minimumNominationDate.getFullYear();

const selectedYear = Number(nominationEndYear.value); // Replace with your dropdown variable
const minMonth = selectedYear === minNominationYear ? minimumNominationDate.getMonth() + 1 : 1;

  console.log('minMonth', minMonth, birthDate,selectedYear, minNominationYear );

  const  maxDate = new Date(
  curBirthYear + 100,
  curBirthMonth - 1,
  curBirthDay
);
const maxNominationYear = maxDate.getFullYear();
  console.log('nomination maxNominationYear', maxNominationYear)
 let maxMonth = selectedYear === maxNominationYear ? maxDate.getMonth() + 1 : 12;

const nominationMonths = [];
for (let month = minMonth; month <= maxMonth; month++) {
  nominationMonths.push(month.toString().padStart( 2, '0'));
}

return nominationMonths;
}

