//  console.log('jira', JsonJiraUCI.value);
let headerTitle = [
'Entity ID',
'BVD ID', 
'Orbis ID', 
'Remediated action', 
'Field name',
'Prev value',
'New value', 
'User ID',
'Domain',
'Create timestamp(UTC)',
];
let valueProperty = [
'entity_id',
'bvd_id', 
'orbis_id', 
'remediated_action', 
'field_value',
'prev_value',
'new_value', 
'user_id',
'object_type',
'create_timestamp',
]

let rowArray = [];
var finalArray = [];
//Create header
for(let i=0; i<=headerTitle.length-1; i++) {
  let rowHeaderObj = `{
          "content":[
            {
              "content":[
                {
                  "text":"${headerTitle[i]}",
                  "type":"text"
                  }
                ],
                "type":"paragraph"
              }
            ],
          "type":"tableHeader"
  }`
  //  let removeSpace = JSON.stringify(rowHeaderObj)
  //  console.log('removeSpace', removeSpace);
  //  let convertJson = JSON.parse(removeSpace);
  rowArray.push(rowHeaderObj);
}
let strConcate = `{"content": [ ${rowArray}], "type":"tableRow"}`
 let convertString = JSON.stringify(strConcate)
  //  console.log('convertString', convertString);
 let convertJson = JSON.parse(convertString);
finalArray.push(convertJson);
//  let removeSpace = JSON.stringify(strConcate)
  //  console.log('removeSpace', removeSpace);
//  let convertJson = JSON.parse(removeSpace);
  //  console.log('strConcate', convertJson);


function cleanBracketedStrings(data) {
    return data.map(item => {
        const cleanValue = (val) => {
            if (typeof val === 'string' && val.startsWith('[') && val.endsWith(']')) {
                return val.replace(/"([^"]*?)"/g, '$1');
            }
            return val;
        };

        return {
            ...item,
            new_value: cleanValue(item.new_value),
            prev_value: cleanValue(item.prev_value)
        };
    });
}

let removeBracketFromArry = [];
// Example usage:
if(auditJsonForJiraValue.value.length !== 0) {
  removeBracketFromArry = cleanBracketedStrings(auditJsonForJiraValue.value);
}

console.log('cleanedData',removeBracketFromArry);


// Row value adding.
for(let i=0; i<=(removeBracketFromArry).length-1; i++) {
  let rowValueObj = {};
  var valueJson = [];
  for (let a=0; a<=headerTitle.length-1; a++) {
    rowValueObj = `{"content": [
          {
            "content": [
              {
                "text": "${[removeBracketFromArry[i][valueProperty[a]]]}",
                "type": "text"
              }
            ],
            "type": "paragraph"
          }
        ],
        "type": "tableCell"}`
    valueJson.push(rowValueObj);
  }
  //  console.log('valueJson', valueJson);
  strConcate = `{"content": [ ${valueJson}], "type":"tableRow"}`
  let convertString = JSON.stringify(strConcate)
  //  console.log('convertString', convertString);
 let convertJson = JSON.parse(convertString);
  finalArray.push(convertJson);
}
 //  console.log('final array', finalArray);
//  console.log('convertJson', convertJson);

let jsonForJira = `{
  "body": {
    "content": [
      {
        "content": [
            {
            "text": "Data Remediation Actions",
            "type": "text"
            }
        ],
        "type": "paragraph"
      },
      {
        "attrs": {
          "isNumberColumnEnabled": false,
          "layout": "default"
        },
        "content": [
            ${finalArray}
        ],
        "type": "table"
      }
    ],
    "type": "doc",
    "version": 1
   }
}`
let jsonValue = {}
 let data = JSON.stringify(jsonForJira)
  //  console.log('convertString', typeof(jsonForJira));
try {
  jsonValue = JSON.parse(data);
  //console.log('convertJson = ', typeof(JSON.parse(jsonValue)) );
  //  console.log('jsonValue = ', jsonValue);
} catch(e) {
  console.log('error', e)
}


//  JSON.parse(jsonValue);
JsonJira.setValue(JSON.parse(jsonValue));

