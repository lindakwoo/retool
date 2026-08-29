const retained = (formatDataAsArray?.(get_percent_retained_avg_monthly.data) || []).map((r) => ({ ...r }));
const meta = (formatDataAsArray?.(get_retained_provider_meta.data) || []).map((r) => ({ ...r }));

// Build lookup map from provider_id -> meta record
const byId = new Map();
for (const m of meta) {
  const pidNum = m?.provider_id == null ? null : Number(m.provider_id);
  if (pidNum != null && Number.isFinite(pidNum)) {
    byId.set(pidNum, m);
  }
}

// Merge meta into retained rows
const rows = retained.map((r) => {
  const pid = r?.provider_id == null ? null : Number(r.provider_id);
  if (pid == null || !Number.isFinite(pid)) {
    return {
      ...r,
      provider_id: null,
      provider_email: 'SITE AVERAGE',
      provider_name: 'SITE AVERAGE' };

  }
  const m = byId.get(pid) || {};
  return {
    ...r,
    provider_id: pid,
    provider_email: m && m.provider_email ? String(m.provider_email) : String(pid),
    provider_name: m && m.provider_name ? String(m.provider_name) : String(pid) };

}).sort((a, b) => {
  const ta = new Date(a?.month_dt ?? 0).getTime() || 0;
  const tb = new Date(b?.month_dt ?? 0).getTime() || 0;
  if (tb !== ta) return tb - ta; // newest month first
  const pa = a?.provider_email === 'SITE AVERAGE' ? 0 : 1;
  const pb = b?.provider_email === 'SITE AVERAGE' ? 0 : 1;
  if (pa !== pb) return pa - pb;
  return String(a?.provider_email || '').localeCompare(String(b?.provider_email || ''));
});

return { rows };