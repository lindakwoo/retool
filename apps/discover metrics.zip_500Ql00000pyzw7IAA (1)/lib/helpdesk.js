// Tip: assign your external references to variables instead of chaining off the curly brackets.
const currentOrgConfigArray = {{getHelpdesk.data}};

if(!currentOrgConfigArray || currentOrgConfigArray.length === 0) {
  return '';
}
const helpdesk = currentOrgConfigArray[0].org_feature_value;
return helpdesk;