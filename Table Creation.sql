CREATE DATABASE IF NOT EXISTS employeedb;
USE employeedb;

CREATE TABLE IF NOT EXISTS Department(
Department_id INT PRIMARY KEY,
Department_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Location(
Location_id INT PRIMARY KEY,
Location_name VARCHAR(30)
);


CREATE TABLE IF NOT EXISTS Employee(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR(50),
Gender ENUM('M', 'F'),
Age INT,
Hire_date DATE,
Designation VARCHAR(100),
Department_id INT,
Location_id INT,
salary DECIMAL(10,2),
FOREIGN KEY (Department_id)REFERENCES Department(Department_id),
FOREIGN KEY(Location_id) REFERENCES Location(Location_id)
);
ALTER TABLE employees
ADD COLUMN Email VARCHAR(100);
ALTER TABLE employees
MODIFY COLUMN Designation VARCHAR(200);
ALTER TABLE employees
DROP COLUMN Age;
ALTER TABLE employees
RENAME COLUMN Hire_date TO Date_of_Joining;
ALTER TABLE department
RENAME TO Departmnents_Info;
ALTER TABLE Location
RENAME TO Locations;
TRUNCATE TABLE employees;
DROP TABLE employees;
DROP DATABASE employeedb; 



 





