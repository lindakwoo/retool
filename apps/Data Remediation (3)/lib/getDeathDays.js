const selectedYear = Number(deathYear.value); // Replace with your dropdown variable

const curBirthYear = Number(birthYear.value); 
const curBirthMonth = Number(birthMonth.value);
const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) :  1; 

// Calculate the 18+ date
const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed
const minimumNominationDate = new Date(birthDate);
//minimumNominationDate.setFullYear(birthDate.getFullYear());
const minNominationYear = minimumNominationDate.getFullYear();


const selectedMonth = Number(deathMonth.value) ; // Replace with your dropdown variable
const minDay =
  selectedYear === minNominationYear && selectedMonth == minimumNominationDate.getMonth() + 1
    ? minimumNominationDate.getDate()
    : 1;


var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

const maxDate = new Date();

const maxNominationDate = new Date(maxDate);
const maxNominationYear = maxNominationDate.getFullYear();

  const maxDay =
  selectedYear === maxNominationYear && selectedMonth == maxNominationDate.getMonth() + 1
    ? maxNominationDate.getDate()
    : daysInMonth;
  daysInMonth = maxDay;

const nominationDays = [];
for (let day = minDay; day <= daysInMonth; day++) {
  nominationDays.push(day.toString().padStart(2, '0'));
}

return nominationDays;

