-- Corrección determinística, pero bloqueada hasta verificar el reporte y el respaldo.
SELECT COUNT(*) AS afectados_antes
FROM products product INNER JOIN product_categories category ON category.id = product.category_id
WHERE product.unit <> 'unit' AND LOWER(category.name) NOT LIKE '%mayorista%';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BLOQUEADO: verificar respaldo product_unit_normalization_audit antes de ejecutar';
-- INSERT IGNORE INTO product_unit_normalization_audit (...)
-- SELECT ... FROM products ... WHERE unit <> 'unit' AND categoria no Mayoristas;
-- UPDATE products JOIN product_categories ... SET unit = 'unit' WHERE categoria no Mayoristas;
