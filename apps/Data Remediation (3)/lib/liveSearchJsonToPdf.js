
// Reset the file upload components
console.log("Resetting file upload components.");
UploadPDF.reset();
UploadPDFS3.reset();

// Set the liveSearchJsonPdfInput value to null initially
console.log("Setting liveSearchJsonPdfInput value to null.");
liveSearchJsonPdfInput.setValue(null);
documentID.setValue();

// Fetch the JSON data from liveSearchJson.value
console.log("Fetching JSON data from kompanyDataSetLiveSearchResponse.");
let jsonData = kompanyDataSetSearchResponse.value.content;

// Log the JSON Data to check its content
console.log("Raw JSON Data length:", JSON.stringify(jsonData).length);

// Check if the JSON data is a string and parse it if necessary
if (typeof jsonData === 'string') {
  console.log("JSON data is a string. Attempting to parse.");
  try {
    jsonData = JSON.parse(jsonData);
    console.log("JSON data parsed successfully.");
  } catch (error) {
    console.error("Failed to parse JSON:", error);
    jsonData = null;
  }
} else {
  console.log("JSON data is already an object.");
}

// Log the parsed JSON Data to ensure it's correctly formatted
console.log("Parsed JSON Data:", jsonData);
console.log("Parsed JSON Data length:", JSON.stringify(jsonData).length);

// Check if jsPDF is loaded
const { jsPDF } = window.jspdf;
if (!jsPDF) {
  console.error("jsPDF is not loaded.");
  return;
}

console.log("jsPDF is loaded. Creating new jsPDF instance.");
// Create a new jsPDF instance
const doc = new jsPDF({
  orientation: 'portrait',
  unit: 'mm',
  format: [210, 297] // A4 size in mm
});

let hasContent = false; // Flag to track if any page has content

// Function to add text to the PDF with pagination
function addTextToPDF(text, x, y) {
 // console.log(`Adding text to PDF: "${text}" at position (${x}, ${y})`);
  doc.setFontSize(12);
  doc.text(text, x, y);
}

// Function to process JSON data in chunks
async function processJSONDataInChunks(jsonData) {
  console.log("Processing JSON data in chunks.");
  const chunkSize = 50; // Adjust based on performance and memory usage
  const lines = JSON.stringify(jsonData, null, 2).split('\n');
  console.log("Total lines to process:", lines.length);

  const margin = 10;
  const lineHeight = 7;
  const pageHeight = 297 - 2 * margin; // A4 page height minus margins
  let yOffset = margin;

  let page = 1;
  // Only add a page if there is content to add
  const addPageIfNecessary = () => {
    if (hasContent) {
      doc.addPage();
      page++;
     // console.log(`Added page ${page}.`);
      yOffset = margin;
      addTextToPDF(`Page ${page}`, margin, margin);
    }
  };

  // Process lines in chunks
  for (let i = 0; i < lines.length; i += chunkSize) {
    const chunk = lines.slice(i, i + chunkSize);
    //console.log(`Processing chunk from line ${i} to ${i + chunkSize}`);
    let textBlock = "";
    for (const line of chunk) {
      textBlock += `\n${line}`; // Aggregate lines into a block
    }

    // Check if the text block fits on the current page
    if (yOffset + (lineHeight * chunk.length) > pageHeight) {
      addPageIfNecessary(); // Add a new page and reset yOffset
    }

    addTextToPDF(textBlock, margin, yOffset); // Add entire block at once
    yOffset += lineHeight * chunk.length; // Adjust yOffset based on actual lines added
    hasContent = true; // Mark that we have added data to the page

    await new Promise(resolve => setTimeout(resolve, 0)); // Yield to the event loop
  }

  // Ensure we add a final page if there was content
  if (hasContent) {
    addPageIfNecessary();
  }
}

// Add JSON data to the PDF
if (jsonData) {
  console.log("Adding JSON data to PDF.");
  try {
    await processJSONDataInChunks(jsonData);
  } catch (error) {
    console.error("Error processing JSON data:", error);
  }
} else {
  console.log("No valid data found. Adding message to PDF.");
  doc.setFontSize(16);
  doc.text("No valid data found to display", 10, 10);
  hasContent = true; // Ensure we have data on the page
}

// Remove the first page if it's blank
if (!hasContent) {
  console.log("Removing blank first page.");
  doc.deletePage(1); // Remove the first blank page
}

// Generate a random UUID for the document ID
console.log("Generating UUID for document ID.");
const generateUUID = () => crypto.randomUUID();
const documentIDPdf = generateUUID();
const filename = `${documentIDPdf}.pdf`;

// Update the filename using the newly generated UUID
console.log("Setting liveSearchJsonPdfInput value with filename:", filename);
liveSearchJsonPdfInput.setValue(filename);

// Save the PDF to binary data
//console.log("Saving PDF to binary data.");
const pdfBinaryData = doc.output('arraybuffer');

// Convert the binary data to base64
console.log("Converting binary data to base64.");
const base64Data = btoa(String.fromCharCode(...new Uint8Array(pdfBinaryData)));

// Get the size in bytes
const sizeBytes = pdfBinaryData.byteLength;

// Prepare the object with expected data format
const pdfData = {
  base64Data: base64Data,
  name: filename,
  sizeBytes: sizeBytes,
  type: "application/pdf"
};

// Log the final object
//console.log("PDF Data of LiveSearchJsonData:", pdfData);
console.log("liveSearchJsonPdfInputValue:", liveSearchJsonPdfInput.value);

// Set the pdfData into pdfBinaryVariable
console.log("Setting pdfBinaryVariable value.");
pdfBinaryVariable.setValue(pdfData);

// Save the PDF with the generated filename
console.log("Saving PDF with filename:", filename);
//doc.save(filename);

// Trigger the UploadPDF2 action with the generated filename
console.log("Triggering UploadPDF2.");
await kompanyLiveDataUpload.trigger();
const resp = await UploadPdfLiveSearchData.trigger();

console.log("UploadPDFliveSearchData response:", resp);

// Retrieve relevant data for metadata
console.log("Retrieving metadata from TableRecordsMastering.");
let data = TableRecordsMastering.value[0];
let bvdId = data.header.bvdID;
let orbisId = data.header.entityID;
let ticket = urlparams.ticket ? urlparams.ticket : "9999";
console.log("ticket:", ticket)

// Set createMetadataItem.value to the specified JSON object
if (UploadPdfLiveSearchData.error == null) {
  console.log("Setting createMetadataItem value.");
  createMetadataItem.setValue({
    "doc_id": documentIDPdf,  // Use documentIDPdf directly
    "user_id": CurrentUserObj.value.user_id.toLowerCase(),
    "orbis_id": orbisId,
    "bvd_id": bvdId,
    "entity_id": orbisId,
    "ticket_id": ticket,
    "doc_category": "",
    "linked_remediated_fields": [],
    "remediation_verification_source": "doc",
    "comments": "",
    "document_url": "",
    "remediated_action": "add",
    "doc_language": "english",
    "doc_name": "kompanyApi",
    "product": "firmographics",
    "doc_type": "pdf"
  });
  documentID.setValue(documentIDPdf);

  //Added by ryan for new linking logic fix
  newDocumentLinks.setValue([documentIDPdf, []])
  
  console.log("liveSerachJsonToPDF createMetadataItem value:", createMetadataItem.value);
  
  // Trigger CreateMetadataRecord
  console.log("Triggering CreateMetadataRecord.");
  const response = await CreateMetadataRecord.trigger();
  console.log("CreateMetadataRecord RESPONSE:", response);
  if(response?.statusCode === 200){
    ReadMetadataRecord.trigger();
  }
  
  loadingPopUp.setHidden(true);
}else{
  loadingPopUp.setHidden(true);
}

// Reset liveSearchJsonPdfInput 
console.log("Resetting liveSearchJsonPdfInput to null.");
liveSearchJsonPdfInput.setValue(null);
console.log("ticket:", urlparams.ticket ? urlparams.ticket : "9999")
