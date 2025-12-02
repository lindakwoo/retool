const searchBoxInputValue = SearchedEntity.value.trim();
const isFirstCharacterNumber = /^\d/.test(searchBoxInputValue);

  if (isFirstCharacterNumber) {
    GetPremasteringbyORBISID.trigger();
  } else {
    GetPremasteringByBVDID.trigger();
  }
