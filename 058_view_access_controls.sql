-- Per-user view access overrides.
-- Run after:
--   057_database_traceability_guards.sql

USE panaderia_db;

CREATE TABLE IF NOT EXISTS user_permission_profiles (
  user_id BIGINT UNSIGNED NOT NULL,
  permission_mode ENUM('inherit','custom') NOT NULL DEFAULT 'inherit',
  updated_by BIGINT UNSIGNED NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  KEY idx_user_permission_profiles_updated_by (updated_by),
  CONSTRAINT fk_user_permission_profiles_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_permission_profiles_updated_by
    FOREIGN KEY (updated_by) REFERENCES users (id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user_permissions (
  user_id BIGINT UNSIGNED NOT NULL,
  permission_id BIGINT UNSIGNED NOT NULL,
  granted_by BIGINT UNSIGNED NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, permission_id),
  KEY idx_user_permissions_permission (permission_id),
  KEY idx_user_permissions_granted_by (granted_by),
  CONSTRAINT fk_user_permissions_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_permissions_permission
    FOREIGN KEY (permission_id) REFERENCES permissions (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_permissions_granted_by
    FOREIGN KEY (granted_by) REFERENCES users (id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_permission_list_by_user $$
CREATE PROCEDURE sp_permission_list_by_user(
  IN p_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_user_exists INT DEFAULT 0;
  DECLARE v_permission_mode VARCHAR(20) DEFAULT 'inherit';
  DECLARE v_roles_json LONGTEXT;
  DECLARE v_permissions_json LONGTEXT;

  SELECT COUNT(*)
    INTO v_user_exists
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL;

  IF v_user_exists = 0 THEN
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    SELECT COALESCE(MAX(permission_mode), 'inherit')
      INTO v_permission_mode
    FROM user_permission_profiles
    WHERE user_id = p_user_id;

    SELECT IFNULL(
             CONCAT('[', GROUP_CONCAT(DISTINCT JSON_QUOTE(r.code) ORDER BY r.code SEPARATOR ','), ']'),
             '[]'
           )
      INTO v_roles_json
    FROM user_roles ur
    INNER JOIN roles r ON r.id = ur.role_id
    WHERE ur.user_id = p_user_id;

    IF v_permission_mode = 'custom' THEN
      SELECT IFNULL(
               CONCAT('[', GROUP_CONCAT(JSON_QUOTE(x.code) ORDER BY x.code SEPARATOR ','), ']'),
               '[]'
             )
        INTO v_permissions_json
      FROM (
        SELECT DISTINCT p.code
        FROM user_permissions up
        INNER JOIN permissions p ON p.id = up.permission_id
        WHERE up.user_id = p_user_id
        ORDER BY p.code
      ) x;
    ELSE
      SELECT IFNULL(
               CONCAT('[', GROUP_CONCAT(JSON_QUOTE(x.code) ORDER BY x.code SEPARATOR ','), ']'),
               '[]'
             )
        INTO v_permissions_json
      FROM (
        SELECT DISTINCT p.code
        FROM user_roles ur
        INNER JOIN role_permissions rp ON rp.role_id = ur.role_id
        INNER JOIN permissions p ON p.id = rp.permission_id
        WHERE ur.user_id = p_user_id
        UNION
        SELECT DISTINCT p.code
        FROM user_permissions up
        INNER JOIN permissions p ON p.id = up.permission_id
        WHERE up.user_id = p_user_id
        ORDER BY code
      ) x;
    END IF;

    SET o_code = 1;
    SET o_message = 'permisos cargados';
    SET o_data_json = CONCAT(
      '{',
      '"user_id":', p_user_id, ',',
      '"permission_mode":', JSON_QUOTE(v_permission_mode), ',',
      '"roles":', IFNULL(v_roles_json, '[]'), ',',
      '"permissions":', IFNULL(v_permissions_json, '[]'),
      '}'
    );
  END IF;
END $$

DELIMITER ;
