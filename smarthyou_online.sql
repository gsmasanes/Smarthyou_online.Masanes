DROP DATABASE IF EXISTS smarthyou_online ;
CREATE DATABASE smarthyou_online ;
USE smarthyou_online ;

-- Tabla para almacenar la información de los transportista--
-- DROP TABLE IF EXISTS transportista;
CREATE TABLE IF NOT EXISTS transportista(
    id_transportista      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion           TEXT,
    razon_social          VARCHAR(255)
);

-- Tabla para almacenar la información de los equipos disponibles--

-- DROP TABLE IF EXISTS equipos;
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
-- DROP TABLE IF EXISTS clientes;
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
    genero 			SET('femenino', 'masculino', 'x')
);

-- Tabla para almacenar la información de las compras realizadas por los clientes
-- DROP TABLE IF EXISTS compras;
CREATE TABLE IF NOT EXISTS compras (
    id_order       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_compra   DATE,
    id_cliente     INT,
    id_equipo      INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);


-- Tabla para almacenar la información de los comentarios de los clientes
-- DROP TABLE IF EXISTS comentarios;
CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha           DATE,
    calificacion    TINYINT UNSIGNED,
    comentario      TEXT,
    CHECK (calificacion >= 0 AND calificacion <= 10)
);

-- Tabla para almacenar la información de los envíos
-- DROP TABLE IF EXISTS envios;
CREATE TABLE IF NOT EXISTS envios (
    id_remito         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order          INT,
    id_transportista  INT,
    fecha_inicio      DATE,
    estado            VARCHAR(100),
    motivo            TEXT,
    fecha_fin         DATE,
    FOREIGN KEY (id_order) REFERENCES compras(id_order),
    FOREIGN KEY (id_transportista) REFERENCES transportista(id_transportista)
);


-- Tabla para almacenar la información de los pagos realizados
-- DROP TABLE IF EXISTS pagos;
CREATE TABLE IF NOT EXISTS pagos (
    id_pago          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha            DATE,
    operacion_tipo   VARCHAR(50),
    monto            DECIMAL(10, 2),
    id_compra        INT,
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

-- FINALIZADO

