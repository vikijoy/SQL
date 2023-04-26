-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 13 лет. 
SELECT COUNT(likes.id) AS likes_to_youngs
  FROM likes
  JOIN media ON likes.media_id = media.id
  JOIN profiles ON media.user_id = profiles.user_id
 WHERE profiles.birthday > DATE_ADD(CURDATE(), INTERVAL -13 YEAR);

-- 2. 
  SELECT profiles.gender AS most_likes_given_by_gender, COUNT(likes.id)
    FROM likes 
    JOIN profiles ON likes.user_id = profiles.user_id
GROUP BY profiles.gender
ORDER BY COUNT(likes.id) DESC;

-- 3. Вывести всех пользователей, которые не отправляли сообщения.
SELECT u.id, u.firstname, u.lastname
FROM users u
LEFT JOIN messages f ON u.id = f.from_user_id
WHERE f.from_user_id is null;

-- 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
select User, Freind, ccn as max_count_mess from (
select *, 
      ROW_NUMBER() OVER (PARTITION BY User ORDER BY ccn DESC) row_num
      from (
SELECT u.id as 'User', 
      CASE WHEN u.id = f.initiator_user_id then target_user_id else initiator_user_id end as 'Freind',
      count(m.from_user_id) as ccn
  FROM users u
  JOIN friend_requests f ON (u.id = f.initiator_user_id or u.id = f.target_user_id) AND f.status = 'approved'
  JOIN messages m ON m.from_user_id = CASE WHEN u.id = f.initiator_user_id then target_user_id else initiator_user_id end AND m.to_user_id = u.id
GROUP BY 1,2
) as d) as s
where row_num = 1
;