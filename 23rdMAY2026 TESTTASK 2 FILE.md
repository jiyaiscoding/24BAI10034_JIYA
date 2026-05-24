# MONGODB CERTIFICATION FACEPREP

# SQL TASKTEST-1

# JIYA ARORA 24BAI10034



1\. Departments (D)

Column Name	Data Type	Constraint	Description

dept\_id	INT	PRIMARY KEY	Unique ID for the department

dept\_name	VARCHAR(50)	NOT NULL	Name of the department

location\_id	VARCHAR(50)	NOT NULL	Geographic location

Sample Data for Departments

dept\_id	dept\_name	location\_id

10	Consulting	NYC

20	Engineering	SF

30	R\&D	London

40	Sales	NYC

50	HR	SF

60	Admin	London

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

2\. Employees (E)

Column Name	Data Type	Constraint	Description

employee\_id	INT	PRIMARY KEY	Unique ID for the employee

employee\_name	VARCHAR(50)	NOT NULL	Employee full name

manager\_id	INT	FOREIGN KEY	ID of the manager

dept\_id	INT	FOREIGN KEY	Department ID

salary	DECIMAL(10,2)	NOT NULL	Annual salary

Sample Data for Employees

employee\_id	employee\_name	manager\_id	dept\_id	salary

100	Alice Smith (CEO)	NULL	10	180000.00

101	Bob Johnson	100	20	120000.00

102	Charlie Brown	101	20	95000.00

103	Diana Prince	100	30	110000.00

104	Evan Clark	103	30	85000.00

105	Fiona Glen	101	20	90000.00

106	George King	100	40	75000.00

107	Hannah Lee	103	30	88000.00

108	Ivan Rossi	100	50	60000.00

109	Jane Doe	101	20	125000.00

110	Kevin Blue	104	30	86000.00

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

3\. Projects (P)

Column Name	Data Type	Constraint	Description

project\_id	INT	PRIMARY KEY	Unique ID for the project

project\_name	VARCHAR(50)	NOT NULL	Project name

client\_name	VARCHAR(50)	NOT NULL	Client name

start\_date	DATE	NOT NULL	Project start date

dept\_id	INT	FOREIGN KEY	Department responsible

Sample Data for Projects

project\_id	project\_name	client\_name	start\_date	dept\_id

5001	Aurora Migration	GlobalTech Solutions	2023-01-15	20

5002	Synergy App Dev	Zenith Corp	2023-05-20	30

5003	Q4 Sales Strategy	Apex Industries	2024-01-01	40

5004	Global Expansion	GlobalTech Solutions	2024-03-10	10

5005	Internal HR Tool	Internal	2024-02-01	50

5006	Data Analytics	Zenith Corp	2022-11-01	20

5007	Future Tech R\&D	R\&D Dept	2024-06-01	30

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

4\. Assignments (A)

Column Name	Data Type	Constraint	Description

assignment\_id	INT	PRIMARY KEY	Unique assignment ID

employee\_id	INT	FOREIGN KEY	Employee assigned

project\_id	INT	FOREIGN KEY	Project assigned

hours\_worked	INT	NOT NULL	Hours worked

start\_date	DATE	NOT NULL	Assignment start date

Sample Data for Assignments

assignment\_id	employee\_id	project\_id	hours\_worked	start\_date

1	101	5001	150	2023-01-15

2	102	5001	160	2023-01-15

3	105	5001	140	2023-02-01

4	103	5002	80	2023-05-20

5	104	5002	70	2023-06-01

6	106	5003	5	2024-01-01

7	100	5004	20	2024-03-10

8	107	5002	75	2023-05-25

9	109	5006	200	2022-11-01

10	101	5006	250	2022-11-01

11	102	5006	180	2022-12-01

12	110	5007	10	2024-06-01

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Database Schema Structure

Table Name	Purpose	Key Columns

Employees (E)	Stores employee information	employee\_id (PK), manager\_id (FK), dept\_id (FK)

Departments (D)	Stores department details	dept\_id (PK), location\_id

Projects (P)	Stores project details	project\_id (PK), client\_name

Assignments (A)	Links employees to projects	assignment\_id (PK), employee\_id (FK), project\_id (FK)

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

### SQL Questions



1\.

List the Employee Name, their Department Name, and the Location Name for all employees.

>> SELECT E.employee\_name, D.dept\_name, D.location\_id FROM Employees E

JOIN Departments D ON E.dept\_id = D.dept\_id;

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

2\.

Retrieve the Project Name, Client Name, and the Total Hours Worked on that project, but only for projects managed by the 'Consulting' department.

>>**SELECT P.project\_name, P.client\_name, SUM(A.hours\_worked)**

**FROM Projects P**

**JOIN Assignments A**

**ON P.project\_id = A.project\_id**

**JOIN Departments D**

**ON P.dept\_id = D.dept\_id**

**WHERE D.dept\_name = 'Consulting'**

**GROUP BY P.project\_name, P.client\_name;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

3\.

Find the names of Employees who have worked on a project with Client Name 'GlobalTech Solutions'. List the Employee Name and Project Name.



>>**SELECT E.employee\_name, P.project\_name**

**FROM Employees E**

**JOIN Assignments A**

**ON E.employee\_id = A.employee\_id**

**JOIN Projects P**

**ON A.project\_id = P.project\_id**

**WHERE P.client\_name = 'GlobalTech Solutions';**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

4\.

List all Departments that have no Employees currently assigned to them.

>>**SELECT D.dept\_name**

**FROM Departments D**

**LEFT JOIN Employees E**

**ON D.dept\_id = E.dept\_id**

**WHERE E.employee\_id IS NULL;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

5\.

Show the Manager Name, the Department Name they manage, and the total number of direct reports they have.

>>**SELECT M.employee\_name AS Manager\_Name,**

**D.dept\_name,**

**COUNT(E.employee\_id) AS Direct\_Reports**

**FROM Employees E**

**JOIN Employees M**

**ON E.manager\_id = M.employee\_id**

**JOIN Departments D**

**ON M.dept\_id = D.dept\_id**

**GROUP BY M.employee\_name, D.dept\_name;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Aggregation and Grouping

6\.

Calculate the Average Hours Worked per Employee across all projects. List the Employee Name and the average hours.



>>**SELECT E.employee\_name, AVG(A.hours\_worked)**

**FROM Employees E**

**JOIN Assignments A**

**ON E.employee\_id = A.employee\_id**

**GROUP BY E.employee\_name;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

7\.

Find the Department Name(s) that have an average salary above the company-wide average salary.



**SELECT D.dept\_name**

**FROM Employees E**

**JOIN Departments D**

**ON E.dept\_id = D.dept\_id**

**GROUP BY D.dept\_name**

**HAVING AVG(E.salary) > (**

&#x20;   **SELECT AVG(salary)**

&#x20;   **FROM Employees**

**);**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**

8\.

Identify the Client Name(s) whose projects have a total combined hours worked exceeding 500 hours.



**SELECT P.client\_name, SUM(A.hours\_worked)**

**FROM Projects P**

**JOIN Assignments A**

**ON P.project\_id = A.project\_id**

**GROUP BY P.client\_name**

**HAVING SUM(A.hours\_worked) > 500;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

9\.

For each Location, find the Department Name with the highest count of employees.

>>

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

10\.

Calculate the total number of employees assigned to each Project, but only include projects that have more than 5 employees assigned.



>>**SELECT P.project\_name, COUNT(A.employee\_id)**

**FROM Projects P**

**JOIN Assignments A**

**ON P.project\_id = A.project\_id**

**GROUP BY P.project\_name**

**HAVING COUNT(A.employee\_id) > 5;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Advanced Filtering

11\.

Find the Employee Name(s) who work on ALL projects managed by the 'R\&D' department.

>>\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

12\.

Retrieve the Department Name(s) that have employees assigned to more than one project.

>>\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

13\.

Write a query to list the Employee Name and Project Name for any employee who has worked less than 10 hours on a project.



>>**SELECT E.employee\_name, P.project\_name**

**FROM Employees E**

**JOIN Assignments A**

**ON E.employee\_id = A.employee\_id**

**JOIN Projects P**

**ON A.project\_id = P.project\_id**

**WHERE A.hours\_worked < 10;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

14\.

Find the Project Name(s) that have no assigned employees.

>>**SELECT P.project\_name**

**FROM Projects P**

**LEFT JOIN Assignments A**

**ON P.project\_id = A.project\_id**

**WHERE A.assignment\_id IS NULL;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

15\.

Select the Employee Name(s) whose salary is greater than the maximum salary in their own department.

>>

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Dates and MySQL Specific Functions

16\.

Assuming the Assignments table has a start\_date column, find the Employee Name and their oldest project start date.



**>>SELECT E.employee\_name, MIN(A.start\_date)**

**FROM Employees E**

**JOIN Assignments A**

**ON E.employee\_id = A.employee\_id**

**GROUP BY E.employee\_name;**



\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

17\.

Write a MySQL query using the DATE\_FORMAT function to list all projects that were active in the year 2023.



>>**SELECT project\_name**

**FROM Projects**

**WHERE DATE\_FORMAT(start\_date, '%Y') = '2023';**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

18\.

Use the MySQL-specific IFNULL function to list all Employee Names. If an employee has no manager, display "CEO" instead of NULL.

>> S**ELECT E.employee\_name,**

**IFNULL(M.employee\_name, 'CEO') AS Manager\_Name**

**FROM Employees E**

**LEFT JOIN Employees M**

**ON E.manager\_id = M.employee\_id;**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**

19\.

Find the top 3 Departments based on the total hours worked by all their employees across all projects.



>>**SELECT D.dept\_name, SUM(A.hours\_worked)**

**FROM Departments D**

**JOIN Employees E**

**ON D.dept\_id = E.dept\_id**

**JOIN Assignments A**

**ON E.employee\_id = A.employee\_id**

**GROUP BY D.dept\_name**

**ORDER BY SUM(A.hours\_worked) DESC**

**LIMIT 3;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

20\.

Display the Project Name and a status ("High Activity" if total hours > 300, "Normal" otherwise) using the CASE statement.

>>**SELECT P.project\_name,**

**CASE**

&#x20;   **WHEN SUM(A.hours\_worked) > 300 THEN 'High Activity'**

&#x20;   **ELSE 'Normal'**

**END AS Status**

**FROM Projects P**

**JOIN Assignments A**

**ON P.project\_id = A.project\_id**

**GROUP BY P.project\_name;**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Complex Scenarios and Performance

21\.

List the Employee Name and their Manager's Name, even if the employee has no manager, or if a potential manager has no employees reporting to them.

>>

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

22\.

Write a query using a Common Table Expression (CTE) to find the Project Name and the number of unique employees assigned to it.

>>\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

23\.

Find the Employee Name(s) who are assigned to the same projects as Employee ID 101.

>>	



