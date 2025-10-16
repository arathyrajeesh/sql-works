create database emp;
use emp;

CREATE TABLE employ(id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL,
position VARCHAR(50) NOT NULL,
salary INT);

CREATE TABLE products(product_id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL,
price VARCHAR(50) NOT NULL,
stock_quantity INT);

ALTER TABLE employ ADD email VARCHAR(15);
ALTER TABLE employ MODIFY salary DECIMAL(10,2);

INSERT INTO employ (name, position, salary)VALUES ('John Doe', 'Manager', 60000);
INSERT INTO products (name, price,stock_quantity)VALUES('Laptop', 75000.00,3),('Smartphone', 25000.00,5),
('Headphones', 1500.00,8);

UPDATE employ SET salary = 70000 WHERE id = 1;
UPDATE employ SET position = 'MD' WHERE salary >= 50000;

DELETE FROM employ WHERE name='John Doe';
delete from products where stock_quantity = 0;

select * from employ;
drop table employe;