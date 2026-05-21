drop table products;
 create table products(
 pid int primary key,
 pname varchar(100) not null,
 cid int,
 foreign key(cid) references category(cid) on delete cascade
 );
 
 select first_name, salary from worker where department='admin' order by salary asc;
select department,count(department) from worker
group by department order by count(department) asc;
select department, sum(salary) from worker 
group by department order by sum(salary) asc;

select department, sum(salary) from worker 
group by department having sum(salary) <= 300000 order by sum(salary) asc;

select * from worker limit 1 offset 2;

create table topper(id int);
insert into topper values(2),(5);
select worker_id, first_name, department from worker
where worker_id in(select id from topper);

select department, sum(salary) from worker 
group by department order by sum(salary) asc limit 2;

select first_name,salary from worker where department='admin'
order by(salary) desc limit 1 offset 1;