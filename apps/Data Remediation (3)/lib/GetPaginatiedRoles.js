const startIndex = (page - 1) * pageSize;
    
// Get a subarray (slice) of the items for the current page
const paginatedItems = items.slice(startIndex, startIndex + pageSize);

return paginatedItems;