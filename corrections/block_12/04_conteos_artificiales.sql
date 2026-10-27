-- Crear block12_packing_count_decisions(packing_report_item_id PK, correct_packed_quantity,
-- corrected_damages_json JSON, reason, approved_by).
SELECT COUNT(*) AS decisiones_cargadas FROM block12_packing_count_decisions;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: cada conteo debe confirmarse contra el registro real de la máquina';
-- Aplicar únicamente mediante el mismo flujo administrativo de corrección de conteo,
-- para compensar inventario, recalcular conciliación y escribir production_record_corrections.
