USE employees;
SHOW tables;
DESCRIBE employees;
-- data types present are: int, date, varchar, enum, & date
SHOW tables;
-- likely contain numeric type column: current_dept_emp, salaries
-- likely contain string type column: departments, employees, titles
-- likely contain date type column: dept_emp_latest_date
DESCRIBE departments;
SHOW CREATE TABLE employees;
SHOW CREATE TABLE departments;
DESCRIBE current_dept_emp;
DESCRIBE dept_emp;
-- not sure what the relationship is between employees and departments other than both being foreign keys in dept_emp
SHOW CREATE TABLE dept_manager;
