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
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2; 

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';