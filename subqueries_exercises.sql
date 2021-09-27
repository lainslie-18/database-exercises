-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
use employees;
show tables;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
select first_name, last_name, hire_date 
from employees
join dept_emp using(emp_no)
where dept_emp.to_date > now() 
and hire_date = (select hire_date from employees where emp_no = 101010);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
select first_name, last_name, title, titles.to_date
from employees
join titles using(emp_no)
where emp_no in 
(select emp_no from employees
join dept_emp using(emp_no)
where first_name = 'Aamod' 
and dept_emp.to_date > now())
order by emp_no;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(emp_no) from employees
where emp_no not in
(select emp_no from dept_emp
where to_date > now());
-- 59,900 employees no longer working for the company

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
select first_name, last_name
from employees
where emp_no in
(select emp_no from dept_manager
where to_date > now())
and gender = 'F';
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select first_name, last_name, salary
from employees
join salaries using(emp_no)
where salaries.to_date > now()
and salary > (select avg(salary) from salaries)
order by salary desc;

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
select count(salary) from salaries
where to_date > now() and salary > 
((select max(salary) from salaries where to_date > now()) - 
(select stddev(salary) from salaries where to_date > now()));

select (select count(salary) from salaries
where to_date > now() and salary > 
((select max(salary) from salaries where to_date > now()) - 
(select stddev(salary) from salaries ))) /
(select count(*) from salaries where to_date > now());

-- Hint Number 1 You will likely use a combination of different kinds of subqueries.
-- Hint Number 2 Consider that the following code will produce the z score for current salaries.

select * from departments limit 5; # dept_no, dept_name
select * from dept_emp limit 5; # emp_no, dept_no, from_date, to_date
select * from dept_manager limit 5; # emp_no, dept_no, from_date, to_date
select * from employees order by emp_no; # emp_no, birth_date, first_name, last_name, gender, hire_date
select * from salaries limit 5; # emp_no, salary, from_date, to_date
select * from titles limit 5; # emp_no, title, from_date, to_date

-- Bonus
-- 1. Find all the department names that currently have female managers.
select dept_name
from dept_manager
join departments using(dept_no)
where dept_manager.emp_no in
(select emp_no from employees
where gender = 'F') and dept_manager.to_date > now();

-- 2. Find the first and last name of the employee with the highest salary.
select first_name, last_name, salary
from employees
join salaries using(emp_no)
where salary = 
(select max(salary) from salaries)
and salaries.to_date > now();

-- 3. Find the department name that the employee with the highest salary works in.
select dept_name
from departments
join dept_emp using(dept_no)
where emp_no = (select emp_no from salaries
where salaries.to_date > now()
order by salary desc
limit 1);