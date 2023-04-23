DROP DATABASE IF EXISTS homework;

CREATE DATABASE IF NOT EXISTS homework;

USE homework;

-- Создайте таблицу.
create table staff
(
    id INT auto_increment primary key,
    firstname varchar(15) NOT NULL,
    lastname varchar(15) NOT NULL,
    post varchar(15),
    seniority INT,
    salary INT,
    age TINYINT
);

INSERT INTO staff 
    (firstname, lastname, post, seniority, salary, age)
VALUES
    ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
    ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49)
;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT * FROM staff 
ORDER BY salary DESC;

SELECT * FROM staff 
ORDER BY salary;

--2. Выведите 5 максимальных заработных плат (saraly) 
SELECT salary  
FROM staff 
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst) 
SELECT post, SUM(salary) AS "Sum of salary"
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно. 
SELECT COUNT(*)  AS "Count of staff"
FROM staff 
WHERE post = 'Рабочий' && age between 24 and 49;

-- 5.Найдите количество специальностей
SELECT  COUNT(distinct post) AS "Count unique of post"
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age)
FROM staff 
GROUP BY post
HAVING AVG(age) < 30;