-- ROLES --

USE information_schema;
-- USE MYSQL;


-- Crear roles
CREATE ROLE ciberseguridad;
CREATE ROLE marketing;
CREATE ROLE cobranzas;
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


-- USER--

CREATE USER 'nicolas.cage'@'%' IDENTIFIED BY '1234' 
COMMENT 'area:marketing';
GRANT marketing TO 'nicolas.cage'@'%';

CREATE USER 'leonardo.dicaprio'@'%' IDENTIFIED BY '1234'
COMMENT 'area:marketing';
GRANT marketing TO 'leonardo.dicaprio'@'%';


CREATE USER 'scarlett.johansson'@'%' IDENTIFIED BY '1234'
COMMENT 'area:ciberseguridad';
GRANT ciberseguridad TO 'scarlett.johansson'@'%';

CREATE USER 'brad.pitt'@'%' IDENTIFIED BY '1234'
COMMENT 'area:ciberseguridad';
GRANT ciberseguridad TO 'brad.pitt'@'%';


CREATE USER 'angelina.jolie'@'%' IDENTIFIED BY '1234'
COMMENT 'area:cobranzas';
GRANT cobranzas TO 'angelina.jolie'@'%';

CREATE USER 'jennifer.aniston'@'%' IDENTIFIED BY '1234'
COMMENT 'area:cobranzas';
GRANT cobranzas TO 'jennifer.aniston'@'%';


CREATE USER 'lionel.meesi'@'%' IDENTIFIED BY '1234'
COMMENT 'area:delivery';
GRANT delivery TO 'lionel.meesi'@'%';

CREATE USER 'roman.riquelme'@'%' IDENTIFIED BY '1234'
COMMENT 'area:delivery';
GRANT delivery TO 'roman.riquelme'@'%';


-- cambio--

-- Revocar permisos de Angelina Jolie y eliminar su usuario//ANGELINA RENUNCIO
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'angelina.jolie'@'%';
DROP USER 'angelina.jolie'@'%';

-- Cambiar el rol de Leonardo DiCaprio a delivery y actualizar sus permisos//CAMBIO DE AREA
REVOKE marketing FROM 'leonardo.dicaprio'@'%';
GRANT delivery TO 'leonardo.dicaprio'@'%';

-- cambiar contraseña de 'brad.pitt'@'%' //

ALTER USER 'brad.pitt'@'%' IDENTIFIED BY '2234'
FAILED_LOGIN_ATTEMPTS 2
PASSWORD_LOCK_TIME 1;


-- ver permisos por usuario 
-- USE MYSQL;
-- SHOW GRANTS FOR 'jennifer.aniston'@'%';