<Screen
  id="identifiers"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title={null}
  urlSlug=""
  uuid="bea1ad4b-1d71-47a9-917b-047e49af4acb"
>
  <JavascriptQuery
    id="FilterIdentifierFromAPIResponseIdentifierPage"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include(
      "../lib/FilterIdentifierFromAPIResponseIdentifierPage.js",
      "string"
    )}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State
    id="CurIdentifiers"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{IdentifiersFromAPIList.value}}"
  />
  <State
    id="IdentifierPutArray"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="[]"
  />
  <State
    id="newIdentifiersReqs"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{{newIdentifiersAdded.value}}"
  />
  <State
    id="NewIdentifiersValues"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value="{}"
  />
  <JavascriptQuery
    id="identifierFieldChange"
    confirmationMessage="Are you sure you want to delete this Identifier?"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/identifierFieldChange.js", "string")}
    requireConfirmation={true}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={true}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <State
    id="ExistingIdentifierFlag"
    value={
      '{{ IdentifiersFromAPIList.value.map(()=> { return {isInvalid :false , errorMessage : ""} }) }}'
    }
  />
  <JavascriptQuery
    id="NewIdentifierValidation"
    _additionalScope={["i", "curNewType"]}
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/NewIdentifierValidation.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="ExistingIdentifierValidation"
    _additionalScope={["i", "curVal", "curType"]}
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/ExistingIdentifierValidation.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State
    id="IdentifiersFromAPIList"
    _persistedValueGetter={null}
    _persistedValueSetter={null}
    persistedValueKey=""
    persistValue={false}
    value={
      '{{  selectedCompany.value.identifiers && selectedCompany.value.identifiers.filter(function(item) {\n  return item.item.type !== \'115\' && item.item.type !== \'992\'\n}).sort((a, b) => {\n    // First, move REMEDIATED items to the end\n    if (a.source === "REMEDIATED" && b.source !== "REMEDIATED") return 1;\n    if (b.source === "REMEDIATED" && a.source !== "REMEDIATED") return -1;\n\n    // Then sort by type in ascending order\n    return parseInt(a.item.type) - parseInt(b.item.type);\n}) }}'
    }
  />
  <State id="NewIdentifiersFlag" value="[]" />
  <State id="CopiedNewIdentifiersValues" value="[]" />
  <State
    id="IdentifierRegexData"
    value={
      '{{ \n    {\n          "1": { country: "AL", regex: /^(J|K|L)(?!0{8})\\d{8}[A-Z]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. Must start with J/K/L followed by 8 digits and 1 letter (Eg: J12345678A)]." },\n          "3": { country: "AR", regex: /^(?!00)(\\d{2})-(?!0{8})(\\d{8})-(?!0$)(\\d)$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, followed by a hyphen, 8 digits, another hyphen, and 1 digit(Eg:12-34567890-1)]." },\n          "4": { country: "AU", regex: /^(?!0+\\s)\\d{3}\\s(?!0+\\s)\\d{3}\\s(?!0+$)\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 digits, a space, 3 digits, another space, and 3 digits(Eg:123 456 789)]." },\n          "5": { country: ["AT", "DE", "LU"], regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "6": { country: "AT", regex: /^FN\\s(?!0+\\s)\\d{1,6}\\s[A-Z](\\s\\([A-Z]+\\))?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: FN, space followed by 1-6 digits, space, 1 letter, optional space and parentheses (Eg:FN 172048 M/FN 172048 M (WIEN))." },\n          "7": { country: "AT", regex: /^ATU(?!0{8})\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: ATU followed by 8 digits(Eg:ATU12345678)." },\n          "8": { country: "KH", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "9": { country: "BY", regex: /^(\\d{8}|\\d{12})$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Either 8 digits or 12 digits(Eg:12345678)." },\n          "10": { country: "BE", regex: /^(?!0+\\.)\\d{4}\\.(?!0+\\.)\\d{3}\\.(?!0+$)\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 4 digits, a period, 3 digits, another period, and 3 digits(Eg:1234.567.890)]." },\n          "11": { country: "SE", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "12": { country: "BO", regex: /^\\d{11}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)." },\n          "13": { country: "BA", regex: /^\\d{13}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)]." },\n          "14": { country: "IT", regex: /^\\d{6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits(123456)]." },\n          "15": { country: "BR", regex: /^(?!0+\\.)\\d{2}\\.(?!0+\\.)\\d{3}\\.(?!0+\\/)\\d{3}\\/(?!0+\\-)\\d{4}-(?!0+$)\\d{2}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, a period, 3 digits, another period, 3 digits, a slash, 4 digits, a hyphen, and 2 digits(Eg:12.345.678/1234-12)]." },\n          "16": { country: "BG", regex: /^(\\d{13}|\\d{9})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 13 digits or 9 digits(Eg:1234567890123)]." },\n          "17": { country: "DK", regex: /^\\d{1,4}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 4 digits(Eg:1234)]." },\n          "18": { country: "CL", regex: /^(?!0+.)\\d{2}\\.(?!0+.)\\d{3}\\.(?!0+.)\\d{3}-[A-Z]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, a period, 3 digits, another period, 3 digits, a hyphen, and 1 letter(Eg:12.345.678-A)]." },\n          "19": { country: "CN", regex: /^[A-Za-z0-9]{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 alphanumeric characters(Eg:A12345678)." },\n          "20": { country: "BG", regex: /^(\\d{13}|\\d{9})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 13 digits or 9 digits(Eg:1234567890123)]." },\n          "21": { country: "CO", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "22": { country: "HR", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "23": { country: "CR", regex: /^\\d{1}-(?!0+-)\\d{3}-(?!0+$)\\d{6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 digit, a hyphen, 3 digits, a hyphen, and 6 digits(Eg:1-234-567890)]." },\n          "24": { country: "HR", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "25": { country: "CY", regex: /^[A-Za-z](?!0+$)\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 non-digit character followed by 1 to 6 digits(Eg:A123456)]." },\n          "26": { country: "CZ", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "27": { country: "DK", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "28": { country: "HR", regex: /^\\d{11}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)." },\n          "29": { country: "AU", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "30": { country: "PK", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)]." },\n          "31": { country: "EC", regex: /^\\d{13}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)]." },\n          "32": { country: "NL", regex: /^\\d{12}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)." },\n          "33": { country: "LU", regex: /^LU(?!0{8})\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: LU followed by 8 digits(Eg:LU12345678)." },\n          "34": { country: "SV", regex: /^(?!0+-)\\d{4}-(?!0+-)\\d{6}-(?!0+-)\\d{3}-\\d{1}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 4 digits, a hyphen, 6 digits, another hyphen, 3 digits, a hyphen, and 1 digit(Eg:1234-567890-123-1)]." },\n          "35": { country: "EE", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "36": { country: "FI", regex: /^\\d{7}-\\d$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits, a hyphen, and 1 digit(Eg:1234567-1)]." },\n          "37": { country: "BG", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "38": { country: "M", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "39": { country: "FR", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "40": { country: "FR", regex: /^(?!0+-)\\d{9}-(?!0+$)\\d{5}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits, a hyphen, and 5 digits(Eg:123456789-12345)]." },\n          "41": { country: "FR", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "43": { country: "DE", regex: /^(HRA|HRB|GnR|PR|VR)\\s\\d{1,6}(\\s\\D+)?(\\s\\(\\D+\\))?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: HRA/HRB/GnR/PR/VR followed by 1-6 digits and optional letters and parentheses(Eg:HRA 123 ABC (XYZ))." },\n          "44": { country: "DE", regex: /^DE\\s(?!0{9})\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: DE followed by 9 digits(Eg:DE 123456789)." },\n          "45": { country: "GR", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "47": { country: "GT", regex: /^\\d{4,7}-[\\d|K]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 4 to 7 digits followed by a hyphen and either a digit or \'K\'(Eg:12345-K)." },\n          "48": { country: "WRLD", regex: /^[A-Za-z]{2}(?!0{10})\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 non-digit characters followed by 10 digits(Eg:AB1234567890)]." },\n          "49": { country: "HK", regex: /^(F|LP|FM|MF|RT|SO|UC)?(?!0{7})\\d{7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: An optional prefix F/LP/FM/MF/RT/SO/UC followed by 7 digits(Eg:FM1234567)." },\n          "50": { country: "HU", regex: /^(?!0+-)\\d{2}-(?!0+-)\\d{2}-(?!0$)\\d{6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, a hyphen, 2 digits, another hyphen, and 6 digits(Eg:12-34-567890)." },\n          "51": { country: "IS", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "52": { country: "IN", regex: /^\\d{2,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2- to 6-digit(Eg:123456)." },\n          "53": { country: "ID", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "56": { country: "IE", regex: /^\\d{5,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 6 digits(Eg:123456)]." },\n          "57": { country: "IT", regex: /^[A-Za-z]{2}(?!0{7})\\d{7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 non-digit characters followed by 7 digits(Eg:AB1234567)." },\n          "58": { country: "IT", regex: /^(\\d{11}|[A-Za-z0-9]{16})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits or 16 alphanumeric characters(Eg:12345678901)]." },\n          "59": { country: "NL", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "60": { country: "JM", regex: /^(?!0+$)\\d{1,6}(\\s\\(Overseas\\))?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits, optionally followed by \'(Overseas)\'(Eg:123456 (Overseas))." },\n          "61": { country: "BE", regex: /^(?!0)\\d\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 digit, a period, 3 digits, another period, 3 digits, another period, and 3 digits(Eg:1.234.567.890)]." },\n          "62": { country: "KR", regex: /^(?!0{6})\\d{6}-(?!0{7})\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits, a hyphen, and 7 digits(Eg:123456-1234567)]." },\n          "63": { country: "KR", regex: /^([A-Z](?!0+$)\\d{5}|[A-Z]{2}(?!0{4})\\d{4})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 1 letter followed by 5 digits, or 2 letters followed by 4 digits(Eg:A12345)]." },\n          "64": { country: "KR", regex: /^(?!0{3})\\d{3}-(?!0{2})\\d{2}-(?!0{5})\\d{5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 3 digits, a hyphen, 2 digits, another hyphen, and 5 digits(Eg:123-45-67890)." },\n          "66": { country: "LV", regex: /^(\\d{9}|\\d{11})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 9 digits or 11 digits(Eg:12345678901)]." },\n          "68": { country: "WRLD", regex: /^(?!0{8}(0{3})?$)[A-Z0-9]{8}([A-Z0-9]{3})?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Either 8 alphanumeric for HQ or 11 alphanumeric for branch(Eg:DEUTDEFF)." },\n          "69": { country: "LI", regex: /^FL-(?!0{4})\\d{4}\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}-\\d$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: FL followed by 4 digits, a period, 3 digits, another period, 3 digits, a hyphen, and 1 digit(Eg:FL-1234.567.890-1)]." },\n          "70": { country: "LT", regex: /^\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)]." },\n          "71": { country: "LU", regex: /^(A|B|C|D|E|F|G|H|I|J|K)\\s((?!0+\\.)\\d{1,3}\\.(?!0{3})\\d{3})(\\s\\((Luxembourg|Diekirch)\\))?$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: A to K followed by 1-3 digits, a period, 3 digits, and optionally Luxembourg/Diekirch(Eg:A 123.456 (Luxembourg))]." },\n          "72": { country: "MK", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)]." },\n          "73": { country: "MY", regex: /^(?!0+-)\\d{1,9}-[A-Za-z]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 9 digits followed by a hyphen and 1 non-digit(Eg:1234567-A)]." },\n          "74": { country: "MT", regex: /^(C|OC|P|P COMM|PR|SV)\\s(?!0+$)\\d+$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: C/OC/P/P COMM/PR/SV followed by 1 or more digits(Eg:P 12345)]." },\n          "75": { country: "IL", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "76": { country: "MX", regex: /^[A-Za-z0-9]{3}[A-Z](?!0{6})\\d{6}\\s[A-Za-z0-9]{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 alphanumeric characters followed by 1 non-digit, 6 digits, a space, and 3 alphanumeric characters(Eg:ABCD123456 XYZ)]." },\n          "77": { country: "MD", regex: /^(\\d{10}|\\d{13})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 or 13 digits (e.g., 1234567890123)]." },\n          "78": { country: "CH", regex: /^CHE-(?!0{3})\\d{3}\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: CHE followed by 3 digits, a period, 3 digits, another period, and 3 digits(Eg:CHE-123.456.789)]." },\n          "79": { country: "ME", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "80": { country: "NL", regex: /^\\d{12}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)]." },\n          "81": { country: "BA", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "82": { country: "NZ", regex: /^\\d{3,10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 3 to 10 digits(Eg:1234567890)." },\n          "83": { country: "CH", regex: /^\\d{1,7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 7 digits(Eg:1234567)." },\n          "84": { country: "ZA", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "85": { country: "NO", regex: /^(?!0{3})\\d{3}\\s(?!0{3})\\d{3}\\s(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 digits, a space, 3 digits, another space, and 3 digits(Eg:123 456 789)]." },\n          "86": { country: "IT", regex: /^\\d{11}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)." },\n          "87": { country: "RS", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "88": { country: "PA", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "89": { country: "CO", regex: /^\\d{16}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 16 digits(Eg:1234567890123456)." },\n          "90": { country: "PY", regex: /^(?!0+-)\\d{8,9}-\\d$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 to 9 digits followed by a hyphen and 1 digit(Eg:12345678-1)]." },\n          "91": { country: "PE", regex: /^\\d{11}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)]." },\n          "92": { country: "PH", regex: /^[A-Za-z]{1,2}(?!0+$)\\d{9,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 or 2 letters followed by 9 or 10 digits(Eg:A123456789)]." },\n          "93": { country: "PL", regex: /^\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)]." },\n          "94": { country: "PT", regex: /^\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)]." },\n          "95": { country: "CN", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "96": { country: "RO", regex: /^\\d{2,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 to 10 digits(Eg:1234567890)]." },\n          "97": { country: "RU", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "98": { country: "RU", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "99": { country: "RU", regex: /^\\d{13}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)." },\n          "100": { country: "CN", regex: /^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: One or more alphanumeric characters followed by optional hyphen and alphanumeric characters(Eg:ABC-123)." },\n          "101": { country: "RS", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "102": { country: "HK", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "103": { country: "SG", regex: /^((?!0{8})\\d{8}[A-Z]|(18|19|20)(?!0{7})\\d{7}[A-Z]|(R|S|T)(?!0{2})\\d{2}[A-Z]{2}(?!0{4})\\d{4}[A-Z])$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits followed by a letter, a year starting with 18/19/20 followed by 7 digits and a letter, or start with R/S/T followed by 2 digits, 2 letters, 4 digits, and 1 letter(Eg:12345678A)]." },\n          "104": { country: "SK", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "105": { country: "SI", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "106": { country: "ZA", regex: /^(18|19|20)\\d{2}\\/(?!0{6})\\d{6}\\/(?!0{2})\\d{2}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 18/19/20 followed by 4 digits, a slash, 6 digits, another slash, and 2 digits(Eg:2019/123456/78)]." },\n          "107": { country: "ES", regex: /^[A-Z](?!0{7})\\d{7}[A-Z]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 non-digit followed by 7 digits and 1 letter(Eg:A1234567A)]." },\n          "108": { country: "SE", regex: /^(?!0{6})\\d{6}-(?!0{4})\\d{4}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits followed by a hyphen and 4 digits(Eg:123456-1234)]." },\n          "109": { country: "GB", regex: /^#(?!0+$)\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: # followed by 7 digits(Eg:#1234567)]." },\n          "110": { country: "CH", regex: /^CH-(?!0{3})\\d{3}\\.\\d\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}-\\d$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: CH followed by 3 digits, a period, 3 digits, another period, 3 digits, a hyphen, and 1 digit(Eg:CH-123.4.567.890-1)." },\n          "111": { country: "CN", regex: /^[A-Za-z0-9]{15}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 15 alphanumeric characters(Eg:ABC123DEF456GH789)." },\n          "112": { country: "TW", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "113": { country: "TH", regex: /^\\d{13}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)]." },\n          "114": { country: "NL", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "115": { country: "WRLD", regex: /^(?!0{4})\\d{4}(?!0{16})[A-Za-z0-9]{16}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 4 digits followed by 16 alphanumeric characters]." },\n          "116": { country: "UA", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "117": { country: "ZA", regex: /^4(?!0{9})\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: A 4 followed by 9 digits(Eg:41234567890)." },\n          "118": { country: "GB", regex: /^(?!0{8})\\d{8}$|^[A-Za-z]{2}(?!0+$)\\d{6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits or 2 letters followed by 6 digits(Eg:AB123456)]." },\n          "119": { country: "UA", regex: /^\\d{12}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits (Eg:123456789012)." },\n          "120": { country: "US", regex: /^M[A-Z1-9][A-Z0-9]{4}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: M followed by 1 uppercase letter or number, then 4 alphanumeric characters(Eg:MABC1234)." },\n          "121": { country: "US", regex: /^(?!0{2})\\d{2}-(?!0{7})\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits followed by a hyphen and 7 digits(Eg:12-3456789)]." },\n          "123": { country: "UY", regex: /^\\d{12}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)." },\n          "125": { country: "VE", regex: /^[A-Za-z]-(?!0{7})\\d{7}-[0-9]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: one letter followed by a hyphen, eight digits (not all zeros), another hyphen, and one final digit(Eg:A-12345678-9)]." },\n          "126": { country: "VN", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "127": { country: "WRLD", regex: /^(?!0+[A-Z])\\d{5,6}[A-Z]{2}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 6 digits followed by 2 non-digits(Eg:12345AB)]." },\n          "128": { country: "PL", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "129": { country: "HR", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "130": { country: "BD", regex: /^(C|CH|P)-(?!0+$)\\d{2,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: C/CH/P followed by 2 to 6 digits(Eg:C-12345)." },\n          "132": { country: "PT", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "133": { country: "UZ", regex: /^\\d{1,9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 9 digits(Eg:123456789)]." },\n          "134": { country: "BH", regex: /^(?!0+-)\\d+-(?!0+$)\\d+$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: One or more digits followed by a hyphen and one or more digits(Eg:123-456)]." },\n          "135": { country: "QA", regex: /^\\d{1,8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 8 digits(Eg:12345678)]." },\n          "136": { country: "HR", regex: /^\\d{11}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)]." },\n          "137": { country: "HR", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be:  10 digits(Eg:1234567890)." },\n          "138": { country: "CZ", regex: /^CZ(?!0+$)\\d{8,10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: CZ followed by 8 to 10 digits(Eg:CZ123456789)." },\n          "139": { country: "IS", regex: /^\\d{5,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 6 digits(Eg:123456)." },\n          "140": { country: "MC", regex: /^(?!0{2})\\d{2}(P|S)(?!0{5})\\d{5}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, followed by P or S, and 5 digits(Eg:12P12345)]." },\n          "141": { country: "PL", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "142": { country: "RO", regex: /^(F|J|C)(?!0{5})\\d{5}(?!0+$)\\d{1,4}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: One letter followed by 5 digits then 1 to 4 digits(Eg:F123451234)." },\n          "143": { country: "SK", regex: /^SK(?!0{10})\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: SK followed by 10 digits(Eg:SK1234567890)" },\n          "144": { country: "SI", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "145": { country: "LV", regex: /^LV(?!0{11})\\d{11}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: LV followed by 11 digits(Eg:LV12345678901)" },\n          "146": { country: "HU", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits (Eg: 12345678)]." },\n          "147": { country: "WRLD", regex: /^(\\d{5}|\\d{8})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 5 digits or 8 digits(Eg:12345)]." },\n          "148": { country: "AT", regex: /^\\d{1,8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 8 digits(Eg:12345678)." },\n          "149": { country: "BY", regex: /^\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)]." },\n          "150": { country: "ID", regex: /^(?!0{2})\\d{2}\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}\\.\\d-(?!0{3})\\d{3}\\.(?!0{3})\\d{3}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, period, 3 digits, period, 3 digits, period, 3 digits, and 3 digits(Eg:12.345.678.9-123.456)." },\n          "151": { country: "IN", regex: /^[A-Z]\\d{5}[A-Z]{2}\\d{4}[A-Z]{3}\\d{6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 non-digit followed by 5 digits, 2 non-digits, 4 digits, 3 non-digits, and 6 digits (Eg:A12345AB123456789)." },\n          "152": { country: "LK", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits (Eg: 123456)." },\n          "154": { country: "GE", regex: /^(\\d{9}|\\d{11})$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Either 9 digits or 11 digits(Eg:12345678901)]." },\n          "155": { country: "WRLD", regex: /^[A-Z]{3}(?!0{9})\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 non-digits followed by 9 digits (Eg:ABC123456789)]." },\n          "156": { country: "BE", regex: /^(?!0{7})\\d{7}-(?!0{2})\\d{2}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits followed by a hyphen and 2 digits(Eg:1234567-12)." },\n          "157": { country: "IN", regex: /^IN(?!0+$)\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: IN followed by 1 to 6 digits (Eg:IN123456)." },\n          "158": { country: "DZ", regex: /^[1-9]{2}[A-Z](?!0{7})\\d{7}$|^[1-9]{2}[A-Z](?!0{7})\\d{7}((?!0{2})\\d{2})?$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 non-zero digits followed by 1 uppercase letter and 7 digits, or 2 additional digits (Eg:12A1234567)]." },\n          "159": { country: "KV", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "160": { country: "EE", regex: /^EE(?!0{9})\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: EE followed by 9 digits (Eg: EE123456789)." },\n          "161": { country: "LT", regex: /^LT(?!0{9})\\d{9}((?!0+$)\\d{2,5})?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: LT followed by 9 digits and optionally 2 to 5 more digits (Eg:LT123456789123)." },\n          "162": { country: "AU", regex: /^(?!0{2})\\d{2}\\s(?!0{3})\\d{3}\\s(?!0{3})\\d{3}\\s(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, space, 3 digits, space, 3 digits, space, 3 digits(Eg:12 345 678 901)]." },\n          "164": { country: "TR", regex: /^\\d{1,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 10 digits(Eg:1234567890)]." },\n          "165": { country: "GB", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "167": { country: "IM", regex: /^(?!0{6})\\d{6}[A-Za-z0-9]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits followed by 1 alphanumeric character (Eg: 123456A)]." },\n          "172": { country: "MT", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "174": { country: "WRLD", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "175": { country: "DK", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "176": { country: "DE", regex: /^(?!0+\\/)\\d{2,5}\\/(?!0+\\/)\\d{3,5}(\\/(?!0+\\/)\\d{4,5})?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 to 5 digits, a slash, 3 to 5 digits, optionally followed by more slashes and 4-5 digits(Eg:12/345/6789)." },\n          "177": { country: "US", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "178": { country: "TZ", regex: /^\\d{3,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 to 6 digits(Eg:123456)]." },\n          "179": { country: "MU", regex: /^((C|T|P)(?!0+$)\\d{2,6}|(?!0+$)\\d{1,6})$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: C/T/P followed by 2-6 digits, or 1-6 digits (Eg: C12345)." },\n          "180": { country: "RW", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "181": { country: "SN", regex: /^\\d{6}[A-Z0-9]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits followed by 1 alphanumeric character (Eg: 123456A)." },\n          "182": { country: "PR", regex: /^\\d{1,7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 7 digits(Eg:1234567)]." },\n          "183": { country: "UY", regex: /^\\d{12}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)]." },\n          "184": { country: "NE", regex: /^\\d{1,4}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 4 digits(Eg:1234)]." },\n          "185": { country: "NE", regex: /^\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits(Eg:12345)." },\n          "187": { country: "GB", regex: /^\\d{1,7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 7 digits(Eg:1234567)." },\n          "188": { country: "KZ", regex: /^\\d{12}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)]." },\n          "189": { country: "MG", regex: /^(19|20)\\d{2}(A|B|C|D|E)(?!0{5})\\d{5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 19/20 followed by 4 digits, 1 letter, and 5 digits (Eg: 2020A12345)." },\n          "190": { country: "NA", regex: /^[A-Z]{0,3}\\/(?!0+\\/)\\d{2,4}\\/(?!0+$)\\d{2,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 0-3 non-digits, a slash, 2-4 digits, another slash, and 2-5 digits (Eg:/12/345)." },\n          "193": { country: "MK", regex: /^MK(?!0{13})\\d{13}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: MK followed by 13 digits (Eg: MK1234567890123)]." },\n          "194": { country: "AT", regex: /^(?!0{3})\\d{3}\\/(?!0{4})\\d{4}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 digits followed by a slash and 4 digits(Eg:123/4567)]." },\n          "195": { country: "WRLD", regex: /^(?!0+$)[A-Za-z0-9]{19}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be 19 digit and can not be a sequence of all zeros]." },\n          "197": { country: "LU", regex: /^(?!0{4})\\d{4}\\/(?!0{4})\\d{4}\\/(?!0+$)\\d{3,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 4 digits, a slash, 4 digits, a slash, and 3-5 digits(Eg:1234/5678/12345)." },\n          "198": { country: "WRLD", regex: /^[A-Z]{2}(?!0{9})\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 non-digits followed by 9 digits (Eg: AB123456789)." },\n          "199": { country: "MX", regex: /^\\d{4,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 4 to 6 digits(Eg:123456)]." },\n          "203": { country: "CM", regex: /^[A-Z](?!0{12})\\d{12}[A-Za-z0-9]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 non-digit followed by 12 digits and 1 alphanumeric character (Eg: A1234567890123A)." },\n          "204": { country: "RU", regex: /^\\d{15}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 15 digits(Eg:123456789012345)]." },\n          "206": { country: "PG", regex: /^(?!0)\\d-(?!0+($|\\.))\\d+(\\.(?!0+$)\\d+)?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 digit, a hyphen, 1 or more digits, and optional decimal numbers(Eg:1-1234.56)." },\n          "208": { country: "PA", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "209": { country: "BR", regex: /^\\d{11}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 11 digits(Eg:12345678901)]." },\n          "211": { country: "BM", regex: /^\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits(Eg:12345)." },\n          "212": { country: "CN", regex: /^[A-Za-z0-9]{18}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 18 alphanumeric characters (Eg:ABCDEFGHIJKL123456)]." },\n          "213": { country: "WRLD", regex: /^\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits(Eg:12345)." },\n          "214": { country: "CY", regex: /^CY(?!0{8})\\d{8}[A-Z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: CY followed by 8 digits and 1 non-digit (Eg:CY12345678A)." },\n          "215": { country: "DO", regex: /^(?!0+\\s)\\d{1,6}(\\s\\(\\w+\\))?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits, optionally followed by a space and a word in parentheses(Eg:123456 (ABC))." },\n          "216": { country: "BS", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "217": { country: "CA", regex: /^(?!0+-)\\d{6}-\\d$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 6 digits followed by a hyphen and 1 digit(Eg:123456-7)]." },\n          "218": { country: "NG", regex: /^\\d{2,7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 to 7 digits(Eg:1234567)." },\n          "219": { country: "PY", regex: /^\\d{1,5}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits(Eg:12345)]." },\n          "220": { country: "LS", regex: /^((E|I)?(?!0+\\/)\\d{2,4}\\/)?(?!0+$)\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Optional E or I followed by optional 2 to 4 digits followed by a slash and 1 to 5 digits(Eg:E12/34567)." },\n          "221": { country: "LS", regex: /^(?!0+-)\\d{7,9}\\-(?!0{1})\\d{1}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 to 9 digits followed by a hyphen and 1 digit(Eg:1234567-1)]." },\n          "222": { country: "BO", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "224": { country: "KE", regex: /^(A|P)(?!0{9})\\d{9}[a-zA-Z0-9]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: A/P followed by 9 digits and 1 alphanumeric character (Eg:A123456789X)]." },\n          "225": { country: "MM", regex: /^(?!0+(\\/|FC))\\d{1,4}(FC)?\\/(?!0{4})\\d{4}-(?!0{4})\\d{4}(\\s\\((MDY|MON|NPW|SHN|YGN)\\))?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 4 digits, optional FC, a slash, 4 digits, a hyphen, 4 digits, optionally followed by MDY/MON/NPW/SHN/YGN(Eg:1234/5678-1234 (MDY))." },\n          "226": { country: "GH", regex: /^(BN|CS|CU|ET|PL|PN|PU)(?!0{9})\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: BN/CS/CU/ET/PL/PN/PU followed by 9 digits (Eg:BN123456789)]." },\n          "227": { country: "IN", regex: /^[A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)(?!0{4})\\d{4}[A-Z]$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 3 non-digits followed by 1 letter, 4 digits, and 1 non-digit (Eg:ABCJ1234A)]." },\n          "228": { country: "MU", regex: /^(C|T|P)(?!0{8})\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: C/T/P followed by 8 digits(Eg:C12345678)." },\n          "229": { country: "IN", regex: /^(?!0+$)(0[1-9]|[12][0-9]|3[0-5])\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: A digit between 01-35 followed by 9 digits(Eg:1234567890)." },\n          "230": { country: "SN", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "231": { country: "GB", regex: /^\\d{5,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 6 digits(Eg:123456)." },\n          "232": { country: "JP", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "233": { country: "MU", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "234": { country: "WRLD", regex: /^\\d{7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)." },\n          "235": { country: "GT", regex: /^(?!0+-)\\d{1,9}-(?!0+-)\\d{1,4}-(?!0+$)\\d{1,4}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 9 digits, a hyphen, 1 to 4 digits, another hyphen, and 1 to 4 digits(Eg:1234567-123-1234)." },\n          "236": { country: "AO", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)]." },\n          "237": { country: "JM", regex: /^(?!0+$)\\d{1,5}\\/(19|20)\\d{2}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits followed by a slash and 19/20 and 4 digits(Eg:12345/2023)." },\n          "238": { country: "DK", regex: /^(?!0\\.)\\d{1,3}\\.(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 3 digits, a period, and 3 digits(Eg:123.456)]." },\n          "239": { country: "JP", regex: /^\\d{13}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)]." },\n          "240": { country: "GY", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "241": { country: "WRLD", regex: /^\\d{1,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 10 digits(Eg:1234567890)]." },\n          "242": { country: "WRLD", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)." },\n          "243": { country: "BE", regex: /^(?!0{4})\\d{4}\\.(?!0{3})\\d{3}\\.(?!0{3})\\d{3}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 4 digits, a period, 3 digits, another period, and 3 digits(Eg:1234.567.890)." },\n          "244": { country: "US", regex: /^\\d{2,5}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 to 5 digits(Eg:12345)]." },\n          "245": { country: "WRLD", regex: /^\\d{5,9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 9 digits(Eg:123456789)." },\n          "246": { country: "ME", regex: /^\\d{8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)]." },\n          "10040": { country: "FR", regex: /^(?!0{9})\\d{9}-(?!0{5})\\d{5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits followed by a hyphen and 5 digits(Eg:123456789-12345)." },\n          "247": { country: "TJ", regex: /^\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)]." },\n          "248": { country: "TJ", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "249": { country: "NZ", regex: /^\\d{13}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 13 digits(Eg:1234567890123)." },\n          "250": { country: "NP", regex: /^\\d{1,6}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)]." },\n          "251": { country: "OM", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)]." },\n          "252": { country: "BN", regex: /^RC(?!0{8})\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: RC followed by 8 digits (Eg: RC12345678)." },\n          "253": { country: "PH", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)]." },\n          "254": { country: "VE", regex: /^\\d{16,19}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 16 to 19 digits(Eg:1234567890123456)]." },\n          "255": { country: "GI", regex: /^\\d{5,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 5 to 6 digits(Eg:123456)." },\n          "256": { country: "GR", regex: /^(?!0{7})\\d{7}([0-5][0-9]|60)(?!0{3})\\d{3}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits followed by 2 digits between 00-60 and 3 more digits(Eg:123456789001)." },\n          "257": { country: "SN", regex: /^SN\\.[A-Z]{3}\\.(19|20)\\d{2}\\.[A-Z]\\.(?!0+$)\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: SN followed by non-digit characters and date format (Eg: SN.ABC.2023.D.123)." },\n          "258": { country: "MA", regex: /^\\d{15}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 15 digits(Eg:123456789012345)]." },\n          "259": { country: "CA", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "260": { country: "KH", regex: /^[A-Z](?!0{3})\\d{3}-(?!0{9})\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 non-digit followed by 3 digits, a hyphen, and 9 digits (Eg: A123-123456789)." },\n          "261": { country: "HU", regex: /^(?!0{8})\\d{8}-(?!0{1})\\d-(?!0{2})\\d{2}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits, a hyphen, 1 digit, and 2 digits(Eg:12345678-1-12)." },\n          "262": { country: "BZ", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)." },\n          "264": { country: "BD", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "265": { country: "WRLD", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)." },\n          "266": { country: "WRLD", regex: /^\\d{1,5}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits(Eg:12345)." },\n          "267": { country: "AM", regex: /^(?!0+\\.)\\d{1,3}\\.(?!0+\\.)\\d{1,3}\\.(?!0+$)\\d{1,7}$/, message: " Identifiers cannot contain leading or trailing spaces. The format must be:1 to 3 digits, period, 1 to 3 digits, period, and 1 to 7 digits(Eg:123.456.7890" },\n          "268": { country: "AM", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "269": { country: "AZ", regex: /^01(?!0{8})\\d{8}(1|2)$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 01 followed by 8 digits and 1 or 2 (Eg: 01234567812)]." },\n          "270": { country: "DZ", regex: /^\\d{15}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 15 digits(Eg:123456789012345)." },\n          "271": { country: "IN", regex: /^[a-zA-Z]{3}-(?!0{4})\\d{4}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 3 non-digits followed by a hyphen and 4 digits (Eg: ABC-1234)." },\n          "272": { country: "BB", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)." },\n          "273": { country: "ZM", regex: /^\\d{12}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)." },\n          "274": { country: "ZM", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "275": { country: "MG", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "276": { country: "TZ", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "278": { country: "SC", regex: /^(\\d{6}|[A-Z](?!0+$)\\d{6,7})$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Either 6 digits or non-digit followed by 6-7 digits (Eg:123456)." },\n          "279": { country: "SC", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "280": { country: "KG", regex: /^\\d{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits(Eg:12345678)." },\n          "281": { country: "KG", regex: /^\\d{14}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 14 digits(Eg:12345678901234)." },\n          "282": { country: "IN", regex: /^(?!0{2})\\d{2}[A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)(?!0{4})\\d{4}[A-Z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 digits, 3 non-digits, 1 letter, followed by 4 digits and a non-digit (Eg:12ABCJ1234A)." },\n          "283": { country: "IT", regex: /^\\d{7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)." },\n          "284": { country: "KV", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "285": { country: "KV", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits(Eg:1234567)]." },\n          "286": { country: "KV", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits(Eg:123456789)." },\n          "287": { country: "MY", regex: /^\\d{12}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 12 digits(Eg:123456789012)]." },\n          "288": { country: "WRLD", regex: /^FS\\w{8}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: FS followed by 8 alphanumeric characters(Eg:FSABCDE123)." },\n          "289": { country: "AE", regex: /^((CN|DMCC|I|IB|IBC|IC|ICC|IN|JLT|L|MC|N|NC|OF|OS|OVR|R|T|TL|TN|UFZ)-)?(?!0+$)\\d{1,9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: An optional prefix followed by a hyphen (-) and then by a number from 1 to 9 digits, not all zeros(Eg:CN123456789)]." },\n          "290": { country: "US", regex: /^(US|CA)(?!0{9})\\d{9}[A-Za-z]{2}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: US/CA followed by 9 digits and 2 non-digits(Eg:US123456789AB)]." },\n          "292": { country: "FR", regex: /^FR(?!0{2})\\d{2}\\s(?!0{9})\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: FR followed by 2 digits and 9 digits with a space(Eg:FR12 123456789)]." },\n          "293": { country: "TR", regex: /^\\d{8,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 8 to 10 digits(Eg:1234567890)]." },\n          "294": { country: "AW", regex: /^(H|S)(?!0+\\.)\\d{1,5}.0$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: H/S followed by 1 to 5 digits and a decimal point(Eg:H12345.0)." },\n          "295": { country: "CW", regex: /^\\d{1,6}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 6 digits(Eg:123456)." },\n          "296": { country: "WS", regex: /^\\d{4,9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 4 to 9 digits(Eg:123456789)." },\n          "297": { country: "GH", regex: /^(C|P)(?!0{10})\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: C/P followed by 10 digits(Eg:C1234567890)]." },\n          "298": { country: "TN", regex: /^\\w{1,10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 10 alphanumeric characters(Eg:ABC123XYZ)]." },\n          "299": { country: "BW", regex: /^BW(?!0{11})\\d{11}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: BW followed by 11 digits (Eg:BW12345678901)]." },\n          "300": { country: "IE", regex: /^IE(?!0+$)\\d{8,9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: IE followed by 8 to 9 digits (Eg:IE123456789)]." },\n          "301": { country: "CA", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits (Eg: 1234567890)." },\n          "302": { country: "CA", regex: /^((?!0+[A-Z])\\d{1,5}[A-Z]{0,2}|(?!0+$)\\d{1,6})$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 5 digits followed by 0 to 2 letters or 1 to 6 digits (Eg:123AB)." },\n          "303": { country: "CA", regex: /^\\d{7}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 7 digits (Eg:1234567)]." },\n          "305": { country: "WRLD", regex: /^\\d{1,8}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 1 to 8 digits(Eg:12345678)]." },\n          "306": { country: "ID", regex: /^[A-Z]{2}(?!0{10})\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 2 non-digits followed by 10 digits (Eg:AB1234567890)]." },\n          "307": { country: "WRLD", regex: /^[0-9a-fA-F]{32}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 32 hexadecimal characters(Eg:a1b2c3d4e5f67890a1b2c3d4e5f67890)]." },\n          "308": { country: "SK", regex: /^\\d{10}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: 10-digits(Eg:1234567890)]." },\n          "309": { country: "ML", regex: /^[0-9]{9}[A-Z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits followed by 1 uppercase letter(Eg:123456789A)." },\n          "310": { country: "ET", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "311": { country: "ES", regex: /^(X|\\d)(?!0+[A-Za-z])\\d{6,7}[A-Za-z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: X or digit followed by 6-7 digits and 1 letter(Eg:X1234567A)." },\n          "312": { country: "GN", regex: /^((?!0{9})\\d{9}|(?!0+[A-Z])\\d{1,5}[A-Z]{1,3})$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 digits or 1 to 5 digits followed by 1 to 3 uppercase letters(Eg:123456789)." },\n          "313": { country: "PK", regex: /^[A-Z](?!0{5})\\d{5}(-\\d)?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 1 letter (province code), 5 digits, sometimes with dash and 1 check digit (Eg:A1234567-8)" },\n          "314": { country: "IN", regex: /UDYAM-[A-Z]{2}-\\d{2}-(?!0{7})\\d{7}/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: UDYAM followed by 2 uppercase letters, 2 digits, and 7 digits(Eg:UDYAM-AB-12-1234567)." },\n          "315": { country: "CZ", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 10 digits(Eg:1234567890)." },\n          "317": { country: "CZ", regex: /^CZ(?!0+$)\\d{9}/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: CZ followed by 9 digits." },\n          "318": { country: "JM", regex: /^\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Exactly 9 digits." },\n          "319": { country: "CI", regex: /^(?!0+[A-Z])\\d{7,8}[A-Z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be:   7 or 8 digits, followed by 1 uppercase letter." },\n          "320": { country: "PH", regex: /^(?!0{3})\\d{3}-(?!0{3})\\d{3}-(?!0{3})\\d{3}(-(?!0{3})\\d{3})?$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 9 or 12 digits split by dashes (xxx-xxx-xxx or xxx-xxx-xxx-xxx)." },\n          "321": { country: "CN", regex: /^156(?!0+$)\\d{9}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Starts with 156 followed by 9 digits]." },\n          "322": { country: "CO", regex: /^\\d{10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Exactly 10 digits." },\n          "323": { country: "BF", regex: /^BF[A-Za-z]{3}(?!0{4})\\d{4}[A-Za-z](?!0{5})\\d{5}$|^BF[A-Za-z]{3}(?!0{6})\\d{6}[A-Za-z](?!0{7})\\d{7}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: Two formats: 1. BF + 3 letters + 4 digits + 1 letter + 5 digits , 2. BF + 3 letters + 6 digits + 1 letter + 7 digits."},\n          "324": { country: "BF", regex: /^(?!0+[A-Z])\\d{8}[A-Za-z]$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 8 digits followed by 1 letter." },\n          "325": { country: "RO", regex: /^(?!0+$)\\d{2,10}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be: 2 to 10 digits." },\n          "326": { country: "AU", regex: /^(?!0{3})\\d{3}\\s(?!0{3})\\d{3}\\s(?!0{3})\\d{3}$/, message: "Please contact the BvD ID team before modifying this ID.[Identifiers cannot contain leading or trailing spaces. The format must be: Three groups of 3 digits separated by spaces]." },\n          "328": { country: "MC", regex: /^FR[A-HJ-NP-Z0-9]{2}(?!0+$)\\d{9}$/, message: "Identifiers cannot contain leading or trailing spaces. The format must be:  FR + 2 alphanumeric chars (excluding I and O) + 9 digits." },\n\n      }\n  }}'
    }
  />
  <JavascriptQuery
    id="handleSaveIdentifiers"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleSaveIdentifiers.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="PUTMasteringRecordIdentifiers"
    body={
      '[{"key":"entityID","value":"{{selectedCompany.value.header.entityID}}"},{"key":"recordStatus","value":"ACTIVE"},{"key":"identifiers","value":"{{IdentifierPutArray.value.length > 0 ? IdentifierPutArray.value : null}}"},{"key":"activityDescriptions","value":"{{saveActivityDescriptions.value.length > 0 ? saveActivityDescriptions.value : null}}"},{"key":"names","value":"{{saveNamePutArray.value?.length === 0 ? null : saveNamePutArray.value}}"},{"key":"entityInfo","value":"{{saveEntityInfoPutArray.value?.length === 0 ? null : saveEntityInfoPutArray.value}}"},{"key":"addresses","value":"{{saveAddressPutArray.value.length > 0 ? saveAddressPutArray.value : null}}"},{"key":"digitalPresences","value":"{{saveDigitalPresencesPutArray.value.length > 0 ? saveDigitalPresencesPutArray.value : null}}"}]'
    }
    bodyType="json"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/premastering"
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` v
return "
    type="PUT"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: '//  updateLinkedAttributes.trigger()\n\n//  var response = UpdateMetadataRecord.trigger()\n//  console.log("UpdateMetadataRecord Links RESPONSE : ", response)\n\n//updateLinkedAttributes.trigger()\n//  AuditTrailList.setValue({})\n\n//  loadingPopUp.hide(true)',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const searchBoxInputValue = SearchedEntity.value.trim();\nconst isFirstCharacterNumber = /^\\d/.test(searchBoxInputValue);\n// Trigger actions after a 5-second delay\nResetIdentifiersData.trigger();\nsetTimeout(() => {\n  if (isFirstCharacterNumber) {\n    GetMasteringByOrbisIdIdentifiers.trigger(); \n    GetPremasteringbyORBISID.trigger();\n  } else {\n    GetMasteringByBvDID2.trigger();\n    GetPremasteringByBVDID.trigger();\n  }\n}, 5000); // 5 seconds delay\n",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "Success" },
                { description: "Record has been successfully updated" },
                { duration: "2" },
              ],
            },
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { onSuccess: null },
                { onFailure: null },
                { additionalScope: null },
              ],
            },
          },
        ],
      }}
      pluginId="resetAllGlobalVariables"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "error" },
                { title: "Error" },
                { description: "Record Not Updated" },
              ],
            },
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="openPage"
      params={{
        ordered: [
          { options: { ordered: [{ passDataWith: "urlParams" }] } },
          { pageName: "identifiers" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="GetMasteringByOrbisIdIdentifiers"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers="[]"
    isHidden={false}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="/record/mastering?entity_id={{GlobalEntityId.value ? GlobalEntityId.value : SearchedEntity.value.trim().toUpperCase()}}
"
    resourceName="49403dc5-ac74-4ca2-bc49-29dce5881270"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: '\nvar response = GetMasteringByOrbisIdIdentifiers.data;\n//exclude deleted records ODY-13419 state: 1\n if (response.header.state !== 1 ) {\n var curRecord  = await FilterIdentifierFromAPIResponseIdentifierPage.trigger();\n selectedCompany.setValue(curRecord);\n console.log("selectedCompany", selectedCompany);\n var a = [];\n a.push(curRecord);\n TableRecordsMastering.setValue(a);\n nationalLegalFormUpdates.trigger();\n} else {\n  loadingPopUp.hide();\n  utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});\n}',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="loadingPopUp"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="resetAllGlobalVariables"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="failure"
      method="run"
      params={{
        ordered: [
          {
            src: 'loadingPopUp.setHidden(true);\n utils.openPage("identifiers", { newTab: false });\n utils.showNotification({\n  title : "Error",\n  description: "No matching record found.",\n  notificationType: "error",\n  duration: 3,\n});',
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="ResetIdentifiersData"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/ResetIdentifiersData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="handleCloseIdentifier"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/handleCloseIdentifier.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="LinkCheckIdentifiers"
    isHidden={false}
    notificationDuration={4.5}
    query={include("../lib/LinkCheckIdentifiers.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main6"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    style={{ ordered: [{ canvas: "#ffffff" }] }}
    type="main"
  >
    <ButtonGroup2
      id="orbisMasterButtonGroup6"
      alignment="right"
      hidden="{{ jiraClick.value }}"
      overflowPosition={2}
    >
      <ButtonGroup2-Button
        id="de099"
        backgroundColor="rgb(204, 204, 204)"
        icon="bold/interface-arrows-synchronize"
        iconPosition="left"
        styleVariant="custom"
        text="Refresh"
      >
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "loadingPopUp.show();\nlet entityId =selectedCompany?.value?.header?.entityID ? selectedCompany?.value?.header?.entityID : GlobalEntityId.value\nsetTimeout(()=>{\n  const trimmedInput = entityId;\nconst isFirstCharacterNumber = /^\\d/.test(trimmedInput);\n//ResetFormFields.trigger();\n\n//metadataTableLinkReset.trigger();\n  \nResetIdentifiersData.trigger();\nresetAllGlobalVariables.trigger(); \n  if (isFirstCharacterNumber) {\n    //  console.log(\"isFirstCharacterNumber\");\n    requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n    GetMasteringByOrbisIdIdentifiers.trigger();\n  } else {\n    //  console.log(\"isnot FirstCharacterNumber\");\n    //GetMasteringByBvDID.trigger();\n  requestTypeLockUnlock.setValue('read');\n setLockUnlockParams.trigger();\n  }\n}, 100)\n",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="a38a2"
        icon="bold/interface-arrows-left-alternate"
        iconPosition="left"
        styleVariant="solid"
        text="Home"
      >
        <Event
          event="click"
          method="openPage"
          params={{
            ordered: [
              { options: { ordered: [{ passDataWith: "urlParams" }] } },
              { pageName: "firmohome" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "lockEntity.setValue(false);\ntext533.setValue('');\n//metadataTableLinkReset.trigger();\nResetIdentifiersData.trigger();\nresetAllGlobalVariables..trigger();",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "false" }] }}
          pluginId="loaderHideFlag"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="preMasteringCallsForFirmoHome"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Include src="./EntityInfoActionsWrapper5.rsx" />
    <Container
      id="navigationContainer5"
      disabled="{{
    NewIdentifiersFlag.value.filter((item) => item.isInvalid === true).length > 0 
    || ExistingIdentifierFlag.value.filter((item)=> item.isInvalid === true).length > 0
    || Object.values(NewIdentifiersValues.value).some(value => !value)
}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ jiraClick.value }}"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
    >
      <Header>
        <Text
          id="containerTitle385"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f90d9" viewKey="View 1">
        <Container
          id="navigationAccordion13"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle77"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Information"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle78"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              style={{ ordered: [] }}
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion13.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion13"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation24"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/shopping-business-card"
                iconPosition="left"
                itemType="custom"
                label="Names"
                screenTargetId="entityDetails"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      {
                        options: {
                          ordered: [
                            { passDataWith: "urlParams" },
                            {
                              queryParams: [
                                {
                                  ordered: [
                                    { key: "orbisId" },
                                    {
                                      value:
                                        "{{ TableRecordsMastering.value[0].header.entityID }}\n",
                                    },
                                  ],
                                },
                                {
                                  ordered: [
                                    { key: "bvdId" },
                                    {
                                      value:
                                        "{{ TableRecordsMastering.value[0].header.bvdID }}\n",
                                    },
                                  ],
                                },
                                {
                                  ordered: [
                                    { key: "ticket" },
                                    {
                                      value:
                                        "{{ JiraTicketNumber.value ? JiraTicketNumber.value : ''}}",
                                    },
                                  ],
                                },
                              ],
                            },
                            { persistUrlParams: true },
                          ],
                        },
                      },
                      { pageName: "entityDetails" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="486e3"
                icon="bold/legal-justice-scale-1"
                iconPosition="left"
                itemType="custom"
                label="Legal Information"
                screenTargetId="business"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "legalInformation" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="0e62c"
                icon="bold/shopping-business-table"
                iconPosition="left"
                itemType="custom"
                label="Business Description"
                screenTargetId="business"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "business" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion14"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle78"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Company Contact"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle79"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion14.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion14"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation25"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/computer-connection-network"
                iconPosition="left"
                itemType="custom"
                label="Digital Presence"
                screenTargetId="digitalPresence"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "digitalPresence" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
              <Option
                id="0e62c"
                icon="bold/programming-web-address-field-alternate"
                iconPosition="left"
                itemType="custom"
                label="Addresses"
                screenTargetId="address"
              >
                <Event
                  event="click"
                  method="openPage"
                  params={{
                    ordered: [
                      { options: { ordered: [{ passDataWith: "urlParams" }] } },
                      { pageName: "address" },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'let curRecord = { ...selectedCompany.value };\nconsole.log("Original:", curRecord);\nlet expandedAddresses = [];\ncurRecord.addresses.forEach(addr => {\n    if (addr.item.localizedAddresses && addr.item.localizedAddresses.length > 1) {\n        addr.item.localizedAddresses.forEach(localized => {\n            let newAddr = JSON.parse(JSON.stringify(addr)); // Deep copy\n            newAddr.item.localizedAddresses = [localized];\n            expandedAddresses.push(newAddr);\n        });\n    } else {\n        expandedAddresses.push(addr);\n    }\n});\n\n\nlet sortedAddresses = expandedAddresses.sort((a, b) =>\n  Number(a?.item?.types?.[0] ?? 0) - Number(b?.item?.types?.[0] ?? 0)\n);\nconsole.log("Sorted:", sortedAddresses);\n\ncurRecord.addresses = sortedAddresses;\nAddressesList.setValue(sortedAddresses);\nconsole.log("AddressesList :", AddressesList);\nconst deleteFlags = sortedAddresses.map(() => false);\nAddressDeleteFlags.setValue(deleteFlags);\n\nselectedCompany.setValue(curRecord);\nconsole.log("Updated company:", curRecord);\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
        <Container
          id="navigationAccordion15"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          showHeader={true}
          style={{ ordered: [{ background: "rgb(238, 238, 238)" }] }}
        >
          <Header>
            <Text
              id="collapsibleTitle79"
              margin="0"
              style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
              value="###### Identifiers"
              verticalAlign="center"
            />
            <ToggleButton
              id="collapsibleToggle80"
              horizontalAlign="right"
              iconForFalse="bold/interface-arrows-button-down"
              iconForTrue="bold/interface-arrows-button-up"
              iconPosition="replace"
              styleVariant="outline"
              text="{{ self.value ? 'Hide' : 'Show' }}"
              value="{{ navigationAccordion15.showBody }}"
            >
              <Event
                event="change"
                method="setShowBody"
                params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
                pluginId="navigationAccordion15"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </ToggleButton>
          </Header>
          <View id="4e33d" viewKey="View 1">
            <Navigation
              id="navigation26"
              itemMode="static"
              orientation="vertical"
              retoolFileObject={{ ordered: [] }}
              style={{
                ordered: [
                  { hoverText: "rgba(0, 0, 0, 0.7)" },
                  { color: "rgba(0, 0, 0, 0.7)" },
                  { highlightText: "rgb(0, 0, 0)" },
                  { highlightBackground: "rgba(170, 170, 170, 0.2)" },
                ],
              }}
            >
              <Option
                id="73d80"
                icon="bold/interface-id-iris-scan-alternate"
                iconPosition="left"
                itemType="custom"
                label="Identifiers"
                screenTargetId="identifiers"
              >
                <Event
                  event="click"
                  method="run"
                  params={{
                    ordered: [
                      {
                        src: 'utils.openPage("identifiers", { newTab: false });\nGetAvailableNewIdentifiers.trigger();\n',
                      },
                    ],
                  }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{ ordered: [{ value: "false" }] }}
                  pluginId="savePutFlag"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="trigger"
                  params={{ ordered: [] }}
                  pluginId="handleSaveIdentifiers"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Option>
            </Navigation>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="FormWrapper5"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ jiraClick.value }}"
      padding="12px"
      showBody={true}
      styleContext={{ ordered: [] }}
    >
      <Header>
        <Text
          id="containerTitle386"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="3eabc" viewKey="View 1">
        <Container
          id="MyEditsContainer10"
          disabled=""
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
          style={{ ordered: [] }}
          styleContext={{ ordered: [] }}
        >
          <Header>
            <IconText
              id="firmoGoldenRecordIcon5"
              iconPosition="right"
              style={{
                ordered: [
                  { fontSize: "h4Font" },
                  { fontWeight: "h4Font" },
                  { fontFamily: "h4Font" },
                ],
              }}
              text="Golden record ✪"
              tooltipText="Please hover the mouse over the name or field name to find the information provider name"
            />
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Container
              id="IdentifiersContainer6"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showBorder={false}
              showHeader={true}
            >
              <Header>
                <Text
                  id="containerTitle400"
                  value="**Identifiers**"
                  verticalAlign="center"
                />
              </Header>
              <View id="3eabc" viewKey="View 1">
                <Include src="./container236.rsx" />
                <ListViewBeta
                  id="CurrentIdentifiersList7"
                  computeAllInstanceValues={true}
                  data={
                    '{{selectedCompany.value.identifiers && selectedCompany.value.identifiers.filter(function(item) {\n  return item.item.type !== \'115\' && item.item.type !== \'992\'\n}).sort((a, b) => {\n    // First, move REMEDIATED items to the end\n    if (a.source === "REMEDIATED" && b.source !== "REMEDIATED") return 1;\n    if (b.source === "REMEDIATED" && a.source !== "REMEDIATED") return -1;\n\n    // Then sort by type in ascending order\n    return parseInt(a.item.type) - parseInt(b.item.type);\n})}}'
                  }
                  heightType="auto"
                  itemWidth="200px"
                  marginType="none"
                  numColumns={3}
                  padding="0"
                >
                  <Container
                    id="container237"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    margin="0"
                    marginType="normal"
                    padding="12px"
                    showBody={true}
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle401"
                        marginType="normal"
                        value="#### {{ item }}"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="62b09" viewKey="View 1">
                      <TextInput
                        id="eachIdentifierVal7"
                        disabled=""
                        label="{{IdentifiersList.value.filter((e) => {
  return e.code === item.item.type
})[0].labels.en}}{{ i ? '' :'' }}*"
                        marginType="normal"
                        placeholder="Enter value"
                        readOnly="true"
                        style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
                        tooltipText="{{ 
  (() => {
    const source = item.source;
    
  const matched = /^\d+$/.test(source) ? sourceCodes.value.find(obj => obj.code === source)?.labels?.en : null; 
  return source ? 'Source: ' + (matched?.trim() ? matched : source) : ''; 
  })() 
}}"
                        value="{{item.item.id}}"
                      >
                        <Event
                          event="change"
                          method="run"
                          params={{
                            ordered: [
                              {
                                src: "var temp = CurIdentifiers.value;\n\nvar oldValue = temp[i].item.id;\n\nif (eachIdentifierVal7.value.trim() !== '') {\n  temp[i].item.id = eachIdentifierVal7.value;\n\nCurIdentifiers.setValue(temp);\n}\n",
                              },
                            ],
                          }}
                          pluginId=""
                          type="script"
                          waitMs="0"
                          waitType="debounce"
                        />
                      </TextInput>
                    </View>
                  </Container>
                </ListViewBeta>
                <Multiselect
                  id="newIdentifiersAdded6"
                  data="{{ GetAvailableNewIdentifiers.data }}"
                  disabled="{{((CurrentUserObj.value.permission &&  CurrentUserObj.value.permission.includes('create')) ? false : true) ||
  ValidateBvdId.data || ValidateOrbisId.data }}"
                  emptyMessage="No options"
                  hidden="true"
                  itemAdornmentSize="large"
                  label="Add New Identifiers"
                  labelPosition="top"
                  labels="{{ item.labels.en}}"
                  maintainSpaceWhenHidden={true}
                  overlayMaxHeight={375}
                  placeholder="Select options"
                  showSelectionIndicator={true}
                  values="{{ item.code }}"
                  wrapTags={true}
                >
                  <Event
                    event="inputValueChange"
                    method="run"
                    params={{
                      ordered: [{ src: "//console.log(newIdentifiersAdded2)" }],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                  <Event
                    event="change"
                    method="run"
                    params={{
                      ordered: [
                        {
                          src: 'var icon_link = iconHiddenFlag.value\nvar link_dict = masterRecordLinkedRemFields.value\n\nvar identifier_link = icon_link.identifier\n\n\nfor (var key_id in identifier_link){\n  if (key_id.includes(\'new\')){\n    delete identifier_link[key_id]\n    for (var doc_id in link_dict){\n      var i = 0\n      for (var doc_row of link_dict[doc_id]){\n        if(doc_row.iteration == key_id){\n          link_dict[doc_id].splice(i, 1);\n        }\n        i += 1 \n      }\n    }\n  }\n}\n\n\nicon_link.identifier = identifier_link\niconHiddenFlag.setValue(icon_link)\nconsole.log("Icon Link After NewIndenitifer Change: ", icon_link)\n\nmasterRecordLinkedRemFields.setValue(link_dict)\nconsole.log("Master Link After NewIndenitifer Change: ", link_dict)',
                        },
                      ],
                    }}
                    pluginId=""
                    type="script"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Multiselect>
              </View>
            </Container>
          </View>
        </Container>
        <Container
          id="MyEditsContainer9"
          disabled="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data || lockEntity.value }} "
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle391"
              value="#### My Edits"
              verticalAlign="center"
            />
          </Header>
          <View id="3eabc" viewKey="View 1">
            <Include src="./IdentifiersContainer.rsx" />
          </View>
        </Container>
      </View>
    </Container>
    <Button
      id="CloseMasterRecordBtnIdentifiers"
      disabled=""
      hidden="{{ jiraClick.value }}"
      marginType="normal"
      style={{ ordered: [{ background: "#f6f6f6" }] }}
      submitTargetId=""
      text="Close"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleCloseIdentifier"
        type="datasource"
        waitMs="200"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="metadataTableLinkReset"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="saveButtonIdentifiers"
      disabled="{{
    NewIdentifiersFlag.value.filter((item) => item.isInvalid === true).length > 0 
    || ExistingIdentifierFlag.value.filter((item)=> item.isInvalid === true).length > 0
    || Object.values(NewIdentifiersValues.value).some(value => !value)
}}"
      hidden="{{ jiraClick.value }}"
      marginType="normal"
      style={{ ordered: [{ background: "primary" }] }}
      submitTargetId=""
      text="Save"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="LinkCheckIdentifiers"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleSaveIdentifiers"
        type="datasource"
        waitMs="200"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'loadingPopUp.show()\n\nconst linkCheck = await linkDisableSave.trigger()\n\nif (linkCheck[0] == false){\n  savePutFlag.setValue(true)\n  \n} else {\n  loadingPopUp.setHidden(true);\n  utils.showNotification({\n        title: "Warning",\n        //  description: `Atleast 1 Edited Attribute Needs to Be Linked Before Saving: \\n ${disable_save[1]}`,\n        //  "Upload or link the required document as evidence for the Updates as evidence. This is a required step for data transparerency."\n        description: `Please upload or link the required sections ${linkCheck[1]} …`,\n        notificationType: "warning",\n        duration: 3,\n    });\n    \n}',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="100"
        waitType="debounce"
      />
    </Button>
  </Frame>
</Screen>
