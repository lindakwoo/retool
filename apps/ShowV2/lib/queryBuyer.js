const response = await queryUser.trigger({
  additionalScope: {
    userId: buyerId,
    shouldShowPii: shouldShowPii,
  }
});

return {
  id: response.id,
  username: response.username,
  email: response.email,
  first_name: response.first_name,
  last_name: response.last_name,
  phone_number: response.phone_number
};