create database example;
use example;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);
INSERT INTO products (name, price, stock_quantity)
VALUES 
('Laptop', 75000.00, 10),
('Mouse', 500.00, 50),
('Keyboard', 1200.00, 30);
INSERT INTO products (name, price, stock_quantity)
VALUES 
('tv', 75000.00, 10);
DELETE FROM products WHERE stock_quantity = 0;

SELECT COUNT(*)  FROM products WHERE price = 75000;

select * from products