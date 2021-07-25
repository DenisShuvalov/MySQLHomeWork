-- кол-во постов , сообщений, лайков по пользователю

USE VK;

SELECT DISTINCT
	u.first_name
	,u.last_name
	,IFNULL (msg_count, 0) 'Сообщения'
	,IFNULL (post_count, 0) 'Посты'
	,IFNULL (media_count, 0) 'Медиа-файлы'
	,IFNULL (like_count, 0) 'Лайки'

FROM users u 

LEFT OUTER JOIN
	(
		SELECT m.from_user_id, COUNT(1) msg_count FROM messages m GROUP BY from_user_id
		) msg
			ON msg.from_user_id = u.id
		
LEFT OUTER JOIN
	(
		SELECT p.user_id , COUNT(1) post_count FROM posts p GROUP BY user_id 
		) pst
			ON pst.user_id = u.id
	
LEFT OUTER JOIN
	(
		SELECT  m.user_id , COUNT(1) media_count FROM media m GROUP BY user_id 
		) med
			ON med.user_id = u.id
		
LEFT OUTER JOIN
	(
		SELECT l.user_id, COUNT(1) like_count FROM likes l GROUP BY user_id 
		)lik
			ON lik.user_id = u.id

ORDER BY msg_count + post_count + media_count + like_count DESC
;