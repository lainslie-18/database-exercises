use employees;

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
select
	case 
		when dept_name in ('research', 'development') then 'R&D'
		when dept_name in ('sales', 'marketing') then 'Sales & Marketing'
		when dept_name in ('production', 'quality management') then 'Prod & QM'
		when dept_name in ('finance', 'human resources') then 'Finance & HR'
		else 'Customer Service'
		end as dept_group, 
	round(avg(salary),2) as dept_avg_salary
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
where dept_emp.to_date > curdate()
and salaries.to_date > curdate()
group by dept_group
order by dept_avg_salary;

select dept_name, round(avg(salary),2)
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
where dept_emp.to_date > curdate()
and salaries.to_date > curdate()
group by dept_name;

select * from departments; # dept_no, dept_name
select * from dept_emp limit 5; # emp_no, dept_no, from_date, to_date
select * from dept_manager limit 5; # emp_no, dept_no, from_date, to_date
select * from employees order by emp_no; # emp_no, birth_date, first_name, last_name, gender, hire_date
select * from salaries limit 5; # emp_no, salary, from_date, to_date
select * from titles limit 5; # emp_no, title, from_date, to_date