-- Permite productos sin impuesto y conserva la validacion cuando se selecciona una tasa.

ALTER TABLE products
  MODIFY COLUMN tax_rate_id BIGINT UNSIGNED NULL;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_product_create $$
CREATE PROCEDURE sp_product_create(
  IN p_sku VARCHAR(60), IN p_name VARCHAR(150), IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED, IN p_tax_rate_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20), IN p_base_price DECIMAL(12,2), IN p_min_stock DECIMAL(12,3),
  IN p_units_per_bag DECIMAL(14,3), IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT, OUT o_message VARCHAR(255), OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_base_price < 0 OR p_min_stock < 0 THEN
    SET o_code = 0; SET o_message = 'base_price y min_stock deben ser >= 0'; SET o_data_json = NULL;
  ELSEIF p_units_per_bag IS NOT NULL AND p_units_per_bag <= 0 THEN
    SET o_code = 0; SET o_message = 'unidades por bulto debe ser mayor que 0'; SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM product_categories WHERE id = p_category_id AND is_active = 1) THEN
    SET o_code = 0; SET o_message = 'categoria de producto no encontrada o inactiva'; SET o_data_json = NULL;
  ELSEIF p_tax_rate_id IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM tax_rates WHERE id = p_tax_rate_id AND is_active = 1) THEN
    SET o_code = 0; SET o_message = 'tasa de impuesto no encontrada o inactiva'; SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM products WHERE sku = TRIM(p_sku)) THEN
    SET o_code = 0; SET o_message = 'el sku de producto ya existe'; SET o_data_json = NULL;
  ELSE
    INSERT INTO products (
      sku, name, description, category_id, tax_rate_id, unit,
      base_price, min_stock, units_per_bag, is_active
    ) VALUES (
      TRIM(p_sku), TRIM(p_name), p_description, p_category_id, p_tax_rate_id,
      p_unit, p_base_price, p_min_stock, p_units_per_bag, IFNULL(p_is_active, 1)
    );
    SET v_id = LAST_INSERT_ID();
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (p_actor_user_id, 'product.create', 'products', CAST(v_id AS CHAR),
      JSON_OBJECT('units_per_bag', p_units_per_bag, 'tax_rate_id', p_tax_rate_id));
    SET o_code = 1; SET o_message = 'producto creado';
    SET o_data_json = JSON_OBJECT('product_id', v_id, 'sku', TRIM(p_sku));
  END IF;
END $$

DROP PROCEDURE IF EXISTS sp_product_update $$
CREATE PROCEDURE sp_product_update(
  IN p_product_id BIGINT UNSIGNED, IN p_name VARCHAR(150), IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED, IN p_tax_rate_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20), IN p_base_price DECIMAL(12,2), IN p_min_stock DECIMAL(12,3),
  IN p_units_per_bag DECIMAL(14,3), IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT, OUT o_message VARCHAR(255), OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_base_price < 0 OR p_min_stock < 0 THEN
    SET o_code = 0; SET o_message = 'base_price y min_stock deben ser >= 0'; SET o_data_json = NULL;
  ELSEIF p_units_per_bag IS NOT NULL AND p_units_per_bag <= 0 THEN
    SET o_code = 0; SET o_message = 'unidades por bulto debe ser mayor que 0'; SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM product_categories WHERE id = p_category_id) THEN
    SET o_code = 0; SET o_message = 'categoria de producto no encontrada'; SET o_data_json = NULL;
  ELSEIF p_tax_rate_id IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM tax_rates WHERE id = p_tax_rate_id) THEN
    SET o_code = 0; SET o_message = 'tasa de impuesto no encontrada'; SET o_data_json = NULL;
  ELSE
    UPDATE products
    SET name = TRIM(p_name), description = p_description, category_id = p_category_id,
        tax_rate_id = p_tax_rate_id, unit = p_unit, base_price = p_base_price,
        min_stock = p_min_stock, units_per_bag = p_units_per_bag,
        is_active = IFNULL(p_is_active, is_active), updated_at = CURRENT_TIMESTAMP
    WHERE id = p_product_id AND deleted_at IS NULL;
    SET v_rows = ROW_COUNT();
    IF v_rows = 0 THEN
      SET o_code = 0; SET o_message = 'producto no encontrado'; SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (p_actor_user_id, 'product.update', 'products', CAST(p_product_id AS CHAR),
        JSON_OBJECT('units_per_bag', p_units_per_bag, 'tax_rate_id', p_tax_rate_id));
      SET o_code = 1; SET o_message = 'producto actualizado';
      SET o_data_json = JSON_OBJECT('product_id', p_product_id);
    END IF;
  END IF;
END $$

DELIMITER ;
