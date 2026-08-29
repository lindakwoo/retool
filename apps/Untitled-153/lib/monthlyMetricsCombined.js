const bert = (formatDataAsArray?.(get_bert_scores_avg_monthly.data) || []).map((r) => ({ ...r }));
const ret = (mergeRetainedWithMeta.data?.rows || []).map((r) => ({ ...r }));
const prov = (formatDataAsArray?.(get_providers_lookup?.data) || []).map((r) => ({ ...r }));

function key(mdt, pid) {
  const t = mdt && new Date(mdt).getTime() || null;
  return `${t}::${pid == null ? 'null' : String(pid)}`;
}

// Build provider lookup by provider_id
const byProviderId = new Map();
for (const p of prov) {
  const pid = Number(p.provider_id);
  if (Number.isFinite(pid)) {
    byProviderId.set(pid, { email: p.provider_email, name: p.provider_name });
  }
}

const byKey = new Map();
// Seed with BERT
for (const b of bert) {
  const k = key(b.month_dt, b.provider_id ?? null);
  const avgBert = b.avg_bert_score != null && Number.isFinite(Number(b.avg_bert_score)) ? Number(b.avg_bert_score) : null;
  const evalBert = b.evaluations != null && Number.isFinite(Number(b.evaluations)) ? Number(b.evaluations) : null;
  const pid = b.provider_id ?? null;
  const provMeta = pid != null ? byProviderId.get(Number(pid)) : null;
  byKey.set(k, {
    month: b.month,
    month_dt: b.month_dt,
    provider_id: pid,
    provider_email: b.provider_email || provMeta?.email || (pid != null ? String(pid) : 'SITE AVERAGE'),
    provider_name: provMeta?.name || (pid != null ? String(pid) : 'SITE AVERAGE'),
    avg_bert_score: avgBert,
    evaluations_bert: evalBert,
    avg_percent_retained: null,
    evaluations_retained: null });

}
// Merge Retained+Meta
for (const r of ret) {
  const k = key(r.month_dt, r.provider_id ?? null);
  const pid = r.provider_id ?? null;
  const provMeta = pid != null ? byProviderId.get(Number(pid)) : null;
  const rec = byKey.get(k) || {
    month: r.month,
    month_dt: r.month_dt,
    provider_id: pid,
    provider_email: r.provider_email || provMeta?.email || (pid != null ? String(pid) : 'SITE AVERAGE'),
    provider_name: r.provider_name || provMeta?.name || (pid != null ? String(pid) : 'SITE AVERAGE'),
    avg_bert_score: null,
    evaluations_bert: null,
    avg_percent_retained: null,
    evaluations_retained: null };

  // Preserve existing non-empty provider meta; otherwise fill from retained/meta
  rec.provider_email = rec.provider_email || r.provider_email || provMeta?.email || (pid != null ? String(pid) : 'SITE AVERAGE');
  rec.provider_name = rec.provider_name || r.provider_name || provMeta?.name || (pid != null ? String(pid) : 'SITE AVERAGE');

  const avgRet = r.avg_percent_retained != null && Number.isFinite(Number(r.avg_percent_retained)) ? Number(r.avg_percent_retained) : null;
  const evalRet = r.evaluations != null && Number.isFinite(Number(r.evaluations)) ? Number(r.evaluations) : null;
  if (avgRet !== null) rec.avg_percent_retained = avgRet; // leave null if missing
  if (evalRet !== null) rec.evaluations_retained = evalRet; // leave null if missing

  byKey.set(k, rec);
}

const rows = Array.from(byKey.values()).sort((a, b) => {
  const ta = new Date(a.month_dt).getTime();
  const tb = new Date(b.month_dt).getTime();
  if (tb !== ta) return tb - ta;
  const pa = a.provider_email === 'SITE AVERAGE' ? 0 : 1;
  const pb = b.provider_email === 'SITE AVERAGE' ? 0 : 1;
  if (pa !== pb) return pa - pb;
  return String(a.provider_email || '').localeCompare(String(b.provider_email || ''));
});

return { rows };