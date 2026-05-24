# MONGODB CERTIFICATION FACEPREP

# SQL TASKTEST-1

# JIYA ARORA 24BAI10034



### Table Structure

\-- Create Departments Table

CREATE TABLE Departments (

dept\_id INT PRIMARY KEY,

dept\_name VARCHAR(50) NOT NULL,

location VARCHAR(50)

);

INSERT INTO Departments (dept\_id, dept\_name, location) VALUES

(10, 'Finance', 'New York'),

(20, 'IT', 'San Francisco'),

(30, 'Sales', 'Chicago'),

(40, 'Marketing', 'Los Angeles');

\-- Create Jobs Table

CREATE TABLE Jobs (

job\_id INT PRIMARY KEY,

job\_title VARCHAR(50),

min\_salary DECIMAL(10,2),

max\_salary DECIMAL(10,2)

);

INSERT INTO Jobs (job\_id, job\_title, min\_salary, max\_salary) VALUES

(1, 'Manager', 80000.00, 150000.00),

(2, 'Developer', 60000.00, 110000.00),

(3, 'Analyst', 50000.00, 90000.00),

(4, 'Intern', 30000.00, 45000.00);

\-- Create Employees Table

CREATE TABLE Employees (

emp\_id INT PRIMARY KEY,

name VARCHAR(50) NOT NULL,

manager\_id INT,

dept\_id INT,

job\_id INT,

salary DECIMAL(10,2),

hire\_date DATE,

FOREIGN KEY (dept\_id) REFERENCES Departments(dept\_id),

FOREIGN KEY (job\_id) REFERENCES Jobs(job\_id)

);

INSERT INTO Employees (emp\_id, name, manager\_id, dept\_id, job\_id, salary, hire\_date) VALUES

\-- Top Level Manager

(501, 'Alice', NULL, 10, 1, 120000.00, '2015-01-01'),

\-- IT Dept Staff

(503, 'Charlie', 501, 20, 1, 95000.00, '2016-05-20'),

(504, 'David', 503, 20, 2, 85000.00, '2019-11-01'),

(505, 'Eve', 503, 20, 2, 78000.00, '2020-02-15'),

\-- Finance Dept Staff

(502, 'Bob', 501, 10, 3, 55000.00, '2018-03-12'),

\-- Sales Dept Staff

(506, 'Frank', 501, 30, 3, 52000.00, '2021-06-21'),

\-- Marketing (unassigned to manager for complexity)

(507, 'Grace', NULL, 40, 2, 72000.00, '2022-08-10');



### 

### Questions:

1\.

\[JOINS] List the name of each employee along with their job title and department name.



>**SELECT E.name, J.job\_title, D.dept\_name FROM Employees E JOIN Jobs J ON E.job\_id = J.job\_id JOIN Departments D ON E.dept\_id = D.dept\_id;** 



2\.

\[SUBQUERY] Find all employees whose salary is higher than the average salary of the 'IT' department.



>



3\.

\[GROUP BY] Calculate the total salary expenditure for each department name (not ID).



>**SELECT D.dept\_name, SUM(E.salary) FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id GROUP BY D.dept\_name;**



4\.

\[HAVING] Display departments that have more than 2 employees and an average salary above 70,000.



> **SELECT D.dept\_name FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id GROUP BY D.dept\_name HAVING COUNT(\*) > 2 AND AVG(E.salary) > 70000;**



5\.

\[SELF JOIN] Retrieve a list of employee names and their respective manager's names.



**>SELECT E.name AS Employee, M.name AS Manager FROM Employees E LEFT JOIN Employees M ON E.manager\_id = M.emp\_id;**



6\.

\[ORDER BY] Find the top 3 highest-paid employees and list them in descending order.



**>SELECT name, salary FROM Employees ORDER BY salary DESC LIMIT 3;**



7\.

\[JOINS + WHERE] Find all Developers working in the 'San Francisco' location.



**>SELECT E.name FROM Employees E JOIN Jobs J ON E.job\_id = J.job\_id JOIN Departments D ON E.dept\_id = D.dept\_id**

**WHERE J.job\_title = 'Developer' AND D.location = 'San Francisco';**



8\.

\[GROUP BY] Find the number of employees hired each year.



**>**



9\.

\[HAVING] List job titles where the maximum salary of an employee in that role is less than 100,000.



**> SELECT J.job\_title FROM Employees E JOIN Jobs J ON E.job\_id = J.job\_id GROUP BY J.job\_title HAVING MAX(E.salary) < 100000;**



10\.

\[SUBQUERY] Find the names of employees who work in the same department as 'David'.



**>SELECT name FROM Employees WHERE dept\_id = ( SELECT dept\_id FROM Employees WHERE name = 'David');**



11\.

\[MULTI-TABLE JOIN] Show all department names even if they have no employees assigned to them.


**> SELECT D.dept\_name, E.name FROM Departments D LEFT JOIN Employees E ON D.dept\_id = E.dept\_id;**



12\.

\[COMPLEX FILTER] Find employees who were hired between 2018 and 2020 and earn more than 60,000.

> **SELECT \* FROM Employees WHERE hire\_date BETWEEN '2018-01-01' AND '2020-12-31' AND salary > 60000**;



13\.

\[CORRELATED SUBQUERY] Find employees who earn more than the average salary of their own department.

>



14\.

\[JOINS] Find the job title and salary of the employee with ID 504.



**>SELECT J.job\_title, E.salary FROM Employees E JOIN Jobs J ON E.job\_id = J.job\_id WHERE E.emp\_id = 504;**



15\.

\[GROUP BY] For each manager (by ID), find the minimum salary of the people reporting to them.



**>SELECT manager\_id, MIN(salary) FROM Employees GROUP BY manager\_id;**



16\.

\[SUBQUERY] List departments that do not have any 'Analysts'.



>



17\.

\[AGGREGATION] Find the difference between the highest and lowest salary in the company.



**> SELECT MAX(salary) - MIN(salary) FROM Employees;**



18\.

\[JOIN + ORDER BY] Display employee names and hire dates, sorted by department name (A-Z) and then by salary (High to Low).

>**SELECT E.name, E.hire\_date, D.dept\_name, E.salary FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id ORDER BY D.dept\_name ASC, E.salary DESC;**



19\.

\[HAVING] Identify managers (by ID) who manage more than 2 people.



> **SELECT manager\_id FROM Employees GROUP BY manager\_id HAVING COUNT(\*) > 2;**



20\.

\[SUBQUERY] Find the employee(s) with the third-highest salary.



**> SELECT name, salary FROM Employees WHERE salary = (**

**>   SELECT DISTINCT salary FROM Employees**

**>   ORDER BY salary DESC LIMIT 1 OFFSET 2**

**>);**


21\.

\[LEFT JOIN] List all job titles and the number of employees currently holding that job.



>



22\.

\[JOIN + LIKE] Find employees in the 'Finance' department whose names contain the letter 'i'.



**>SELECT E.name FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id WHERE D.dept\_name = 'Finance' AND E.name LIKE '%i%';**



23\.

\[MATH + GROUP BY] Calculate the 10% bonus amount for each employee and show the total bonus per department.



**>SELECT D.dept\_name, SUM(E.salary \* 0.10) AS total\_bonus FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id GROUP BY D.dept\_name;**



24\.

\[SUBQUERY] List the name of the department that pays the highest total salary.



**>SELECT D.dept\_name FROM Employees E JOIN Departments D ON E.dept\_id = D.dept\_id GROUP BY D.dept\_name ORDER BY SUM(E.salary) DESC LIMIT 1;**



25\.

\[JOINS] Find all employees who report to 'Charlie'.


**>SELECT E.name FROM Employees E JOIN Employees M ON E.manager\_id = M.emp\_id WHERE M.name = 'Charlie';**

