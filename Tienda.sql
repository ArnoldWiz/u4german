drop database if exists ventas;

create database ventas;

use ventas;

create table usuario(
idUsuario int (11) auto_increment primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
usuario varchar(15) not null,
password varchar(64) not null,
telefono varchar(15) not null,
tipo int(1)	not null default 1
);
insert into usuario values(1,'root','root','root',SHA2('root',256),'1',0);
INSERT INTO usuario (nombre, apellido, usuario, password, telefono, tipo)
VALUES
('Juan', 'Pérez', 'juanp', SHA2('juan123', 256), '5551234567', 1),
('María', 'García', 'maria.g', SHA2('maria123', 256), '5552345678', 1),
('Carlos', 'López', 'clopez', SHA2('carlos123', 256), '5553456789', 1),
('Ana', 'Martínez', 'anam', SHA2('ana123', 256), '5554567890', 1),
('Luis', 'Hernández', 'luis.h', SHA2('luis123', 256), '5555678901', 1),
('Rosa', 'Torres', 'rosat', SHA2('rosa123', 256), '5556789012', 1),
('Pedro', 'Ramírez', 'pedror', SHA2('pedro123', 256), '5557890123', 1),
('Carmen', 'Sánchez', 'csanchez', SHA2('carmen123', 256), '5558901234', 1),
('Héctor', 'Gómez', 'hgomez', SHA2('hector123', 256), '5559012345', 1),
('Sofía', 'Morales', 'smorales', SHA2('sofia123', 256), '5550123456', 1);


CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    estado INT(1) NOT NULL DEFAULT 1
);

INSERT INTO clientes (nombre, telefono, estado)
VALUES
('TechCorp', '5551234567', 1),
('AgroMex', '2227654321', 1),
('EcoVida', '3339876543', 1),
('LogiTrans', '8185432190', 1),
('Construcsa', '4426543219', 1),
('BioFarm', '9991239876', 1),
('FoodMex', '4778765432', 1),
('FinTech', '5567890123', 1),
('GlobalPro', '6647651234', 1),
('AquaPur', '7223456789', 1);


create table categoria(
idCategoria int (11) auto_increment primary key,
descripcion varchar(200) not null,
estado int(1) not null
);

INSERT INTO categoria (descripcion, estado)
VALUES
('Granos y Cereales', 1), 
('Panadería y Pastelería', 1),
('Aceites y Condimentos', 1), 
('Lácteos y Derivados', 1),   
('Proteínas y Conservas', 1),  
('Frutas y Verduras', 1); 

create table producto(
idProducto int (11) auto_increment primary key,
codigo int(12)	not null,
nombre varchar(100) not null,
cantidad int(11) not null,
precio double(10,2) not null,
descripcion varchar(200) not null,
idCategoria int(11) not null,
estado int(1) not null,
iva int (2)	not null,
minimo int not null,
CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO producto (codigo, nombre, cantidad, precio, descripcion, idCategoria, estado, iva, minimo)
VALUES
(100001, 'Tortilla de Maíz', 500, 20.00, 'Kilogramo de tortilla', 1, 1, 16, 50),
(100002, 'Frijol Negro', 300, 25.50, 'Kilogramo de frijol negro', 1, 1, 16, 30),
(100003, 'Arroz Blanco', 400, 22.30, 'Kilogramo de arroz', 1, 1, 16, 40),
(100004, 'Huevo', 100, 85.00, 'Caja de 12 huevos', 2, 1, 16, 10),
(100005, 'Aceite Vegetal', 200, 45.00, 'Botella de 1 litro', 3, 1, 16, 20),
(100006, 'Leche Entera', 150, 24.00, 'Litro de leche entera', 4, 1, 16, 15),
(100007, 'Azúcar', 350, 18.50, 'Kilogramo de azúcar refinada', 1, 1, 16, 25),
(100008, 'Sal', 400, 10.00, 'Paquete de 1 kilogramo', 1, 1, 16, 30),
(100009, 'Pan de Caja', 200, 35.00, 'Bolsa de pan de caja', 2, 1, 16, 10),
(100010, 'Café Soluble', 100, 95.00, 'Frasco de 200 gramos', 3, 1, 16, 10),
(100011, 'Pasta para Sopa', 300, 10.00, 'Paquete de 200 gramos', 1, 1, 16, 15),
(100012, 'Avena', 150, 15.50, 'Bolsa de 500 gramos', 1, 1, 16, 10),
(100013, 'Carne de Res', 80, 150.00, 'Kilogramo de carne de res', 5, 1, 16, 5),
(100014, 'Carne de Pollo', 100, 90.00, 'Kilogramo de carne de pollo', 5, 1, 16, 10),
(100015, 'Pescado', 50, 120.00, 'Kilogramo de pescado', 5, 1, 16, 5),
(100016, 'Tomate', 500, 15.00, 'Kilogramo de tomate', 6, 1, 16, 50),
(100017, 'Cebolla', 400, 18.00, 'Kilogramo de cebolla', 6, 1, 16, 40),
(100018, 'Papas', 350, 22.50, 'Kilogramo de papas', 6, 1, 16, 35),
(100019, 'Zanahoria', 400, 14.00, 'Kilogramo de zanahoria', 6, 1, 16, 30),
(100020, 'Manzana', 300, 35.00, 'Kilogramo de manzana', 6, 1, 16, 25),
(100021, 'Plátano', 400, 18.00, 'Kilogramo de plátano', 6, 1, 16, 30),
(100022, 'Naranja', 500, 12.50, 'Kilogramo de naranja', 6, 1, 16, 50),
(100023, 'Jitomate', 400, 18.00, 'Kilogramo de jitomate', 6, 1, 16, 40),
(100024, 'Chiles Secos', 150, 60.00, 'Kilogramo de chile seco', 6, 1, 16, 10),
(100025, 'Queso Fresco', 100, 75.00, 'Kilogramo de queso fresco', 4, 1, 16, 10),
(100026, 'Crema', 120, 25.00, 'Bote de 250 gramos', 4, 1, 16, 10),
(100027, 'Yogurt', 200, 22.00, 'Litro de yogurt', 4, 1, 16, 15),
(100028, 'Lentejas', 300, 23.50, 'Kilogramo de lentejas', 1, 1, 16, 30),
(100029, 'Atún en Lata', 150, 20.00, 'Lata de 140 gramos', 5, 1, 16, 10),
(100030, 'Sardinas en Lata', 120, 18.00, 'Lata de 200 gramos', 5, 1, 16, 10),
(100031, 'Harina de Trigo', 200, 12.50, 'Paquete de 1 kilogramo', 1, 1, 16, 20),
(100032, 'Galletas', 250, 25.00, 'Paquete de 400 gramos', 2, 1, 16, 25),
(100033, 'Mermelada', 100, 30.00, 'Frasco de 500 gramos', 3, 1, 16, 10),
(100034, 'Mayonesa', 150, 35.00, 'Frasco de 500 gramos', 3, 1, 16, 10),
(100035, 'Chocolate en Polvo', 100, 45.00, 'Caja de 500 gramos', 3, 1, 16, 10),
(100036, 'Pollo Entero', 80, 100.00, 'Kilogramo de pollo entero', 5, 1, 16, 5),
(100037, 'Chayote', 300, 12.00, 'Kilogramo de chayote', 6, 1, 16, 25),
(100038, 'Calabaza', 300, 15.00, 'Kilogramo de calabaza', 6, 1, 16, 25),
(100039, 'Pimiento', 200, 22.00, 'Kilogramo de pimiento', 6, 1, 16, 20),
(100040, 'Lechuga', 250, 10.00, 'Pieza de lechuga', 6, 1, 16, 25),
(100041, 'Cilantro', 300, 8.00, 'Manojo de cilantro', 6, 1, 16, 25),
(100042, 'Espinaca', 200, 15.00, 'Manojo de espinaca', 6, 1, 16, 20),
(100043, 'Jícama', 250, 13.00, 'Kilogramo de jícama', 6, 1, 16, 25),
(100044, 'Sandía', 200, 10.00, 'Kilogramo de sandía', 6, 1, 16, 20),
(100045, 'Melón', 200, 12.00, 'Kilogramo de melón', 6, 1, 16, 20),
(100046, 'Pera', 150, 38.00, 'Kilogramo de pera', 6, 1, 16, 15),
(100047, 'Uva', 100, 50.00, 'Kilogramo de uva', 6, 1, 16, 10),
(100048, 'Durazno', 150, 42.00, 'Kilogramo de durazno', 6, 1, 16, 15),
(100049, 'Aguacate', 150, 75.00, 'Kilogramo de aguacate', 6, 1, 16, 15),
(100050, 'Pepino', 250, 18.00, 'Kilogramo de pepino', 6, 1, 16, 25);

create table venta(
idVenta int (11) auto_increment primary key,
valorPagar double(10,2) not null,
fechaVenta date not null
);
ALTER TABLE venta
ADD COLUMN idUsuario INT(11) NOT NULL AFTER idVenta,
ADD CONSTRAINT fk_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE venta
ADD COLUMN idCliente INT(11) NOT NULL AFTER idUsuario,
ADD CONSTRAINT fk_idCliente FOREIGN KEY (idCliente) REFERENCES clientes(idCliente) ON DELETE CASCADE ON UPDATE CASCADE;


create table detalle_venta(
idDetalleVenta int (11) auto_increment primary key,
idVenta int (11) not null,
idProducto int (11) not null,
cantidad int(11) not null,
precioUnitario double(10,2) not null,
subtotal double(10,2) not null,
totalPagar double(10,2) not null,
iva tinyint not null,
CONSTRAINT fk_idVenta FOREIGN KEY (idVenta) REFERENCES venta(idVenta) ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER $$

CREATE PROCEDURE InsertarCliente(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_correo VARCHAR(100),
    IN p_estado INT
)
BEGIN
    INSERT INTO clientes (nombre, apellido, telefono, correo, estado)
    VALUES (p_nombre, p_apellido, p_telefono, p_correo, p_estado);
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE InsertarVentasSimuladas(
    IN cantidadVentas INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE maxEmpleados INT;
    DECLARE maxClientes INT;
    DECLARE maxProductos INT;
    DECLARE randEmpleado INT;
    DECLARE randCliente INT;
    DECLARE randProducto INT;
    DECLARE randCantidad INT;
    DECLARE fechaVenta DATE;
    DECLARE precioProducto DOUBLE;
    DECLARE totalVenta DOUBLE;
    SELECT MAX(idUsuario) INTO maxEmpleados FROM usuario;
    SELECT MAX(idCliente) INTO maxClientes FROM clientes;
    SELECT MAX(idProducto) INTO maxProductos FROM producto;
    
    WHILE i < cantidadVentas DO
        SET randEmpleado = FLOOR(1 + RAND() * maxEmpleados); 
        SET randCliente = FLOOR(1 + RAND() * maxClientes); 
        SET randProducto = FLOOR(1 + RAND() * maxProductos); 
        SET randCantidad = FLOOR(1 + RAND() * 10);
        SET fechaVenta = MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL FLOOR(RAND() * 365) DAY;
        SELECT precio INTO precioProducto FROM producto WHERE idProducto = randProducto;
        SET totalVenta = randCantidad * precioProducto;
        INSERT INTO venta (idUsuario, idCliente, valorPagar, fechaVenta)
        VALUES (randEmpleado, randCliente, totalVenta, fechaVenta);
        INSERT INTO detalle_venta (idVenta, idProducto, cantidad, precioUnitario, subtotal, totalPagar, iva)
        VALUES (
            LAST_INSERT_ID(), 
            randProducto, 
            randCantidad, 
            precioProducto, 
            randCantidad * precioProducto, 
            randCantidad * precioProducto * 1.16,
            16
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL InsertarVentasSimuladas(10);
SELECT * FROM venta ORDER BY fechaVenta;
SELECT * FROM detalle_venta ORDER BY idDetalleVenta;
CALL InsertarVentasSimuladas(2000);

CREATE VIEW reporte_ventas_mes AS
SELECT 
    v.idVenta AS folio,
    v.fechaVenta AS fecha,
    c.nombre AS cliente,
    CONCAT(u.nombre, ' ', u.apellido) AS empleado,
    v.valorPagar AS total,
    SUM(dv.cantidad) AS cantidadProductos
FROM venta v
JOIN clientes c ON v.idCliente = c.idCliente
JOIN usuario u ON v.idUsuario = u.idUsuario
JOIN detalle_venta dv ON v.idVenta = dv.idVenta
GROUP BY v.idVenta
ORDER BY v.fechaVenta DESC;

SELECT
    CONCAT(u.nombre, ' ', u.apellido) AS empleado,
    SUM(v.valorPagar) AS totalVentas,
    COUNT(v.idVenta) AS cantidadVentas,
    YEAR(v.fechaVenta) AS anio,
    MONTH(v.fechaVenta) AS mes
FROM venta v
JOIN usuario u ON v.idUsuario = u.idUsuario
GROUP BY u.idUsuario, YEAR(v.fechaVenta), MONTH(v.fechaVenta)
ORDER BY anio DESC, mes DESC, totalVentas DESC;
DROP VIEW IF EXISTS reporte_ventas_empleado;
    
SELECT * FROM reporte_ventas_mes
WHERE MONTH(fecha) = 6 and year(fecha)=2024 
ORDER BY fecha DESC;
use tienda;

CREATE VIEW reporte_ventas_empleado AS
SELECT 
    CONCAT(u.nombre, ' ', u.apellido) AS empleado,
    SUM(v.valorPagar) AS totalVentas,
    COUNT(v.idVenta) AS cantidadVentas, 
    YEAR(v.fechaVenta) AS anio,
    MONTH(v.fechaVenta) AS mes
FROM venta v
JOIN usuario u ON v.idUsuario = u.idUsuario
GROUP BY u.idUsuario, YEAR(v.fechaVenta), MONTH(v.fechaVenta)
ORDER BY anio DESC, mes DESC, totalVentas DESC;

SELECT * FROM reporte_ventas_empleado
WHERE anio = 2024 AND mes = 2
ORDER BY totalVentas DESC;
    
CREATE VIEW reporte_ventas_trimestres AS
SELECT
    p.nombre AS producto,
    YEAR(v.fechaVenta) AS anio,
    SUM(CASE WHEN MONTH(v.fechaVenta) BETWEEN 1 AND 3 THEN dv.cantidad ELSE 0 END) AS trimestre_1,
    SUM(CASE WHEN MONTH(v.fechaVenta) BETWEEN 4 AND 6 THEN dv.cantidad ELSE 0 END) AS trimestre_2,
    SUM(CASE WHEN MONTH(v.fechaVenta) BETWEEN 7 AND 9 THEN dv.cantidad ELSE 0 END) AS trimestre_3,
    SUM(CASE WHEN MONTH(v.fechaVenta) BETWEEN 10 AND 12 THEN dv.cantidad ELSE 0 END) AS trimestre_4
FROM venta v
JOIN detalle_venta dv ON v.idVenta = dv.idVenta
JOIN producto p ON dv.idProducto = p.idProducto
GROUP BY p.nombre, YEAR(v.fechaVenta)
ORDER BY anio DESC, producto;

SELECT * FROM reporte_ventas_trimestres WHERE anio = 2024;

CREATE TABLE auditoria_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT,
    accion VARCHAR(10),
    fechaCambio DATETIME,
    idUsuario INT,
    detalles VARCHAR(255)
);
DELIMITER $$

CREATE TRIGGER auditoria_ventas_insert
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
    DECLARE usuario_id INT;
    DECLARE detalles_cambio VARCHAR(255);
    SET usuario_id = (SELECT idUsuario FROM usuario WHERE usuario = USER());
    SET detalles_cambio = CONCAT('Venta insertada: ', NEW.idVenta);
    INSERT INTO auditoria_ventas (idVenta, accion, fechaCambio, idUsuario, detalles)
    VALUES (NEW.idVenta, 'INSERT', NOW(), usuario_id, detalles_cambio);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER auditoria_ventas_update
AFTER UPDATE ON venta
FOR EACH ROW
BEGIN
    DECLARE usuario_id INT;
    DECLARE detalles_cambio VARCHAR(255);
    SET usuario_id = (SELECT idUsuario FROM usuario WHERE usuario = USER());
    SET detalles_cambio = CONCAT('Venta actualizada: ', OLD.idVenta, ' a ', NEW.idVenta);
    INSERT INTO auditoria_ventas (idVenta, accion, fechaCambio, idUsuario, detalles)
    VALUES (NEW.idVenta, 'UPDATE', NOW(), usuario_id, detalles_cambio);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER auditoria_ventas_delete
AFTER DELETE ON venta
FOR EACH ROW
BEGIN
    DECLARE usuario_id INT;
    DECLARE detalles_cambio VARCHAR(255);
    SET usuario_id = (SELECT idUsuario FROM usuario WHERE usuario = USER());
    SET detalles_cambio = CONCAT('Venta eliminada: ', OLD.idVenta);
    INSERT INTO auditoria_ventas (idVenta, accion, fechaCambio, idUsuario, detalles)
    VALUES (OLD.idVenta, 'DELETE', NOW(), usuario_id, detalles_cambio);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER validacion_producto_insert
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio no puede ser negativo.';
    END IF;

    IF TRIM(NEW.nombre) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del producto no puede estar vacío.';
    END IF;

    IF NEW.codigo IS NOT NULL AND (LENGTH(NEW.codigo) < 8 OR LENGTH(NEW.codigo) > 20) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El código de barras debe tener entre 8 y 20 caracteres.';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER validacion_producto_update
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio no puede ser negativo.';
    END IF;

    IF TRIM(NEW.nombre) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del producto no puede estar vacío.';
    END IF;
    
    IF NEW.codigo IS NOT NULL AND (LENGTH(NEW.codigo) < 8 OR LENGTH(NEW.codigo) > 20) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El código de barras debe tener entre 8 y 20 caracteres.';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION calcular_cantidad_productos(venta_folio INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT SUM(dv.cantidad) INTO cantidad
    FROM detalle_venta dv
    WHERE dv.idVenta = venta_folio;
    RETURN cantidad;
END $$
DELIMITER ;







