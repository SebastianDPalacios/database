-- Configura productos cuya venta incluye vendaje automaticamente.

ALTER TABLE products
  ADD COLUMN includes_bonus TINYINT(1) NOT NULL DEFAULT 0 AFTER units_per_bag;

