INSERT INTO productos (nombre, precio, categoria_id)
VALUES ('Teclado', 19.99, 1);

SELECT LAST_INSERT_ID();

INSERT INTO productos (nombre, precio, categoria_id)
VALUES 
  ('Webcam', 45.00, 1),
  ('Lámpara LED', 15.20, 2);

SELECT * FROM productos;

SELECT id, nombre, precio FROM productos;


UPDATE productos_prueba
SET precio = precio + 5.00;

UPDATE productos_prueba
SET sku = CONCAT('TEMP-', id);

UPDATE productos_prueba
SET nombre = UPPER(nombre);


DELETE FROM productos_prueba;

SELECT * FROM productos_prueba;

INSERT INTO productos_prueba (nombre, precio, categoria_id, sku)
VALUES
  ('Item X', 10.00, 1, 'X-001'),
  ('Item Y', 20.00, 2, 'Y-001');

SELECT * FROM productos_prueba;

TRUNCATE TABLE productos_prueba;

SELECT * FROM productos_prueba;

INSERT INTO categorias (nombre)
VALUES ('Oficina'), ('Automotriz');

SELECT * FROM categorias;

INSERT INTO productos_prueba (nombre, precio, categoria_id, sku)
VALUES
  ('Prod 1', 5.00, 1, 'P1'),
  ('Prod 2', 6.00, 1, 'P2'),
  ('Prod 3', 7.00, 1, 'P3');

UPDATE productos_prueba
SET sku = 'SKU-UNICO';

SELECT * FROM productos_prueba;

UPDATE productos_prueba
SET precio = ROUND(precio, 0);

SELECT * FROM productos_prueba;
