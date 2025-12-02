const selectedYear = Number(birthYear.value); // Replace with your dropdown variable
const selectedMonth = Number(birthMonth.value);
const today = new Date();

//  const curBirthYear = Number(birthYear.value); 
//  const curBirthMonth = Number(birthMonth.value);
//  const curBirthDay = Number(birthDay.value) ? Number(birthDay.value) :  1; 

// Calculate the 18+ date
//  const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed


var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

const maxDate = new Date();

const maxNominationDate = new Date(maxDate);
const maxNominationYear = maxNominationDate.getFullYear() - 18;

  const maxDay =
  selectedYear === maxNominationYear && selectedMonth == maxNominationDate.getMonth() + 1
    ? maxNominationDate.getDate()
    : daysInMonth;
  daysInMonth = maxDay;
console.log(selectedYear, maxNominationYear, selectedMonth, )
const nominationDays = [];
for (let day = 1; day <= daysInMonth; day++) {
  nominationDays.push(day.toString().padStart(2, '0'));
}

return nominationDays;

