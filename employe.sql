create database example;
use example;

CREATE TABLE employee (id INT 
PRIMARY KEY auto_increment,name 
VARCHAR(50) NOT NULL,position VARCHAR(50) NOT NULL,salary int);

ALTER TABLE employee ADD email varchar(50);
ALTER TABLE employee MODIFY COLUMN salary DECIMAL(10,2);
ALTER TABLE employee add column posi varchar(50);
INSERT INTO employee (name,position,salary)VALUES ('John Doe', 'Manager', 60000);
INSERT INTO employee (name,position,salary,posi)VALUES ('John Doe', 'staff', 65000,'manager');
UPDATE employee SET Salary = 70000 WHERE id = 1;
UPDATE employee SET posi = 'Senior Staff' WHERE salary > 50000;

select * from employee;
