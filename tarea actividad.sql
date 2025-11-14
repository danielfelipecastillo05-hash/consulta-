CREATE DATABASE IF NOT EXISTS tienda_ddl
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE tienda_ddl;


CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);



CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria_id INT NOT NULL,
    CONSTRAINT chk_precio_pos CHECK (precio > 0),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
        ON DELETE RESTRICT
);


INSERT INTO categorias (nombre) VALUES
('Tecnología'),
('Hogar');

INSERT INTO productos (nombre, precio, categoria_id) VALUES
('Mouse Gamer', 80.00, 1),
('Teclado Mecánico', 150.00, 1),
('Aspiradora Compacta', 200.00, 2);



INSERT INTO productos (nombre, precio, categoria_id)
VALUES ('Producto Inválido', -1, 1);



ALTER TABLE productos
ADD COLUMN sku VARCHAR(30) NOT NULL UNIQUE;

INSERT INTO productos (nombre, precio, categoria_id, sku)
VALUES ('Audífonos', 120, 1, 'SKU123');

INSERT INTO productos (nombre, precio, categoria_id, sku)
VALUES ('Altavoz', 150, 1, 'SKU123');   -- debe fallar


ALTER TABLE productos
MODIFY COLUMN nombre VARCHAR(150) NULL;

ALTER TABLE productos
MODIFY COLUMN nombre VARCHAR(150) NOT NULL;


ALTER TABLE productos
ADD CONSTRAINT unq_nombre_categoria
UNIQUE (nombre, categoria_id);


ALTER TABLE productos
CHANGE COLUMN precio precio_unitario DECIMAL(10,2) NOT NULL;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL
);


CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id)
        ON DELETE CASCADE
);
CREATE TABLE pedido_detalle (
    pedido_id INT NOT NULL,
    linea INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (pedido_id, linea),

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_precio_u CHECK (precio_unitario >= 0)
);
-- Insertar cliente
INSERT INTO clientes (email, nombre) VALUES
('cliente@correo.com', 'Juan Pérez');

-- Crear pedido
INSERT INTO pedidos (cliente_id) VALUES (1);

-- Insertar detalles
INSERT INTO pedido_detalle (pedido_id, linea, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 2, 80.00),
(1, 2, 2, 1, 150.00);

-- Eliminar cliente → borra pedidos y detalles
DELETE FROM clientes WHERE id = 1;


