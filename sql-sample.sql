CREATE DATABASE myapp;
USE myapp;

CREATE TABLE customer (id INT PRIMARY KEY,first_name VARCHAR(50) NOT NULL,last_name VARCHAR(50) NOT NULL);
ALTER TABLE customer ADD phone_number VARCHAR(15);
INSERT INTO customer (id, first_name, last_name, phone_number)VALUES (1, 'John', 'Doe', '12345678900');
INSERT INTO customer (id, first_name, last_name, phone_number)VALUES (2, 'arathy', 'tp', '123456543');
INSERT INTO customer (id, first_name, last_name, phone_number)VALUES (3, 'adithya', 'tp', '12345654344');
INSERT INTO customer (id, first_name, last_name, phone_number)VALUES (4, 'aswathy', 'tp', '1023456543');
UPDATE customer SET first_name = 'Rajeesh', last_name = 'tp' WHERE id= 1 ;
UPDATE customer SET last_name = 'aneesh' WHERE id= 3 ;
DELETE FROM customer WHERE id = 3;
SELECT COUNT(*) FROM customer;
SELECT * FROM customer;
