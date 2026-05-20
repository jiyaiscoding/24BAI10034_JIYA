show tables in vit;
CREATE TABLE Worker (
	WORKER_ID INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
        (101, 'Jiya', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(102, 'Niharika', 'Sharma', 80000, '14-06-11 09.00.00', 'Admin'),
		(103, 'Vidhi', 'Singh', 300000, '14-02-20 09.00.00', 'HR'),
		(104, 'Amit', 'Singla', 500000, '14-02-20 09.00.00', 'Admin'),
		(105, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'IT'),
		(106, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),

select * from worker;

select first_name,department,salary from worker where department='admin' or salary >= 100000;

select * from worker;

select worker_id,first_name,department,salary from worker where worker_id not in (1,6,7);

select * from worker 
where salary not between 110000 and 300000;

SELECT * FROM worker
WHERE salary BETWEEN 100000 AND 500000
AND department NOT IN ('hr','admin');

Select * from worker;
Select * from worker where first_name like __i%;   
Select * from worker where first_name like _i%; 


Select min(salary) from worker
select * from worker;

select max(salary) from worker where department="Admin"
select count (worker_id) from worker where department="HR"
select sum(salary) from worker where department="admin"
select avg(salary) from worker where department="admin"
select min(salary) from worker where department ="admin" and first_name not like '%a%';

select (salary) from worker where department='admin';

SELECT salary FROM worker
UNION ALL
SELECT salary FROM worker;


select * from worker;

select worker_id as RollNumber from worker;

select distinct(department) from worker;

SELECT worker_id, first_name,
CASE
    WHEN salary > 300000 THEN 'Rich people'
    WHEN salary >= 100000 and salary <299999 THEN 'Middle'
    ELSE 'Poor'
END 
AS Status
FROM worker;




