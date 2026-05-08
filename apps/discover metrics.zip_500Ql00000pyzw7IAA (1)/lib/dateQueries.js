const today = new Date();
const startDate = new Date();
const endDate = new Date();
startDate.setMonth(endDate.getMonth() - 6)
const twoMonthsOutDate = new Date();
twoMonthsOutDate.setMonth(endDate.getMonth() + 2)
const threeMonthsBackDate = new Date();
threeMonthsBackDate.setMonth(today.getMonth() - 3)
const sixMonthsBackDate = new Date();
sixMonthsBackDate.setMonth(today.getMonth() - 6)
const oneMonthsBackDate = new Date();
oneMonthsBackDate.setMonth(today.getMonth() - 1)
return {
  startDate: startDate.toLocaleDateString('en-CA'),
  endDate: endDate.toLocaleDateString('en-CA'),
  twoMonthsOutDate: twoMonthsOutDate,
  threeMonthsBackDate: threeMonthsBackDate,
  sixMonthsBackDate: sixMonthsBackDate,
  oneMonthsBackDate:oneMonthsBackDate,
  threeMonthsBackFormattedDate: threeMonthsBackDate.toLocaleDateString('en-CA'),
}