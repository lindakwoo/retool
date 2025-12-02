// Calculate age range
let nominationYears = [];
let refDate = new Date();
if (nominationYear.value) {
  refDate = new Date(
    nominationYear.value,
    nominationMonth.value ?  nominationMonth.value - 1 : 0,
    nominationDay.value ? nominationDay.value : 1
  )

  const minDate = new Date(
    refDate.getFullYear(),
    refDate.getMonth(),
    refDate.getDate()
  );
  var maxDate = new Date(
    refDate.getFullYear() + 100,
    refDate.getMonth(),
    refDate.getDate()
  );
  if (birthYear.value) {
    const curBirthDate = new Date(
    birthYear.value,
    birthMonth.value ? birthMonth.value - 1 : 0,
    birthDay.value ? birthDay.value : 1
  );
    maxDate = new Date(
    curBirthDate.getFullYear() + 100, //100-18
    curBirthDate.getMonth(),
    curBirthDate.getDate()
  );
  }
  nominationYears = Array.from({ length: maxDate.getFullYear() - minDate.getFullYear() + 1 }, (_, i) =>
  minDate.getFullYear() + i
);
} else if (birthYear.value) {
  const birthDate = new Date(
    birthYear.value,
    birthMonth.value ? birthMonth.value - 1 : 0,
    birthDay.value ? birthDay.value : 1
  );

  // Minimum Nomination Start Date (18 years older)
  const minDate = new Date(
    birthDate.getFullYear() + 18,
    birthDate.getMonth(),
    birthDate.getDate()
  );

  // Maximum Nomination Start Date (100 years older)
  const maxDate = new Date(
    birthDate.getFullYear() + 100,
    birthDate.getMonth(),
    birthDate.getDate()
  );
  // Populate Year Options
nominationYears = Array.from({ length: maxDate.getFullYear() - minDate.getFullYear() + 1 }, (_, i) =>
  minDate.getFullYear() + i
);
} else {
  const currentDate = new Date();

  // Minimum Nomination Start Date (100 years older)
  const minDate = new Date(
    currentDate.getFullYear() - 100,
    currentDate.getMonth(),
    currentDate.getDate()
  );

  // Maximum Nomination Start Date (current date)
  const maxDate = new Date(
    currentDate.getFullYear() + 100,
    currentDate.getMonth(),
    currentDate.getDate()
  );

  // Populate Year Options
 nominationYears = Array.from({ length: maxDate.getFullYear() - minDate.getFullYear() + 1 }, (_, i) =>
  minDate.getFullYear() + i
);
}

const yearFromAPI = CurrentSelectedRole.value.function.item.nominationEndDate ? new Date(CurrentSelectedRole.value.function.item.nominationEndDate.date).getUTCFullYear() : null

if (yearFromAPI) {
  console.log('end yearFromAPI', yearFromAPI)
  if (!nominationYears.includes(yearFromAPI)) {
    console.log('adding to end years')
    nominationYears.push(yearFromAPI);
  }
}

return nominationYears; // Assign to the "year" dropdown's options
