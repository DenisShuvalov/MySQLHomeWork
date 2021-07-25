-- Заполняем created_at updated_at текущими датой и временем.

CREATE TABLE users1 
(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
birthday_at DATE,
created_at DATETIME,
updated_at DATETIME
)
;

INSERT INTO users1 (name, birthday_at, created_at, updated_at) VALUES
('Ivanov Ivan Ivanovich', '1945-11-25', NULL, NULL),
('Semenova Elena Petrovna', '1999-09-01', NULL, NULL),
('Fedorov Fedor Ivanovich', '1999-09-02', NULL, NULL)
;

UPDATE users1 SET created_at = CURRENT_DATE() , updated_at = CURRENT_DATE();


SELECT  * FROM users1;

-- DROP TABLE users1;

