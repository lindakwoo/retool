var curOrbisId = selectedCompany.value.header.entityID;

if(curOrbisId === '' || !curOrbisId) {
  return true;
} else {
  return false;
}