-- Independent customer gifts outside sales orders.
-- Run after:
--   053_sales_role_scope.sql

USE panaderia_db;

CREATE TABLE IF NOT EXISTS sales_gifts (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  branch_id BIGINT UNSIGNED NOT NULL,
  customer_id BIGINT UNSIGNED NOT NULL,
  sales_agent_user_id BIGINT UNSIGNED NULL,
  gift_date DATE NOT NULL,
  total_commercial_value DECIMAL(12,2) NOT NULL DEFAULT 0,
  status ENUM('registered','cancelled') NOT NULL DEFAULT 'registered',
  notes VARCHAR(255) NULL,
  created_by BIGINT UNSIGNED NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_sales_gifts_date_seller (gift_date, sales_agent_user_id),
  KEY idx_sales_gifts_customer (customer_id, gift_date),
  KEY idx_sales_gifts_branch (branch_id),
  KEY idx_sales_gifts_created_by (created_by),
  CONSTRAINT fk_sales_gifts_branch
    FOREIGN KEY (branch_id) REFERENCES branches (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_sales_gifts_customer
    FOREIGN KEY (customer_id) REFERENCES customers (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_sales_gifts_seller
    FOREIGN KEY (sales_agent_user_id) REFERENCES users (id)
    ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_sales_gifts_created_by
    FOREIGN KEY (created_by) REFERENCES users (id)
    ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT chk_sales_gifts_total CHECK (total_commercial_value >= 0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sales_gift_items (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sales_gift_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  quantity DECIMAL(12,3) NOT NULL,
  unit_price DECIMAL(12,2) NOT NULL DEFAULT 0,
  tax_percent DECIMAL(6,3) NOT NULL DEFAULT 0,
  commercial_value DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_sales_gift_product (sales_gift_id, product_id),
  KEY idx_sales_gift_items_product (product_id),
  CONSTRAINT fk_sales_gift_items_gift
    FOREIGN KEY (sales_gift_id) REFERENCES sales_gifts (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_sales_gift_items_product
    FOREIGN KEY (product_id) REFERENCES products (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_sales_gift_items_qty CHECK (quantity > 0),
  CONSTRAINT chk_sales_gift_items_amounts CHECK (
    unit_price >= 0 AND tax_percent >= 0 AND commercial_value >= 0
  )
) ENGINE=InnoDB;

