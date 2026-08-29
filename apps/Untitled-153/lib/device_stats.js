const data = {{ get_weekly_devices.data }} || {};


const asArray = Array.isArray(data) ?
data :
data && typeof data === "object" && data.android && Array.isArray(data.android) ?
Object.keys(data).reduce((rows, key) => {
  const col = data[key] || [];
  col.forEach((val, i) => {
    if (!rows[i]) rows[i] = {};
    rows[i][key] = val;
  });
  return rows;
}, []) :
{{ formatDataAsArray(get_weekly_devices.data) }} || [];

const sum = (arr) => (arr || []).reduce((a, b) => a + Number(b || 0), 0);

// Collect columns safely
const androidArr = asArray.map((r) => r?.android).filter((v) => v !== undefined);
const iosArr = asArray.map((r) => r?.ios).filter((v) => v !== undefined);
const webArr = asArray.map((r) => r?.web_browser ?? r?.webBrowser ?? r?.web).filter((v) => v !== undefined);
const chromeArr = asArray.map((r) => r?.chrome_extension ?? r?.chromeExtension).filter((v) => v !== undefined);

const android = sum(androidArr);
const ios = sum(iosArr);
const web = sum(webArr);
const chrome = sum(chromeArr);

const labels = ["Android", "iOS", "Web Browser", "Chrome Extension"];
const values = [android, ios, web, chrome];

return { labels, values };