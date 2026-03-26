const currentConfig = {{discover_config.value}}
const endDate = new Date();
const twoMonthsOutDate = new Date();
twoMonthsOutDate.setMonth(endDate.getMonth() + 2)
if(currentConfig?.trial_end_date_timestamp){
  const configTrialEndDate = new Date(currentConfig.trial_end_date_timestamp * 1000)
  let year = configTrialEndDate.getUTCFullYear();
  let month = String(configTrialEndDate.getUTCMonth() + 1).padStart(2, '0');
  let day = String(configTrialEndDate.getUTCDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
}
let year = twoMonthsOutDate.getUTCFullYear();
let month = String(twoMonthsOutDate.getUTCMonth() + 1).padStart(2, '0');
let day = String(twoMonthsOutDate.getUTCDate()).padStart(2, '0');
return `${year}-${month}-${day}`;