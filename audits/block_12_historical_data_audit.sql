-- BLOQUE 12 - AUDITORIA HISTORICA (SOLO LECTURA)
-- Requiere migraciones hasta 086. No crea, actualiza ni elimina datos.
-- Los productos de categorias cuyo nombre contiene "mayorista" quedan excluidos.

USE panaderia_db;

-- 1. Resumen de candidatos afectados.
SELECT '01_obsequios_como_cambios' AS audit_type, COUNT(*) AS affected_count
FROM order_items item
INNER JOIN products product ON product.id = item.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN sales_return_items return_item ON return_item.order_item_id = item.id
WHERE item.line_type = 'exchange'
  AND return_item.id IS NULL
  AND LOWER(category.name) NOT LIKE '%mayorista%'
UNION ALL
SELECT '02_cambios_producto_incorrecto', COUNT(*)
FROM sales_return_items return_item
INNER JOIN sales_returns sales_return ON sales_return.id = return_item.sales_return_id
INNER JOIN order_items original_item ON original_item.id = return_item.order_item_id
INNER JOIN products received_product ON received_product.id = return_item.returned_product_id
INNER JOIN product_categories received_category ON received_category.id = received_product.category_id
LEFT JOIN products replacement_product ON replacement_product.id = return_item.replacement_product_id
LEFT JOIN product_categories replacement_category ON replacement_category.id = replacement_product.category_id
WHERE sales_return.operation_type = 'exchange'
  AND (original_item.order_id <> sales_return.order_id OR original_item.product_id <> return_item.returned_product_id)
  AND LOWER(received_category.name) NOT LIKE '%mayorista%'
  AND (replacement_category.id IS NULL OR LOWER(replacement_category.name) NOT LIKE '%mayorista%')
UNION ALL
SELECT '03_productos_terminados_unidad_incorrecta', COUNT(*)
FROM products product
INNER JOIN product_categories category ON category.id = product.category_id
WHERE (product.unit IS NULL OR product.unit <> 'unit')
  AND LOWER(category.name) NOT LIKE '%mayorista%'
UNION ALL
SELECT '04_conteos_artificiales_unidad', COUNT(*)
FROM packing_report_items item
INNER JOIN products product ON product.id = item.product_id
INNER JOIN product_categories category ON category.id = product.category_id
INNER JOIN production_batch_outputs output ON output.id = item.production_batch_output_id
WHERE (item.counted_quantity = 1 OR item.packed_quantity = 1)
  AND output.produced_quantity > 1
  AND LOWER(category.name) NOT LIKE '%mayorista%'
UNION ALL
SELECT '05_danos_sin_conteo', COUNT(*)
FROM production_damages damage
INNER JOIN products product ON product.id = damage.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN packing_report_items item ON item.id = damage.packing_report_item_id
WHERE (damage.packing_report_item_id IS NULL OR item.id IS NULL)
  AND LOWER(category.name) NOT LIKE '%mayorista%'
UNION ALL
SELECT '06_registros_sin_fecha_operativa', COUNT(*)
FROM inventory_movements movement
LEFT JOIN production_batches batch
  ON movement.reference_type = 'production_batch' AND batch.id = movement.reference_id
LEFT JOIN production_output_materials output_material
  ON movement.reference_type = 'production_output_material' AND output_material.id = movement.reference_id
LEFT JOIN production_batches output_batch ON output_batch.id = output_material.production_batch_id
LEFT JOIN production_record_corrections correction
  ON movement.reference_type IN ('production_correction','packing_correction') AND correction.id = movement.reference_id
LEFT JOIN production_batches correction_batch ON correction_batch.id = correction.production_batch_id
LEFT JOIN products product ON product.id = movement.product_id
LEFT JOIN product_categories category ON category.id = product.category_id
WHERE movement.reference_type IN ('production_batch','production_output_material','production_correction','packing_correction')
  AND COALESCE(batch.produced_date, output_batch.produced_date, correction_batch.produced_date) IS NULL
  AND (category.id IS NULL OR LOWER(category.name) NOT LIKE '%mayorista%')
UNION ALL
SELECT '07_correcciones_incompletas', COUNT(*)
FROM production_record_corrections correction
INNER JOIN production_batch_outputs output ON output.id = correction.production_batch_output_id
INNER JOIN products product ON product.id = output.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN packing_report_items packing_item ON packing_item.id = correction.packing_report_item_id
LEFT JOIN users actor ON actor.id = correction.corrected_by
WHERE (
    correction.reason IS NULL OR CHAR_LENGTH(TRIM(correction.reason)) < 5
    OR actor.id IS NULL
    OR correction.original_quantity IS NULL OR correction.corrected_quantity IS NULL
    OR (correction.correction_type = 'packing' AND packing_item.id IS NULL)
    OR (correction.correction_type = 'packing' AND (correction.original_damages_json IS NULL OR correction.corrected_damages_json IS NULL))
  )
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY audit_type;

-- 2. Detalle: posibles obsequios históricos capturados como cambio.
-- Es un conjunto de candidatos para revisión humana; no debe reclasificarse automáticamente.
SELECT item.id AS order_item_id, item.order_id, item.product_id, product.name AS product_name,
       category.name AS category_name, item.quantity, item.commercial_value, item.created_at
FROM order_items item
INNER JOIN products product ON product.id = item.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN sales_return_items return_item ON return_item.order_item_id = item.id
WHERE item.line_type = 'exchange' AND return_item.id IS NULL
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY item.created_at, item.id;

-- 3. Detalle: cambios cuyo producto recibido no coincide con la línea del pedido original.
SELECT sales_return.id AS sales_return_id, sales_return.order_id, return_item.id AS return_item_id,
       return_item.order_item_id, original_item.order_id AS item_order_id,
       original_item.product_id AS ordered_product_id, ordered_product.name AS ordered_product,
       return_item.returned_product_id, received_product.name AS received_product,
       return_item.replacement_product_id, replacement_product.name AS replacement_product,
       sales_return.status, sales_return.reported_at
FROM sales_return_items return_item
INNER JOIN sales_returns sales_return ON sales_return.id = return_item.sales_return_id
INNER JOIN order_items original_item ON original_item.id = return_item.order_item_id
INNER JOIN products ordered_product ON ordered_product.id = original_item.product_id
INNER JOIN products received_product ON received_product.id = return_item.returned_product_id
INNER JOIN product_categories received_category ON received_category.id = received_product.category_id
LEFT JOIN products replacement_product ON replacement_product.id = return_item.replacement_product_id
LEFT JOIN product_categories replacement_category ON replacement_category.id = replacement_product.category_id
WHERE sales_return.operation_type = 'exchange'
  AND (original_item.order_id <> sales_return.order_id OR original_item.product_id <> return_item.returned_product_id)
  AND LOWER(received_category.name) NOT LIKE '%mayorista%'
  AND (replacement_category.id IS NULL OR LOWER(replacement_category.name) NOT LIKE '%mayorista%')
ORDER BY sales_return.reported_at, sales_return.id, return_item.id;

-- 4. Detalle: productos terminados con unidad diferente de Unidades.
SELECT product.id, product.sku, product.name, category.name AS category_name, product.unit,
       normalization.previous_unit, normalization.corrected_unit, normalization.corrected_at
FROM products product
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN product_unit_normalization_audit normalization ON normalization.product_id = product.id
WHERE (product.unit IS NULL OR product.unit <> 'unit')
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY product.name, product.id;

-- 5. Detalle: conteos históricos sospechosos de haber sido forzados con una unidad.
SELECT item.id AS packing_report_item_id, report.id AS packing_report_id,
       report.packed_date, batch.id AS production_batch_id, product.id AS product_id,
       product.name AS product_name, output.produced_quantity,
       item.counted_quantity, item.packed_quantity, item.damaged_quantity,
       item.reconciliation_status
FROM packing_report_items item
INNER JOIN packing_reports report ON report.id = item.packing_report_id
INNER JOIN production_batches batch ON batch.id = report.production_batch_id
INNER JOIN production_batch_outputs output ON output.id = item.production_batch_output_id
INNER JOIN products product ON product.id = item.product_id
INNER JOIN product_categories category ON category.id = product.category_id
WHERE (item.counted_quantity = 1 OR item.packed_quantity = 1)
  AND output.produced_quantity > 1
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY report.packed_date, batch.id, item.id;

-- 6. Detalle: daños no asociados con un conteo.
SELECT damage.id AS production_damage_id, damage.production_batch_id,
       damage.production_batch_output_id, damage.packing_report_item_id,
       damage.product_id, product.name AS product_name, damage.quantity,
       damage.damage_stage, damage.damaged_date, damage.notes, damage.created_at
FROM production_damages damage
INNER JOIN products product ON product.id = damage.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN packing_report_items item ON item.id = damage.packing_report_item_id
WHERE (damage.packing_report_item_id IS NULL OR item.id IS NULL)
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY damage.damaged_date, damage.id;

-- 7. Detalle: movimientos de producción sin fecha operativa resoluble.
SELECT movement.id AS inventory_movement_id, movement.item_type, movement.raw_material_id,
       movement.product_id, movement.movement_type, movement.reference_type,
       movement.reference_id, movement.moved_at
FROM inventory_movements movement
LEFT JOIN production_batches batch
  ON movement.reference_type = 'production_batch' AND batch.id = movement.reference_id
LEFT JOIN production_output_materials output_material
  ON movement.reference_type = 'production_output_material' AND output_material.id = movement.reference_id
LEFT JOIN production_batches output_batch ON output_batch.id = output_material.production_batch_id
LEFT JOIN production_record_corrections correction
  ON movement.reference_type IN ('production_correction','packing_correction') AND correction.id = movement.reference_id
LEFT JOIN production_batches correction_batch ON correction_batch.id = correction.production_batch_id
LEFT JOIN products product ON product.id = movement.product_id
LEFT JOIN product_categories category ON category.id = product.category_id
WHERE movement.reference_type IN ('production_batch','production_output_material','production_correction','packing_correction')
  AND COALESCE(batch.produced_date, output_batch.produced_date, correction_batch.produced_date) IS NULL
  AND (category.id IS NULL OR LOWER(category.name) NOT LIKE '%mayorista%')
ORDER BY movement.moved_at, movement.id;

-- 8. Detalle: correcciones incompletas.
SELECT correction.*, product.name AS product_name, category.name AS category_name,
       actor.full_name AS corrected_by_name
FROM production_record_corrections correction
INNER JOIN production_batch_outputs output ON output.id = correction.production_batch_output_id
INNER JOIN products product ON product.id = output.product_id
INNER JOIN product_categories category ON category.id = product.category_id
LEFT JOIN packing_report_items packing_item ON packing_item.id = correction.packing_report_item_id
LEFT JOIN users actor ON actor.id = correction.corrected_by
WHERE (
    correction.reason IS NULL OR CHAR_LENGTH(TRIM(correction.reason)) < 5
    OR actor.id IS NULL
    OR correction.original_quantity IS NULL OR correction.corrected_quantity IS NULL
    OR (correction.correction_type = 'packing' AND packing_item.id IS NULL)
    OR (correction.correction_type = 'packing' AND (correction.original_damages_json IS NULL OR correction.corrected_damages_json IS NULL))
  )
  AND LOWER(category.name) NOT LIKE '%mayorista%'
ORDER BY correction.created_at, correction.id;
