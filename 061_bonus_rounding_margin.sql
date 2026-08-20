-- Margen configurable por linea para completar una unidad entera de vendaje.

ALTER TABLE sales_settings
  ADD COLUMN bonus_max_company_loss_amount DECIMAL(12,2) NOT NULL DEFAULT 1500.00
  AFTER bonus_minimum_amount;

ALTER TABLE orders
  ADD COLUMN bonus_max_company_loss_amount DECIMAL(12,2) NOT NULL DEFAULT 1500.00
  AFTER bonus_minimum_amount;

