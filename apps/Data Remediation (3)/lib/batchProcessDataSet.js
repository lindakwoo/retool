let excelFileInfo = browseExcelFile.parsedValue[0];
let fullData = [];
//  console.log("browseExcelFile", browseExcelFile.parsedValue[0]);
console.log("excelFileInfo", excelFileInfo);
if (excelFileInfo === undefined) {
  browseExcelFile.resetValue();
  AlertMessageDetail.setValue(`There is no data found in the Excel file.`);
  PopUpOpen.trigger();
  return;
}
let updateValue = (excelFileInfo.update && excelFileInfo.update.length !== 0) ? excelFileInfo.update : [];
let addressArr = (excelFileInfo.address && excelFileInfo.address.length !== 0) ? excelFileInfo.address : [];
let prevValue = (excelFileInfo.prev_name && excelFileInfo.prev_name.length !== 0) ? excelFileInfo.prev_name : [];

// Merge record of two tab
fullData = [...updateValue, ...addressArr, ...prevValue];

if (updateValue.length === 0 && addressArr.length === 0 && !(excelFileInfo.hasOwnProperty('update')) && !(excelFileInfo.hasOwnProperty('address')) && !(excelFileInfo.hasOwnProperty('prev_name'))) {
  browseExcelFile.resetValue();
  AlertMessageDetail.setValue(`There is no "update", "prev_name" and "address" tab found in the Excel file.`);
  PopUpOpen.trigger();
  //  DynamicAlertShow.setHidden(false);
  return;
} 
if (fullData.length >= 200) {
  browseExcelFile.resetValue();
   AlertMessageDetail.setValue(`Excel file have more than 200 records, current batch process limit is max 200 records per batch.`);
  PopUpOpen.trigger();
  //  DynamicAlertShow.setHidden(false);
  return;
}

// Show pop up after browse file.
  let errorDataCount = 0, goodDataCount = 0;
  fullData.forEach((data) => {
    if ((data.bvd_id === '' || data.sr === '' || data.case_no === '' || data.requester === '')) {
      let missingAttributes = [];
      
      if (data.bvd_id === '') missingAttributes.push('bvd_id');
    if (data.sr === '') missingAttributes.push('sr');
    if (data.case_no === '') missingAttributes.push('case_no');
    if (data.requester === '') missingAttributes.push('requester');
    // if missing any atrribute then we have to show message.
    if (missingAttributes.length > 0) {
        data.error_message = `missing attributes - ${missingAttributes.join(', ')}`
    }
      errorDataCount++;
    } else {
      goodDataCount++;
    }
  })
  AlertMessageDetail.setValue(`Validation pass: ${goodDataCount} \n \n Validation failed: ${errorDataCount}`
  )
  PopUpOpen.trigger();


  batchProcessTable.clearSelection();
batchProcessTable.clearFilterStack();
VarBatchProcessData.setValue(fullData);


//  return fullData;
//  return boeRequest;
