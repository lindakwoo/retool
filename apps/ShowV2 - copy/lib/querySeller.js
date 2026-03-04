const response = await queryUser.trigger({
  additionalScope: {
    userId: sellerId,
    shouldShowPii: shouldShowPii,
  }
});

return {
  id: response.id,
  username: response.username,
  email: response.email,
  first_name: response.first_name,
  last_name: response.last_name,
  phone_number: response.phone_number,
  is_ep_enabled: response.seller_early_payout_enabled
};