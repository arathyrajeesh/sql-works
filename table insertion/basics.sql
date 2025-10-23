create database department;
use department;

# A. TABLE CREATION & INSERTION
CREATE TABLE Departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    dept_id INT,
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Departments (dept_id, dept_name) VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');
INSERT INTO Employees (emp_id, emp_name, salary, dept_id, join_date) VALUES
(101, 'Alice', 75000, 2, '2022-04-10'),
(102, 'Bob', 60000, 1, '2019-12-20'),
(103, 'Charlie', 82000, 3, '2021-06-15'),
(104, 'David', 55000, 2, '2020-08-05'),
(105, 'Eva', 90000, 3, '2023-02-25');

#B. SELECT & WHERE Clause
select emp_name, salary from Employees;
select emp_name from Employees where salary > 60000;
select emp_name from Employees where join_date > '2021-01-01';
select emp_name from Employees where dept_id = 2;
select emp_name from Employees WHERE emp_name LIKE 'A%';

#C. UPDATE & DELETE
UPDATE Employees e JOIN Departments d ON e.dept_id = d.dept_id SET e.salary = e.salary * 1.10 
WHERE d.dept_name = 'HR';

UPDATE Employees SET dept_id = 3 WHERE emp_name = 'Bob';
delete from Employees where join_date < '2020-01-01';
delete from Employees where emp_id = 104;
update Employees set salary = salary + 50000 where dept_id = 2;

#D. AGGREGATE FUNCTIONS
SELECT SUM(salary) FROM Employees;
SELECT dept_id, AVG(salary) AS average_salary FROM Employees GROUP BY dept_id;
SELECT MAX(salary) FROM Employees;
SELECT MIN(salary) FROM Employees WHERE dept_id = 2;
SELECT dept_id, COUNT(emp_id) FROM Employees GROUP BY dept_id;

#E. JOIN Queries
SELECT E.emp_name, D.dept_name FROM Employees E JOIN Departments D ON E.dept_id = D.dept_id;
SELECT D.dept_name, E.emp_name FROM Departments D LEFT JOIN Employees E ON D.dept_id = E.dept_id;
SELECT E.emp_name, D.dept_name FROM Departments D RIGHT JOIN Employees E ON D.dept_id = E.dept_id;

SELECT E.emp_name, D.dept_name FROM Employees E
LEFT JOIN Departments D ON E.dept_id = D.dept_id
UNION
SELECT E.emp_name, D.dept_name FROM Employees E
RIGHT JOIN Departments D ON E.dept_id = D.dept_id;

SELECT D.dept_name FROM Departments D
LEFT JOIN Employees E ON D.dept_id = E.dept_id WHERE E.emp_id IS NULL;

select * from Departments;
select * from Employees;

#Subqueries

SELECT * FROM Employees e WHERE salary > (SELECT AVG(salary) FROM Employees);


SELECT emp_name,salary FROM Employees
WHERE emp_id IN (SELECT emp_id FROM Employees
                        GROUP BY emp_id
                        HAVING max(salary));


SELECT emp_id,emp_name,salary,dept_id FROM Employees
WHERE
    dept_id IN ( SELECT dept_id FROM Departments WHERE dept_name IN ('IT', 'HR'));
    
SELECT emp_name FROM Employees
WHERE dept_id IN ( SELECT dept_id FROM Departments WHERE dept_name = 'Finance');

SELECT D1.dept_name
FROM Departments AS D1
WHERE 60000 < ( SELECT MAX(E1.salary)FROM Employees AS E1
WHERE E1.dept_id = D1.dept_id);