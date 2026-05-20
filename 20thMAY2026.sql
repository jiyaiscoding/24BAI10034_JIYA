use vit;
create table persons (
id int not null,
lastname varchar(225) not null,
firstname varchar(225) not null,
age int
);
desc persons;

alter table persons
add unique(age);
alter table  persons
drop constraint age;

insert into persons values(102,'Jiya','Arora',null);
select * from persons;
drop table persons;

create table persons(
id int not null,
lastname varchar(225) not null,
firstname varchar(225),
age int,
check (age>=18)
);
drop table persons;

create table persons(
id int not null,
lastname varchar(225) not null,
firstname varchar(225),
age int
);
ALTER TABLE Persons	
ADD CHECK (Age>=18);
insert into persons value(10,'ram','singh',27);
insert into persons value(11,'ravi','sharma',24);
delete from persons where id=11 and lastname='sharma' and firstname='ravi' and age=24 limit 1;
select * from persons;
create table persons1(
id int not null,
lastname varchar(225) not null,
firstname varchar(225),
age int,
city varchar(225) default 'Gurgaon'
);
desc persons1;
create table products(
pid int primary key,
pname varchar(225),
pefn varchar(225)
);
alter table products
add unique(pefn);
alter table products
modify pefn varchar(225) not null;
desc products;
drop table products;

 create table category(
 cid int primary key,
 cname varchar(225)
 );
 insert into category values(1,'electronics'),(2,'furniture');
 select * from category;
 create table products(
 pid int primary key,
 pname varchar(100) not null,
 cid int,
 foreign key(cid) references category(cid)
 );
 desc products;
 select * from products;
 insert into products values (501, 'Laptop', 1);

insert into products values (502, 'Wooden Chair', 2);

insert into products values (503, 'Phone', 3);
delete from category where cid=101;
insert into products values (504,'Power Bank Samsung',64-bit encry key);
select * from products;