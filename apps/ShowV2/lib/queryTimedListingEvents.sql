SELECT * 
FROM time_listing_events 
WHERE listing_id = {{ listingParentId.value }} 
AND {{ queryRecord.data.created_at }} BETWEEN starts_at AND ends_at LIMIT 100;