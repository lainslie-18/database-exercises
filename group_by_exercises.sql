-- 1. Create a new file named group_by_exercises.sql

use employees;

show tables;
select * from titles;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
select distinct title from titles;
-- 7 distinct titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
select last_name from employees
where last_name like 'e%e'
group by last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
select concat(first_name, ' ', last_name) as full_name
from employees
where last_name like 'e%e'
group by full_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
select last_name from employees
where last_name like 'q%' and not last_name like 'qu%'
group by last_name;
-- Qiwen

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
select last_name, count(*) from employees
where last_name like 'q%' and not last_name like 'qu%'
group by last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
select gender, count(*) from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by gender;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
select lower(concat(substr(first_name,1,1),
		substr(last_name,1,4),
		'_',substr(birth_date,6,2),
		substr(birth_date,3,2)))
as username, count(*) from employees
group by username
having count(username) > 1;
-- yes, there are duplicate usernames
-- 13,251 duplicates

-- 9.a Find the historic average salary for all employees. 
select avg(salary) from salaries
where to_date < curdate();

-- Now determine the current average salary.
select avg(salary) from salaries
where to_date > curdate();

-- 9.b Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.
select emp_no, avg(salary) from salaries
where to_date < curdate()
group by emp_no;

-- 9.c Find the current average salary for each employee.
select emp_no, avg(salary) from salaries
where to_date > curdate()
group by emp_no;

-- 9.d Find the maximum salary for each current employee.
select emp_no, max(salary) from salaries
where to_date > curdate()
group by emp_no;

-- 9.e Now find the max salary for each current employee where that max salary is greater than $150,000.
select emp_no, max(salary) from salaries
where to_date > curdate()
group by emp_no
having max(salary) > 150000;

-- 9.f Find the current average salary for each employee where that average salary is between $80k and $90k.
select emp_no, avg(salary) from salaries
where to_date > curdate()
group by emp_no
having avg(salary) between 80000 and 90000;

