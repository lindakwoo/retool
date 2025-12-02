

var temp = BusinessDescriptionsVariableList.value;

  temp[i].deleteFlag = true;
  BusinessDescriptionsVariableList.setValue(temp);
  console.log("New BusinessDescriptionsVariableList after delete", BusinessDescriptionsVariableList.value)

deleteFlag2.setValue(true)
console.log("deleteFlag2", deleteFlag2.value);

