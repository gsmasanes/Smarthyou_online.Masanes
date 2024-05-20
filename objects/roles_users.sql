-- ROLES --

USE information_schema;
-- USE MYSQL;


-- Crear roles
DROP ROLE IF EXISTS ciberseguridad;
CREATE ROLE ciberseguridad;

DROP ROLE IF EXISTS marketing;
CREATE ROLE marketing;

DROP ROLE IF EXISTS cobranzas;
CREATE ROLE cobranzas;

DROP ROLE IF EXISTS delivery;
CREATE ROLE delivery;

-- Asignar permisos a los roles
GRANT ALL PRIVILEGES ON smarthyou_online.* TO ciberseguridad WITH GRANT OPTION;

GRANT SELECT ON smarthyou_online.clientes TO marketing;
GRANT INSERT, UPDATE, DELETE ON smarthyou_online.equipos TO marketing;

GRANT ALL PRIVILEGES ON smarthyou_online.pagos TO cobranzas WITH GRANT OPTION;
GRANT SELECT ON smarthyou_online.compras TO cobranzas;
GRANT SELECT ON smarthyou_online.envios TO cobranzas;
GRANT SELECT ON smarthyou_online.equipos TO cobranzas;

GRANT ALL PRIVILEGES ON smarthyou_online.* TO delivery WITH GRANT OPTION;


-- CREACION DE USER Y ASIGNACIÓN DE ROL--
DROP USER IF EXISTS 'nicolas.cage'@'%';
CREATE USER 'nicolas.cage'@'%' IDENTIFIED BY '1234'
COMMENT 'area:marketing';
GRANT marketing TO 'nicolas.cage'@'%';
SET DEFAULT ROLE ALL TO 'nicolas.cage'@'%';


DROP USER IF EXISTS 'leonardo.dicaprio'@'%';
CREATE USER 'leonardo.dicaprio'@'%' IDENTIFIED BY '1234'
COMMENT 'area:marketing';
GRANT marketing TO 'leonardo.dicaprio'@'%';
SET DEFAULT ROLE ALL TO 'leonardo.dicaprio'@'%';


DROP USER IF EXISTS 'scarlett.johansson'@'%';
CREATE USER 'scarlett.johansson'@'%' IDENTIFIED BY '1234'
COMMENT 'area:ciberseguridad';
GRANT ciberseguridad TO 'scarlett.johansson'@'%';
SET DEFAULT ROLE ALL TO 'scarlett.johansson'@'%';


DROP USER IF EXISTS 'brad.pitt'@'%';
CREATE USER 'brad.pitt'@'%' IDENTIFIED BY '1234'
COMMENT 'area:ciberseguridad';
GRANT ciberseguridad TO 'brad.pitt'@'%';
SET DEFAULT ROLE ALL TO 'brad.pitt'@'%';

DROP USER IF EXISTS 'angelina.jolie'@'%';
CREATE USER 'angelina.jolie'@'%' IDENTIFIED BY '1234'
COMMENT 'area:cobranzas';
GRANT cobranzas TO 'angelina.jolie'@'%';
SET DEFAULT ROLE ALL TO 'angelina.jolie'@'%';

DROP USER IF EXISTS 'jennifer.aniston'@'%';
CREATE USER 'jennifer.aniston'@'%' IDENTIFIED BY '1234'
COMMENT 'area:cobranzas';
GRANT cobranzas TO 'jennifer.aniston'@'%';
SET DEFAULT ROLE ALL TO 'jennifer.aniston'@'%';

DROP USER IF EXISTS 'lionel.meesi'@'%';
CREATE USER 'lionel.meesi'@'%' IDENTIFIED BY '1234'
COMMENT 'area:delivery';
GRANT delivery TO 'lionel.meesi'@'%';
SET DEFAULT ROLE ALL TO 'lionel.meesi'@'%';

DROP USER IF EXISTS 'roman.riquelme'@'%';
CREATE USER 'roman.riquelme'@'%' IDENTIFIED BY '1234'
COMMENT 'area:delivery';
GRANT delivery TO 'roman.riquelme'@'%';
SET DEFAULT ROLE ALL TO'roman.riquelme'@'%';


-- MODIFICACIONES EN LOS PERMISOS DE USUARIOS--

-- Revocar permisos de Angelina Jolie y eliminar su usuario//ANGELINA RENUNCIO
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'angelina.jolie'@'%';
DROP USER 'angelina.jolie'@'%';

-- Cambiar el rol de Leonardo DiCaprio a delivery y actualizar sus permisos//CAMBIO DE AREA
REVOKE marketing FROM 'leonardo.dicaprio'@'%';
GRANT delivery TO 'leonardo.dicaprio'@'%';

-- CAMBIO DE CONTRASEÑA 'brad.pitt'@'%' //

ALTER USER 'brad.pitt'@'%' IDENTIFIED BY '2234'
FAILED_LOGIN_ATTEMPTS 2
PASSWORD_LOCK_TIME 1;


-- FINALIZADO
