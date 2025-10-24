create database HospitalDB;
use HospitalDB;


CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT,
    gender VARCHAR(255),
    city VARCHAR(255)
    );
insert into Patient(first_name,last_name,age,gender,city)values('Aarav','Sharma',30,'Male','Delhi'),
('Diya','Singh', 25 ,'Female',' Mumbai'),
('Rahul', 'Verma', 40 ,'Male',' Chennai'),
('Sneha', 'Nair', 32 ,'Female', 'Kochi'),
('Mukesh', 'Gupta', 55 ,'Male', 'Kolkata');
select * from Patient;

CREATE TABLE Doctor (
    doctor_id int auto_increment primary key,
    name  varchar(250),
    specialization varchar(250),
    phone varchar(250)
    );
insert into Doctor(name,specialization,phone) values
('Dr. Anil Kumar' ,'Cardiologist ',9876543210),
('Dr. Priya Rao ' ,'Cardiologist ',9876543210),
('Dr. John Mathew ','Orthopedic' ,9876001234),
('Dr. Neha Sharma', 'Pediatrician',9123456780),
('Dr. Manoj Varma',' Surgeon', 9090909090);

select * from Doctor;

create table Department(
department_id int auto_increment primary key,
department_name varchar(250));
insert into Department (department_name) values('Cardiology'),('Neurology'),('Orthopedics'),('Pediatrician'),('General Surgery');
select * from Department;

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

INSERT INTO Appointment VALUES
(1, 1, 1, '2025-10-20', 'Completed'),
(2, 2, 2, '2025-10-21', 'Scheduled'),
(3, 3, 3, '2025-10-22', 'Completed'),
(4, 4, 4, '2025-10-25', 'Scheduled'),
(5, 5, 5, '2025-10-18', 'Cancelled');

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30),
    price_per_day INT
);

INSERT INTO Room VALUES
(1, 'General Ward', 1500),
(2, 'Private Room', 3000),
(3, 'ICU', 7500),
(4, 'General Ward', 1500),
(5, 'ICU', 7500);

#Basic SELECT Queries 
select * from Patient;
select name from Doctor;
select first_name from Patient where gender='Female';
select first_name from Patient where city='Delhi';
select patient_id, status from Appointment;
select name,phone from Doctor;
select * from Patient where age > 30;
select appointment_date from Appointment;
select distinct room_type from Room;
select department_name from Department;

#WHERE & Logical Operators
select * from Patient where gender = 'Male';
select * from Patient where age between 25 and 50;
select * from Doctor where specialization like '%Cardio%';
select * from Appointment where status = 'Scheduled';
select * from Patient where city <> 'Chennai';

#ORDER BY
select * from Patient order by first_name asc;
select * from Doctor order by specialization asc;
select * from Room order by  price_per_day desc;
select * from Appointment order by appointment_date asc;
select * from Patient order by age asc;

#Aggregate Functions
select COUNT(*) as total_patients from Patient;
select gender, COUNT(*) as total from Patient group by gender;
select MAX(price_per_day) as highest_price from Room;
select MIN(age) as youngest_age from Patient;
select avg(price_per_day) as average_price from Room;

#GROUP BY Queries
SELECT specialization, COUNT(*) AS total_doctors FROM Doctor GROUP BY specialization;
SELECT city, COUNT(*) AS total_patients FROM Patient GROUP BY city;
SELECT status, COUNT(*) AS total_appointments FROM Appointment GROUP BY status;
SELECT room_type, COUNT(*) AS total_rooms FROM Room GROUP BY room_type;
SELECT department_name, COUNT(*) AS total_doctors FROM Department GROUP BY department_name;

#JOIN QUERIES
SELECT P.first_name AS patient_name,D.name AS doctor_name FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id JOIN Doctor D ON A.doctor_id = D.doctor_id;

SELECT A.appointment_date,D.specialization FROM Appointment A
JOIN Doctor D ON A.doctor_id = D.doctor_id;

SELECT P.first_name AS patient_name,P.city,D.name AS doctor_name
FROM Appointment A JOIN Patient P ON A.patient_id = P.patient_id JOIN Doctor D ON A.doctor_id = D.doctor_id;

SELECT D.name AS doctor_name,Dept.department_name
FROM Doctor D JOIN Department Dept ON D.doctor_id = Dept.department_id;

SELECT CONCAT(P.first_name, ' ', P.last_name) AS patient_name, A.status FROM Appointment A 
JOIN Patient P ON A.patient_id = P.patient_id;


# Advanced JOIN 
SELECT P.first_name AS patient_name,D.name AS doctor_name,A.appointment_date,A.status
FROM Appointment A JOIN Patient P ON A.patient_id = P.patient_id
JOIN Doctor D ON A.doctor_id = D.doctor_id WHERE A.status = 'Completed';

SELECT Dept.department_name,D.name AS doctor_name
FROM Department Dept JOIN Doctor D ON Dept.department_id = D.doctor_id;

SELECT P.first_name AS patient_name,P.city,A.appointment_date,A.status
FROM Appointment A JOIN Patient P ON A.patient_id = P.patient_id WHERE A.status = 'Cancelled';

SELECT P.first_name AS patient_name,P.age,D.name AS doctor_name,A.appointment_date
FROM Appointment A JOIN Patient P ON A.patient_id = P.patient_id
JOIN Doctor D ON A.doctor_id = D.doctor_id WHERE P.age > 35;

SELECT A.appointment_id,D.name AS doctor_name,D.phone AS doctor_phone
FROM Appointment A JOIN Doctor D ON A.doctor_id = D.doctor_id;
