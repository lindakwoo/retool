//ODY-6580
if (GlobalIdentifierList?.value?.length > 0 || CurIdentifiers.value.length > 0) {

    let modifiedValue = curVal;
    let typeValue = curType;
    console.log("modifiedValue: ", modifiedValue);
    console.log("typeValue: ", typeValue);
    let bvdIDInput = selectedCompany.value.header.bvdID?.substring(0, 2);


    // Validate identifier
    let invalidIdentifier = validateIdentifier(typeValue, bvdIDInput, modifiedValue);



    console.log("invalidIdentifier", invalidIdentifier);
    //console.log("isMatch for CIK/RSSD codes", isMatch);

    // If the identifier is invalid or there is a match (as per the logic for type 241 and 174), set the flag to true
    if (invalidIdentifier && typeValue !== "241" && typeValue !== "174" && typeValue !== "263") {
        //console.log("111", invalidIdentifier);
        //  var temp = 
        var temp = ExistingIdentifierFlag.value;
        temp[i].isInvalid = invalidIdentifier === "valid" ? false : true;
        temp[i].errorMessage = invalidIdentifier === "valid" ? "" : invalidIdentifier;
        console.log(temp);
        ExistingIdentifierFlag.setValue(temp);
        //  break;  // Exit the loop
    } else {
        var tempValue = ExistingIdentifierFlag.value;
        tempValue[i].isInvalid = /^0+$/.test(modifiedValue) || !/^(?!\s)(?!.*\s$)(?!.*[!?])(?!^[!?]).*$/.test(modifiedValue) ? true : false;
        tempValue[i].errorMessage = invalidIdentifier;
        console.log(tempValue);
        ExistingIdentifierFlag.setValue(tempValue);
    }

}


function validateIdentifier(typeValue, bvdIDInput, modifiedValue) {

    if ((typeValue === "989" || typeValue === "990") && (modifiedValue === null || modifiedValue.trim() === "")) {
        return "Identifiers cannot be empty.";
    }

   if (typeValue === "263") {
        return "Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number.";
    }

    if (typeValue === "241" || typeValue === "174") {
        return "Please consult the Osiris team before modifying CIK/RSSD values."
    }

    const validationRules = IdentifierRegexData.value;

    if (validationRules[typeValue]) {
        const { country: expectedState, regex, message } = validationRules[typeValue];
        //console.log("expectedState:", expectedState, "regex:", regex, "message:", message);
        // Ensure the first two characters of bvdID match the expected state
        // const isValidState = bvdIDInput === expectedState || expectedState === "WRLD";
        const validStates = [].concat(expectedState);  // This will convert it to an array if it's not already
        //console.log("validStates:", validStates);
        // Check if bvdIDInput matches any of the valid states or if it's "WRLD"
        const isValidState = validStates.includes(bvdIDInput) || validStates.includes("WRLD");

        // Perform validation if the state matches
        if (isValidState && !regex.test(modifiedValue)) {
            return message; // Return specific validation message
        }
    }

    // Check if modifiedValue is all zeros (invalid case)
    if (/^0+$/.test(modifiedValue)) {
        return "Identifiers cannot contain only zeros.";
    }

    // Check if identifier contains spaces or invalid symbols
    if (!/^(?!\s)(?!.*\s$)(?!.*[!?])(?!^[!?]).*$/.test(modifiedValue)) {
        return "Identifiers cannot contain spaces or invalid symbols (!, ?).";
    }

    // If everything is valid
    return "valid";
}

//console.log("ExistingIdentifierFlag: ", temp);
