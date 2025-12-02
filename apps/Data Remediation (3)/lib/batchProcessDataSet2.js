let excelFileInfo = browseExcelFile.parsedValue[0];
let fullData = [];
//  console.log("browseExcelFile", browseExcelFile.parsedValue[0]);
//  console.log("excelFileInfo", excelFileInfo);
if (excelFileInfo === undefined) {
  return;
}
let updateValue = (excelFileInfo.update && excelFileInfo.update.length) ? excelFileInfo.update : [];
let addressArr = (excelFileInfo.address && excelFileInfo.address.length) ? excelFileInfo.address : [] ;

let differentValue = []
if(addressArr.length !== 0) {
  differentValue = addressArr.filter(({ sr: id1 }) => !updateValue.some(({ sr: id2 }) => id2 === id1));
}

//  console.log('different value',differenceValue);
let addressValue, combineObj;
  (addressValue = ""),
updateValue.forEach((updateData) => {
  combineObj = updateData;
  addressValue = addressArr && addressArr.find((data) => data.sr === updateData.sr);
  if (addressValue !== "undefined") {
    combineObj = { ...combineObj, ...addressValue };
  }
  fullData.push(combineObj);
});
fullData = [...fullData, ...differentValue];
//  console.log("fullData", fullData);

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
  AlertMessageDetail.setValue(`Validation Pass: ${goodDataCount} \n\n Validation Failed: ${errorDataCount}`
  )
  PopUpOpen.trigger();

VarBatchProcessData.setValue(fullData);
//  return fullData;
//  return boeRequest;
