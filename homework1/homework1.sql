-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 
CREATE DATABASE IF NOT EXISTS homework;

USE homework;

CREATE TABLE IF NOT EXISTS telephon (
  Id INT NOT NULL AUTO_INCREMENT,
  ProductName VARCHAR(45) NOT NULL,
  Manufacturer VARCHAR(45) NULL,
  ProductCount DOUBLE NULL,
  Price DOUBLE NULL,
  PRIMARY KEY (Id));
  
INSERT telephon(ProductName, Manufacturer, ProductCount, Price) 
VALUES 
('iPhone 14 Pro', 'Apple', 4, 150000),
('iPhone SE', 'Apple', 2, 51000),
('Galaxy S23 ULTRA', 'Samsung', 2, 100000),
('Galaxy S22+', 'Samsung', 1, 65000),
('P50 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2; 

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';