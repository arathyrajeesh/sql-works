create database employee;
use employee;

CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INTEGER  
);
INSERT INTO Employees (emp_id, name, dept_id) VALUES(1, 'Alice', 101),(2, 'Bob', 102),(3, 'Charlie', 103),(4, 'David', NULL),(5, 'Eva', 101);

CREATE TABLE Departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
INSERT INTO Departments (dept_id, dept_name) VALUES (101, 'HR'), (102, 'IT'), (103, 'Marketing'), (104, 'Finance');

#innerjoin

SELECT E.name AS EmployeeName, D.dept_name AS DepartmentName
FROM Employees E INNER JOIN Departments D ON E.dept_id = D.dept_id;

#LEFT JOIN
SELECT E.name AS EmployeeName, D.dept_name AS DepartmentName
FROM Employees E LEFT JOIN Departments D ON E.dept_id = D.dept_id;

#RIGHT JOIN
SELECT D.dept_name AS DepartmentName, E.name AS EmployeeName
FROM Employees E RIGHT JOIN Departments D ON E.dept_id = D.dept_id;

#CROSS JOIN
SELECT E.name AS EmployeeName, D.dept_name AS DepartmentName
FROM Employees E CROSS JOIN Departments D;


SELECT A.name AS Employee1, B.name AS Employee2,D.dept_name AS Department
FROM Employees A INNER JOIN Employees B ON A.dept_id = B.dept_id AND A.emp_id < B.emp_id 
INNER JOIN Departments D ON A.dept_id = D.dept_id;

#JOIN with WHERE clause
SELECT E.name AS EmployeeName,D.dept_name AS DepartmentName
FROM Employees E INNER JOIN Departments D ON E.dept_id = D.dept_id
WHERE D.dept_name = 'HR';

#JOIN and ORDER BY
SELECT E.name AS EmployeeName, D.dept_name AS DepartmentName
FROM Employees E INNER JOIN Departments D ON E.dept_id = D.dept_id ORDER BY D.dept_name ASC;


select * from Employees;
select * from Departments;