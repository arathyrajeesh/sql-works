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


select * from Departments;
select * from Employees;