DROP DATABASE IF EXISTS homework;

CREATE DATABASE IF NOT EXISTS homework;

USE homework;

-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными 

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE NOT NULL,
	product_id INT,
    count INT NOT NULL
);

INSERT INTO sales(sale_date, product_id, count)
VALUES
	(DATE '2023-04-01', 1, 65),
	(DATE '2023-04-02', 2, 100),
	(DATE '2023-04-03', 35, 294),
	(DATE '2023-04-04', 768, 144),
	(DATE '2023-04-04', 145, 51),
	(DATE '2023-04-05', 11, 525);

/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300. 
*/

SELECT 
	id,
    CASE
		WHEN count < 100 THEN "Маленький"
        WHEN count BETWEEN 100 AND 300 THEN "Средний"
        ELSE "Большой"
    END AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	courier_id INT,
    amount FLOAT DEFAULT 0.0,
	status VARCHAR(20)
);

INSERT INTO orders (courier_id, amount, status)
VALUES
(7, 15.00, "OPEN"),
(9, 25.50, "OPEN"),
(15, 100.70, "CLOSED"),
(26, 22.18, "OPEN"),
(1, 9.50, "CANCELLED");

-- Покажите “полный” статус заказа, используя оператор CASE
SELECT
	id,
    courier_id,
    status,
	CASE
		WHEN status = "OPEN" THEN "Заказ открыт"
        WHEN status = "CLOSED" THEN "Заказ исполнен"
        WHEN status = "CANCELLED" THEN "Заказ отменён"
        ELSE ""
    END AS full_status
FROM orders;

-- 4. Чем NULL отличается от 0?
select 'NULL в СУБД — специальное значение (псевдозначение), которое может быть записано в поле таблицы базы данных (БД). NULL соответствует понятию «пустое поле», то есть «поле, не содержащее никакого значения». Введено для того, чтобы различать в полях БД пустые (визуально не отображаемые) значения (например, строку нулевой длины) и отсутствующие значения (когда в поле не записано вообще никакого значения, даже пустого).' as result
UNION 
select 'https://ru.wikipedia.org/wiki/NULL_(SQL)'