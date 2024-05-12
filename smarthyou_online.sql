
/*
DATABASE SMARTHYOU_ONLINE
Tablas 
		Transportistas: id_transportista, descripcion, razon_social.
		Equipos: id_equipo, marca, descripcion, color, ram, mp, pulgadas, gama, importe_sin_iva.
		Clientes: id_cliente, nombre, apellido, edad, email, telefono, calle, numero, piso_dto, cp, ciudad, provincia, pais, genero.
		Compras: id_order, Fecha_compra, id_cliente, id_equipo.
		Comentarios: id_comentario, fecha, calificacion, comentario.
		Envios: id_remito, id_order, id_transportista, fecha_inicio, estado, motivo, fecha_fin.
		Pagos: id_pago, fecha, operacion_tipo, monto, id_compra.
    */
     
     
DROP DATABASE IF EXISTS smarthyou_online;
CREATE DATABASE IF NOT EXISTS smarthyou_online;
USE smarthyou_online;


-- Tabla para almacenar la información de los transportistas
DROP TABLE IF EXISTS Transportistas;
CREATE TABLE IF NOT EXISTS transportistas (
    id_transportista      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion           TEXT,
    razon_social          VARCHAR(255)
);

-- Tabla para almacenar la información de los equipos disponibles
DROP TABLE IF EXISTS equipos;
CREATE TABLE IF NOT EXISTS equipos (
    id_equipo      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    marca          VARCHAR(100),
    descripcion    TEXT,
    color          VARCHAR (50),
    ram            VARCHAR(30),
    mp             VARCHAR(100),
    pulgadas       DECIMAL(4, 2),
    gama           VARCHAR(50),
    importe_sin_iva DECIMAL(10,2)
);

-- Tabla para almacenar la información de los clientes, incluyendo la dirección
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(255),
    apellido        VARCHAR(255),
    edad            INT,
    email           VARCHAR(255) UNIQUE,
    telefono        VARCHAR(20),
    calle           VARCHAR(255),
    numero          INT,
    piso_dto        VARCHAR(10),
    cp              INT,
    ciudad          VARCHAR(100),
    provincia       VARCHAR(100),
    pais            VARCHAR(100),
    genero 			SET('Femenino', 'Masculino', 'x')
);

-- Tabla para almacenar la información de las compras realizadas por los clientes
DROP TABLE IF EXISTS compras;
CREATE TABLE IF NOT EXISTS compras (
    id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_compra DATE,
    id_cliente INT,
    id_equipo INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);


-- Tabla para almacenar la información de los comentarios de los clientes
DROP TABLE IF EXISTS comentarios;
CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    calificacion TINYINT UNSIGNED,
    comentario TEXT,
    CHECK (calificacion >= 0 AND calificacion <= 10)
);

-- Tabla para almacenar la información de los envíos
DROP TABLE IF EXISTS envios;
CREATE TABLE IF NOT EXISTS envios (
    id_remito INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT,
    id_transportista INT,
    fecha_inicio DATE,
    estado VARCHAR(100),
    motivo TEXT,
    fecha_fin DATE,
    FOREIGN KEY (id_order) REFERENCES compras(id_order),
    FOREIGN KEY (id_transportista) REFERENCES transportistas(id_transportista)
);


-- Tabla para almacenar la información de los pagos realizados
DROP TABLE IF EXISTS pagos;
CREATE TABLE IF NOT EXISTS pagos (
    id_pago        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha          DATE,
    operacion_tipo VARCHAR(50),
    monto          DECIMAL(10, 2),
    id_compra      INT,
    FOREIGN KEY (id_compra) REFERENCES compras(id_order)
);

-- Modificaciones

ALTER TABLE envios
MODIFY COLUMN fecha_inicio DATE DEFAULT (CURDATE())
;

ALTER TABLE comentarios
ADD COLUMN id_order INT,
ADD CONSTRAINT fk_comentarios_id_order
FOREIGN KEY (id_order) REFERENCES compras(id_order);


SET SQL_SAFE_UPDATES=0;


 /* VISTAS*/
-- 1)_Compras por genero

CREATE OR REPLACE VIEW vw_compras_por_genero AS
SELECT cl.genero, 
       COUNT(*) AS total_compras,
       CONCAT(FORMAT((COUNT(*) / (SELECT COUNT(*) FROM compras)) * 100, 0), '%') AS porcentaje_compras
FROM compras c
JOIN clientes cl 
	ON c.id_cliente = cl.id_cliente
GROUP BY cl.genero;

SELECT * 
FROM smarthyou_online.vw_compras_por_genero;

-- 2)_Top five: edad de cliente que mas compra

CREATE OR REPLACE VIEW vw_top5_edades_compran AS
	SELECT cl.edad
, 	COUNT(*) AS total_compras
FROM compras c
JOIN clientes cl 
ON c.id_cliente = cl.id_cliente
GROUP BY cl.edad
ORDER BY total_compras DESC
LIMIT 5;

SELECT * 
FROM smarthyou_online.vw_top5_edades_compran;


-- 3)_Top_five: equipos mas vendidos

CREATE OR REPLACE VIEW vw_top5_equipos_mas_vendidos AS
SELECT e.marca, e.descripcion AS descripcion_equipo, COUNT(*) AS cant_vendida
FROM compras c
JOIN equipos e ON c.id_equipo = e.id_equipo
GROUP BY e.marca, e.descripcion
ORDER BY cant_vendida DESC
LIMIT 5;

SELECT * 
FROM smarthyou_online.vw_top5_equipos_mas_vendidos;


-- 4)_Monto promedio que gastan los clientes para comprar un celular en la tienda on-line

CREATE OR REPLACE VIEW vw_promedio_gasto_clientes AS
SELECT AVG(monto) AS promedio_gasto
FROM pagos;


SELECT * 
FROM smarthyou_online.vw_promedio_gasto_clientes;

-- 5)_ Agrupar calificaciones de los clientes

CREATE OR REPLACE VIEW vw_calificaciones_clientes AS
SELECT 
    calificacion,
    COUNT(*) AS cantidad
FROM comentarios
GROUP BY calificacion
ORDER BY calificacion DESC;

SELECT * 
FROM smarthyou_online.vw_calificaciones_clientes;

/*--FUNCIONES--*/
-- 1)


DROP FUNCTION IF EXISTS fn_monto_con_iva;

DELIMITER //
CREATE FUNCTION fn_monto_con_iva(monto_base DECIMAL(12, 2)) 
    RETURNS DECIMAL(12, 2)
    DETERMINISTIC
    COMMENT 'Esta función devuelve el monto con un IVA del 21%'
BEGIN
    DECLARE monto_con_iva DECIMAL(12, 2);
    SET monto_con_iva = monto_base * 1.21;
    RETURN monto_con_iva;
END//

DELIMITER ;


SELECT 
    DISTINCT monto AS monto_sin_iva,
    fn_monto_con_iva(monto) AS monto_total_con_iva
FROM pagos
ORDER BY monto_total_con_iva DESC;


-- 2)_

DROP FUNCTION IF EXISTS fn_demora_entrega;

DELIMITER //
CREATE FUNCTION fn_demora_entrega(id_remito INT) 
    RETURNS INT
    DETERMINISTIC
    COMMENT 'Calcula la demora de entrega de un envío en días'
BEGIN
    DECLARE demora INT;
    
    SELECT DATEDIFF(fecha_fin, fecha_inicio) INTO demora
    FROM envios
    WHERE id_remito = id_remito
    LIMIT 1; 
    
    RETURN demora;
    
END//
DELIMITER ;

SELECT fn_demora_entrega(27533064) AS demora_rto_27533052;


-- 3)_

DROP FUNCTION IF EXISTS fn_nombre_cliente;

DELIMITER //                            
CREATE FUNCTION fn_nombre_cliente(P_ID INT)
		RETURNS VARCHAR(50)
		DETERMINISTIC
        COMMENT "Esta funcion me devuelve los datos del cliente:Nombre/Apellido/Edad"
BEGIN                    
		DECLARE nombre_cliente VARCHAR(50);
		SELECT CONCAT(nombre, " ", apellido, ",", " ", edad) INTO nombre_cliente
		FROM clientes
		WHERE id_cliente= p_id;
   RETURN nombre_cliente;
END //       
DELIMITER  ;
 
SELECT fn_nombre_cliente(1000) AS "nombre del cliente";


/*STORED PROCEDURE */

-- 1)

DROP PROCEDURE IF EXISTS sp_obtener_compras_por_cliente;

DELIMITER //
CREATE PROCEDURE sp_obtener_compras_por_cliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT c.id_order, c.fecha_compra, e.marca, e.descripcion AS descripcion_equipo, e.importe_sin_iva
    FROM compras c
    JOIN equipos e ON c.id_equipo = e.id_equipo
    WHERE c.id_cliente = p_id_cliente;
END //
DELIMITER ;

CALL sp_obtener_compras_por_cliente(1);

-- 2)

DROP PROCEDURE IF EXISTS sp_monto_total_ventas_por_gama;

DELIMITER //
CREATE PROCEDURE sp_monto_total_ventas_por_gama(
    IN p_year INT
)
BEGIN
    SELECT e.gama,
           SUM(p.monto) AS monto_total_ventas
    FROM compras c
    JOIN equipos e ON c.id_equipo = e.id_equipo
    JOIN pagos p ON c.id_order = p.id_compra
    WHERE YEAR(c.Fecha_compra) = p_year
    GROUP BY e.gama;
END //
DELIMITER ;

CALL sp_monto_total_ventas_por_gama(2024);


/* Triggers  */

-- 1)

DROP TABLE IF EXISTS smarthyou_online.stage_insertion_equipos ;
CREATE TABLE smarthyou_online.stage_insertion_equipos (
	id_equipo INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	marca VARCHAR(100)
,	descripcion	text
,	color VARCHAR(50)
,	ram VARCHAR(30)
,	mp VARCHAR(100)
,	pulgadas DECIMAL(4,2)
,	gama VARCHAR(50)
,	importe_sin_iva DECIMAL(10,2)
, 	fecha_insert DATETIME
);


DROP TRIGGER IF EXISTS insert_before_equipos;
DELIMITER //
CREATE TRIGGER insert_before_equipos BEFORE INSERT ON equipos FOR EACH ROW
BEGIN
    -- variable
    DECLARE fecha_insert DATETIME;
    SET fecha_insert = NOW();
    
    INSERT INTO smarthyou_online.stage_insertion_equipos
    VALUES
    (NULL, NEW.marca, NEW.descripcion, NEW.color, NEW.ram, NEW.mp, NEW.pulgadas, NEW.gama, NEW.importe_sin_iva, fecha_insert);
    
END //

DELIMITER ;


INSERT INTO equipos (marca, descripcion, color, ram, mp, pulgadas, gama, importe_sin_iva)
VALUES ('samsung', 'galaxy A14 4G', 'verde', '512GB', '20mp', 8.40, 'premium plata', 704999.00);


SELECT count(id_equipo)
FROM smarthyou_online.equipos;
 
 SELECT *
FROM smarthyou_online.stage_insertion_equipos; 


-- 2)

DROP TABLE IF EXISTS smarthyou_online.stage_update_equipos ;
CREATE TABLE smarthyou_online.stage_update_equipos (
	old_id_equipo INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	old_marca VARCHAR(100)
,	old_descripcion	text
,	old_color VARCHAR(50)
,	old_ram VARCHAR(30)
,	old_mp VARCHAR(100)
,	old_pulgadas DECIMAL(4,2)
,	old_gama VARCHAR(50)
,	old_importe_sin_iva DECIMAL(10,2)
,	new_marca VARCHAR(100)
,	new_descripcion	text
,	new_color VARCHAR(50)
,	new_ram VARCHAR(30)
,	new_mp VARCHAR(100)
,	new_pulgadas DECIMAL(4,2)
,	new_gama VARCHAR(50)
,	new_importe_sin_iva DECIMAL(10,2)
, 	fecha_update DATETIME
,	usuario_update VARCHAR (50)
);



DELIMITER //
CREATE TRIGGER update_equipo_AU AFTER UPDATE ON equipos FOR EACH ROW
BEGIN
    -- variable
    DECLARE fecha_update DATETIME;
    SET fecha_update = NOW();
    
    INSERT INTO smarthyou_online.stage_update_equipos
    VALUES
    (NULL, OLD.marca, OLD.descripcion, OLD.color, OLD.ram, OLD.mp, OLD.pulgadas, OLD.gama, OLD.importe_sin_iva,
			NEW.marca, NEW.descripcion, NEW.color, NEW.ram, NEW.mp, NEW.pulgadas, NEW.gama, NEW.importe_sin_iva, fecha_update, user() );
    
END //
DELIMITER ;
	
UPDATE equipos
SET importe_sin_iva = 701999.00
WHERE id_equipo = 999;


 SELECT *
FROM smarthyou_online.stage_update_equipos; 

 SHOW TRIGGERS
FROM smarthyou_online;