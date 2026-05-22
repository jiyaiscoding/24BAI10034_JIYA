# ***MONGODB CERTIFICATION FACEPREP*** 

# ***SQL TEST***

## JIYA ARORA 24BAI10034 



### ***DATABASE->***

&#x20;CREATE TABLE Worker (

&#x09;WORKER\_ID INT NOT NULL PRIMARY KEY AUTO\_INCREMENT,

&#x09;FIRST\_NAME CHAR(25),

&#x09;LAST\_NAME CHAR(25),

&#x09;SALARY INT(15),

&#x09;JOINING\_DATE DATETIME,

&#x09;DEPARTMENT CHAR(25)

);



INSERT INTO Worker 

&#x09;(WORKER\_ID, FIRST\_NAME, LAST\_NAME, SALARY, JOINING\_DATE, DEPARTMENT) VALUES

&#x09;	(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),

&#x09;	(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),

&#x09;	(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),

&#x09;	(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),

&#x09;	(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),

&#x09;	(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),

&#x09;	(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),

&#x09;	(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');



CREATE TABLE Bonus (

&#x09;WORKER\_REF\_ID INT,

&#x09;BONUS\_AMOUNT INT(10),

&#x09;BONUS\_DATE DATETIME,

&#x09;FOREIGN KEY (WORKER\_REF\_ID)

&#x09;	REFERENCES Worker(WORKER\_ID)

&#x20;       ON DELETE CASCADE

);



INSERT INTO Bonus 

&#x09;(WORKER\_REF\_ID, BONUS\_AMOUNT, BONUS\_DATE) VALUES

&#x09;	(001, 5000, '16-02-20'),

&#x09;	(002, 3000, '16-06-11'),

&#x09;	(003, 4000, '16-02-20'),

&#x09;	(001, 4500, '16-02-20'),

&#x09;	(002, 3500, '16-06-11');

CREATE TABLE Title (

&#x09;WORKER\_REF\_ID INT,

&#x09;WORKER\_TITLE CHAR(25),

&#x09;AFFECTED\_FROM DATETIME,

&#x09;FOREIGN KEY (WORKER\_REF\_ID)

&#x09;	REFERENCES Worker(WORKER\_ID)

&#x20;       ON DELETE CASCADE

);



INSERT INTO Title 

&#x09;(WORKER\_REF\_ID, WORKER\_TITLE, AFFECTED\_FROM) VALUES

&#x20;(001, 'Manager', '2016-02-20 00:00:00'),

&#x20;(002, 'Executive', '2016-06-11 00:00:00'),

&#x20;(008, 'Executive', '2016-06-11 00:00:00'),

&#x20;(005, 'Manager', '2016-06-11 00:00:00'),

&#x20;(004, 'Asst. Manager', '2016-06-11 00:00:00'),

&#x20;(007, 'Executive', '2016-06-11 00:00:00'),

&#x20;(006, 'Lead', '2016-06-11 00:00:00'),

&#x20;(003, 'Lead', '2016-06-11 00:00:00');



### ***QUESTIONS->***



1\. Write an SQL query to fetch “FIRST\_NAME” from Worker table using the alias name as <WORKER\_NAME>



>> **select first\_name as worker\_name from worker;**



2\. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.



>> **select distinct department from worker;**



3\. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table. (without OR condition)



>> **select \* from worker where first\_name in ('Vipul','Satish');**



4\. Write an SQL query to print details of the Workers whose FIRST\_NAME contains ‘a’.



>>**select \* from worker where first\_name like '%a%';**



5\. Write an SQL query to print details of the Workers whose FIRST\_NAME ends with ‘a’.



>> **select \* from Worker where first\_name like '%a';**



6\. Write an SQL query to print details of the admin whose SALARY lies between 100000 and 500000.



>>**select \* from worker where department = 'Admin' and salary between 100000 and 500000;**



7\. Write an SQL query to fetch the count of employees working in the department ‘Admin’.



>> **select count(\*) from worker where department = 'Admin';**



8\. Write an SQL query to show the second highest salary from a table.



>> **select distinct salary from worker order by salary desc limit 1 offset 1;**



9.Write an SQL query to fetch the departments that have less than three people in it.



>> **select department from worker group by department having count(\*) <3;**



10\. Write an SQL query to show all departments along with the total number of people in there.



>> **select department, count(\*) from worker group by department;**



11\. Write an SQL query to print the name of employees having the highest salary in each department.



>> select first\_name, department, salary from worker W1 where W1.salary = (

&#x20;   select max(W2.salary)

&#x20;   from worker W2

&#x20;   where W1.department = W2.department

);

