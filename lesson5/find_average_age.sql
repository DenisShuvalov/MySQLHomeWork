--средний возраст
use vk;

SELECT
AVG (TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_DATE())),
AVG (FLOOR (TIMESTAMPDIFF(DAY, p.birthday, CURRENT_DATE())/ 365.25))
FROM
	profiles p 
;