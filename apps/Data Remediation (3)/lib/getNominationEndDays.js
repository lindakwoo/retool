const curBirthYear = Number(birthYear.value); 
const curBirthMonth = Number(birthMonth.value);
const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) : 1; 

if (nominationYear.value) {
  const selectedYear = Number(nominationEndYear.value);

 const curNominationYear = Number(nominationYear.value); 
const curNominationMonth = Number(nominationMonth.value);
const curNominationDay = Number(nominationDay.value); 

const nominationStartDate = new Date(curNominationYear, curNominationMonth - 1, curNominationDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(nominationStartDate);
minimumNominationDate.setFullYear(nominationStartDate.getFullYear());
const minNominationYear = minimumNominationDate.getFullYear();

const selectedMonth = Number(nominationEndMonth.value); 
const minDay =
  selectedYear === minNominationYear && selectedMonth === minimumNominationDate.getMonth() + 1
    ? minimumNominationDate.getDate()
    : 1;

let daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

let maxDate = new Date(curNominationYear + 100, curNominationMonth - 1, curNominationDay);
 if (birthYear.value) {
  maxDate = new Date(curBirthYear + 100, curBirthMonth - 1, curBirthDay);

const maxNominationDate = new Date(maxDate);
const maxNominationYear = maxNominationDate.getFullYear();

  const maxDay =
  selectedYear === maxNominationYear && selectedMonth === maxNominationDate.getMonth() + 1
    ? maxNominationDate.getDate()
    : daysInMonth;
  daysInMonth = maxDay;
 }
  
const nominationDays = [];
for (let day = minDay; day <= daysInMonth; day++) {
  nominationDays.push(day.toString().padStart(2, '0'));
}

return nominationDays;
} else {
  const selectedYear = Number(nominationEndYear.value); // Replace with your dropdown variable

// Calculate the 18+ date
const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(birthDate);
minimumNominationDate.setFullYear(birthDate.getFullYear() + 18);
const minNominationYear = minimumNominationDate.getFullYear();

const selectedMonth = Number(nominationEndMonth.value); // Replace with your dropdown variable
const minDay =
  selectedYear === minNominationYear && selectedMonth === minimumNominationDate.getMonth() + 1
    ? minimumNominationDate.getDate()
    : 1;

let daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

  const maxDate = new Date(curBirthYear + 100, curBirthMonth - 1, curBirthDay);

const maxNominationDate = new Date(maxDate);
const maxNominationYear = maxNominationDate.getFullYear();

  const maxDay =
  selectedYear === maxNominationYear && selectedMonth === maxNominationDate.getMonth() + 1
    ? maxNominationDate.getDate()
    : daysInMonth;
  daysInMonth = maxDay;

  
const nominationDays = [];
for (let day = minDay; day <= daysInMonth; day++) {
  nominationDays.push(day.toString().padStart(2, '0'));
}

return nominationDays;
}



