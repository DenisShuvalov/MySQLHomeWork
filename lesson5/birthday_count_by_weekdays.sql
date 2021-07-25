--кол-во дней рожений по дням недели текущего года

USE vk;

SELECT
DATE_FORMAT(REPLACE(p.birthday,LEFT(CAST(p.birthday as CHAR(4)),4),YEAR(CURRENT_DATE())),'%W') AS 'WEEK_DAY',

COUNT(1) 'COUNT'

FROM profiles p

GROUP BY WEEK_DAY 
;