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
INSERT INTO department (Department_id,Department_name)
VALUES
(101,'Human Resource'),
(102,'Marketing'),
(103,'Finance'),
(104,'Sales'),
(105,'IT'),
(106,'Administration'),
(107,'Customer Service'),
(108,'Operations');
SELECT*FROM department;

INSERT INTO location(Location_id,Location_name)
VALUES(201,'Chennai'),
(202,'Mumbai'),
(203,'Delhi'),
(204,'Kolkatta'),
(205,'Uttar Pradesh'),
(206,'Bangalore'),
(207,'Maharashtra'),
(208,'Hyderabad');
SELECT*FROM location;

INSERT INTO employees(Employee_id,Employee_Name,Gender,Age,Hire_Date,Designation,Department_id,Location_id,Salary)
VALUES(1001,'Ram','M',23,'2026-06-05','Data Analyst',101,201,55000),
(1002,'Janani','F',31,'2015-08-01','Manager',102,202,62000),
(1003,'Nivas','M',24,'2016-04-11',' ',103,203,15000),
(1004,'Priya','F',33,'2018-02-17','HR Executive',104,204,35000),
(1005,'Seetha','F',47,'2015-12-09','IT Manager',105,205,43000),
(1006,'Ravi','M',51,'2017-08-26','Marketing Executive',106,206,24000),
(1007,'Kavitha','F',39,'2019-01-27','Administrative Assistant',107,207,31000),
(1008,'Sathish','M',21,'2026-03-19','Customer Service Executive',108,208,17000);
SELECT*FROM employees;
SELECT DISTINCT Salary FROM employees;

SELECT AGE AS Employee_Age,Salary AS Employee_Salary FROM employees;

SELECT*FROM employees WHERE Salary>50000 AND Hire_Date< '2016-01-01';  
   
UPDATE employees
SET Designation=null
WHERE Employee_id=1003;
SELECT*FROM employees;
UPDATE employees
SET Designation='Data Scientist'
WHERE Employee_id=1003;
SELECT*FROM employees;

SELECT Department_id,Salary
FROM employees
ORDER BY Department_id ASC,Salary DESC;

SELECT * FROM employees
WHERE YEAR(Hire_Date)=2018
 ORDER BY Hire_date DESC
 LIMIT 5;


 SELECT SUM(e.salary) AS 'Total Salary',d.Department_Name
 FROM employees AS e
 INNER JOIN department AS d ON e.Department_id=d.Department_id
 WHERE d.Department_Name='Finamnce';
 
 SELECT MIN(Age) AS' Minimum age' FROM employees; 
 
 SELECT MAX(e.Salary) AS 'Highest_Salary',l.Location_Name
 FROM employees AS e
 INNER JOIN location AS l ON e.Location_id=l.Location_id
 GROUP BY Location_Name;
 
 SELECT AVG(Salary) AS Avg_Salary FROM employees WHERE  Designation LIKE '%Analyst';
 
 SELECT d.Department_Name,
 COUNT(e.Employee_id) AS Employee_Count
 FROM department AS d
 INNER JOIN employees AS e
 ON d.Department_id=e.Department_id
 GROUP BY d.Department_Name
 HAVING COUNT(e.Employee_id)>3;
 
 SELECT l.Location_Name,
 AVG(e.Age) AS Average_Age
 FROM employees AS e
 INNER JOIN location AS l
 ON e.Location_id=l.Location_id
 WHERE e.Gender='F'
 GROUP BY l.Location_Name
 HAVING AVG(e.Age)<30;
 
 SELECT e.Employee_Name,e.Designation,d.Department_Name
 FROM employees AS e
 INNER JOIN department AS d
 ON e.Department_id=d.Department_id;
 
 SELECT d.Department_Name,
 COUNT(e.Employee_id) AS Total_Employees
 FROM department AS d
 LEFT JOIN employees AS e
 ON d.Department_id=e.Department_id
 GROUP BY d.Department_Name;
 
SELECT l.Location_Name,e.Employee_Name
FROM employees AS e
RIGHT JOIN location AS l
ON l.Location_id=e.Location_id;

SELECT d.Department_Name,l.Location_Name
FROM department AS d
CROSS JOIN location AS l;

SELECT
e1.Employee_Name AS Employee1,
e2.Employee_Name AS Employee2,
e1.Department_id
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.Department_id=e2.Department_id
AND e1.Employee_id<e2.Employee_id;

SELECT
Employee_Name,Salary,
RANK()OVER (ORDER BY Salary DESC) AS Salary_Rank
FROM employees;

SELECT 
Employee_Name,Department_id,Salary,
Dense_Rank() OVER(PARTITION BY Department_id ORDER BY Salary DESC)AS Salary_Rank
FROM employees;

SELECT
Employee_Name,Department_id,Salary,
SUM(Salary) OVER(PARTITION BY Department_id ORDER BY Employee_id) AS Running_Total_Salary
FROM employees;



