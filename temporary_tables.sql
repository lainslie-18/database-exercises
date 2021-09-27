-- Create a file named temporary_tables.sql to do your work for this exercise.
use employees;

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
create temporary table hopper_1549.employees_with_departments as
select first_name, last_name, dept_name
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
where dept_emp.to_date > now();

use hopper_1549;

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
alter table employees_with_departments
add full_name varchar(30);

-- b. Update the table so that full name column contains the correct data
update employees_with_departments
set full_name = concat(first_name, ' ', last_name);

-- c. Remove the first_name and last_name columns from the table.
alter table employees_with_departments
drop first_name, drop last_name;

-- d. What is another way you could have ended up with this same table?
create temporary table hopper_1549.employees_with_departments as
select concat(first_name, ' ', last_name), dept_name
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
where dept_emp.to_date > now();

-- 2. Create a temporary table based on the payment table from the sakila database.
select * from employees_with_departments;
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?