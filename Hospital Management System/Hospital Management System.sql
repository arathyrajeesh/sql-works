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


