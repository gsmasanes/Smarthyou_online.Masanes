
/* Triggers  */

USE smarthyou_online;
-- 1)
DROP TABLE IF EXISTS smarthyou_online.stage_insertion_equipos ;
CREATE TABLE smarthyou_online.stage_insertion_equipos (
	id_equipo        INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	marca            VARCHAR(100)
,	descripcion	     TEXT
,	color            VARCHAR(50)
,	ram              VARCHAR(30)
,	mp               VARCHAR(100)
,	pulgadas         DECIMAL(4,2)
,	gama             VARCHAR(50)
,	importe_sin_iva  DECIMAL(10,2)
, 	fecha_insert     DATETIME
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
	old_id_equipo         INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	old_marca             VARCHAR(100)
,	old_descripcion	      TEXT
,	old_color             VARCHAR(50)
,	old_ram               VARCHAR(30)
,	old_mp                VARCHAR(100)
,	old_pulgadas          DECIMAL(4,2)
,	old_gama              VARCHAR(50)
,	old_importe_sin_iva   DECIMAL(10,2)
,	new_marca             VARCHAR(100)
,	new_descripcion	      TEXT
,	new_color             VARCHAR(50)
,	new_ram               VARCHAR(30)
,	new_mp                VARCHAR(100)
,	new_pulgadas          DECIMAL(4,2)
,	new_gama              VARCHAR(50)
,	new_importe_sin_iva   DECIMAL(10,2)
, 	fecha_update          DATETIME
,	usuario_update        VARCHAR (50)
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