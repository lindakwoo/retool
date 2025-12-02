if (CurrentUserObj.value.level === "level0") {
  // EditsContainer.views[0].setDisabled(true);
  //EditsContainer.setDisabled(true);
  container134.setDisabled(false);
  searchOrbisId.setDisabled(false);
  activeFlag.setDisabled(true);
  suppressFlag.setDisabled(true);
  suppressRoleFlag.setDisabled(true);
  AboutContainer1.setDisabled(true);
  myEditsRoleContainer.setDisabled(true);
  RemCurrentFunctionsContainer.setDisabled(true);
  RemPreviousFunctionsContainer.setDisabled(true);
  IdentifierContainer.setDisabled(true);
  EducationContainer1.setDisabled(true);
  biographyContainer.setDisabled(true);
  SaveFunction.setDisabled(true);
  SaveContactBtn.setDisabled(true);

  return true;

}
else {
  return false;
}