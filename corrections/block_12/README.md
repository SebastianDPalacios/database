# Scripts correctivos del Bloque 12

No ejecutar estos archivos hasta revisar el resultado de `database/audits/block_12_historical_data_audit.sql`.

Cada archivo está separado por problema y contiene un bloqueo intencional. Para habilitar una corrección se debe:

1. Completar manualmente la tabla de decisiones indicada por el script.
2. Confirmar que ningún producto pertenezca a una categoría Mayoristas.
3. Crear y verificar la tabla de respaldo.
4. Retirar el `SIGNAL` solamente después de aprobación.
5. Ejecutar primero con `ROLLBACK` y comparar conteos antes/después.
6. Sustituir `ROLLBACK` por `COMMIT` únicamente en la ejecución autorizada.

Archivos:

- `01_obsequios_registrados_como_cambios.sql`
- `02_cambios_productos_incorrectos.sql`
- `03_productos_unidad_incorrecta.sql`
- `04_conteos_artificiales.sql`
- `05_danos_sin_conteo.sql`
- `06_fechas_operativas.sql`
- `07_correcciones_incompletas.sql`
