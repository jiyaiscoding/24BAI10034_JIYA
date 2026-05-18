show databases;
use vit;
show tables from vit;
select * from cse;
desc cse;
ALTER TABLE cse ADD(
    sphn int8, sphn2 int8
);

insert into cse values (104,"Semi",95,'CSE','SriLanka');

ALTER TABLE cse DROP COLUMN sphn2;

ALTER TABLE cse ADD(
    sCountry varchar(30) DEFAULT 'INDIA'
);

ALTER TABLE cse RENAME column 
    Scountry TO SLocation;
    
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(101, 'Jiya', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(102, 'Niharika', 'Sharma', 80000, '14-06-11 09.00.00', 'Admin'),
		(103, 'Vidhi', 'Singh', 300000, '14-02-20 09.00.00', 'HR'),
		(104, 'Amit', 'Singla', 500000, '14-02-20 09.00.00', 'Admin'),
		(105, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(106, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
        
select * from cse;

drop table cse;

desc cse;

show tables from vit;

delete from eee;

select * from eee;

RENAME TABLE eee to ECE;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(101, 'Jiya', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(102, 'Niharika', 'Sharma', 80000, '14-06-11 09.00.00', 'Admin'),
		(103, 'Vidhi', 'Singh', 300000, '14-02-20 09.00.00', 'HR'),
		(104, 'Amit', 'Singla', 500000, '14-02-20 09.00.00', 'Admin'),
		(105, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'IT'),
		(106, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
select * from worker;

UPDATE worker SET First_name='Gini',Last_name='Samya' WHERE worker_id=5;

UPDATE worker SET salary = salary+5000; 

DELETE FROM worker WHERE worker_id=8; 

select * from worker;
CREATE TABLE yep (
    id INT
);

START TRANSACTION;

SELECT * FROM yep;

SAVEPOINT time15;
INSERT INTO yep VALUES (101);

SAVEPOINT time15;
INSERT INTO yep VALUES (102);
ROLLBACK TO time15;

SAVEPOINT time17;
INSERT INTO yep VALUES (103);

SAVEPOINT time18;
INSERT INTO yep VALUES (104);
ROLLBACK TO time18;

SAVEPOINT time19;
INSERT INTO yep VALUES (105);

COMMIT;

SELECT * FROM yep;

select first_name, department from worker where salary < 100000 and last_name = 'sharma';
SELECT first_name, department FROM worker WHERE department = 'HR' OR department = 'IT';
SELECT first_name, department FROM worker WHERE department != 'Admin';
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;
		
