-- FUNCIONES--

USE smarthyou_online;
-- 1)
DROP FUNCTION IF EXISTS fn_monto_con_iva ;
DELIMITER //
CREATE FUNCTION fn_monto_con_iva(monto_base DECIMAL(12, 2)) 
    RETURNS VARCHAR(50)
    DETERMINISTIC
    COMMENT 'Esta función devuelve el monto con un IVA del 21% con el signo de pesos y dos decimales'
BEGIN
    DECLARE monto_con_iva DECIMAL(12, 2);
    DECLARE monto_con_iva_formato VARCHAR(50);

    SET monto_con_iva = monto_base * 1.21;
    SET monto_con_iva_formato = CONCAT('$', FORMAT(monto_con_iva, 2));

    RETURN monto_con_iva_formato;
END //
DELIMITER ;


SELECT 
    DISTINCT monto AS monto_sin_iva,
    fn_monto_con_iva(monto) AS monto_total_con_iva
FROM pagos
ORDER BY monto_total_con_iva DESC;


-- 2)
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

-- finalizado