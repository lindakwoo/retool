SELECT
  p.id                                                                    AS provider_id,
  p.first_name,
  p.last_name,
  LOWER(sa.email)                                                         AS email,
  sa.id                                                                   AS scribe_account_id,
  sa.scribe_tier_id,
  s.additional_context -> 'regenerated_text' -> 0 AS regenerated_text,
  sa.is_enabled,
  p.site_id,
  si.name                                                                 AS site_name,
  ss.contract_type,
  s.id                                                                    AS scribe_id,
  s.uuid                                                                  AS session_id,
  TO_CHAR(s.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles', 'YYYY-MM-DD"T"HH24:MI:SS') AS created_at,
  s.patient_name,
  s.task_status,
  CASE s.device_type::text
    WHEN 'MOBILE_IOS' THEN 'iOS'
    WHEN 'MOBILE_ANDROID' THEN 'Android'
    WHEN 'WEB_APP' THEN 'Web Browser'
    WHEN 'WEB_CHROME' THEN 'Chrome Extension'
    ELSE s.device_type::text
  END                                                                     AS device_type,
  s.audio_length_in_seconds,
  s.transcription,
  s.clinical_documentation,
  s.template_id,
  s.version,
  t.template_name,
  s.appointment_id,
  sa2.status                                                              AS appointment_status,
  sa2.chief_complaint,
  sa2.ai_scribe_consent,
  rp.first_name || ' ' || rp.last_name                                   AS rendering_provider_name,
  s.additional_context -> 'regenerated_text' -> 0                        AS regenerated_text,
  (s.additional_context -> 'carry_forward_preference' ->> 'user_preference')::boolean AS carry_forward_preference,
  ROUND(EXTRACT(EPOCH FROM (
  s.processing_completed_timestamp - s.end_recording_timestamp
)))::integer AS latency_seconds
FROM scribe s
JOIN scribe_accounts sa ON sa.id = s.scribe_account_id
JOIN providers p ON p.id = sa.provider_id
JOIN sites si ON si.id = p.site_id
JOIN scribe_sites ss ON ss.site_id = si.id
LEFT JOIN templates t ON t.id = s.template_id
LEFT JOIN scribe_appointments sa2 ON sa2.id = s.appointment_id
LEFT JOIN appointments a ON a.id = s.appointment_id
LEFT JOIN providers rp ON rp.id = a.rendering_provider_id
WHERE s.id = {{selectedScribeId.value}}::integer