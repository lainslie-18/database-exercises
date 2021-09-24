-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
use join_example_db;
show tables;
select * from roles;
select * from users;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select roles.name, count(users.role_id) as role_count
from roles
left join users on roles.id = users.role_id
group by roles.name
order by role_count desc;


-- Employees Database
-- 1. Use the employees database.
use employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
select dept_name, concat(first_name, ' ', last_name) as full_name
from employees
join dept_manager using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate();

-- 3. Find the name of all departments currently managed by women.
select dept_name as department, 
concat(first_name, ' ', last_name) as full_name,
gender
from employees
join dept_manager using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate()
and employees.gender = 'F';

-- 4. Find the current titles of employees currently working in the Customer Service department.
select title as Title, count(title) as Count
from titles
join current_dept_emp using(emp_no)
join departments using(dept_no)
where departments.dept_name = 'Customer Service'
and titles.to_date > curdate()
group by title;

-- 5. Find the current salary of all current managers.
select dept_name, concat(first_name, ' ', last_name) as full_name, salary
from salaries
join employees using(emp_no)
right join dept_manager using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate()
and salaries.to_date > curdate()
order by salary desc;

-- 6. Find the number of current employees in each department.
select dept_no, dept_name, count(*) as num_employees
from departments
join current_dept_emp using(dept_no)
where current_dept_emp.to_date > curdate()
group by dept_name
order by dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
select dept_name, round(avg(salary),2) as avg_salary
from departments
join current_dept_emp using(dept_no)
join salaries using(emp_no)
where salaries.to_date > curdate()
group by dept_name
order by avg_salary desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?
select concat(first_name, ' ', last_name) as full_name
from employees
join salaries using(emp_no)
join current_dept_emp using(emp_no)
join departments using(dept_no)
where salaries.to_date > curdate()
and dept_name = 'Marketing'
order by salary desc
limit 1;

-- 9. Which current department manager has the highest salary?
select concat(first_name, ' ', last_name) as full_name, salary, dept_name
from employees
join salaries using(emp_no)
join dept_manager using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate()
and salaries.to_date > curdate()
order by salary desc
limit 1;

-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name.
select a.concat(first_name, ' ', last_name) as employee_name, 
b.concat(employees.first_name, ' ', employees.last_name) as manager_name,
departments.dept_name
from employees a, employees b
join current_dept_emp using(emp_no)
join departments using(dept_no)
join dept_manager using(emp_no)
where a;

where dept_manager.dept_no = current_dept_emp.dept_no 
and dept_manager.to_date > curdate())
from employees a, employees b
where current_dept_emp.to_date > curdate();


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

select * from salaries limit 5;         # emp_no, salary, from_date, to_date
select * from titles limit 5;           # emp_no, title, from_date, to_date
select * from departments limit 5;      # dept_no, dept_name
select * from current_dept_emp limit 5; # emp_no, dept_no, from_date, to_date
select * from employees limit 5;        # emp_no, birth_date, first_name, last_name, gender, hire_date
select * from dept_manager limit 5;     # emp_no, dept_no, from_date, to_date
select * from dept_emp limit 5;
show tables;

-- 11. Bonus Who is the highest paid employee within each department.
# dept_name, employee, salary
select dept_name, concat(first_name, ' ', last_name) as name, salary
from employees
join salaries using(emp_no)
join dept_emp using(emp_no)
join departments using(dept_no)
where salary in 
(select max(salary)
from salaries
join employees using(emp_no)
join dept_emp using(emp_no)
join departments using(dept_no)
where salaries.to_date > now()
and dept_emp.to_date > now()
group by dept_name);

-- Bonus, Bonus Determine the average salary for each department. Use all salary information and round your results.
select dept_name, round(avg(salary)) as avg_salary
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
group by dept_name
order by avg_salary desc;