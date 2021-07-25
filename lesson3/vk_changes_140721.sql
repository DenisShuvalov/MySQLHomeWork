USE vk;

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
				
-- friendship_statuses OK	
SELECT * FROM friendship_statuses fs  LIMIT 10;		

-- ���� �����-������ OK
SELECT * FROM media_types mt LIMIT 10;	


-- �����
SELECT m.*,
	   mt.id,
	   mt.name
		FROM media m
INNER JOIN media_types mt on mt.id = m.media_type_id
 LIMIT 10;	

-- ������������ �������� ������

UPDATE media m SET filename = CONCAT
								(
  'http://dropbox.net/vk/',
  filename,
  '.',
  				(
  				SELECT DISTINCT mt.name 
  			FROM
  				media_types mt WHERE 
  						m.media_type_id = mt.id
  					)
								);

DESC media;

-- ���������� ���� metadata ��� JSON

ALTER TABLE media MODIFY COLUMN metadata JSON;

-- ��������� ����������
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}'); 

 -- ���������
 
 SELECT * FROM messages m  /*where m.from_user_id = m.to_user_id*/ LIMIT 10;	

-- ���������� ��������� from_user_id != to_user_id

UPDATE messages m
	SET from_user_id = (
						SELECT u.id
							FROM users u
							WHERE 
							u.id <> m.to_user_id 
							
								ORDER BY RAND () LIMIT 1 
								
						)
				WHERE
				m.from_user_id = m.to_user_id;
			
			
-- ������� �����
CREATE TABLE genders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL
);

INSERT INTO genders (id, name)
VALUES
(1, 'Female'),
(2, 'Male');
			

-- �������
			
SELECT * FROM profiles p LIMIT 10;


-- ������ ��� ���� gender �� Integer ��� ������� ���� genders
-- ������ �������� ���� profiles.gender �� gender_id 

ALTER TABLE profiles CHANGE gender gender_id INTEGER NOT NULL;

-- ��������� gender_id

UPDATE profiles p
	SET p.gender_id = (
						SELECT g.id
							FROM genders g
							ORDER BY RAND () LIMIT 1 
					);



-- ������������

SELECT * FROM users LIMIT 10;

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;   
			