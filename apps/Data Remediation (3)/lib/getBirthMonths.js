const today = new Date();
//  const curBirthYear = today.getUTCFullYear();
//  const curBirthMonth = today.getUTCMonth()
//  const curBirthDay = today.getUTCDate()

const selectedYear = Number(birthYear.value);

// Calculate the 18+ date
//const birthDate = new Date(curBirthYear, curBirthMonth - 1, curBirthDay); // curBirthMonth is 1-indexed
const maxBirthDate = new Date(today);

const maxYear = maxBirthDate.getFullYear() - 18;

const maxMonth = selectedYear === maxYear ? maxBirthDate.getUTCMonth() + 1 : 12;
 console.log('maxMonth', maxMonth);
const nominationMonths = [];
for (let month = 1; month <= maxMonth; month++) {
  console.log('month', month)
  nominationMonths.push(month.toString().padStart( 2, '0'));
}
return nominationMonths;
