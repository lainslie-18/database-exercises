use employees;

select * from departments limit 5; # dept_no, dept_name
select * from dept_emp limit 5; # emp_no, dept_no, from_date, to_date
select * from dept_manager limit 5; # emp_no, dept_no, from_date, to_date
select * from employees order by emp_no; # emp_no, birth_date, first_name, last_name, gender, hire_date
select * from salaries limit 5; # emp_no, salary, from_date, to_date
select * from titles limit 5; # emp_no, title, from_date, to_date

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
select emp_no, dept_no, from_date as start_date, to_date as end_date,
	IF(to_date > now(), True, False) AS is_current_employee
from dept_emp;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
select first_name, last_name, 
	case
    when last_name regexp '[A-H]' THEN 'A-H'
           when last_name regexp '[I-Q]' THEN 'I-Q'
           when last_name regexp '[R-Z]' THEN 'R-Z'
           end as alpha_group
from employees
order by last_name;

-- 3. How many employees (current or previous) were born in each decade?
select case
	when birth_date like '195%' then '1950s'
    when birth_date like '196%' then '1960s'
    end as 'decades',
    count(*) as employees_born
    from employees
    group by decades;

select concat(substr(birth_date,1,3),'0s') as decade, count(*)
from employees
group by decade;

-- BONUS

-- 1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
    CASE column_a
        WHEN condition_a THEN value_1
        WHEN condition_b THEN value_2
        ELSE value_3
        END AS new_column_name
FROM table_a;

SELECT CASE
           WHEN column_a > condition_1 THEN value_1
           WHEN column_b <= condition_2 THEN value_2
           ELSE value_3
           END AS new_column_name
FROM table_a;

SELECT IF(column_a = condition_1, value_1, value_2) AS new_column
FROM table_a;