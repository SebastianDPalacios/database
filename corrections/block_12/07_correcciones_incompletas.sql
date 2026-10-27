-- Crear block12_correction_decisions(correction_id PK, correct_reason, correct_actor_user_id,
-- original_damages_json JSON, corrected_damages_json JSON, approved_by).
SELECT COUNT(*) AS decisiones_cargadas FROM block12_correction_decisions;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: completar auditoría solo con evidencia verificable';
-- Respaldar production_record_corrections. Completar campos faltantes sin sobrescribir
-- valores originales válidos y registrar la intervención en audit_logs.
