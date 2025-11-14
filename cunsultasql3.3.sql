SELECT nombre AS producto, precio AS precio_eur FROM productos;

SELECT * FROM productos
WHERE activo = TRUE AND precio >= 50;

SELECT * FROM productos
WHERE precio BETWEEN 20 AND 100;

SELECT * FROM productos
WHERE categoria_id IN (1,3);

SELECT * FROM productos
WHERE nombre LIKE '%te%';

SELECT * FROM productos
WHERE sku IS NULL;

SELECT nombre, precio
FROM productos
ORDER BY precio DESC, nombre ASC;

SELECT *
FROM productos
ORDER BY precio DESC
LIMIT 3;

SELECT COUNT(*) FROM productos;

SELECT 
  AVG(precio) AS precio_promedio,
  MAX(precio) AS precio_max,
  MIN(precio) AS precio_min
FROM productos;

SELECT SUM(stock)
FROM productos
WHERE activo = TRUE;

SELECT 
  categoria_id,
  COUNT(*) AS total_productos,
  AVG(precio) AS precio_promedio
FROM productos
GROUP BY categoria_id
ORDER BY total_productos DESC;

SELECT 
  categoria_id,
  COUNT(*)
FROM productos
GROUP BY categoria_id
HAVING COUNT(*) >= 2;

SELECT 
  activo,
  SUM(stock)
FROM productos
GROUP BY activo;

SELECT 
  pedido_id,
  COUNT(*) AS lineas,
  SUM(cantidad) AS unidades,
  SUM(cantidad * precio_unitario) AS importe_total
FROM pedido_detalle
GROUP BY pedido_id
ORDER BY importe_total DESC;

SELECT 
  pedido_id,
  COUNT(*) AS lineas,
  SUM(cantidad) AS unidades,
  SUM(cantidad * precio_unitario) AS importe_total
FROM pedido_detalle
GROUP BY pedido_id
HAVING SUM(cantidad * precio_unitario) >= 200
ORDER BY importe_total DESC;

SELECT id, nombre
FROM clientes
ORDER BY fecha_registro DESC
LIMIT 2;

SELECT *
FROM productos
ORDER BY id ASC
LIMIT 2 OFFSET 2;
