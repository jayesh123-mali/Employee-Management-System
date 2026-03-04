create database companydb;
use companydb;

#create table location
create table location (
location_id int primary key,
location_name varchar(50));

#department table 
create table department (
dept_id int primary key,
dept_name varchar(50),
location_id int,
foreign key (location_id) references location(location_id)
);

#employee table
create table employee (
emp_id int primary key,
emp_name varchar(50),
salary int,
dept_id int,
foreign key (dept_id) references department(dept_id));

INSERT INTO Location VALUES
(1, 'Mumbai'),
(2, 'Pune'),
(3, 'Delhi');

insert into department values
(101,'it', 1),
(102,'hr',2),
(103,'finance',3);

insert into employee values
(1,'amit',70000, 101),
(2,'neha',80000, 102),
(3,'rahul',60000, 101),
(4,'pooja',90000, 103),
(5,'kiran',75000, 102);

select * from employee;

#employee with salary > 70000
select * from employee
where salary > 70000;

#Department-wise total salary
select dept_id, sum(salary) as total_salary
from employee
group by dept_id;

#Department having avg salary > 70000
select dept_id, avg(salary) as avg_salary
from employee
group by dept_id
having avg(salary) > 70000;

-- 6 JOINS
-- Employee with Department Name
select e.emp_name, d.dept_name
from employee e
inner join department d
on e.dept_id = d.dept_id;	

-- Employee with Department & Location
SELECT e.emp_name, d.dept_name, l.location_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
JOIN Location l ON d.location_id = l.location_id;

-- 7 Subqueries
-- Employees earning more than average salary
select emp_name, salary
from employee
where salary > (select avg(salary) from employee);

-- Employee with maximum salary
select emp_name, salary
from employee
where salary = (select max(salary) from employee);

-- Window Functions
-- Rank employees by salary
select emp_name, salary, 
rank() over (order by salary desc) as rank_salary
from employee;

#2nd highest salary
select emp_name, salary
from (
select emp_name, salary,
dense_rank() over (order by salary desc) as rnk
from employee
) t
where rnk = 2;

select emp_name, salary
from (
select emp_name, salary,
dense_rank() over (order by salary desc) as rnk
from employee
) t
where rnk = 3;

#update salary
update employee
set salary = 85000
where emp_name = 'neha';

select * from employee;

#delete an employee
delete from employee
where emp_id = 3;

select *  from employee;










