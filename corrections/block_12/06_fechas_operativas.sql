-- Crear block12_operational_date_decisions(inventory_movement_id PK, correct_reference_type,
-- correct_reference_id, operational_date, reason, approved_by).
SELECT COUNT(*) AS decisiones_cargadas FROM block12_operational_date_decisions;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: la fecha operativa debe derivarse del lote correcto, no de UTC ni de una fecha inventada';
-- Respaldar inventory_movements. Corregir la referencia rota o el lote fuente;
-- no alterar moved_at para simular una fecha operativa.
