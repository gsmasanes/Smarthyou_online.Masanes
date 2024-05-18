SHOW VARIABLES LIKE 'AUTOCOMMIT';

SET autocommit=0;
USE smarthyou_online;
START TRANSACTION;


INSERT INTO equipos (marca, descripcion, color, ram, mp, pulgadas, gama, importe_sin_iva)
VALUES
    ('samsung', 'Galaxy S24 ultra', 'violeta', '256GB', '200mp', 8.5, 'Premium oro', 2629999),
    ('samsung', 'Galaxy S25', 'violeta', '256GB', '200mp', 8.5, 'Premium oro', 2999999),
    ('samsung', 'Galaxy S26', 'violeta', '256GB', '200mp', 8.5, 'Premium oro', 3629999),
    ('samsung', 'Galaxy S27', 'violeta', '256GB', '200mp', 8.5, 'Premium oro', 2999999);

SAVEPOINT s1;

INSERT INTO equipos (marca, descripcion, color, ram, mp, pulgadas, gama, importe_sin_iva)
VALUES
    ('enova', 'N50', 'negro', '256GB', '100mp', 8.5, 'Premium oro', 2629999),
    ('enova', 'N50 plus', 'negro', '256GB', '1500mp', 8.5, 'Premium oro', 2999999),
    ('enova', 'N51', 'negro', '256GB', '150mp', 8.5, 'Premium oro', 3629999),
    ('enova', 'N51 PLUS', 'negro', '256GB', '200mp', 8.5, 'Premium oro', 2999999);
    
SAVEPOINT s2;

ROLLBACK TO SAVEPOINT s1;
COMMIT;

-- validamos:
-- SELECT * FROM equipos;