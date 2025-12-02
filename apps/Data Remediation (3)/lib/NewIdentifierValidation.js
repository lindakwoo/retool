//ODY-6580
var curFlags = NewIdentifiersFlag.value
//console.log('inside validation');
console.log(curFlags);
// Check if NewIdentifiersValues is empty
if ( Object.keys(GlobalNewIdentifierValueList.value).length > 0  || Object.keys(NewIdentifiersValues.value).length > 0) {

    let curNewTypeValue = curNewType;
    /// Initialize the flag to false
    //console.log("curNewTypeValue", curNewTypeValue);
    // If NewIdentifiersValues is not empty, check the values
    for (let [key, value] of Object.entries(NewIdentifiersValues.value)) {
        // Check if the value is invalid based on the regular expression or if it's an empty string
        // console.log("key", key);
        // console.log("value", value);


        if (curNewTypeValue === key) {
            //console.log("Matched Key", key);
            let bvdIDValue = selectedCompany.value.header.bvdID?.substring(0, 2);
            let invalidNewIdentifier = validateIdentifier(key, bvdIDValue, value);
            //console.log("invalidNewIdentifier", invalidNewIdentifier);
            //console.log("value", value);
            if (key !== "263") {
                if (invalidNewIdentifier || value === "") {
                    var temp = NewIdentifiersFlag.value;
                    var curCodeObj = temp.find((obj) => obj.code === key);
                    //console.log("curCodeObj", curCodeObj);
                    curCodeObj.isInvalid = invalidNewIdentifier === "valid" && value !== "" ? false : true;
                    curCodeObj.errorMessage = invalidNewIdentifier !== "valid" ? invalidNewIdentifier : "";
                    //console.log(temp);
                    temp = temp.map((obj) => {
                        if (obj.code === key) {
                            return curCodeObj;
                        }
                        return obj;
                    });
                    NewIdentifiersFlag.setValue(temp);// Set the flag to true if any invalid value is found

                }
            } else {
                var tempValue = NewIdentifiersFlag.value;
                var curCodeObj = tempValue.find((obj) => obj.code === key);
                //console.log("curCodeObj", curCodeObj);
                curCodeObj.isInvalid = /^0+$/.test(value) || !/^(?!\s)(?!.*\s$)(?!.*[!?])(?!^[!?]).*$/.test(value) ? true : false;;
                curCodeObj.errorMessage = invalidNewIdentifier;
                //console.log(tempValue);
                tempValue = tempValue.map((obj) => {
                    if (obj.code === key) {
                        return curCodeObj;
                    }
                    return obj;
                })
                NewIdentifiersFlag.setValue(tempValue);
            }


        }

    }

}

function validateIdentifier(key, bvdIDValue, value) {
    const validationRules = IdentifierRegexData.value;

    if (validationRules[key]) {
        const { country: expectedState, regex, message } = validationRules[key];
        //console.log("expectedState:", expectedState, "regex:", regex, "message:", message);
        // Ensure the first two characters of bvdID match the expected state
        //const isValidState = bvdIDValue === expectedState || expectedState === "WRLD";

        const validStatesRegex = [].concat(expectedState);  // This will convert it to an array if it's not already
        //console.log("validStates:", validStates);
        // Check if bvdIDInput matches any of the valid states or if it's "WRLD"
        const isValidState = validStatesRegex.includes(bvdIDValue) || validStatesRegex.includes("WRLD");

        // Perform validation if the state matches
        if (isValidState && !regex.test(value)) {
            return message; // Return specific validation message
        }
    }

    if (key === "263") {

        return "Identifiers cannot contain leading or trailing spaces. It is equal to the local VAT/ Tax identification number.";
    }

    // Check if modifiedValue is all zeros (invalid case)
    if (/^0+$/.test(value)) {
        return "Identifiers cannot contain only zeros.";
    }

    // Check if identifier contains spaces or invalid symbols
    if (!/^(?!\s)(?!.*\s$)(?!.*[!?])(?!^[!?]).*$/.test(value)) {
        return "Identifiers cannot contain spaces or invalid symbols (!, ?).";
    }

    // If everything is valid
    return "valid";
}
