-- 1. Create a new file named group_by_exercises.sql

use employees;

show tables;
select * from titles;

-- 2. 
select distinct title from titles;
-- 7 distinct titles

-- 3. 
select last_name from employees
where last_name like 'e%e'
group by last_name;

-- 4. 
select concat(first_name, ' ', last_name) as full_name
from employees
where last_name like 'e%e'
group by full_name;

-- 5. 
select last_name from employees
where last_name like 'q%' and not last_name like 'qu%'
group by last_name;
-- Qiwen

-- 6. 
select last_name, count(*) from employees
where last_name like 'q%' and not last_name like 'qu%'
group by last_name;

-- 7. 
select gender, count(*) from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by gender;

-- 8.
select lower(concat(substr(first_name,1,1),
		substr(last_name,1,4),
		'_',substr(birth_date,6,2),
		substr(birth_date,3,2)))
as username, count(*) from employees
group by username;
-- yes, there are duplicate usernames

-- 9. 
select avg(salary) from salaries
where to_date < curdate();

select avg(salary) from salaries
where to_date > curdate();

show tables;
select * from salaries;

describe employees;
