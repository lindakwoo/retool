const raw = {{ get_weekly_devices.data }} ?? {};

const toStr = (x) => String(x);
const toNum = (x) => Number(x ?? 0);

const weekCol = raw.week_of ?? [];
const labels = (Array.isArray(weekCol) ? weekCol : []).map(toStr);
const weeks = Array.from(new Set(labels)).sort((a, b) => new Date(a).getTime() - new Date(b).getTime());
const mapFrom = (col) => new Map((raw.week_of ?? []).map((w, i) => [toStr(w), toNum((raw[col] ?? [])[i])]));


const mAndroid = mapFrom('android');
const mIos = mapFrom('ios');
const mWeb = mapFrom('web_browser');
const mChrome = mapFrom('chrome_extension');

// Align series to the unified weeks list
const android = weeks.map((w) => mAndroid.get(w) ?? 0);
const ios = weeks.map((w) => mIos.get(w) ?? 0);
const web = weeks.map((w) => mWeb.get(w) ?? 0);
const chrome = weeks.map((w) => mChrome.get(w) ?? 0);

return { weeks, android, ios, web, chrome };