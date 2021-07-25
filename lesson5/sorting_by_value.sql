
-- Сортировка записей в порядке увеличения значения value. Значение 0 в самом конце

USE test;

CREATE TABLE storehouses_products
(
id SERIAL PRIMARY KEY,
storehouse_id INT UNSIGNED,
product_id INT UNSIGNED,
value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
;

INSERT INTO storehouses_products (storehouse_id, product_id, value)
VALUES
(1, 543, 0),
(1, 789, 2500),
(1, 3432, 0),
(1, 826, 30),
(1, 719, 500),
(1, 638, 1)
;

SELECT * FROM storehouses_products
ORDER BY (CASE WHEN value > 0 THEN 0 ELSE 1 END) ASC, value ASC
;