
-- STORE_PROCEDURE --
USE smarthyou_online;

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
           CONCAT('$', FORMAT(SUM(p.monto), 2)) AS monto_total_ventas
    FROM compras c
    JOIN equipos e ON c.id_equipo = e.id_equipo
    JOIN pagos p ON c.id_order = p.id_compra
    WHERE YEAR(c.Fecha_compra) = p_year
    GROUP BY e.gama;
END //
DELIMITER ;

CALL sp_monto_total_ventas_por_gama(2024);

-- Finalizado