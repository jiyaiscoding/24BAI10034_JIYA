use vit;

create table departments(
did int primary key,
dname varchar(25) not null unique
);
insert into departments values
(101,'CSE'),(102,'ECE'),(103,'civil'),(106,'Aero'),(107,'Mech');

select * from departments order by did;

create table HOD
(Hid int primary key,
hname varchar(20) not null unique);

insert into HOD values
(101,'Arun'),(102,'Jayanth'),(104,'Karthik'),
(105,'Murali');

select * from HOD;

SELECT * FROM 
departments CROSS JOIN hod order by did asc; 
SELECT * FROM department inner join hod where department.did = hod.hid ;
SELECT * FROM department  natural join hod;
SELECT * FROM department left outer join hod on ( department.did = hod.hid ) order by did asc ;
SELECT * FROM department right outer join hod on ( department.did = hod.hid ) order by did asc ;
SELECT * FROM department full join hod on ( department.did = hod.hid ) order by did asc ;

