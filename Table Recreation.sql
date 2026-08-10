create database if not exists employeedb;
use employeedb;

create table if not exists department(
Department_id INT PRIMARY KEY,
Department_name VARCHAR(100) NOT NULL
);

create table if not exists location(
Location_id INT AUTO_INCREMENT PRIMARY KEY,
Location_name VARCHAR(30) NOT NULL
);

create table if not exists employees(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR(50) NOT NULL,
Gender ENUM('M','F'),
Age INT CHECK(Age>=18), 
Hire_date DATE DEFAULT(current_date),
Designation VARCHAR(100),
Department_id INT,
Location_id INT,
Salary DECIMAL(10,2),
FOREIGN KEY(Department_id)REFERENCES department(Department_id),
FOREIGN KEY(Location_id)REFERENCES location(Location_id),
Email VARCHAR(50)
);
