// Calculate age range
let nominationYears = [];
if (birthYear.value) {
  const birthDate = new Date(
  birthYear.value,
  birthMonth.value ?  birthMonth.value - 1 : 0,
  birthDay.value ? birthDay.value : 1
);

// Minimum Nomination Start Date (18 years older)
const minDate = new Date(
  birthDate.getUTCFullYear() + 18,
  birthDate.getMonth(),
  birthDate.getDate()
);
 // Maximum Nomination Start Date (100 years older)
let maxDate = new Date(
  birthDate.getUTCFullYear() + 100,
  birthDate.getMonth(),
  birthDate.getDate()
);
  if (nominationEndYear.value) {
    // Maximum Nomination Start Date (100 years older)
    const nominationEndDate = new Date(
  nominationEndYear.value,
  nominationEndMonth.value ?  nominationEndMonth.value - 1 : 0,
  nominationEndDay.value ? nominationEndDay.value : 1
);
   maxDate = new Date(
  nominationEndDate.getUTCFullYear(),
  nominationEndDate.getMonth(),
  nominationEndDate.getDate()
);
  }

// Populate Year Options
nominationYears = Array.from({ length: maxDate.getUTCFullYear() - minDate.getUTCFullYear() + 1 }, (_, i) =>
  minDate.getUTCFullYear() + i
);

console.log(nominationYears)
} else {
  const currentDate = new Date();

// Minimum Nomination Start Date (100 years older)
const minDate = new Date(
  currentDate.getUTCFullYear() - 100,
  currentDate.getMonth(),
  currentDate.getDate()
);

// Maximum Nomination Start Date (current date)
let maxDate = new Date(
  currentDate.getUTCFullYear() + 100,
  currentDate.getMonth(),
  currentDate.getDate()
);

   if (nominationEndYear.value) {
    // Maximum Nomination Start Date (100 years older)
    const nominationEndDate = new Date(
  nominationEndYear.value,
  nominationEndMonth.value ?  nominationEndMonth.value - 1 : 0,
  nominationEndDay.value ? nominationEndDay.value : 1
);
   maxDate = new Date(
  nominationEndDate.getUTCFullYear(),
  nominationEndDate.getMonth(),
  nominationEndDate.getDate()
);
  }

// Populate Year Options
nominationYears = Array.from({ length: maxDate.getUTCFullYear() - minDate.getUTCFullYear() + 1 }, (_, i) =>
  minDate.getUTCFullYear() + i
);
}

const yearFromAPI = CurrentSelectedRole.value.function.item.nominationDate ? new Date(CurrentSelectedRole.value.function.item.nominationDate.date).getUTCFullYear() : null

if (yearFromAPI) {
  console.log('yearFromAPI', yearFromAPI)
  if (!nominationYears.includes(yearFromAPI)) {
    console.log('adding to years')
    nominationYears.push(yearFromAPI);
  }
}

return nominationYears; // Assign to the "year" dropdown's options
