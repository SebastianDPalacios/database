-- Crear block12_exchange_product_decisions(return_item_id PK, correct_received_product_id,
-- correct_replacement_product_id, reason, approved_by).
SELECT COUNT(*) AS decisiones_pendientes
FROM block12_exchange_product_decisions decision
WHERE decision.correct_received_product_id IS NULL OR decision.correct_replacement_product_id IS NULL;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: validar pedido, producto recibido y reemplazo antes de corregir';
-- Antes del UPDATE: respaldar sales_return_items y movimientos exchange_out relacionados.
-- La ejecución autorizada debe ajustar inventario mediante movimiento compensatorio, no reescribirlo.
