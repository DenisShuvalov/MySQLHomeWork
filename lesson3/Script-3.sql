USE VK;


-- ������
SELECT * FROM cities LIMIT 10;

-- ��������� ������� ���� �� ������
UPDATE cities ct 
	SET ct.country_id = (
						SELECT cn.id
							FROM countries cn 
								ORDER BY RAND () LIMIT 1 
						);

					
-- ����������
SELECT * FROM communities order by created_at  desc LIMIT 10;

-- �������� ���������� � ��������� ����� ������ ��������

UPDATE communities c 
			SET c.name  = CONCAT
					(
					LEFT (UPPER (c.name),1),
						SUBSTR (c.name , 2) 
						);
					
					
-- ���������� � ������������ ��					
SELECT * FROM communities_users LIMIT 10;					

-- ������ OK
SELECT * FROM countries  LIMIT 10;

-- ���������
SELECT * FROM friendship f WHERE user_id  = friend_id;

-- ���������� ID ������������ != ID �����

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
				
			
			