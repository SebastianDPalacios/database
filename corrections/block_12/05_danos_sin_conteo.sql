-- Crear block12_damage_count_decisions(production_damage_id PK, packing_report_item_id, reason, approved_by).
SELECT COUNT(*) AS asociaciones_cargadas FROM block12_damage_count_decisions;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: no asociar daños automáticamente cuando existan varios conteos candidatos';
-- Respaldar production_damages antes de asociar. Verificar coincidencia de lote,
-- producto y fecha; excluir productos Mayoristas y registrar audit_logs.
