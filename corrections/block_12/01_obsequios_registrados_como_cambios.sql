-- Requiere una decisión humana por cada order_item_id.
-- Crear previamente block12_gift_decisions(order_item_id PK, confirmed_gift TINYINT, reason VARCHAR(500), approved_by BIGINT).
SELECT COUNT(*) AS candidatos_antes FROM block12_gift_decisions WHERE confirmed_gift = 1;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: crear respaldo y aprobar el mapeo antes de reclasificar obsequios';
-- La corrección autorizada deberá crear sales_gifts/sales_gift_items y conservar
-- la línea histórica original; nunca convertir silenciosamente order_items.
