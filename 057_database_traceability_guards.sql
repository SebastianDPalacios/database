-- Database traceability guards for gifts, customer credit, production and packaging.
-- Run after:
--   056_production_specific_permissions.sql

USE panaderia_db;

-- =====================
-- Independent gifts audit
-- =====================

SET @sales_gifts_updated_by_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND COLUMN_NAME = 'updated_by'
);

SET @sales_gifts_updated_by_sql = IF(
  @sales_gifts_updated_by_exists = 0,
  'ALTER TABLE sales_gifts
     ADD COLUMN updated_by BIGINT UNSIGNED NULL AFTER created_by',
  'SELECT 1'
);

PREPARE sales_gifts_updated_by_stmt FROM @sales_gifts_updated_by_sql;
EXECUTE sales_gifts_updated_by_stmt;
DEALLOCATE PREPARE sales_gifts_updated_by_stmt;

SET @sales_gifts_cancelled_by_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND COLUMN_NAME = 'cancelled_by'
);

SET @sales_gifts_cancelled_by_sql = IF(
  @sales_gifts_cancelled_by_exists = 0,
  'ALTER TABLE sales_gifts
     ADD COLUMN cancelled_by BIGINT UNSIGNED NULL AFTER updated_by,
     ADD COLUMN cancelled_at TIMESTAMP NULL AFTER cancelled_by,
     ADD COLUMN cancellation_reason VARCHAR(255) NULL AFTER cancelled_at',
  'SELECT 1'
);

PREPARE sales_gifts_cancelled_by_stmt FROM @sales_gifts_cancelled_by_sql;
EXECUTE sales_gifts_cancelled_by_stmt;
DEALLOCATE PREPARE sales_gifts_cancelled_by_stmt;

SET @sales_gifts_updated_by_key_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND INDEX_NAME = 'idx_sales_gifts_updated_by'
);

SET @sales_gifts_updated_by_key_sql = IF(
  @sales_gifts_updated_by_key_exists = 0,
  'ALTER TABLE sales_gifts ADD KEY idx_sales_gifts_updated_by (updated_by)',
  'SELECT 1'
);

PREPARE sales_gifts_updated_by_key_stmt FROM @sales_gifts_updated_by_key_sql;
EXECUTE sales_gifts_updated_by_key_stmt;
DEALLOCATE PREPARE sales_gifts_updated_by_key_stmt;

SET @sales_gifts_cancelled_by_key_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND INDEX_NAME = 'idx_sales_gifts_cancelled_by'
);

SET @sales_gifts_cancelled_by_key_sql = IF(
  @sales_gifts_cancelled_by_key_exists = 0,
  'ALTER TABLE sales_gifts ADD KEY idx_sales_gifts_cancelled_by (cancelled_by, cancelled_at)',
  'SELECT 1'
);

PREPARE sales_gifts_cancelled_by_key_stmt FROM @sales_gifts_cancelled_by_key_sql;
EXECUTE sales_gifts_cancelled_by_key_stmt;
DEALLOCATE PREPARE sales_gifts_cancelled_by_key_stmt;

SET @sales_gifts_updated_by_fk_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
  WHERE CONSTRAINT_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND CONSTRAINT_NAME = 'fk_sales_gifts_updated_by'
);

SET @sales_gifts_updated_by_fk_sql = IF(
  @sales_gifts_updated_by_fk_exists = 0,
  'ALTER TABLE sales_gifts
     ADD CONSTRAINT fk_sales_gifts_updated_by
       FOREIGN KEY (updated_by) REFERENCES users (id)
       ON DELETE SET NULL ON UPDATE CASCADE',
  'SELECT 1'
);

PREPARE sales_gifts_updated_by_fk_stmt FROM @sales_gifts_updated_by_fk_sql;
EXECUTE sales_gifts_updated_by_fk_stmt;
DEALLOCATE PREPARE sales_gifts_updated_by_fk_stmt;

SET @sales_gifts_cancelled_by_fk_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
  WHERE CONSTRAINT_SCHEMA = DATABASE()
    AND TABLE_NAME = 'sales_gifts'
    AND CONSTRAINT_NAME = 'fk_sales_gifts_cancelled_by'
);

SET @sales_gifts_cancelled_by_fk_sql = IF(
  @sales_gifts_cancelled_by_fk_exists = 0,
  'ALTER TABLE sales_gifts
     ADD CONSTRAINT fk_sales_gifts_cancelled_by
       FOREIGN KEY (cancelled_by) REFERENCES users (id)
       ON DELETE SET NULL ON UPDATE CASCADE',
  'SELECT 1'
);

PREPARE sales_gifts_cancelled_by_fk_stmt FROM @sales_gifts_cancelled_by_fk_sql;
EXECUTE sales_gifts_cancelled_by_fk_stmt;
DEALLOCATE PREPARE sales_gifts_cancelled_by_fk_stmt;

-- =====================
-- Customer credit audit
-- =====================

SET @credit_ledger_balance_before_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'customer_credit_ledger'
    AND COLUMN_NAME = 'balance_before'
);

SET @credit_ledger_balance_before_sql = IF(
  @credit_ledger_balance_before_exists = 0,
  'ALTER TABLE customer_credit_ledger
     ADD COLUMN balance_before DECIMAL(12,2) NOT NULL DEFAULT 0 AFTER amount',
  'SELECT 1'
);

PREPARE credit_ledger_balance_before_stmt FROM @credit_ledger_balance_before_sql;
EXECUTE credit_ledger_balance_before_stmt;
DEALLOCATE PREPARE credit_ledger_balance_before_stmt;

SET @credit_ledger_metadata_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'customer_credit_ledger'
    AND COLUMN_NAME = 'metadata_json'
);

SET @credit_ledger_metadata_sql = IF(
  @credit_ledger_metadata_exists = 0,
  'ALTER TABLE customer_credit_ledger
     ADD COLUMN metadata_json LONGTEXT NULL AFTER notes',
  'SELECT 1'
);

PREPARE credit_ledger_metadata_stmt FROM @credit_ledger_metadata_sql;
EXECUTE credit_ledger_metadata_stmt;
DEALLOCATE PREPARE credit_ledger_metadata_stmt;

SET @credit_ledger_type_key_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'customer_credit_ledger'
    AND INDEX_NAME = 'idx_customer_credit_ledger_type_date'
);

SET @credit_ledger_type_key_sql = IF(
  @credit_ledger_type_key_exists = 0,
  'ALTER TABLE customer_credit_ledger
     ADD KEY idx_customer_credit_ledger_type_date (movement_type, created_at)',
  'SELECT 1'
);

PREPARE credit_ledger_type_key_stmt FROM @credit_ledger_type_key_sql;
EXECUTE credit_ledger_type_key_stmt;
DEALLOCATE PREPARE credit_ledger_type_key_stmt;

UPDATE customer_credit_ledger
SET balance_before = CASE
  WHEN movement_type = 'redeemed' THEN balance_after + amount
  ELSE GREATEST(balance_after - amount, 0)
END
WHERE id > 0
  AND amount > 0
  AND balance_before = 0;

-- =====================
-- Production and packaging traceability
-- produced_quantity = baker reported quantity
-- counted_quantity = independent packaging count
-- =====================

SET @production_outputs_baker_reported_by_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND COLUMN_NAME = 'baker_reported_by'
);

SET @production_outputs_baker_reported_by_sql = IF(
  @production_outputs_baker_reported_by_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD COLUMN baker_reported_by BIGINT UNSIGNED NULL AFTER produced_quantity,
     ADD COLUMN baker_reported_at TIMESTAMP NULL AFTER baker_reported_by',
  'SELECT 1'
);

PREPARE production_outputs_baker_reported_by_stmt FROM @production_outputs_baker_reported_by_sql;
EXECUTE production_outputs_baker_reported_by_stmt;
DEALLOCATE PREPARE production_outputs_baker_reported_by_stmt;

SET @production_outputs_counted_by_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND COLUMN_NAME = 'counted_by'
);

SET @production_outputs_counted_by_sql = IF(
  @production_outputs_counted_by_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD COLUMN counted_by BIGINT UNSIGNED NULL AFTER counted_quantity,
     ADD COLUMN counted_at TIMESTAMP NULL AFTER counted_by',
  'SELECT 1'
);

PREPARE production_outputs_counted_by_stmt FROM @production_outputs_counted_by_sql;
EXECUTE production_outputs_counted_by_stmt;
DEALLOCATE PREPARE production_outputs_counted_by_stmt;

SET @production_outputs_reported_key_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND INDEX_NAME = 'idx_batch_outputs_baker_reported_by'
);

SET @production_outputs_reported_key_sql = IF(
  @production_outputs_reported_key_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD KEY idx_batch_outputs_baker_reported_by (baker_reported_by, baker_reported_at)',
  'SELECT 1'
);

PREPARE production_outputs_reported_key_stmt FROM @production_outputs_reported_key_sql;
EXECUTE production_outputs_reported_key_stmt;
DEALLOCATE PREPARE production_outputs_reported_key_stmt;

SET @production_outputs_counted_key_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND INDEX_NAME = 'idx_batch_outputs_counted_by'
);

SET @production_outputs_counted_key_sql = IF(
  @production_outputs_counted_key_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD KEY idx_batch_outputs_counted_by (counted_by, counted_at)',
  'SELECT 1'
);

PREPARE production_outputs_counted_key_stmt FROM @production_outputs_counted_key_sql;
EXECUTE production_outputs_counted_key_stmt;
DEALLOCATE PREPARE production_outputs_counted_key_stmt;

SET @production_outputs_reported_fk_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
  WHERE CONSTRAINT_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND CONSTRAINT_NAME = 'fk_batch_outputs_baker_reported_by'
);

SET @production_outputs_reported_fk_sql = IF(
  @production_outputs_reported_fk_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD CONSTRAINT fk_batch_outputs_baker_reported_by
       FOREIGN KEY (baker_reported_by) REFERENCES users (id)
       ON DELETE SET NULL ON UPDATE CASCADE',
  'SELECT 1'
);

PREPARE production_outputs_reported_fk_stmt FROM @production_outputs_reported_fk_sql;
EXECUTE production_outputs_reported_fk_stmt;
DEALLOCATE PREPARE production_outputs_reported_fk_stmt;

SET @production_outputs_counted_fk_exists = (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
  WHERE CONSTRAINT_SCHEMA = DATABASE()
    AND TABLE_NAME = 'production_batch_outputs'
    AND CONSTRAINT_NAME = 'fk_batch_outputs_counted_by'
);

SET @production_outputs_counted_fk_sql = IF(
  @production_outputs_counted_fk_exists = 0,
  'ALTER TABLE production_batch_outputs
     ADD CONSTRAINT fk_batch_outputs_counted_by
       FOREIGN KEY (counted_by) REFERENCES users (id)
       ON DELETE SET NULL ON UPDATE CASCADE',
  'SELECT 1'
);

PREPARE production_outputs_counted_fk_stmt FROM @production_outputs_counted_fk_sql;
EXECUTE production_outputs_counted_fk_stmt;
DEALLOCATE PREPARE production_outputs_counted_fk_stmt;

UPDATE production_batch_outputs pbo
INNER JOIN production_batches pb ON pb.id = pbo.production_batch_id
SET pbo.baker_reported_by = COALESCE(pbo.baker_reported_by, pb.created_by),
    pbo.baker_reported_at = COALESCE(pbo.baker_reported_at, pb.created_at)
WHERE pbo.id > 0
  AND pbo.produced_quantity > 0;

UPDATE production_batch_outputs pbo
INNER JOIN (
  SELECT
    pri.production_batch_output_id,
    MAX(pr.created_by) AS counted_by,
    MAX(pr.created_at) AS counted_at
  FROM packing_report_items pri
  INNER JOIN packing_reports pr ON pr.id = pri.packing_report_id
  WHERE pri.counted_quantity > 0
  GROUP BY pri.production_batch_output_id
) trace ON trace.production_batch_output_id = pbo.id
SET pbo.counted_by = COALESCE(pbo.counted_by, trace.counted_by),
    pbo.counted_at = COALESCE(pbo.counted_at, trace.counted_at)
WHERE pbo.id > 0
  AND pbo.counted_quantity > 0;

-- =====================
-- Traceability views
-- =====================

CREATE OR REPLACE VIEW vw_customer_credit_traceability AS
SELECT
  cca.customer_id,
  c.name AS customer_name,
  cca.balance_amount,
  ccl.id AS ledger_id,
  ccl.movement_type,
  ccl.amount,
  ccl.balance_before,
  ccl.balance_after,
  ccl.sales_return_id,
  ccl.order_id,
  ccl.notes,
  ccl.created_by,
  u.full_name AS created_by_name,
  ccl.created_at
FROM customer_credit_accounts cca
INNER JOIN customers c ON c.id = cca.customer_id
LEFT JOIN customer_credit_ledger ccl ON ccl.customer_id = cca.customer_id
LEFT JOIN users u ON u.id = ccl.created_by;

CREATE OR REPLACE VIEW vw_production_output_traceability AS
SELECT
  pb.id AS production_batch_id,
  pb.produced_date,
  pb.status,
  pb.branch_id,
  b.name AS branch_name,
  pb.recipe_id,
  COALESCE(NULLIF(SUBSTRING_INDEX(r.notes, ' - ', 1), ''), rp.name, CONCAT('Receta #', r.id)) AS recipe_name,
  pb.baker_employee_id,
  baker_user.full_name AS baker_name,
  pbo.id AS production_batch_output_id,
  pbo.product_id,
  p.name AS product_name,
  p.sku AS product_sku,
  pbo.expected_quantity,
  pbo.produced_quantity AS baker_reported_quantity,
  pbo.counted_quantity,
  pbo.packed_quantity,
  pbo.damaged_quantity,
  pbo.missing_quantity,
  (pbo.counted_quantity - pbo.produced_quantity) AS count_difference,
  pbo.baker_reported_by,
  baker_report_user.full_name AS baker_reported_by_name,
  pbo.baker_reported_at,
  pbo.counted_by,
  counted_user.full_name AS counted_by_name,
  pbo.counted_at
FROM production_batch_outputs pbo
INNER JOIN production_batches pb ON pb.id = pbo.production_batch_id
INNER JOIN branches b ON b.id = pb.branch_id
INNER JOIN recipes r ON r.id = pb.recipe_id
LEFT JOIN products rp ON rp.id = r.product_id
INNER JOIN employees baker ON baker.id = pb.baker_employee_id
INNER JOIN users baker_user ON baker_user.id = baker.user_id
INNER JOIN products p ON p.id = pbo.product_id
LEFT JOIN users baker_report_user ON baker_report_user.id = pbo.baker_reported_by
LEFT JOIN users counted_user ON counted_user.id = pbo.counted_by;

CREATE OR REPLACE VIEW vw_sales_gift_traceability AS
SELECT
  sg.id AS sales_gift_id,
  sg.gift_date,
  sg.status,
  sg.branch_id,
  b.name AS branch_name,
  sg.customer_id,
  c.name AS customer_name,
  sg.sales_agent_user_id,
  seller.full_name AS sales_agent_name,
  sg.total_commercial_value,
  sg.notes,
  sg.created_by,
  creator.full_name AS created_by_name,
  sg.created_at,
  sg.updated_by,
  updater.full_name AS updated_by_name,
  sg.updated_at,
  sg.cancelled_by,
  canceller.full_name AS cancelled_by_name,
  sg.cancelled_at,
  sg.cancellation_reason
FROM sales_gifts sg
INNER JOIN branches b ON b.id = sg.branch_id
INNER JOIN customers c ON c.id = sg.customer_id
LEFT JOIN users seller ON seller.id = sg.sales_agent_user_id
LEFT JOIN users creator ON creator.id = sg.created_by
LEFT JOIN users updater ON updater.id = sg.updated_by
LEFT JOIN users canceller ON canceller.id = sg.cancelled_by;



