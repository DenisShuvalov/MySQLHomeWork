-- ������� ���������� �����, � ������� ���������

SELECT
	CONCAT (
			gender_name, 's gived more likes')
			
		FROM
		(
SELECT 
	g.name as 'gender_name'
	,COUNT(1) as 'like_count'

FROM profiles p

INNER JOIN genders g ON	g.id = p.gender_id 
INNER JOIN likes l ON l.user_id = p.user_id

GROUP BY g.name
		) a
ORDER BY like_count DESC
LIMIT 1
;






