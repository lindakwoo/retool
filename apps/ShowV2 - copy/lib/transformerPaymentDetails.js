// Reference external variables with curly brackets or using JS variables
let data = {{ queryRecord.data.payment }}
const giveawayData = {{ queryGiveawayCredits.data.total_amount_cents }}
const arnStanData = {{ stateArnStan }}

data.giveaway_credits = giveawayData[0] ?? "None"
data.arn_stan = arnStanData.value ?? "null"

return data