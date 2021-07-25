USE VK;


-- Города
SELECT * FROM cities LIMIT 10;

-- рандомный внешний ключ на страны
UPDATE cities ct 
	SET ct.country_id = (
						SELECT cn.id
							FROM countries cn 
								ORDER BY RAND () LIMIT 1 
						);

					
-- Сообщества
SELECT * FROM communities order by created_at  desc LIMIT 10;

-- Название сообщества с заглавной буквы вместо строчной

UPDATE communities c 
			SET c.name  = CONCAT
					(
					LEFT (UPPER (c.name),1),
						SUBSTR (c.name , 2) 
						);
					
					
-- Сообщества и пользователи ОК					
SELECT * FROM communities_users LIMIT 10;					

-- Страны OK
SELECT * FROM countries  LIMIT 10;

-- Отношения
SELECT * FROM friendship f WHERE user_id  = friend_id;

-- Исправляем ID пользователя != ID друга

UPDATE friendship f
	SET f.friend_id = (
						SELECT u.id
							FROM users u
							WHERE 
							u.id <> f.user_id 
							
								ORDER BY RAND () LIMIT 1 
								
						)
				WHERE
				f.user_id = f.friend_id;
				
			
			