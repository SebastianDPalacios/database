-- Specific production permissions for baker and packaging roles.
-- Run after:
--   055_customer_credit_balances.sql

USE panaderia_db;

INSERT INTO permissions (code, name, description)
VALUES
  ('production.baker', 'Produccion panadero', 'Registrar produccion realizada y ver asignaciones propias de panadero'),
  ('production.packaging', 'Conteo y empaque', 'Registrar conteo, empaque, danados y faltantes de produccion')
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  description = VALUES(description);

INSERT IGNORE INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
INNER JOIN permissions p
  ON p.code IN ('production.baker', 'production.packaging')
WHERE r.code IN ('ADMIN', 'SUPER_ADMIN', 'PRODUCCION');

INSERT IGNORE INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
INNER JOIN permissions p ON p.code = 'production.baker'
WHERE r.code = 'PANADERO';

INSERT IGNORE INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
INNER JOIN permissions p ON p.code = 'production.packaging'
WHERE r.code = 'EMPAQUETADOR';

DELETE rp
FROM role_permissions rp
INNER JOIN roles r ON r.id = rp.role_id
INNER JOIN permissions p ON p.id = rp.permission_id
WHERE r.code = 'PANADERO'
  AND p.code IN ('production.manage', 'recipes.manage', 'reports.view');

DELETE rp
FROM role_permissions rp
INNER JOIN roles r ON r.id = rp.role_id
INNER JOIN permissions p ON p.id = rp.permission_id
WHERE r.code = 'EMPAQUETADOR'
  AND p.code IN ('production.manage', 'recipes.manage', 'reports.view');
