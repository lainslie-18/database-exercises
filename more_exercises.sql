use employees;

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
-- department managers in Customer Service and Production get paid less than dept average salary
create temporary table hopper_1549.manager_salary_comparison as
select dept_name, first_name, last_name, salary 
from dept_manager
join employees using(emp_no)
join salaries using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > now()
and salaries.to_date > now()
order by salary desc;

use hopper_1549;
select * from manager_salary_comparison;

create temporary table hopper_1549.dept_avg_salary as
select dept_name, round(avg(salary)) as avg_salary
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
where dept_emp.to_date > now()
and salaries.to_date > now()
group by dept_name;

select * from manager_salary_comparison
join dept_avg_salary using(dept_name)
order by salary desc;
