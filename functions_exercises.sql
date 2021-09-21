-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

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
where last_name like 'e%e';
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

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
-- Irena Reutenauer (first), Vidya Simmen (last)

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;
-- Irena Acton (first), Vidya Zweizig (last)

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;
-- Irena Acton (first), Maya Zyda (last)

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select first_name, last_name, emp_no from employees
where last_name like 'e%e'
order by emp_no;
-- 899 employees, 10021: Ramzi Erde (first), 499648: Tadahiro Erde (last)


-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
select first_name, last_name, hire_date from employees
where last_name like 'e%e'
order by hire_date desc;
-- 899 employees, Teiji Eldridge (newest), Sergi Erde (oldest)

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
select first_name, last_name, birth_date, hire_date from employees
where birth_date like '%12-25' and hire_date like '199%'
order by hire_date desc, birth_date desc;
-- 362 employees, Khun Bernini (hired last), Alselm Cappello (hired first)

-- 1. Copy the order by exercise and save it as functions_exercises.sql.
-- completed
use employees;

-- 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
select concat(first_name, ' ', last_name) as full_name
from employees
where last_name like 'e%e';

-- 3. Convert the names produced in your last query to all uppercase.
select upper(concat(first_name, ' ', last_name)) as full_name
from employees
where last_name like 'e%e';

-- 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
select first_name, last_name, birth_date, hire_date, datediff(curdate(), hire_date) as days_with_company
from employees
where birth_date like '%12-25' and hire_date like '199%';

-- 5. Find the smallest and largest current salary from the salaries table.
select min(salary) as min_salary, max(salary) as max_salary
from salaries;

-- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.
select lower(concat(substr(first_name,1,1),substr(last_name,1,4),'_',substr(birth_date,6,2),substr(birth_date,3,2)))
as username from employees;