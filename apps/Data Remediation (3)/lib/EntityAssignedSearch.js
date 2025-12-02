// Clear existing filters and reset data
EntityAssignedDataTable.clearFilterStack();
EntityAssignedHistoryTable.clearFilterStack();
const input = txtboxSearchEntityAssign.value.trim();
entityAssignmentRecordResponse.setValue([]);
entityAssignmentArchiveResponse.setValue([]);
loadingPopUp.show();

// Prepare search object
let searchParams = {
    request_type: "search"
};

const selectedSearchType = entityAssignSearchTab.value;

switch (selectedSearchType) {
    case 'Ticket Number':
        searchParams.ticket_id = input.toUpperCase();
        break;

    case 'User Email':
        const formattedEmail = input.toLowerCase().replace(/[@.]/g, '-');
        searchParams.user_id = formattedEmail.toLowerCase();
        break;

    case 'Orbis or BVDID':
        if (/[a-zA-Z]/.test(input)) {
            searchParams.bvd_id = input.toUpperCase();
        } else {
            searchParams.orbis_id = input;
        }
        break;

    default:
        console.warn('Unsupported search type');
        break;
}

// Set search parameters and trigger read operation
entityAssignedParams.setValue(searchParams);
ReadEntityAssignment.trigger();
