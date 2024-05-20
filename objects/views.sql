
-- VIEWS --

USE smarthyou_online;
-- 1)_Compras por genero

CREATE OR REPLACE VIEW vw_compras_por_genero AS
SELECT cl.genero, 
       COUNT(*) AS total_compras,
       CONCAT(FORMAT((COUNT(*) / (SELECT COUNT(*) FROM compras)) * 100, 0), '%') AS porcentaje_compras
FROM compras c
JOIN clientes cl 
	ON c.id_cliente = cl.id_cliente
GROUP BY cl.genero;

-- SELECT * 
-- FROM smarthyou_online.vw_compras_por_genero;

-- 2)_Edad de mis clientes

CREATE OR REPLACE VIEW vw_edades_clientes AS
    SELECT cl.edad,
           COUNT(*) AS total_compras
    FROM compras c
    JOIN clientes cl ON c.id_cliente = cl.id_cliente
    GROUP BY cl.edad;

-- SELECT *
-- FROM vw_edades_clientes
-- ORDER BY total_compras DESC
-- LIMIT 5;


-- 3)_Equipos mas vendidos

CREATE OR REPLACE VIEW vw_equipos_mas_vendidos AS
SELECT e.marca, e.descripcion AS descripcion_equipo, COUNT(*) AS cant_vendida
FROM compras c
JOIN equipos e ON c.id_equipo = e.id_equipo
GROUP BY e.marca, e.descripcion
ORDER BY cant_vendida DESC
LIMIT 5;

-- SELECT * 
-- FROM smarthyou_online.vw_equipos_mas_vendidos;


-- 4)_Monto promedio que gastan los clientes para comprar un celular en la tienda Smartyou

CREATE OR REPLACE VIEW vw_promedio_gasto_clientes AS
SELECT CONCAT('$', FORMAT(AVG(monto), 2)) AS gasto_promedio
FROM pagos;


-- SELECT * 
-- FROM smarthyou_online.vw_promedio_gasto_clientes;

-- 5)_ Agrupar calificaciones de los clientes

CREATE OR REPLACE VIEW vw_calificaciones_clientes AS
SELECT 
    calificacion,
    COUNT(*) AS cantidad
FROM comentarios
GROUP BY calificacion
ORDER BY calificacion DESC;

-- SELECT * 
-- FROM smarthyou_online.vw_calificaciones_clientes;