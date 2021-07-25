use test;

-- Меняем тип данных для created_at и updated_at с VARCHAR на DATETIME

CREATE TABLE users1 
(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
birthday_at DATE,
created_at VARCHAR (100),
updated_at VARCHAR (100)
)
;

INSERT INTO users1 (name, birthday_at, created_at, updated_at) VALUES
('Ivanov Ivan Ivanovich', '1945-11-25', '20.10.2017 8:10', '20.10.2017 8:10'),
('Semenova Elena Petrovna', '1999-09-01', '20.3.2017 12:10', '20.10.2017 12:10'),
('Fedorov Fedor Ivanovich', '1999-09-02', '20.5.2017 13:10', '20.10.2017 13:10')
;

-- SELECT * FROM users1 -- DROP TABLE users1 

UPDATE users1 set created_at = STR_TO_DATE(created_at,'%d.%m.%Y %k:%i'),
 updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %k:%i')
; 
  
ALTER TABLE users1 change created_at DATETIME;
ALTER TABLE users1 change updated_at DATETIME;