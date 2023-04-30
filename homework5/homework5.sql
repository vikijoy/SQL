-- 1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет. 
CREATE VIEW homework5
as
select firstname, lastname, hometown, gender
  from users u
  join profiles p on p.user_id = u.id
 where birthday > DATE_ADD(CURDATE(), INTERVAL -20 YEAR);

-- 2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK) 
select firstname, lastname, count(p.From_user_id) as count_message, DENSE_RANK() OVER (ORDER BY count(p.From_user_id) desc) AS Rang
  from users u
  left join messages p on p.From_user_id = u.id
 group by firstname, lastname;

-- 3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
select p.*, CASE WHEN ROW_NUMBER() OVER (order by created_at)= 1 then LEAD(created_at, 1) OVER (ORDER BY created_at) - created_at else created_at - LAG(created_at, 1) OVER (ORDER BY created_at) end as delta
  from messages p
 order by created_at;