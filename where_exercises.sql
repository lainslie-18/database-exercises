-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.
use employees;
show tables;
describe employees;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya');
-- 709 employees

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
select first_name, last_name from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
-- 709 employees; does match Q2

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
select first_name, last_name, gender from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
and gender = 'M';
-- 441 employees

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
select first_name, last_name from employees
where last_name like 'e%';
-- 7,330 employees

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
select first_name, last_name from employees
where last_name like 'e%' or last_name like '%e';
-- 30,723 employees

select first_name, last_name from employees
where last_name like '%e' and not last_name like 'e%';
-- 23,393 employees

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
select first_name, last_name from employees
where last_name like 'e%' and last_name like '%e';
-- 899 employees

select first_name, last_name from employees
where last_name like '%e';
-- 24,292 employees

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
select first_name, last_name, hire_date from employees
where hire_date between '1990-01-01' and '1999-12-31';
-- 135,214 employees

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
select first_name, last_name, birth_date from employees
where birth_date like '%12-25';
-- 842 employees

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
select first_name, last_name, birth_date, hire_date from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%12-25';
-- 362 employees

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
select first_name, last_name from employees
where last_name like '%q%';
-- 1,873 employees

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
select first_name, last_name from employees
where last_name like '%q%' and not last_name like '%qu%';
-- 547 employees