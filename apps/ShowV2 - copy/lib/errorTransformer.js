let status = {{ queryRecord?.metadata?.status }};

console.log("errorTransformer status", status);

if (typeof status === 'undefined') {
  return "";
}

switch(status) {
  case 200:
    return "";
    
  case 400:
  case 404:
    return "Not Found";
}

return `Error ${status}`;